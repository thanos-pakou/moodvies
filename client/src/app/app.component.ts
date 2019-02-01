import {Component, OnInit} from "@angular/core";
import {AuthService} from "./auth.service";
import { Router } from "@angular/router";
import {ErrorHandlingService} from "./errorhandling.service";
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
  ) {

  }

  ngOnInit() {
    this.getIpAddress();
    setTimeout( () => {
      this.postIpAddress();
    }, 5000 );
    setTimeout( () => {
      this.getIpAddressId();
    }, 8000 );
  }

  changeOfRoutes() {
    this.token = localStorage.getItem('moodvies-jwt-token');
    if (this.token) {
      this.auth.tokenRefresh(this.token).subscribe(results => {
        if (results) {
          const currDate = Math.floor((new Date).getTime()/1000);
          const decoded = jwt_decode(this.token);
          if(decoded['exp'] - currDate < 60 ) {

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

  postIpAddress(): void {
    this.ip.postIpAddress().subscribe();
  }

  getIpAddressId(): void {
    this.ip.getIpId();
  }
}




