import { Component, OnInit } from '@angular/core';
import {FeedbackService} from "../feedback.service";
import {IpService} from "../ip.service";
import {Feedback} from "../feedback";

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {

  constructor(
    private feedService: FeedbackService,
    private ip: IpService,
  ) { }

  ngOnInit() {
  }

  postFeedback(email: string, cont: string) {
    const ip = this.ip.idIpAddress;
    const feed = new Feedback(email, cont, ip);
    this.feedService.postFeedback(feed).subscribe();
  }

}
