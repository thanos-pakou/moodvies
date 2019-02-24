import {Component, OnInit, TemplateRef} from '@angular/core';
import {Movie} from '../movie';
import {MovieService} from '../movie.service';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-top20',
  templateUrl: './top20.component.html',
  styleUrls: ['./top20.component.css']
})
export class Top20Component implements OnInit {

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };
  p1 = 1;
  movies: Movie[];

  constructor(public movieService: MovieService,
              private titleService: Title,) { }

  ngOnInit() {
    this.movieService.loading = true;
    this.getTop20Movies();
  }

  getTop20Movies(): void {
    this.movieService.getTopMovies().subscribe(
      movies => {
        this.movies = movies;
        this.movieService.loading = false;
      },
      () => this.movieService.loading = false
    );
    this.titleService.setTitle('Moodvies --  Top 20 movies by our users');
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
