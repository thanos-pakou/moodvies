import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Top20Component } from './top20.component';

describe('Top20Component', () => {
  let component: Top20Component;
  let fixture: ComponentFixture<Top20Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Top20Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Top20Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
