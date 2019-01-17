import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { GenreDetailComponent } from './genre-detail.component';

describe('GenreDetailComponent', () => {
  let component: GenreDetailComponent;
  let fixture: ComponentFixture<GenreDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ GenreDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(GenreDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
