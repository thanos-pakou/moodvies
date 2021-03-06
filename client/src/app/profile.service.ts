import {Injectable, OnInit} from '@angular/core';
import {Observable, of} from "rxjs";
import {catchError, map} from "rxjs/operators";
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {ErrorHandlingService} from "./errorhandling.service";
import {User} from "./user";
import * as jwt_decode from 'jwt-decode';
import {AuthService} from "./auth.service";


class Credentials {
  constructor(public username: string, public password: string) {
  }
}

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable({
  providedIn: 'root'
})
export class ProfileService implements OnInit{

  isUsernameValidForUpdate = true;
  isEmailValidForUpdate = true;
  user: User[];

  constructor(private http: HttpClient,
              private eh: ErrorHandlingService,
              private auth: AuthService) { }


  ngOnInit() {

  }

  /**
   * Verifies password in the server for updating profile
   * Returns Observable boolean for result
   */
  verifyPassword(username, password): Observable<boolean> {
    const authUrl = `/api-token-auth/`;
    const credentials = new Credentials(username, password);
    return this.http
      .post(authUrl, credentials, httpOptions ).pipe(
        map(results => {
          return !!results['token'];
        }),
        catchError(this.eh.handleError<boolean>(`Server Error`,
          false))
      );
  }

  /**
   * Updates user in the server with new password and returns Observable
   * If password is ok returns new token with the updated information
   */
  updateUserProfile(user: User): Observable<any> {
    const url = `api/user/${user.id}`;
    return this.http.put(url, user, httpOptions).pipe(
      map(results => {
        console.log(results);
        if (results['token']) {
          localStorage.setItem('moodvies-jwt-token', results['token']);
          const decoded = jwt_decode(results['token']);
          this.auth.username = decoded['username'];
          this.auth.isLoggedIn = true;
          return true;
        } else {
          return false;
        }
      }),
      catchError(this.eh.handleError<boolean>(`updateUserProfile`,
        false))
    );
  }

  /**
   * Updates user in the server without new password and returns Observable
   * If password is ok returns new token with the updated information
   */
  updateUserProfileNoPw(user: User): Observable<any> {
    const url = `api/user-nopw/${user.id}`;
    return this.http.put(url, user, httpOptions).pipe(
      map(results => {
        if (results['token']) {
          localStorage.setItem('moodvies-jwt-token', results['token']);
          const decoded = jwt_decode(results['token']);
          this.auth.username = decoded['username'];
          this.auth.isLoggedIn = true;
          return true;
        } else {
          return false;
        }
      }),
      catchError(this.eh.handleError<boolean>(`updateUserProfileNoPw`,
        false))
    );
  }

  /**
   * Searches username in the server and returns a user[] with or without result in it
   * If no result found sets username true for update
   */
  searchUsername(term: string): Observable<User[]> {
    if (!term.trim()) {
      // if not search term, return empty book array.
      return of([]);
    }
    return this.http.get<User[]>(`api/user/?search_user_name=${term}`).pipe(
      map(res => {
        this.auth.getUser().subscribe(user => this.user = user,
          () => {},
          () => {
            if (term !== this.user[0].username)
              this.isUsernameValidForUpdate = res.length === 0;
            else {
              this.isUsernameValidForUpdate = true;
            }
          });
        return res
      })
    );
  }

  /**
   * Searches email in the server and returns a user[] with or without result in it
   * If no result found sets email true for update
   */
  searchEmail(term: string): Observable<User[]> {
    if (!term.trim()) {
      // if not search term, return empty book array.
      return of([]);
    }
    return this.http.get<User[]>(`api/user/?search_email=${term}`).pipe(
      map(res => {
        this.auth.getUser().subscribe(user => this.user = user,
          () => {},
          () => {
            if (term !== this.user[0].email)
              this.isEmailValidForUpdate = res.length === 0;
            else {
              this.isEmailValidForUpdate = true;
            }
          });
        return res
      })
    );
  }
}
