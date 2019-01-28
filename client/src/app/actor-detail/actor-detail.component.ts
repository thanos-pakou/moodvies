import { Component, OnInit, Input } from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {ActorService} from '../actor.service';

import { Actor } from '../actor';

@Component({
  selector: 'app-actor-detail',
  templateUrl: './actor-detail.component.html',
  styleUrls: ['./actor-detail.component.css']
})
export class ActorDetailComponent implements OnInit {
  p1 = 1;

  @Input()
  actor: Actor;

  constructor(private route: ActivatedRoute,
              private actorService: ActorService) { }

  ngOnInit() {
    this.getActor();
  }

  getActor(): void {
    const id = +this.route.snapshot.paramMap.get('id');
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

}
