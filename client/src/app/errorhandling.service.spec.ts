import { TestBed } from '@angular/core/testing';

import { ErrorhandlingService } from './errorhandling.service';

describe('ErrorhandlingService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: ErrorhandlingService = TestBed.get(ErrorhandlingService);
    expect(service).toBeTruthy();
  });
});
