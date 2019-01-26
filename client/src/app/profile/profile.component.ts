import { Component, OnInit } from '@angular/core';
import { UserMovieList } from '../user-movie-list';
import { AuthService } from '../auth.service';
import { UserMovieListService } from '../user-movie-list.service';
import {User} from '../user';

@Component({
  selector: 'app-profile',
  templateUrl: './profile.component.html',
  styleUrls: ['./profile.component.css']
})
export class ProfileComponent implements OnInit {

  uMovieLists: UserMovieList[];
  user: User[];
  selectedOption = 'prof';
  movieListToDelete: UserMovieList;

  constructor(private auth: AuthService,
              private umlService: UserMovieListService) { }

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
}
