import {Component, OnInit, TemplateRef} from '@angular/core';

import { Actor } from '../actor';
import { ActorService } from '../actor.service';
import {debounceTime, delay, distinctUntilChanged, startWith, switchMap} from "rxjs/operators";
import {Observable, Subject} from "rxjs";
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-actor',
  templateUrl: './actor.component.html',
  styleUrls: ['./actor.component.css']
})
export class ActorComponent implements OnInit {

  public ngxLoadingAnimationTypes = ngxLoadingAnimationTypes;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public coloursEnabled = false;
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  actors: Actor[];
  p1 = 1;
  p: number[] = [];

  searchValue = '';
  actors$: Observable<Actor[]>;
  private searchTerms = new Subject<string>();

  constructor(public actorService: ActorService,
              private titleService: Title,
  ) { }

  search(term: string): void {
    this.searchTerms.next(term);
  }

  ngOnInit() {
    this.actorService.loading = true;
    this.titleService.setTitle('Moodvies--Actor Page');
    this.getActors();
    this.actors$ = this.searchTerms.pipe(
      // wait 300ms after each keystroke before considering the term
      debounceTime(300),

      // ignore new term if same as previous term
      distinctUntilChanged(),

      // switch to new search observable each time the term changes
      switchMap((term: string) => this.actorService.searchActors(term)),

    )

  }

  getActors(): void {
    this.actorService.getActors().subscribe(
      actors => {
        this.actors = actors;
        this.actorService.loading = false
    },
      () => this.actorService.loading = false
    );

  }

}
