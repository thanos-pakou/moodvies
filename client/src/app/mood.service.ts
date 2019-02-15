import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Mood } from './mood';
import {Observable, of} from 'rxjs';
import {Movie} from './movie';

@Injectable({
  providedIn: 'root'
})
export class MoodService {

  private moodUrl = 'api/mood';

  constructor(private http: HttpClient) { }

  /**
   * Gets all moods from the server
   * */
  getMoods(): Observable<Mood[]> {
    return this.http.get<Mood[]>(this.moodUrl);
  }

  /**
   * Gets mood from the server by id
   * */
  getMood(id: number): Observable<Mood> {
    const url = `${this.moodUrl}/${id}`;
    return this.http.get<Mood>(url);
  }
}
