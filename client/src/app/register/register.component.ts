import { Component, OnInit } from '@angular/core';
import {AuthService} from '../auth.service';
import {Router} from '@angular/router';
import {User} from '../user';
import { MessageService } from '../message.service';
import {catchError} from 'rxjs/operators';

@Component({
  selector: 'app-register',
  templateUrl: './register.component.html',
  styleUrls: ['./register.component.css']
})
export class RegisterComponent implements OnInit {


  user: User;

  constructor(
    public auth: AuthService,
    private router: Router,
    public messageService: MessageService
  ) { }

  ngOnInit( ) {
    this.user = new User();
    this.messageService.clear();
  }

  register(username, email, password, first_name, last_name) {
    this.messageService.clear();
    this.user.username = username;
    this.user.email = email;
    this.user.password = password;
    this.user.first_name = first_name;
    this.user.last_name = last_name;
    this.auth.register(this.user).subscribe(res => {
      if (res) {
        alert('Your account has created successfully!');
        this.router.navigate(['/login']);
      }
    });
  }
}
