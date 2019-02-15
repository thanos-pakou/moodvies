import { Component, OnInit } from '@angular/core';
import {Observable, Subject} from "rxjs";
import {Movie} from "../movie";
import {debounceTime, distinctUntilChanged, switchMap} from "rxjs/operators";
import {MovieService} from "../movie.service";

import {AuthService} from "../auth.service";
import {User} from "../user";
import {Router} from "@angular/router";
import {UserMovieList} from "../user-movie-list";

@Component({
  selector: 'app-post-user-movie-list',
  templateUrl: './post-user-movie-list.component.html',
  styleUrls: ['./post-user-movie-list.component.css']
})
export class PostUserMovieListComponent implements OnInit {

  movies$: Observable<Movie[]>;
  containedMovie: number[] = [];
  userMovieList: Movie[] = [];
  searchValue = null;
  user: User[];

  private searchTerms = new Subject<string>();

  constructor(private movieService: MovieService,
              private authService: AuthService,
              private router: Router) { }

  /**
   * Pushes a movie search term into the observable stream.
   */
  search(term: string): void {
    this.searchTerms.next(term);
  }

  ngOnInit() {
    // Username Observable for verification
    this.movies$ = this.searchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.movieService.searchMovies(term)),
    );

    this.authService.getUser().subscribe(user => this.user = user);
  }

  /**
   * Adds movie to userMovieList:the movie list that will be created
   */
  addMovie(id: number, title: string, pub_year: number): void {
    const movie = new Movie(id, title, pub_year);
    this.containedMovie.push(id);
    this.userMovieList.push(movie);
  }

  /**
   * Removes movie from userMovieList: the movie list that will be created
   */
  deleteMovie(num: number): void {
    this.containedMovie.splice(num, 1);
    this.userMovieList.splice(num, 1);
  }

  /**
   * Posts movie list into the server through movie service
   */
  postList(userId: number, title: string, description: string): void {
    this.movieService.postMovieList(userId, title, description, this.containedMovie).subscribe(
      res => {
        if(res) {
          this.router.navigate([`/movie-lists/${res.idUserMovieList}`]);
        }
      }
    );
  }

}
