import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { UserMovieListDetailComponent } from './user-movie-list-detail.component';

describe('UserMovieListDetailComponent', () => {
  let component: UserMovieListDetailComponent;
  let fixture: ComponentFixture<UserMovieListDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ UserMovieListDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(UserMovieListDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
