import {Component, Input, OnInit} from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {DirectorService} from '../director.service';

import { Director } from '../director';

@Component({
  selector: 'app-director-detail',
  templateUrl: './director-detail.component.html',
  styleUrls: ['./director-detail.component.css']
})
export class DirectorDetailComponent implements OnInit {

  @Input()
  director: Director;

  constructor(private route: ActivatedRoute,
              private directorService: DirectorService ) { }

  ngOnInit() {
    this.getDirector();
  }

  getDirector(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.directorService.getDirector(id).subscribe(director => this.director = director);
  }
}
