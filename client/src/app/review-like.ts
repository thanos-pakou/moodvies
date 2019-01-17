export class ReviewLike {
  constructor (like: boolean, userId: number, reviewId: number) {
    this.like= like;
    this.userId = userId;
    this. reviewId = reviewId;
  }

  like: boolean;
  userId: number;
  reviewId: number;
}
