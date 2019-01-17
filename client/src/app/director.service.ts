import { Injectable } from '@angular/core';

import { Observable } from 'rxjs';
import {HttpClient} from '@angular/common/http';

import { Director } from './director';


@Injectable({
  providedIn: 'root'
})
export class DirectorService {

  private directorUrl = 'api/director'

  constructor(private http: HttpClient) { }

  getDirectors(): Observable<Director[]> {
    return this.http.get<Director[]>(this.directorUrl);
  }

  getDirector(id: number): Observable<Director> {
    const url = `${this.directorUrl}/${id}`;
    return this.http.get<Director>(url);
  }
}
