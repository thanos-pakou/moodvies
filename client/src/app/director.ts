import {Movie} from "./movie";

export class Director {
  idDirector: number;
  name: string;
  l_name: string;
  date_of_birth: Date;
  description: string;
  image: string;
  movies: Movie[];
}
