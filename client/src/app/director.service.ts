import { Injectable } from '@angular/core';

import {Observable, of} from 'rxjs';
import {HttpClient} from '@angular/common/http';

import { Director } from './director';
import {Actor} from "./actor";


@Injectable({
  providedIn: 'root'
})
export class DirectorService {

  private directorUrl = 'api/director';

  constructor(private http: HttpClient) { }

  getDirectors(): Observable<Director[]> {
    return this.http.get<Director[]>(this.directorUrl);
  }

  getDirector(id: number): Observable<Director> {
    const url = `${this.directorUrl}/${id}`;
    return this.http.get<Director>(url);
  }

  searchDirectors(term: string): Observable<Director[]> {
    if (!term.trim()) {
      // if not search term, return empty book array.
      return of([]);
    }
    return this.http.get<Director[]>(`api/director/?search=${term}`);
  }
}
