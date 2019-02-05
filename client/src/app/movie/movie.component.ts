import { Component, OnInit } from '@angular/core';

import { MovieService } from '../movie.service';
import { Movie } from '../movie';
import {Title} from "@angular/platform-browser";

@Component({
  selector: 'app-movie',
  templateUrl: './movie.component.html',
  styleUrls: ['./movie.component.css']
})
export class MovieComponent implements OnInit {
  p: number[] = [];
  p1 = 1;
  movies: Movie[];

  constructor(private movieService: MovieService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.getMovies();
    this.titleService.setTitle('Moodvies -- List of all movies');
  }

  getMovies(): void {
    this.movieService.getMovies().subscribe(movies => this.movies = movies);

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
