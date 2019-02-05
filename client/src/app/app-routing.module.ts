import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';

import { MovieComponent } from './movie/movie.component';
import {MovieDetailComponent} from './movie-detail/movie-detail.component';
import {LoginComponent} from './login/login.component';
import {MoodComponent} from './mood/mood.component';
import {MoodDetailComponent} from './mood-detail/mood-detail.component';
import {ActorComponent} from './actor/actor.component';
import {ActorDetailComponent} from './actor-detail/actor-detail.component';
import {DirectorComponent} from './director/director.component';
import {DirectorDetailComponent} from './director-detail/director-detail.component';
import {RegisterComponent} from './register/register.component';
import {HomeComponent} from './home/home.component';
import {TopImdbMoviesComponent} from './top-imdb-movies/top-imdb-movies.component';
import {UserMovieListComponent} from './user-movie-list/user-movie-list.component';
import {Top20Component} from './top20/top20.component';
import {UserMovieListDetailComponent} from './user-movie-list-detail/user-movie-list-detail.component';
import {AboutComponent} from './about/about.component';
import {Page404Component} from "./page404/page404.component";

const routes: Routes = [
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: 'home', component: HomeComponent },
  { path: 'about', component: AboutComponent },
  { path: 'movies', component: MovieComponent },
  { path: 'movies/:id', component: MovieDetailComponent },
  { path: 'top-imdb', component: TopImdbMoviesComponent },
  { path: 'top20', component: Top20Component },
  { path: 'movie-lists', component: UserMovieListComponent },
  { path: 'movie-lists/:id', component: UserMovieListDetailComponent },
  { path: 'moods', component: MoodComponent },
  { path: 'moods/:id', component: MoodDetailComponent },
  { path: 'actors', component: ActorComponent },
  { path: 'actors/:id', component: ActorDetailComponent },
  { path: 'directors', component: DirectorComponent },
  { path: 'directors/:id', component: DirectorDetailComponent },
  { path: 'login', component: LoginComponent },
  { path: 'register', component: RegisterComponent },
  {path: '404', component: Page404Component},
  {path: '**', redirectTo: '/404'}
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})
export class AppRoutingModule { }
