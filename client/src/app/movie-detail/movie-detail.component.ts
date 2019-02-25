import {Component, OnInit, Input, OnDestroy, TemplateRef} from '@angular/core';

import { MovieService } from '../movie.service';
import { Movie } from '../movie';

import {ActivatedRoute, Params} from '@angular/router';
import { Location } from '@angular/common';
import {DomSanitizer, Title} from '@angular/platform-browser';
import {AuthService} from '../auth.service';
import {User} from '../user';
import {MessageService} from '../message.service';
import {ReviewLike} from '../review-like';
import * as jwt_decode from "jwt-decode";
import { Router } from "@angular/router";
import {Review} from "../review";
import {IpService} from "../ip.service";
import {Subscription} from "rxjs";
import {ngxLoadingAnimationTypes} from "ngx-loading";


@Component({
  selector: 'app-movie-detail',
  templateUrl: './movie-detail.component.html',
  styleUrls: ['./movie-detail.component.css']
})
export class MovieDetailComponent implements OnInit, OnDestroy {

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  @Input()
  movie: Movie;

  isRevChecked = [];
  p1 = 1;
  user: User[];
  res;
  liked;
  reviewLike: ReviewLike;
  reviewLikeForCheck: any[] = [];
  token: string;
  reviewToDelete: Review;
  movieSub: Subscription;


  constructor(private route: ActivatedRoute,
              private messageService: MessageService,
              private auth: AuthService,
              public movieService: MovieService,
              private location: Location,
              private sanitizer: DomSanitizer,
              private router: Router,
              private titleService: Title,
              private ip: IpService,
  ) {
    this.sanitizer = sanitizer;
  }

  createReview = false;
  userRatee = false;
  movieId: number;

  ngOnInit() {
    this.movieService.loading = true;
    this.token = localStorage.getItem('moodvies-jwt-token');
    if (this.token) {
      this.auth.tokenRefresh(this.token).subscribe(results => {
        if (results) {
          const currDate = Math.floor((new Date).getTime()/1000);
          const decoded = jwt_decode(this.token);
          if(decoded['exp'] - currDate < 60 ) {
            localStorage.removeItem('moodvies-jwt-token');
            localStorage.setItem('moodvies-jwt-token', results['token']);
          }
        } else {
          this.auth.logout(false);
          this.router.navigate(['/login']);
        }
      },
        () => {},
        () => {
          this.ip.getIpAddress().subscribe(
            res => {
              this.ip.ipAddress = res.ip;
              this.ip.postIpAddress().subscribe(
                () => {
                  this.ip.getIpId().subscribe(
                    res => this.ip.idIpAddress = res[0]['id'],
                    () => {},
                    () => {this.movieVisit();}
                  );
                },
              );
            },
          );
          this.getMovie();
          this.movieService.createReview = false;
          this.messageService.clear();
          if (this.auth.isLoggedIn === true) {
            this.auth.getUser().subscribe(user => this.user = user);
          }
        }
        );
    } else {
      this.auth.logout(false);
      this.ip.getIpAddress().subscribe(
        res => {
          this.ip.ipAddress = res.ip;
          this.ip.postIpAddress().subscribe(
            () => {
              this.ip.getIpId().subscribe(
                res => this.ip.idIpAddress = res[0]['id'],
                () => {},
                () => {this.movieVisit();}
              );
            },
          );
        },
      );
      this.getMovie();
      this.movieService.createReview = false;
      this.messageService.clear();
    }
  }

  ngOnDestroy(): void {
    this.movieSub.unsubscribe();
  }

  getMovie(): void {
    this.movieSub = this.route.params.subscribe((params: Params) => {
      this.movieId = params.id;
      this.movieService.getMovie(params.id).subscribe(
        movie => {
          this.movie = null;
          this.reviewLikeForCheck = [];
          this.movie = movie;
          this.movieService.loading = false;
        },
        () => this.movieService.loading = false,
        () => {
          this.titleService.setTitle( this.movie.title + ' (' + this.movie.pub_year + ')');
          for (let j in this.movie.reviews) {
            if (this.user) {
              this.checkIfLiked(this.user[0].id, this.movie.reviews[j].idReview);
            }

          }
        }
      );
    });
  }

  getUrl() {
    return this.sanitizer.bypassSecurityTrustResourceUrl('https://www.youtube.com/embed/' + this.movie.trailer_url);
  }

  getLikes(positive, total): string {
    if (total === 0) {
      return 'No one liked yet';
    } else {
      return String('Likes: ' +  (positive / total * 100).toFixed(2)) + '%';
    }
  }

  getLikesNum(positive, total): number {
    if (total === 0) {
      return 0;
    } else {
      return parseFloat((positive / total * 100).toFixed(2));
    }
  }

  userRate(bool: boolean): void {
    if (bool) {
      this.userRatee = true;
    } else {
      this.userRatee = false;
    }
  }


  userRates(idMovie: number, idUser: number, userRates: number): void {
    this.movieService.rateMovie(idMovie, idUser, userRates).subscribe(res => this.res = res);
  }

  toggleCreateReview(): void {
    this.movieService.createReview = true;
  }

  confirmDeleteReview(review: Review): void {
    this.reviewToDelete = review;
  }

  deleteReview(review: Review): void {
    this.movieService.deleteReview(review).subscribe(
      () => {},
      () => {},
      () => {
        this.reviewToDelete = null;
        this.getMovie();
      }
    );
  }

  likeReview(like: boolean, user: number, review: number): void {
    this.reviewLike = new ReviewLike(like, user, review);
    this.movieService.likeReview(like, user, review).subscribe(
      () => {},
      () => {},
      () => {
        this.movieService.getMovie(+this.route.snapshot.paramMap.get('id')).subscribe(movie => {
          this.movie = null;
          this.movie = movie;
          this.reviewLikeForCheck.push(review);
        });
      }
    );
  }

  deleteLikeReview(reviewLike: ReviewLike): void {
    this.movieService.deleteLikeReview(reviewLike).subscribe(
      () => {},
      () => {},
      () => {
        this.movieService.getMovie(+this.route.snapshot.paramMap.get('id')).subscribe(
          movie => {
            this.movie = null;
            this.reviewLikeForCheck = [];
            this.movie = movie;
          },
          err => console.error('Observer got an error: ' + err),
          () => {
            for (let j in this.movie.reviews) {
              this.checkIfLiked(this.user[0].id, this.movie.reviews[j].idReview);
            }
          }
        );
      }
    );
  }

  updateLikeReview(reviewLike: ReviewLike, bool: boolean): void {
    this.movieService.updateLikeReview(reviewLike, bool).subscribe(
      () => {},
      () => {},
      () => {
        this.movieService.getMovie(+this.route.snapshot.paramMap.get('id')).subscribe(
          movie => {
            this.movie = null;
            this.reviewLikeForCheck = [];
            this.movie = movie;
          },
          err => console.error('Observer got an error: ' + err),
          () => {
            for (let j in this.movie.reviews) {
              this.checkIfLiked(this.user[0].id, this.movie.reviews[j].idReview);
            }
          }
        );
      }
    );
  }

  checkIfLiked(user: number, review: number): void {
    this.movieService.reviewCheckIfLiked(user, review).subscribe(res => {
      if(res[0]) {
        this.reviewLikeForCheck.push(res[0].review);
      }
    });
  }

  movieVisit() {
    this.movie['visit'].push(this.ip.idIpAddress);
    this.ip.movieVisit(this.movie, this.movieId).subscribe();
  }
}

