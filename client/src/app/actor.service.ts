import { Injectable } from '@angular/core';

import {Observable, of} from 'rxjs';
import {HttpClient} from '@angular/common/http';

import { Actor } from './actor';
import {tap} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class ActorService {

  searching = false;
  loading = false;
  private actorUrl = 'api/actor';

  constructor(private http: HttpClient) { }

  getActors(): Observable<Actor[]> {
    return this.http.get<Actor[]>(this.actorUrl);
  }

  getActor(id: number): Observable<Actor> {
    const url = `${this.actorUrl}/${id}`;
    return this.http.get<Actor>(url);
  }

  searchActors(term: string): Observable<Actor[]> {
    if (!term.trim()) {
      // if not search term, return empty actor array.
      return of([]);
    }
    return this.http.get<Actor[]>(`api/actor/?search=${term}`);
  }
}
