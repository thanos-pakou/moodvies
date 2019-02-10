import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Observable } from 'rxjs/index';
import { map, catchError } from 'rxjs/operators';
import {ErrorHandlingService} from './errorhandling.service';
import { User } from './user';
import * as jwt_decode from 'jwt-decode';
import {Mood} from './mood';




class Credentials {
  constructor(public username: string, public password: string) {

  }
}

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};


@Injectable()
export class AuthService {

  isLoggedIn = false;
  username: string;
  user: User;

  constructor(
    private http: HttpClient,
    private eh: ErrorHandlingService
  ) { }

  register(user: User): Observable<boolean> {
    const userUrl = `/api/user`;
     return this.http
       .post(userUrl, user, httpOptions).pipe(
         catchError(this.eh.handleError<boolean>('addUser', false)),
         map(res => {
           if (res) {
             return true;
           }
         })
       );
  }


  login(username, password): Observable<boolean> {
    const authUrl = `/api-token-auth/`;
    const credentials = new Credentials(username, password);
    return this.http
      .post(authUrl, credentials, httpOptions ).pipe(
        map(results => {
          if (results['token']) {
            localStorage.setItem('moodvies-jwt-token', results['token']);
            this.isLoggedIn = true;
            this.username = username;
            alert('You have successfully logged in. Welcome ' + this.username);
            return true;
          } else {
            return false;
          }
        }),
        catchError(this.eh.handleError<boolean>(`Server Error`,
          false))
      );
  }



  logout(mess: boolean): void {
    this.isLoggedIn = false;
    if (mess) {
      alert('You have successfully logged out');
    }
    localStorage.removeItem('moodvies-jwt-token');
  }

  tokenVerify(token: string): Observable<boolean> {
    const verUrl = `/api-token-verify/`;
    return this.http
      .post(verUrl, {token: token}, httpOptions ).pipe(
        map(results => {
          if (results['token']) {
            localStorage.setItem('moodvies-jwt-token', results['token']);
            const decoded = jwt_decode(token);
            this.username = decoded['username'];
            this.isLoggedIn = true;
            return true;
          } else {
            return false;
          }
        }),
        catchError(this.eh.handleError<boolean>(`Server Error`,
          false))
      );
  }

  tokenRefresh(token: string): Observable<boolean> {
    const refUrl = `/api-token-refresh/`;
    return this.http
      .post(refUrl, {token: token}, httpOptions ).pipe(
        map(results => {
          if (results['token']) {
            const currDate = Math.floor((new Date).getTime()/1000);
            if(jwt_decode(token)['exp'] - currDate < 6000 ) {
              localStorage.setItem('moodvies-jwt-token', results['token']);
            }
            const decoded = jwt_decode(token);
            this.username = decoded['username'];
            this.isLoggedIn = true;
            return true;
          } else {
            return false;
          }
        }),
        catchError(this.eh.handleError<boolean>(`Server Error`,
          false))
    );
  }


  getUser(): Observable<User[]> {
    const getUserUrl = `/api/user`;
    return this.http.get<User[]>(getUserUrl);
  }

  updateUserProfile(user: User): Observable<any> {
    const url = `api/user/${user.id}`;
    return this.http.put(url, user, httpOptions);
  }

  updateUserProfileNoPw(user: User): Observable<any> {
    const url = `api/user-nopw/${user.id}`;
    return this.http.put(url, user, httpOptions).pipe(
      map(results => {
        if (results['token']) {
          localStorage.setItem('moodvies-jwt-token', results['token']);
          const decoded = jwt_decode(results['token']);
          this.username = decoded['username'];
          this.isLoggedIn = true;
        }
      })
    );
  }
}
