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
import {Observable} from 'rxjs';


@Component({
  selector: 'app-movie-detail',
  templateUrl: './movie-detail.component.html',
  styleUrls: ['./movie-detail.component.css']
})
export class MovieDetailComponent implements OnInit {

  @Input()
  movie: Movie

  p1 = 1;
  user: User[];
  res;
  liked;
  reviewLike: ReviewLike;
  reviewLiked;
  x: boolean[];

  constructor(private route: ActivatedRoute,
              private messageService: MessageService,
              private auth: AuthService,
              private movieService: MovieService,
              private location: Location,
              private sanitizer: DomSanitizer
  ) {
    this.sanitizer = sanitizer;
  }

  createReview = false;
  userRatee = false;

  ngOnInit() {
    this.movieService.createReview = false;
    this.messageService.clear();
    this.getMovie();
    if (this.auth.isLoggedIn === true) {
      this.auth.getUser().subscribe(user => this.user = user);
    }
  }


  getMovie(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.movieService.getMovie(id).subscribe(movie => this.movie = movie);
  }

  getUrl() {
    return this.sanitizer.bypassSecurityTrustResourceUrl('https://www.youtube.com/embed/' + this.movie.trailer_url);
  }

  getLikes(positive, total): string {
    if (total === 0) {
      return 'No one liked yet';
    } else {
      return String('Likes: ' + positive / total * 100) + '%';
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
  }


}

