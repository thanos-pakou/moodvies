import {Component, OnDestroy, OnInit} from '@angular/core';
import { Router } from '@angular/router';
import { Location } from '@angular/common';
import { catchError } from 'rxjs/operators';

import { AuthService } from '../auth.service';
import {MessageService} from '../message.service';
import {Title} from "@angular/platform-browser";

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit, OnDestroy{
  message: string;

  constructor(
    public auth: AuthService,
    private router: Router,
    private location: Location,
    public messageService: MessageService,
    private titleService: Title,
  ) { }

  ngOnInit() {
    this.titleService.setTitle('Moodvies--Login Page');
  }

  ngOnDestroy() {
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
