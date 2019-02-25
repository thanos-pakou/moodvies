import {Component, OnInit, TemplateRef} from '@angular/core';
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

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;

  showListWindow = false;
  p1 = 1;
  p: number[] = [];
  movies$: Observable<Movie[]>;
  movie: Movie;
  userMovieLists: UserMovieList[];

  user: User[];

  private searchTerms = new Subject<string>();

  constructor(private movieService: MovieService,
              public messageService: MessageService,
              public authService: AuthService,
              public umlService: UserMovieListService,
              private titleService: Title,
              ) {}

  // Push a search term into the observable stream.
  search(term: string): void {
    this.searchTerms.next(term);
  }


  ngOnInit(): void {
    this.umlService.loading = true;
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
    this.umlService.getUserMovieLists().subscribe(
      movieLists => {
        this.userMovieLists = movieLists;
        this.umlService.loading = false;
      },
      () => this.umlService.loading = false
      );
  }

  listWindow(bol: boolean): void {
    this.showListWindow = bol;
  }



}
