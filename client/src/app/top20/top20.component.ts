import { Component, OnInit } from '@angular/core';
import {Movie} from '../movie';
import {MovieService} from '../movie.service';

@Component({
  selector: 'app-top20',
  templateUrl: './top20.component.html',
  styleUrls: ['./top20.component.css']
})
export class Top20Component implements OnInit {

  p1 = 1;
  movies: Movie[];

  constructor(private movieService: MovieService) { }

  ngOnInit() {
    this.getTop20Movies();
  }

  getTop20Movies(): void {
    this.movieService.getTopMovies().subscribe(movies => this.movies = movies);
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
