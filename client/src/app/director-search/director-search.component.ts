import { Component, OnInit } from '@angular/core';
import {debounceTime, distinctUntilChanged, switchMap} from "rxjs/operators";
import {Observable, Subject} from "rxjs";
import {Director} from "../director";
import {DirectorService} from "../director.service";

@Component({
  selector: 'app-director-search',
  templateUrl: './director-search.component.html',
  styleUrls: ['./director-search.component.css']
})
export class DirectorSearchComponent implements OnInit {
  directors$: Observable<Director[]>;
  searchValue = '';
  private searchTerms = new Subject<string>();

  search(term: string): void {
    this.searchTerms.next(term);
  }

  constructor(private directorService: DirectorService) { }

  ngOnInit() {
    this.directors$ = this.searchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.directorService.searchDirectors(term)),

    )
  }

}
