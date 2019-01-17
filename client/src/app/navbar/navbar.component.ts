import {Component, Input, OnDestroy, OnInit} from '@angular/core';
import {AuthService} from '../auth.service';
import {Router} from '@angular/router';
import { JwtHelperService } from '@auth0/angular-jwt';
import {User} from '../user';
import {Movie} from '../movie';


@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css'],
})
export class NavbarComponent implements OnInit, OnDestroy {

  profile = false;
  user: User[];
  state = 'small';

  constructor( public auth: AuthService,
               public router: Router) { }

  ngOnInit() {
    if (this.auth.isLoggedIn === true) {
      this.auth.getUser().subscribe(user => this.user = user);
    }
  }

  ngOnDestroy() {
    const helper = new JwtHelperService();
    const token = localStorage.getItem('moodvies-jwt-token');
    const isExpired = helper.isTokenExpired(token);
    if (isExpired) {
      this.auth.logout(false);
    }
  }
  getProfile(bool: boolean): void {
    this.profile = bool;
  }





}
