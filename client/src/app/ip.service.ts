import { Injectable } from '@angular/core';
import {HttpClient} from "@angular/common/http";
import {map} from "rxjs/operators";

@Injectable({
  providedIn: 'root'
})
export class IpService {

  ipAddress: any;

  constructor(private http: HttpClient) { }

  getIpAddress(): void {
    const proxyurl = "https://cors-anywhere.herokuapp.com/";
    const url = "https://api.ipify.org?format=json"; // site that doesn’t send Access-Control-*
    fetch(proxyurl + url) // https://cors-anywhere.herokuapp.com/https://example.com
      .then(response => response.text())
      .then(contents => { if (contents) {this.ipAddress = JSON.parse(contents).ip} })
      .catch(() => console.log("Can’t access " + url + " response. Blocked by browser?"))
  }
}



