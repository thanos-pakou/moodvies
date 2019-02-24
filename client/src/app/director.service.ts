import { Injectable } from '@angular/core';

import {Observable, of} from 'rxjs';
import {HttpClient} from '@angular/common/http';

import { Director } from './director';
import {Actor} from "./actor";


@Injectable({
  providedIn: 'root'
})
export class DirectorService {

  loading = false;
  private directorUrl = 'api/director';

  constructor(private http: HttpClient) { }

  /**
   * Gets list with all directors from the server
   * */
  getDirectors(): Observable<Director[]> {
    return this.http.get<Director[]>(this.directorUrl);
  }

  /**
   * Gets director from the server by id
   * */
  getDirector(id: number): Observable<Director> {
    const url = `${this.directorUrl}/${id}`;
    return this.http.get<Director>(url);
  }

  /**
   * Searches for director whose search field contains search term
   */
  searchDirectors(term: string): Observable<Director[]> {
    if (!term.trim()) {
      // if not search term, return empty director array.
      return of([]);
    }
    return this.http.get<Director[]>(`api/director/?search=${term}`);
  }
}
