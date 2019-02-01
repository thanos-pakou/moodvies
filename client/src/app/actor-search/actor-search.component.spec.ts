import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ActorSearchComponent } from './actor-search.component';

describe('ActorSearchComponent', () => {
  let component: ActorSearchComponent;
  let fixture: ComponentFixture<ActorSearchComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ActorSearchComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ActorSearchComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
