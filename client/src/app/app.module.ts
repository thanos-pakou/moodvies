import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import {NgbModule} from '@ng-bootstrap/ng-bootstrap';
import {ErrorHandler, NgModule} from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { StarRatingModule } from 'angular-star-rating';

import { HttpClientModule } from '@angular/common/http';
import { AppComponent } from './app.component';
import { AppRoutingModule } from './app-routing.module';
import { MovieComponent } from './movie/movie.component';

import { MovieService } from './movie.service';
import { AuthService } from './auth.service';
import { MoodService } from './mood.service';

import { MovieDetailComponent } from './movie-detail/movie-detail.component';
import { LoginComponent } from './login/login.component';
import { HTTP_INTERCEPTORS } from '@angular/common/http';
import { TokenInterceptor } from './token.interceptor';
import { MoodComponent } from './mood/mood.component';
import { MoodDetailComponent } from './mood-detail/mood-detail.component';
import { ActorComponent } from './actor/actor.component';
import { ActorDetailComponent } from './actor-detail/actor-detail.component';
import { DirectorComponent } from './director/director.component';
import { DirectorDetailComponent } from './director-detail/director-detail.component';
import { GenreComponent } from './genre/genre.component';
import { GenreDetailComponent } from './genre-detail/genre-detail.component';
import { UserMovieListComponent } from './user-movie-list/user-movie-list.component';
import { UserMovieListDetailComponent } from './user-movie-list-detail/user-movie-list-detail.component';
import {ErrorHandlingService} from './errorhandling.service';
import { RegisterComponent } from './register/register.component';
import { HomeComponent } from './home/home.component';
import { NavbarComponent } from './navbar/navbar.component';
import {MessageService} from './message.service';
import {NgxPaginationModule} from 'ngx-pagination';
import { MovieSearchComponent } from './movie-search/movie-search.component';
import { TopImdbMoviesComponent } from './top-imdb-movies/top-imdb-movies.component';
import {UserMovieListService} from './user-movie-list.service';
import { Top20Component } from './top20/top20.component';
import { ProfileComponent } from './profile/profile.component';
import { PostReviewComponent } from './post-review/post-review.component';
import { AboutComponent } from './about/about.component';
import { FooterComponent } from './footer/footer.component';


@NgModule({
  declarations: [
    AppComponent,
    MovieComponent,
    MovieDetailComponent,
    LoginComponent,
    MoodComponent,
    MoodDetailComponent,
    ActorComponent,
    ActorDetailComponent,
    DirectorComponent,
    DirectorDetailComponent,
    GenreComponent,
    GenreDetailComponent,
    UserMovieListComponent,
    UserMovieListDetailComponent,
    RegisterComponent,
    HomeComponent,
    NavbarComponent,
    MovieSearchComponent,
    TopImdbMoviesComponent,
    Top20Component,
    ProfileComponent,
    PostReviewComponent,
    AboutComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    AppRoutingModule,
    HttpClientModule,
    NgbModule.forRoot(),
    NgxPaginationModule,
    BrowserAnimationsModule,
    StarRatingModule.forRoot()
  ],
  providers: [MovieService, AuthService, MoodService, ErrorHandlingService, MessageService, UserMovieListService,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: TokenInterceptor,
      multi: true,
    },
    {provide: ErrorHandler, useClass: ErrorHandler}
    ],
  bootstrap: [AppComponent]
})
export class AppModule { }