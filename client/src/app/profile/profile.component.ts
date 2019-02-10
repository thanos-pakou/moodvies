import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import { UserMovieList } from '../user-movie-list';
import { AuthService } from '../auth.service';
import { UserMovieListService } from '../user-movie-list.service';
import {User} from '../user';
import {Observable} from "rxjs";
import {catchError} from "rxjs/operators";
import {ErrorHandlingService} from "../errorhandling.service";
import {MessageService} from "../message.service";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  @ViewChild('newPassword') newPassword: ElementRef;
  @ViewChild('repeatPassword') repeatPassword: ElementRef;

  uMovieLists: UserMovieList[];
  user: User[];
  selectedOption = 'prof';
  movieListToDelete: UserMovieList;
  togUpProfile = false;
  changePass = false;

  constructor(private auth: AuthService,
              private umlService: UserMovieListService,
              private messageService: MessageService) { }

  ngOnInit() {
    if (this.auth.isLoggedIn == true) {
      this.auth.getUser().subscribe(user => this.user = user);
    }
  }

  getUserMovieLists(id: number): void {
    this.umlService.getUserMovieListByUser(id).subscribe(movieLists => this.uMovieLists = movieLists);
  }

  onSelect(str: string): void {
    this.selectedOption = str;
  }

  confirmDelete(umList: UserMovieList): void {
    this.movieListToDelete = umList;
  }

  delete(umList: UserMovieList): void {
    this.uMovieLists = this.uMovieLists.filter(h => h !== umList);
    this.umlService.deleteUserMovieList(umList).subscribe();
    this.movieListToDelete = null;
  }

  toggleUpdateProfile(bol: boolean): void {
    this.togUpProfile = bol;
  }

  toggleChangePassword(bol: boolean): void {
    if (bol) {
      document.getElementById('password-li').style.visibility = 'visible';
      this.changePass = true;
    } else {
      document.getElementById('password-li').style.visibility = 'hidden';
      this.changePass = false;
      this.newPassword.nativeElement.value = '';
      this.repeatPassword.nativeElement.value = '';
    }
  }

  updateProfile(username: string, email: string, newPassword: string, repeatPassword: string, fName: string, lName: string): void {
    if (newPassword === ''){
      const user = new User(this.user[0].id, username, email, fName, lName);
      this.auth.updateUserProfileNoPw(user).subscribe(
        res => {console.log(res)}
        );
    } else if (newPassword  === repeatPassword) {
      const user = new User(this.user[0].id, username, email, newPassword, fName, lName);
      this.auth.updateUserProfile(user).subscribe();
    } else {
      this.messageService.add('Passwords does not match');
    }
  }
}
