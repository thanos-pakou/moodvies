import {Component, OnInit, TemplateRef} from '@angular/core';

import { Director } from '../director';
import {DirectorService} from '../director.service';
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";




@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {

  public ngxLoadingAnimationTypes = ngxLoadingAnimationTypes;
  public loading = true;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public coloursEnabled = false;
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };
  p1 = 1;
  p: number[] = [];
  directors: Director[];

  constructor(public directorService: DirectorService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.directorService.loading = true;
    this.titleService.setTitle('Moodvies--Director Page');
    this.getDirectors();
  }

  getDirectors(): void {
    this.directorService.getDirectors().subscribe(directors => {
      this.directors = directors;
      this.directorService.loading = false;
    },
      () => this.directorService.loading = false
    );
  }

}
