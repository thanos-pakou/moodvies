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
  movie: number;
  title: string;
  content: string;
}
