import { Component, OnInit, Input } from '@angular/core';

import { MovieService } from '../movie.service';
import { Movie } from '../movie';

import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import {DomSanitizer} from '@angular/platform-browser';
import {AuthService} from '../auth.service';
import {User} from '../user';
import {MessageService} from '../message.service';
import {ReviewLike} from '../review-like';



@Component({
  selector: 'app-movie-detail',
  templateUrl: './movie-detail.component.html',
  styleUrls: ['./movie-detail.component.css']
})
export class MovieDetailComponent implements OnInit {

  @Input()
  movie: Movie;

  isRevChecked = [];
  p1 = 1;
  user: User[];
  res;
  liked;
  reviewLike: ReviewLike;
  reviewLikeForCheck: any[] = [];


  constructor(private route: ActivatedRoute,
              private messageService: MessageService,
              private auth: AuthService,
              public movieService: MovieService,
              private location: Location,
              private sanitizer: DomSanitizer
  ) {
    this.sanitizer = sanitizer;
  }

  createReview = false;
  userRatee = false;

  ngOnInit() {
    this.getMovie();
    this.movieService.createReview = false;
    this.messageService.clear();
    setTimeout( () => {
      if (this.auth.isLoggedIn === true) {
        this.auth.getUser().subscribe(user => this.user = user);
      }
    }, 400 );

  }


  getMovie(): void {
    let j:any;
    const id = +this.route.snapshot.paramMap.get('id');
    this.movieService.getMovie(id).subscribe(movie => {
      this.movie = movie;
      setTimeout( () => {
        for (j in movie.reviews) {
          this.checkIfLiked(this.user[0].id, movie.reviews[j].idReview);
        }
      }, 800 );
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

  likeReview(like: boolean, user: number, review: number): void {
    this.reviewLike = new ReviewLike(like, user, review);
    this.movieService.likeReview(like, user, review).subscribe(liked => this.liked = liked);
    setTimeout( () => {
      this.movieService.getMovie(+this.route.snapshot.paramMap.get('id')).subscribe(movie => {
        this.movie = null;
        this.movie = movie;
        this.reviewLikeForCheck.push(review);
      });
    }, 800 );

  }

  deleteLikeReview(reviewLike: ReviewLike): void {
    const index: number = this.reviewLikeForCheck.indexOf(reviewLike.idReviewLike, 0);
    let arr = this.reviewLikeForCheck;
    this.movieService.deleteLikeReview(reviewLike).subscribe();
    setTimeout( () => {
      this.movieService.getMovie(+this.route.snapshot.paramMap.get('id')).subscribe(movie => {
        this.movie = null;
        this.reviewLikeForCheck = [];
        this.movie = movie;
        for (let i in arr) {
          if (parseInt(i) != reviewLike.idReviewLike) {
            this.reviewLikeForCheck.push(i);
          }
        }
      });
    }, 800 );

  }

  checkIfLiked(user: number, review: number): void {
    this.movieService.reviewCheckIfLiked(user, review).subscribe(res => {
      if(res[0]) {
        this.reviewLikeForCheck.push(res[0].review);
      }
    });
  }


  checkIfRev(b: number): void {
    this.isRevChecked[b] = true;
  }

}

