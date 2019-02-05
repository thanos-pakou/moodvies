import { Component, OnInit } from '@angular/core';
import {Location} from "@angular/common";
import {Title} from "@angular/platform-browser";

@Component({
  selector: 'app-page404',
  templateUrl: './page404.component.html',
  styleUrls: ['./page404.component.css']
})
export class Page404Component implements OnInit {

  constructor(private location: Location,
              private titleService: Title,
              ) { }

  ngOnInit() {
    this.titleService.setTitle( 'Moodvies--Error Page' );
    console.log(window.location.href)
  }

  goBack(): void {
    this.location.back();
  }

}
