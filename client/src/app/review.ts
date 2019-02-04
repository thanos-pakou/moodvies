import {User} from "./user";
import {ReviewLike} from "./review-like";

class TotalLikes {
  positive_likes: number;
  total_likes: number;
}

export class Review {
  constructor(user: number,
              movie: number,
              title: string,
              content: string,
  ) {
    this.user = user;
    this.movie = movie;
    this.title = title;
    this.content = content;
  }
  idReview: number;
  user: number;
  user_details: User[];
  movie: number;
  title: string;
  content: string;
  likes: TotalLikes[];
  users_liked: ReviewLike[];
  created: string;

}
