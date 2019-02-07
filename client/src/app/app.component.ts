import {Component, OnInit} from "@angular/core";
import {AuthService} from "./auth.service";
import { Router } from "@angular/router";
import { CookieService } from 'ngx-cookie-service';
import {HttpClient} from "@angular/common/http";
import * as jwt_decode from "jwt-decode";
import {IpService} from "./ip.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  title = 'moodvies';
  token: string;
  ipAddress: any;



  constructor(
    private http: HttpClient,
    private auth: AuthService,
    private router: Router,
    private ip: IpService,
    private cookieService: CookieService,
  ) {

  }

  ngOnInit() {
    this.token = localStorage.getItem('moodvies-jwt-token');
    if (this.token) {
      this.auth.tokenRefresh(this.token).subscribe(results => {
        if (results) {
          const currDate = Math.floor((new Date).getTime()/1000);
          const decoded = jwt_decode(this.token);
          if(decoded['exp'] - currDate < 6000 ) {
            localStorage.removeItem('moodvies-jwt-token');
            localStorage.setItem('moodvies-jwt-token', results['token']);
          }
        } else {
          this.auth.logout(false);
          this.router.navigate(['/login']);
        }
      });
    } else {
      this.auth.logout(false);
    }
    this.getIpAddress();
  }

  changeOfRoutes() {
    this.token = localStorage.getItem('moodvies-jwt-token');
    if (this.token) {
      this.auth.tokenRefresh(this.token).subscribe(results => {
        if (results) {
          const currDate = Math.floor((new Date).getTime()/1000);
          const decoded = jwt_decode(this.token);
          if(decoded['exp'] - currDate < 60 ) {
            localStorage.removeItem('moodvies-jwt-token');
            localStorage.setItem('moodvies-jwt-token', results['token']);
          }
        } else {
            this.auth.logout(false);
            this.router.navigate(['/login']);
        }
      });
    } else {
      this.auth.logout(false);
    }
  }

  getIpAddress(): void {
    this.ip.getIpAddress();
  }
}




