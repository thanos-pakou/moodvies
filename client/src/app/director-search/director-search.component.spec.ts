import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DirectorSearchComponent } from './director-search.component';

describe('DirectorSearchComponent', () => {
  let component: DirectorSearchComponent;
  let fixture: ComponentFixture<DirectorSearchComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DirectorSearchComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DirectorSearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
