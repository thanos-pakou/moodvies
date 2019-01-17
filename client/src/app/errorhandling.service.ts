import { Injectable } from '@angular/core';

import { MessageService } from './message.service';

import { Observable } from 'rxjs';
import { of } from 'rxjs';

@Injectable()
export class ErrorHandlingService {

  constructor(private messageService: MessageService) { }

  /**
   * Handle HTTP operation that failed.
   * Let the app continue.
   * @param operation - name of the operation that failed
   * @param result - optional value to return as the observable result
   */
  public handleError<T>(operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {
      if (error.error.username) {
        if (String(error.error.username) === 'This field must be unique.') {
          this.messageService.add('Username: This username is already taken');
        } else {
          this.messageService.add('Username: ' + error.error.username);
        }
      }

      if (error.error.password) {
        this.messageService.add('Password: ' + error.error.password);
      }

      if (error.error.email) {
        this.messageService.add('Email: ' + error.error.email);
      }

      if (error.error.first_name) {
        this.messageService.add('First Name: ' + error.error.first_name);
      }

      if (error.error.last_name) {
        this.messageService.add('Last Name: ' + error.error.last_name);
      }

      if (error.error.non_field_errors) {
        if (String(error.error.non_field_errors) === 'The fields user, movie must make a unique set.') {
          this.messageService.add('You have already rated this movie.');
        } else {
          this.messageService.add('Username, Password or both seem to be  incorrect');
        }
      }

      if (error.error.title) {
        if (String(error.error.title) === 'This field must be unique.') {
          this.messageService.add('Title: This title is already taken');
        } else {
          this.messageService.add('Title: ' + error.error.title);
        }
      }

      if (error.error.description) {
        this.messageService.add('Description: ' + error.error.content);
      }

      if (error.error.content) {
        this.messageService.add('Content: ' + error.error.content);
      }

      console.error(error); // log to console instead
      // Let the app keep running by returning an empty result.
      return of(result as T);
    };
  }


}
