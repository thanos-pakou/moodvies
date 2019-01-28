import {Movie} from "./movie";

export class Actor {
  idActor: number;
  name: string;
  last_name: string;
  date_of_birth: Date;
  description: string;
  image: string;
  movies: Movie[];
}
