import {Genre} from "./genre";
import {Mood} from "./mood";
import {Actor} from "./actor";
import {Director} from "./director";
import {Review} from "./review";

export class Movie {
  constructor(id, title, pub_year) {
    this.id = id;
    this.title = title;
    this.pub_year = pub_year;
  }
  id: number;
  title: string;
  pub_year: number;
  description: string;
  trailer_url: string;
  logo: string;
  country: string;
  duration: number;
  strDuration: string;
  imdb_score: number;
  total_rate: number;
  ratings: number[];
  reviews: Review[];
  genre: number[];
  genre_details: Genre[];
  mood: number[];
  mood_details: Mood[];
  actor: number[];
  actor_details: Actor[];
  director: number[];
  director_details: Director[];
}
