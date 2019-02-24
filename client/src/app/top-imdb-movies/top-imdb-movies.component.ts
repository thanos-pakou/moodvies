import { Component, OnInit } from '@angular/core';
import {MovieService} from '../movie.service';
import {Movie} from '../movie';
import {Title} from "@angular/platform-browser";

@Component({
  selector: 'app-top-imdb-movies',
  templateUrl: './top-imdb-movies.component.html',
  styleUrls: ['./top-imdb-movies.component.css']
})
export class TopImdbMoviesComponent implements OnInit {

  movies: Movie[];
  p1 = 1;

  constructor(private movieService: MovieService,
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
