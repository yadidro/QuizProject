import { Component } from '@angular/core';
import { QuestionService } from '../service/question.service';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css'],
})
export class QuestionComponent {
  public name: string = '';
  public questionList: any = [];
  public currentQuestion: number = 0;
  public progress: string = '0';
  public selectedOption: any;
  answers = new Map<number, any>();

  constructor(private questionService: QuestionService) {}

  ngOnInit(): void {
    this.name = localStorage.getItem('name')!;
    this.getAllQuestions();
  }

  getAllQuestions() {
    this.questionService.getQuestionJson().subscribe((res: any) => {
      this.questionList = res;
    });
  }
  nextQuestion() {
    this.currentQuestion =
      (this.currentQuestion + 1) % this.questionList.length;
    this.selectedOption = this.answers.get(this.currentQuestion);
  }

  previousQuestion() {
    this.currentQuestion = this.currentQuestion - 1;
    if (this.currentQuestion < 0)
      this.currentQuestion = this.questionList.length - 1;
    this.selectedOption = this.answers.get(this.currentQuestion);
  }

  answer(option: any) {
    this.selectedOption = option;
    if (!this.answers.has(this.currentQuestion)) this.setProgressPrecent();
    this.answers.set(this.currentQuestion, option);
  }

  setProgressPrecent() {
    this.progress = (
      ((this.answers.size + 1) / this.questionList.length) *
      100
    ).toString();
  }

  reset() {
    this.progress = '0';
    this.selectedOption = null;
    this.currentQuestion = 0;
    this.answers = new Map<number, any>();
  }

  submit() {
    this.progress = '0';
    this.selectedOption = null;
    this.answers = new Map<number, any>();
  }
}
