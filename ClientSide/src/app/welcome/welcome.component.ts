import { Component, ViewChild, ElementRef, OnInit } from '@angular/core';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css'],
})
export class WelcomeComponent {
  @ViewChild('name') namekey!: ElementRef;
  @ViewChild('id') idkey!: ElementRef;
  public savedId: string = '';
  constructor() {}

  ngOnInit(): void {}
  startQuiz() {
    localStorage.setItem('name', this.namekey.nativeElement.value);
    localStorage.setItem('id', this.idkey.nativeElement.value);
  }

  saveId() {
    this.savedId = this.idkey.nativeElement.value;
  }
}
