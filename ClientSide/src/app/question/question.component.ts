import { Component } from '@angular/core';
import { QuestionService } from '../service/question.service';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent {
public name :string="";
public questionList: any=[];
public currentQuestion:number = 0;

constructor(private questionService: QuestionService){}

ngOnInit():void{
  this.name=localStorage.getItem("name")!;
  this.getAllQuestions();
}

getAllQuestions(){
  this.questionService.getQuestionJson().subscribe((res:any) => {
    this.questionList=res
  })
}
}
