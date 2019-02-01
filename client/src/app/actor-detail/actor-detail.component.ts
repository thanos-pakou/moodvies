import { Component, OnInit, Input } from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {ActorService} from '../actor.service';

import { Actor } from '../actor';
import {IpService} from "../ip.service";

@Component({
  selector: 'app-actor-detail',
  templateUrl: './actor-detail.component.html',
  styleUrls: ['./actor-detail.component.css']
})
export class ActorDetailComponent implements OnInit {
  p1 = 1;

  @Input()
  actor: Actor;
  actorId: number;

  constructor(private route: ActivatedRoute,
              private actorService: ActorService,
              private ip: IpService,
  ) { }

  ngOnInit() {
    this.getActor();
    setTimeout( () => {
      this.actorVisit();
    }, 5000 );

  }

  getActor(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.actorId = id;
    this.actorService.getActor(id).subscribe(actor => this.actor = actor);
  }

  getTitle(title, pub_year): String[] {
    const wTitle = title + ' (' + pub_year.toString() + ')';
    if (wTitle.length > 45) {
      return [wTitle.substr(0, 43) + '...', wTitle];
    } else {
      return [wTitle];
    }
  }

  actorVisit() {
    this.actor['visit'].push(this.ip.idIpAddress);
    this.ip.actorVisit(this.actor, this.actorId).subscribe();
  }

}
