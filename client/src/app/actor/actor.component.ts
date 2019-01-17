import { Component, OnInit } from '@angular/core';

import { Actor } from '../actor';
import { ActorService } from '../actor.service';

@Component({
  selector: 'app-actor',
  templateUrl: './actor.component.html',
  styleUrls: ['./actor.component.css']
})
export class ActorComponent implements OnInit {

  actors: Actor[];

  constructor(private actorService: ActorService) { }

  ngOnInit() {
    this.getActors();
  }

  getActors(): void {
    this.actorService.getActors().subscribe(actors => this.actors = actors);
  }

}
