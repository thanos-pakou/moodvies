import { Component, OnInit } from '@angular/core';
import {MovieService} from '../movie.service';
import {debounceTime, distinctUntilChanged, switchMap, tap} from 'rxjs/operators';
import {Observable, Subject} from 'rxjs';
import {Movie} from '../movie';
import {AuthService} from '../auth.service';
import {User} from '../user';
import {UserMovieListService} from '../user-movie-list.service';
import {UserMovieList} from '../user-movie-list';
import {MessageService} from '../message.service';
import {Title} from "@angular/platform-browser";



@Component({
  selector: 'app-user-movie-list',
  templateUrl: './user-movie-list.component.html',
  styleUrls: ['./user-movie-list.component.css']
})


export class UserMovieListComponent implements OnInit {
  showListWindow = false;
  p1 = 1;
  p: number[] = [];
  searchValue = null;
  movies$: Observable<Movie[]>;
  movie: Movie;
  userMovieLists: UserMovieList[];
  userMovieList: Movie[] = [];
  containedMovie: number[] = [];
  user: User[];

  private searchTerms = new Subject<string>();

  constructor(private movieService: MovieService,
              public messageService: MessageService,
              public authService: AuthService,
              private umlService: UserMovieListService,
              private titleService: Title,
              ) {}

  // Push a search term into the observable stream.
  search(term: string): void {
    this.searchTerms.next(term);
  }


  ngOnInit(): void {
    this.titleService.setTitle('Moodvies --  Movie list from users');
    this.messageService.clear();
    this.getLists();
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

  getLists(): void {
    this.umlService.getUserMovieLists().subscribe(movieLists => this.userMovieLists = movieLists);
  }

  listWindow(bol: boolean): void {
    if (bol) {
      this.showListWindow = true;
    } else {
      this.showListWindow = false;
    }
  }

  addMovie(id: number, title: string, pub_year: number): void {
    const movie = new Movie(id, title, pub_year);
    this.containedMovie.push(id);
    this.userMovieList.push(movie);
  }

  deleteMovie(num: number): void {
    this.containedMovie.splice(num, 1);
    this.userMovieList.splice(num, 1);
  }

  postList(userId: number, title: string, description: string): void {
    this.movieService.postMovieList(userId, title, description, this.containedMovie).subscribe();
  }



}
