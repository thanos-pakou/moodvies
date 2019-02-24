import {Component, OnInit, TemplateRef} from '@angular/core';
import {AuthService} from '../auth.service';
import {MovieService} from '../movie.service';
import {Movie} from '../movie';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.css']
})
export class HomeComponent implements OnInit {

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };
  movies: Movie[];

  constructor(private auth: AuthService,
              public movieService: MovieService,
              private titleService: Title) { }

  ngOnInit() {
    this.movieService.loading = true;
    this.getMovies();
    this.titleService.setTitle('Moodvies--Home Page');
  }

  getMovies(): void {
    this.movieService.getRecommendedMovies().subscribe(
      movies => {
        this.movies = movies;
        this.movieService.loading = false;
      },
      () => this.movieService.loading = false
      );
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
