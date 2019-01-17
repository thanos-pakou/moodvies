import {Component, OnInit} from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { catchError } from 'rxjs/operators';

import { AuthService } from '../auth.service';
import {MessageService} from '../message.service';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit{
  message: string;

  constructor(
    public auth: AuthService,
    private router: Router,
    private location: Location,
    public messageService: MessageService,
  ) { }

  ngOnInit() {
    this.messageService.clear();
  }

  login(username, password) {
    this.messageService.clear();
    this.auth.login(username, password)
      .subscribe(res => {
        if (res) {
          this.location.back();
        }
    });
  }

  logout() {
    this.auth.logout(true);
  }
}