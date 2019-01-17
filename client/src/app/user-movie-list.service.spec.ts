import { TestBed } from '@angular/core/testing';

import { UserMovieListService } from './user-movie-list.service';

describe('UserMovieListService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: UserMovieListService = TestBed.get(UserMovieListService);
    expect(service).toBeTruthy();
  });
});
