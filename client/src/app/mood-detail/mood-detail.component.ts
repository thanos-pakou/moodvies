import {Component, Input, OnInit, TemplateRef} from '@angular/core';

import { Mood } from '../mood';
import { MoodService} from '../mood.service';

import { ActivatedRoute } from '@angular/router';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-mood-detail',
  templateUrl: './mood-detail.component.html',
  styleUrls: ['./mood-detail.component.css']
})
export class MoodDetailComponent implements OnInit {

  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  p1 = 1;

  constructor(private route: ActivatedRoute,
              public moodService: MoodService,
              private titleService: Title) { }

  @Input()
  mood: Mood;

  ngOnInit() {
    this.moodService.loading = true;
    this.getMood();
  }


  getMood(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.moodService.getMood(id).subscribe(
      mood => {
        this.mood = mood;
        this.moodService.loading = false;
      },
      () => this.moodService.loading = false,
      () => {
        this.titleService.setTitle('Mood: ' + this.mood.mood);
      }
    );
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
