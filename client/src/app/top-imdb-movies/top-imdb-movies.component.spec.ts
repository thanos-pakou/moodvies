import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TopImdbMoviesComponent } from './top-imdb-movies.component';

describe('TopImdbMoviesComponent', () => {
  let component: TopImdbMoviesComponent;
  let fixture: ComponentFixture<TopImdbMoviesComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TopImdbMoviesComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TopImdbMoviesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
