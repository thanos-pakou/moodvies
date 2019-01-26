import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Movie } from './movie';
import {Observable, of} from 'rxjs/index';
import {User} from './user';
import {catchError, map} from 'rxjs/operators';
import {ErrorHandlingService} from './errorhandling.service';
import {Review} from './review';
import {ReviewLike} from './review-like';

class Rating {
  constructor(public user: number, public movie: number, public rating: number) {}
}

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  createReview = false;
  private movieUrl = 'api/movie';

  constructor(private http: HttpClient,
              private eh: ErrorHandlingService) { }

  /* Get a movie from the server by id */
  getMovie(id: number): Observable<Movie> {
    const url = `${this.movieUrl}/${id}`;
    return this.http.get<Movie>(url);
  }

  /* Get a list of all movies inside the server */
  getMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>(this.movieUrl);
  }


  getTopImdbMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>('api/movie/?top20_imdb=true');
  }

  getTopMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>('api/movie/?top20=true');
  }

  getRecommendedMovies(): Observable<Movie[]> {
    return this.http.get<Movie[]>('api/movie/?rec=true');
  }

  /* Get books whose title contains search term */
  searchMovies(term: string): Observable<Movie[]> {
    if (!term.trim()) {
      // if not search term, return empty book array.
      return of([]);
    }
    return this.http.get<Movie[]>(`api/movie/?search=${term}`);
  }

  /* Rate a movie by its id and saves the user id */
  rateMovie(idMovie: number, idUser: number, rating: number): Observable<boolean> {
    const url = `api/rating`;
    const ratings = new Rating(idUser, idMovie, rating)
    return this.http
      .post(url, ratings, httpOptions).pipe(
        catchError(this.eh.handleError<boolean>('addUser', false)),
        map(res => {
          if (res) {
            return true;
          }
        })
      );
  }

  postReview(review: Review): Observable<boolean> {
    const url = 'api/review';
    return this.http.post(url, review, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('postReview', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }

  likeReview(like: boolean, userId: number, reviewId: number): Observable<boolean> {
    const url = `api/review-like`;
    return this.http.post(url, {
      "like": like,
      "user": userId,
      "review": reviewId
    }, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('postReviewLike', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }

  reviewCheckIfLiked(user: number, review: number): Observable<boolean> {
    const url = `api/review-like/?user=${user}&review=${review}`;
      return this.http.get<ReviewLike>(url).pipe(
      map(
      res => {
        if (res) {
          return true;
        } else {
          return false;
        }
      }
    ));
  }


  postMovieList(userId: number, title: string, description: string, movieList: number[]): Observable<boolean> {
    const url = 'api/movie-list';
    const sth = {
      'user': userId,
      'title': title,
      'description': description,
      'movies': movieList
    };
    return this.http.post(url, sth, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('addUser', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }
}

