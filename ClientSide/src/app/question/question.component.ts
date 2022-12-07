import { Component } from '@angular/core';
import { QuestionService } from '../service/question.service';
import { question, option } from '../models/question';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css'],
})
export class QuestionComponent {
  public name: string = '';
  public quizResult: string = '';
  public questionList: question[] = [];
  public currentQuestion: number = 0;
  public progress: string = '0';
  public selectedOption: option | undefined = { text: '', score: 0 };
  answers = new Map<number, option>();

  constructor(private questionService: QuestionService) {}

  ngOnInit(): void {
    this.name = localStorage.getItem('name')!;
    this.getAllQuestions();
  }

  getAllQuestions() {
    this.questionService.getQuestionJson().subscribe((res: question[]) => {
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
    this.selectedOption = { text: '', score: 0 };
    this.currentQuestion = 0;
    this.quizResult = '';
    this.answers = new Map<number, option>();
  }

  submit() {
    let answersList: option[] = [];
    for (let i = 0; i < this.answers.size; i++) {
      let value = this.answers.get(i);
      if (value !== undefined) answersList.push(value);
    }

    this.questionService.getQuizResult(answersList).subscribe((res: string) => {
      this.quizResult = res;
    });
  }
}
