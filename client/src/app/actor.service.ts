import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import {HttpClient} from '@angular/common/http';

import { Actor } from './actor';

@Injectable({
  providedIn: 'root'
})
export class ActorService {

  private actorUrl = 'api/actor';

  constructor(private http: HttpClient) { }

  getActors(): Observable<Actor[]> {
    return this.http.get<Actor[]>(this.actorUrl);
  }

  getActor(id: number): Observable<Actor> {
    const url = `${this.actorUrl}/${id}`;
    return this.http.get<Actor>(url);
  }
}
