import {Component, OnInit} from '@angular/core';
import {AuthService} from './auth.service';
import { Router } from '@angular/router';
import * as jwt_decode from 'jwt-decode';
import {ErrorHandlingService} from "./errorhandling.service";

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit{
  title = 'moodvies';
  token: string;


  constructor(
    private auth: AuthService,
    private router: Router,
    private eh: ErrorHandlingService,
  ) {}

  ngOnInit() {

  }

  changeOfRoutes() {
    this.token = localStorage.getItem('moodvies-jwt-token');
    if (this.token) {
      this.auth.tokenRefresh(this.token).subscribe(results => {
        if (results) {
          const currDate = Math.floor((new Date).getTime()/1000);
          if(jwt_decode(this.token).exp - currDate < 60 ) {

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
}




