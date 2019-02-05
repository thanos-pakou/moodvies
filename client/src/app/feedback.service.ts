import { Injectable } from '@angular/core';
import {Observable} from "rxjs";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Feedback} from "./feedback";
import {map} from "rxjs/operators";

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class FeedbackService {

  constructor(private http: HttpClient,) { }

  postFeedback(feedback: Feedback): Observable<boolean> {
    const url = `api/feedback`;
    return this.http.post(url, feedback, httpOptions).pipe(
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }
}
