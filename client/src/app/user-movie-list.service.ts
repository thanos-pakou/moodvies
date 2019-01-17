import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ErrorHandlingService} from './errorhandling.service';
import {Observable} from 'rxjs';
import {UserMovieList} from './user-movie-list';
import {Movie} from './movie';
import {User} from './user';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class UserMovieListService {

  url = 'api/movie-list'

  constructor(private http: HttpClient,
              private eh: ErrorHandlingService) { }


  getUserMovieLists(): Observable<UserMovieList[]> {
    return this.http.get<UserMovieList[]>(this.url);
  }

  getUserMovieList(id: number): Observable<UserMovieList> {
    const url = `${this.url}/${id}`;
    return this.http.get<UserMovieList>(url);
  }

  getUserMovieListByUser(id: number): Observable<UserMovieList[]> {
    const url = `${this.url}/?user=${id}`;
    return this.http.get<UserMovieList[]>(url);
  }

  /** DELETE: delete the book from the server */
  deleteUserMovieList(umList: UserMovieList | number): Observable<UserMovieList> {
    const id = typeof umList === 'number' ? umList : umList.idUserMovieList;
    const url = `${this.url}/${id}`;

    return this.http.delete<UserMovieList>(url, httpOptions);
  }
}
