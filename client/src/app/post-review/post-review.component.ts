import {Component, OnInit, Input, Output, EventEmitter} from '@angular/core';
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
  @Output() posted = new EventEmitter<boolean>();

  review: Review;

  constructor(private movieService: MovieService,
              public messageService: MessageService) { }

  ngOnInit() {
    this.messageService.clear();

  }

  postReview(title: string, content: string): void {
    this.messageService.clear();
    this.review = new Review(this.idUser, this.idMovie, title, content);
    this.movieService.postReview(this.review).subscribe(res => {
      if (res) {
        this.movieService.createReview = false;
        this.posted.emit(true);
      } else {
        window.setTimeout(function() {
          window.scrollTo(0,  document.body.scrollHeight -900);
        }, 200);
      }
    });
  }
}
