import {Movie} from "./movie";

export class Mood {
  id: number;
  mood: string;
  description: string;
  image: string;
  back_image: string;
  movies: Movie[];
}
