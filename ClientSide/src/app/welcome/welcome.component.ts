import { Component,ViewChild,ElementRef,OnInit } from '@angular/core';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css']
})
export class WelcomeComponent {
  @ViewChild('name') namekey!:ElementRef;
constructor(){}

ngOnInit():void{}
startQuiz(){
  localStorage.setItem("name",this.namekey.nativeElement.value);
}
}
