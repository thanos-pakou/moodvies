import { Component, OnInit } from '@angular/core';
import {Actor} from "../actor";
import {debounceTime, distinctUntilChanged, switchMap} from "rxjs/operators";
import {ActorService} from "../actor.service";
import {Observable, Subject} from "rxjs";

@Component({
  selector: 'app-actor-search',
  templateUrl: './actor-search.component.html',
  styleUrls: ['./actor-search.component.css']
})
export class ActorSearchComponent implements OnInit {
  searchValue = null;
  actors$: Observable<Actor[]>;
  private searchTerms = new Subject<string>();

  constructor(private actorService: ActorService) { }

  search(term: string): void {
    this.searchTerms.next(term);
  }

  ngOnInit() {
    this.actors$ = this.searchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.actorService.searchActors(term)),
    );
  }

}
