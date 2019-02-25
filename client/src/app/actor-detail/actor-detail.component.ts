import {Component, OnInit, Input, TemplateRef} from '@angular/core';

import {ActivatedRoute} from '@angular/router';
import {ActorService} from '../actor.service';

import { Actor } from '../actor';
import {IpService} from "../ip.service";
import {Title} from "@angular/platform-browser";
import {ngxLoadingAnimationTypes} from "ngx-loading";

@Component({
  selector: 'app-actor-detail',
  templateUrl: './actor-detail.component.html',
  styleUrls: ['./actor-detail.component.css']
})
export class ActorDetailComponent implements OnInit {

  public ngxLoadingAnimationTypes = ngxLoadingAnimationTypes;
  public primaryColour = 'PrimaryWhite';
  public secondaryColour = 'SecondaryGrey';
  public coloursEnabled = false;
  public loadingTemplate: TemplateRef<any>;
  public config = { animationType: ngxLoadingAnimationTypes.none, primaryColour: this.primaryColour, secondaryColour: this.secondaryColour, tertiaryColour: this.primaryColour, backdropBorderRadius: '3px' };

  p1 = 1;

  @Input()
  actor: Actor;
  actorId: number;

  constructor(private route: ActivatedRoute,
              public actorService: ActorService,
              private ip: IpService,
              private titleService: Title,
  ) { }

  ngOnInit() {
    this.actorService.loading = true;
    this.ip.getIpAddress().subscribe(
      res => {
        this.ip.ipAddress = res.ip;
        this.ip.postIpAddress().subscribe(
          () => {
            this.ip.getIpId().subscribe(
              res => this.ip.idIpAddress = res[0]['id'],
              () => {},
              () => {this.actorVisit();}
            );
            },
        );
      },
    );
    this.getActor();

  }

  getActor(): void {
    const id = +this.route.snapshot.paramMap.get('id');
    this.actorId = id;
    this.actorService.getActor(id).subscribe(
      actor => {
        this.actor = actor
        this.actorService.loading = false;
      },
      () => {},
      () => {
        this.titleService.setTitle('Actor: ' + this.actor.name + ' ' + this.actor.last_name);
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

  actorVisit() {
    this.actor['visit'].push(this.ip.idIpAddress);
    this.ip.actorVisit(this.actor, this.actorId).subscribe();
  }

}
