import { Component, OnInit } from '@angular/core';

import { Director } from '../director';
import {DirectorService} from '../director.service';
import {Title} from "@angular/platform-browser";




@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {

  p1 = 1;
  p: number[] = [];
  directors: Director[];

  constructor(private directorService: DirectorService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.titleService.setTitle('Moodvies--Director Page');
    this.getDirectors();
  }

  getDirectors(): void {
    this.directorService.getDirectors().subscribe(directors => this.directors = directors);
  }

}
