import { Component, OnInit } from '@angular/core';

import { Director } from '../director';
import {DirectorService} from '../director.service';



@Component({
  selector: 'app-director',
  templateUrl: './director.component.html',
  styleUrls: ['./director.component.css']
})
export class DirectorComponent implements OnInit {

  directors: Director[];

  constructor(private directorService: DirectorService) { }

  ngOnInit() {
    this.getDirectors();
  }

  getDirectors(): void {
    this.directorService.getDirectors().subscribe(directors => this.directors = directors);
  }

}
