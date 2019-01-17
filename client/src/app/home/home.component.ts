import { Component, OnInit } from '@angular/core';
import {AuthService} from '../auth.service';
import {MovieService} from '../movie.service';
import {Movie} from '../movie';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {
  movies: Movie[];

  constructor(private auth: AuthService,
              private movieService: MovieService) { }

  ngOnInit() {
    this.getMovies();
  }

  getMovies(): void {
    this.movieService.getRecommendedMovies().subscribe(movies => this.movies = movies);
  }

  getTitle(title, pub_year): String[] {
    const wTitle = title + ' (' + pub_year.toString() + ')';
    if (wTitle.length > 30) {
      return [wTitle.substr(0, 18) + '..', wTitle];
    } else {
      return [wTitle];
    }
  }
}
