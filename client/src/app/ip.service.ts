import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {catchError, map} from "rxjs/operators";
import {Observable} from "rxjs";
import {ErrorHandlingService} from "./errorhandling.service";
import {Actor} from "./actor";
import {Director} from "./director";

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

  getIpAddress(): void {
    const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = "https://api.ipify.org?format=json"; // site that doesn’t send Access-Control-*
    fetch(proxyurl + url) // https://cors-anywhere.herokuapp.com/https://example.com
      .then(response => response.text())
      .then(contents => { if (contents) {this.ipAddress = JSON.parse(contents).ip} })
      .catch(() => console.log("Can’t access " + url + " response. Blocked by browser?"))
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

  getIpId(): void {
    const url = `api/ip-address?spec_ip=${this.ipAddress}`;
    this.http.get<string>(url).subscribe(res => this.idIpAddress = res[0]['id']);
  }

  actorVisit(actor: Actor, actorId: number): Observable<boolean> {
    const url = `api/actor/${actorId}`;
    return this.http.put(url, actor, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }

  directorVisit(director: Director, directorId: number): Observable<boolean> {
    const url = `api/director/${directorId}`;
    return this.http.put(url, director, httpOptions).pipe(
      catchError(this.eh.handleError<boolean>('post ip address to director', false)),
      map(res => {
        if (res) {
          return true;
        }
      })
    );
  }
}



