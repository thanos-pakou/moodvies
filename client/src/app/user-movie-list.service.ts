import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from '@angular/common/http';
import {ErrorHandlingService} from './errorhandling.service';
import {Observable} from 'rxjs';
import {UserMovieList} from './user-movie-list';


const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class UserMovieListService {

  url = 'api/movie-list';

  constructor(private http: HttpClient,
              private eh: ErrorHandlingService) { }


  /**
   * Gets all movie lists from the server
   * */
  getUserMovieLists(): Observable<UserMovieList[]> {
    return this.http.get<UserMovieList[]>(this.url);
  }

  /**
   * Gets  movie list from the server by id
   * */
  getUserMovieList(id: number): Observable<UserMovieList> {
    const url = `${this.url}/${id}`;
    return this.http.get<UserMovieList>(url);
  }

  /**
   * Gets movie lists from the server by user
   * */
  getUserMovieListByUser(id: number): Observable<UserMovieList[]> {
    const url = `${this.url}/?user=${id}`;
    return this.http.get<UserMovieList[]>(url);
  }


  /**
   * Deletes a movie list from the server
   * */
  deleteUserMovieList(umList: UserMovieList | number): Observable<UserMovieList> {
    const id = typeof umList === 'number' ? umList : umList.idUserMovieList;
    const url = `${this.url}/${id}`;

    return this.http.delete<UserMovieList>(url, httpOptions);
  }
}
