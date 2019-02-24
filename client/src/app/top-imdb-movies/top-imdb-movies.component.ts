import {Component, OnInit, TemplateRef} from '@angular/core';
import {MovieService} from '../movie.service';
import {Movie} from '../movie';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-top-imdb-movies',
  templateUrl: './top-imdb-movies.component.html',
  styleUrls: ['./top-imdb-movies.component.css']
})
export class TopImdbMoviesComponent implements OnInit {


  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  movies: Movie[];
  p1 = 1;

  constructor(public movieService: MovieService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.movieService.loading = true;
    this.getTopImdbMovies();
  }

  getTopImdbMovies(): void {
    this.movieService.getTopImdbMovies().subscribe(
      movies => {
        this.movies = movies;
        this.movieService.loading = false;
      },
      () => this.movieService.loading = false
    );
    this.titleService.setTitle('Moodvies --  Top 20 movies according to imdb');
  }

  getTitle(title, pub_year): String[] {
    const wTitle = title + ' (' + pub_year.toString() + ')';
    if (wTitle.length > 45) {
      return [wTitle.substr(0, 43) + '...', wTitle];
    } else {
      return [wTitle];
    }
  }

}
