import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MoodDetailComponent } from './mood-detail.component';

describe('MoodDetailComponent', () => {
  let component: MoodDetailComponent;
  let fixture: ComponentFixture<MoodDetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MoodDetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MoodDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
