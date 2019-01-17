import {Component, Input, OnInit} from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {UserMovieListService} from '../user-movie-list.service';
import {UserMovieList} from '../user-movie-list';

@Component({
  selector: 'app-user-movie-list-detail',
  templateUrl: './user-movie-list-detail.component.html',
  styleUrls: ['./user-movie-list-detail.component.css']
})
export class UserMovieListDetailComponent implements OnInit {

  @Input()
  userMovieList: UserMovieList;

  constructor(public route: ActivatedRoute,
              private umlService: UserMovieListService) { }

  ngOnInit() {
    this.getUserMovieList();
  }

  getUserMovieList(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.umlService.getUserMovieList(id).subscribe(userMovieList => this.userMovieList = userMovieList);
  }

  getTitle(title, pub_year): String[] {
    const wTitle = title + ' (' + pub_year.toString() + ')';
    if (wTitle.length > 45) {
      return [wTitle.substr(0, 43) + '...', wTitle];
    } else {
      return [wTitle];
    }
  }

}
