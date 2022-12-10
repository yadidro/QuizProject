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
  textError: string = '';
  constructor() {}

  ngOnInit(): void {}
  startQuiz() {
    localStorage.setItem('name', this.namekey.nativeElement.value);
    localStorage.setItem('id', this.idkey.nativeElement.value);
  }

  saveId() {
    if (this.checkIdValid(this.idkey.nativeElement.value))
      this.savedId = this.idkey.nativeElement.value;
    else this.textError = 'Id should contain numbers only';
  }

  checkIdValid(id: string): boolean {
    return /^$|^[0-9 ]+$/.test(id);
  }
}
