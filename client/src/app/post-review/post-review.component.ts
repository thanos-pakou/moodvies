import { Component, OnInit, Input } from '@angular/core';
import {Review} from '../review';
import {MovieService} from '../movie.service';
import {MessageService} from '../message.service';

@Component({
  selector: 'app-post-review',
  templateUrl: './post-review.component.html',
  styleUrls: ['./post-review.component.css']
})
export class PostReviewComponent implements OnInit {

  @Input() idUser: number;
  @Input() idMovie: number;

  review: Review;

  constructor(private movieService: MovieService,
              public messageService: MessageService) { }

  ngOnInit() {
    this.messageService.clear();
    window.scrollTo(3000, document.body.scrollHeight);
  }

  postReview(title: string, content: string): void {
    this.messageService.clear();
    this.review = new Review(this.idUser, this.idMovie, title, content);
    this.movieService.postReview(this.review).subscribe(res => {
      if (res) {
        this.movieService.createReview = false;
      } else {
        window.setTimeout(function() {
          window.scrollTo(3000, document.body.scrollHeight);
        }, 200);
      }
    });
  }
}
