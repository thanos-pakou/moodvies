import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PostUserMovieListComponent } from './post-user-movie-list.component';

describe('PostUserMovieListComponent', () => {
  let component: PostUserMovieListComponent;
  let fixture: ComponentFixture<PostUserMovieListComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PostUserMovieListComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PostUserMovieListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
