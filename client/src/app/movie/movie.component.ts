import {Component, OnInit, TemplateRef} from '@angular/core';

import { MovieService } from '../movie.service';
import { Movie } from '../movie';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-movie',
  templateUrl: './movie.component.html',
  styleUrls: ['./movie.component.css']
})
export class MovieComponent implements OnInit {

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  p: number[] = [];
  p1 = 1;
  movies: Movie[];

  constructor(public movieService: MovieService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.movieService.loading = true;
    this.getMovies();
    this.titleService.setTitle('Moodvies -- List of all movies');
  }

  getMovies(): void {
    this.movieService.getMovies().subscribe(
      movies => {
        this.movies = movies;
        this.movieService.loading = false;
      },
      () => this.movieService.loading = false
    );
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
