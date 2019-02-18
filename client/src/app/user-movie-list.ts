import {Movie} from "./movie";
import {User} from "./user";

export class UserMovieList {
  idUserMovieList: number;
  title: string;
  description: string;
  movies: number[];
  movies_details: Movie[];
  user: number[];
  user_details: User[];
  created: Date;
}
