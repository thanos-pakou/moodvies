import { Component, OnInit } from '@angular/core';

import { Mood } from '../mood';
import { MoodService } from '../mood.service';

@Component({
  selector: 'app-mood',
  templateUrl: './mood.component.html',
  styleUrls: ['./mood.component.css']
})
export class MoodComponent implements OnInit {
  bool = false;
  p1 = 1;
  p: number[] = [];
  moods: Mood[];

  constructor(private moodService: MoodService) { }

  ngOnInit() {
    this.getMoods();
  }

  getMoods(): void {
    this.moodService.getMoods().subscribe(moods => this.moods = moods);
  }

  getBackImage(id, url): void {
    const el = document.getElementById(id);
    el.style.backgroundImage = 'url(\'' + url + '\')';
  }

  delBackImage(id): void {
    const el = document.getElementById(id);
    el.style.backgroundImage = '';
  }
}
