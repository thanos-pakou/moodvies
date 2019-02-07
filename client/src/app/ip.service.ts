import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {catchError, map} from "rxjs/operators";
import {Observable} from "rxjs";
import {ErrorHandlingService} from "./errorhandling.service";
import {Actor} from "./actor";
import {Director} from "./director";
import {Movie} from "./movie";

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

class ipAddress {
  constructor (ip:string) {
    this.ip = ip;
  }
  ip: string;
}

@Injectable({
  providedIn: 'root'
})
export class IpService {

  ipAddress: any;
  idIpAddress: any;

  constructor(private http: HttpClient,
              private eh: ErrorHandlingService
  ) { }

  getIpAddress(): Observable<any> {
    const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = "https://api.ipify.org?format=json"; // site that doesn’t send Access-Control-*
    return this.http.get(proxyurl + url);

  }

  postIpAddress(): Observable<boolean> {
    const url = `api/ip-address`;
    const ip = new ipAddress(this.ipAddress);
    return this.http.post(url, ip, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address', false)),
      map( res => {
        if (res) {
          return true;
        } else
          return false;
      })
    )
  }

  getIpId(): Observable<string> {
    const url = `api/ip-address?spec_ip=${this.ipAddress}`;
    return this.http.get<string>(url);
  }

  actorVisit(actor: Actor, actorId: number): Observable<boolean> {
    const url = `api/actor-update/${actorId}`;
    return this.http.put(url, actor, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address to actor', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }

  directorVisit(director: Director, directorId: number): Observable<boolean> {
    const url = `api/director-update/${directorId}`;
    return this.http.put(url, director, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address to director', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }


  movieVisit(movie: Movie, movieId: number): Observable<boolean> {
    const url = `api/movie-update/${movieId}`;
    return this.http.put(url, movie, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address to movie', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }
}



