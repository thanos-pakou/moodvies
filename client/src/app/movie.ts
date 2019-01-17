export class Movie {
  constructor(id, title, pub_year) {
    this.id = id;
    this.title = title;
    this.pub_year = pub_year;
  }
  id: number;
  title: string;
  pub_year: number;
  mood: [number];
  trailer_url: string;
}
