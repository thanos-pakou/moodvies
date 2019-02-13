import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import { UserMovieList } from '../user-movie-list';
import { AuthService } from '../auth.service';
import { UserMovieListService } from '../user-movie-list.service';
import {User} from '../user';
import {MessageService} from "../message.service";
import {MessageProfile} from "../message-profile";

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {
  @ViewChild('newPassword') newPassword: ElementRef;
  @ViewChild('repeatPassword') repeatPassword: ElementRef;
  @ViewChild('firstName') firstName: ElementRef;
  @ViewChild('lastName') lastName: ElementRef;
  @ViewChild('username') username: ElementRef;
  @ViewChild('email') email: ElementRef;

  uMovieLists: UserMovieList[];
  user: User[];
  selectedOption = 'prof';
  movieListToDelete: UserMovieList;
  profileUpdateConfirmToggle = false;
  profileFieldsToUpdate: String[] = [];
  profileFieldsToUpdate1: MessageProfile = new MessageProfile();
  profileFieldsToUpdate1Null = true;
  togUpProfile = false;
  changePass = false;
  passwordVerify = null;

  constructor(private auth: AuthService,
              private umlService: UserMovieListService,
              public messageService: MessageService,
              private el: ElementRef) { }

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
    this.profileFieldsToUpdate1 = new MessageProfile();
  }

  toggleChangePassword(bol: boolean): void {
    if (bol) {
      document.getElementById('password-li').style.display = 'block';
      this.changePass = true;
    } else {
      document.getElementById('password-li').style.display = 'none';
      this.changePass = false;
      this.newPassword.nativeElement.value = '';
      this.repeatPassword.nativeElement.value = '';
      this.passwordVerify = null;
    }
  }

  verifyNewPassword(newPw: string, repeatPw: string): void {
    if (repeatPw === '' || newPw === '') {
      this.passwordVerify = null;
      this.profileFieldsToUpdate1.password = undefined;
    } else if (newPw === repeatPw) {
      this.profileFieldsToUpdate1.password = newPw;
      this.passwordVerify = true;
    } else {
      this.profileFieldsToUpdate1.password = undefined;
      this.passwordVerify = false;
    }
  }

  updateProfile(username: string, email: string, newPassword: string, repeatPassword: string, fName: string, lName: string): void {
    this.messageService.clear();
    if (newPassword === ''){
      const user = new User(this.user[0].id, username, email, fName, lName);
      this.auth.updateUserProfileNoPw(user).subscribe(
        res => {console.log(res)},
        () => {},
        () => {
          if (this.auth.isLoggedIn == true) {
            this.auth.getUser().subscribe(user => this.user = user);
          }
        }
        );
    } else if (newPassword  === repeatPassword) {
      const user = new User(this.user[0].id, username, email, newPassword, fName, lName);
      this.auth.updateUserProfile(user).subscribe(
        () => {},
        () => {},
        () => {
          if (this.auth.isLoggedIn == true) {
            this.auth.getUser().subscribe(user => this.user = user);
          }
        },
      );
    } else {
      this.messageService.add('Password does not match');
    }
    this.profileUpdateConfirmToggle = false;
  }

  UpdateProfileConfirm(bol: boolean, username: string, email: string, newPassword: string, repeatPassword: string, fName: string, lName: string) {
    this.profileUpdateConfirmToggle = bol;
    if (username != this.user[0].username) {
      this.profileFieldsToUpdate1.username = username;
    }
    if (email != this.user[0].email) {
      this.profileFieldsToUpdate1.email = email;
    }
    if (fName != this.user[0].first_name) {
      this.profileFieldsToUpdate1.firstName = fName;
    }
    if (lName != this.user[0].last_name) {
      this.profileFieldsToUpdate1.lastName = lName;
    }
    if (newPassword != '' && repeatPassword != '' && newPassword === repeatPassword) {
    } else if (newPassword !== repeatPassword) {
      this.messageService.add('Passwords do not match.')
      this.profileUpdateConfirmToggle = false;
    }
  }

  UpdateProfileConfirmToggle(bol: boolean) {
    this.profileUpdateConfirmToggle = bol;
    this.profileFieldsToUpdate.length = 0;
  }

  keyUpFieldsToUpdate(oldField: string, newField: string, fieldName: string): void {
    if (newField === '') {
    } else if (oldField !== newField) {
      this.profileFieldsToUpdate1[fieldName] = newField;
    } else {
      this.profileFieldsToUpdate1[fieldName] = undefined;
    }
  }

  focusOutFieldsToUpdate(oldField: string, newField: string, fieldName: string): void {
    if (newField === '') {
      this.profileFieldsToUpdate1[fieldName] = undefined;
      this[fieldName].nativeElement.value = oldField;
    }
  }

  passwordVerification(password: string) {
    alert(<string>this.username.nativeElement);
    this.auth.verifyPassword(this.user[0].username, password).subscribe(
      res => {
        if(res) {
          alert(this.username.nativeElement.value);
          this.updateProfile(this.username.nativeElement.value, this.email.nativeElement.value, this.newPassword.nativeElement.value, this.repeatPassword.nativeElement.value, this.firstName.nativeElement.value, this.lastName.nativeElement.value)
        }
      }
    )
  }
}
