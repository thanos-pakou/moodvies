import {Component, OnInit, TemplateRef} from '@angular/core';

import { Mood } from '../mood';
import { MoodService } from '../mood.service';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-mood',
  templateUrl: './mood.component.html',
  styleUrls: ['./mood.component.css']
})
export class MoodComponent implements OnInit {


  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };
  bool = false;
  p1 = 1;
  p: number[] = [];
  moods: Mood[];

  constructor(public moodService: MoodService,
              private titleService: Title) { }

  ngOnInit() {
    this.moodService.loading = true;
    this.getMoods();
    this.titleService.setTitle('Moodvies--Mood Page');
  }

  getMoods(): void {
    this.moodService.getMoods().subscribe(
      moods => {
        this.moods = moods;
        this.moodService.loading = false;
      },
      () => this.moodService.loading = false,
      () => {}
    );
  }

  getBackImage(id, url): void {
    const el = document.getElementById(id);
    el.style.backgroundImage = 'url(\'' + url + '\')';
  }

  delBackImage(id): void {
    const el = document.getElementById(id);
    el.style.backgroundImage = '';
  }
}
