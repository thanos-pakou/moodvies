import {Component, ElementRef, OnInit, ViewChild} from '@angular/core';
import { UserMovieList } from '../user-movie-list';
import { AuthService } from '../auth.service';
import { UserMovieListService } from '../user-movie-list.service';
import {User} from '../user';
import {MessageService} from "../message.service";
import {MessageProfile} from "../message-profile";
import {ProfileService} from "../profile.service";
import {debounceTime, distinctUntilChanged, map, switchMap} from "rxjs/operators";
import {Observable, Subject} from "rxjs";

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
  togUpProfile = false;
  changePass = false;
  passwordVerify = null;
  username$: Observable<User[]>;
  email$: Observable<User[]>;

  private usernameSearchTerms = new Subject<string>();
  private emailSearchTerms = new Subject<string>();

  search(term: string, type: string): void {
    if (type === 'email') {
      this.emailSearchTerms.next(term);
    } else {
      this.usernameSearchTerms.next(term);
    }
  }

  constructor(private auth: AuthService,
              private umlService: UserMovieListService,
              public messageService: MessageService,
              private profService: ProfileService) { }

  ngOnInit() {
    this.messageService.clearMessagesProfile();
    if (this.auth.isLoggedIn == true) {
      this.auth.getUser().subscribe(
        user => this.user = user,
        () => {},
        () => {}
        );
    }

    this.username$ = this.usernameSearchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.profService.searchUsername(term)),
      map(res => {
          if (res.length !== 0) {
            this.profileFieldsToUpdate1.username = undefined;
          }
          return res;
        }
      )
    );

    this.email$ = this.emailSearchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.profService.searchEmail(term)),
      map(res => {
          if (res.length !== 0) {
            this.profileFieldsToUpdate1.email = undefined;
          }
          return res;
        }
      )
    )
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
      this.profService.updateUserProfileNoPw(user).subscribe(
        res => {
          if (res) {
            this.profileFieldsToUpdate1 = new MessageProfile();
            this.toggleChangePassword(false);
            this.profileUpdateConfirmToggle = false;
          }
        },
        () => {},
        () => {
          if (this.auth.isLoggedIn == true) {
            this.auth.getUser().subscribe(user => this.user = user);
          }
        }
        );
    } else if (newPassword  === repeatPassword) {
      const user = new User(this.user[0].id, username, email, fName, lName, newPassword);
      this.profService.updateUserProfile(user).subscribe(
        res => {
          if (res) {
            this.profileFieldsToUpdate1 = new MessageProfile();
            this.toggleChangePassword(false);
            this.profileUpdateConfirmToggle = false;
          }
        },
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
  }

  UpdateProfileConfirmToggle(bol: boolean) {
    this.profileUpdateConfirmToggle = bol;
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
    this.profService.verifyPassword(this.user[0].username, password).subscribe(
      res => {
        if(res) {
          alert(this.username.nativeElement.value);
          this.updateProfile(this.username.nativeElement.value, this.email.nativeElement.value, this.newPassword.nativeElement.value, this.repeatPassword.nativeElement.value, this.firstName.nativeElement.value, this.lastName.nativeElement.value)
        }
      }
    )
  }
}
