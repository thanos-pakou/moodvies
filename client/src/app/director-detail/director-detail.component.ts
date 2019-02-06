import {Component, Input, OnInit} from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {DirectorService} from '../director.service';

import { Director } from '../director';
import {Title} from "@angular/platform-browser";
import {IpService} from "../ip.service";

@Component({
  selector: 'app-director-detail',
  templateUrl: './director-detail.component.html',
  styleUrls: ['./director-detail.component.css']
})
export class DirectorDetailComponent implements OnInit {
  p1 = 1;

  @Input()
  director: Director;
  directorId: number;

  constructor(private route: ActivatedRoute,
              private directorService: DirectorService,
              private ip: IpService,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.getDirector();
  }

  getDirector(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.directorId = id;
    this.directorService.getDirector(id).subscribe(
      actor => this.director = actor,
      () => {},
      () => {
        this.directorVisit();
        this.titleService.setTitle('Director: ' + this.director.name + ' ' + this.director.l_name);
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

  directorVisit() {
    this.director['visit'].push(this.ip.idIpAddress);
    this.ip.directorVisit(this.director, this.directorId).subscribe();
  }
}
