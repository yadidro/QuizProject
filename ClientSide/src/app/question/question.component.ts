import { QuestionService } from '../service/question.service';
import { question, option, questionType } from '../models/question';
import { Component, ViewChild, ElementRef, OnInit } from '@angular/core';
@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css'],
})
export class QuestionComponent {
  @ViewChild('comment') commentkey!: ElementRef;
  public name: string = '';
  public quizResult: string = '';
  public questionList: question[] = [];
  public currentQuestion: number = 0;
  public progress: string = '0';
  public selectedOptions: option[] = [];
  answers = new Map<number, option[]>();
  public currentComment: string = '';

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
    this.selectedOptions = this.answers.get(this.currentQuestion) ?? [];

    this.currentComment = this.questionList[this.currentQuestion].comment;
  }

  previousQuestion() {
    this.currentQuestion = this.currentQuestion - 1;
    if (this.currentQuestion < 0)
      this.currentQuestion = this.questionList.length - 1;
    this.selectedOptions = this.answers.get(this.currentQuestion) ?? [];

    this.currentComment = this.questionList[this.currentQuestion].comment;
  }

  answer(option: option) {
    if (this.questionList[this.currentQuestion].type === 'Single') {
      this.selectedOptions?.pop();
    }
    if (this.optionSelected(option)) {
      this.selectedOptions?.pop();
      if (this.selectedOptions.length == 0) {
        this.answers.delete(this.currentQuestion);
        this.setProgressPrecent();
      }
    } else {
      this.selectedOptions?.push(option);

      this.answers.set(this.currentQuestion, this.selectedOptions);
      this.setProgressPrecent();
    }
  }

  setProgressPrecent() {
    this.progress = (
      (this.answers.size / this.questionList.length) *
      100
    ).toString();
  }

  reset() {
    for (let i = 0; i < this.questionList.length; i++) {
      this.questionList[i].comment = '';
    }

    this.progress = '0';
    this.selectedOptions = [];
    this.currentQuestion = 0;
    this.quizResult = '';
    this.answers = new Map<number, option[]>();
    this.currentComment = '';
  }

  optionSelected(option: option) {
    return (
      this.selectedOptions.find(
        (selectedOption) => selectedOption.text === option.text
      ) != undefined
    );
  }

  submit() {
    let answersForEachQuestionScores: question[] = [];
    for (let i = 0; i < this.answers.size; i++) {
      let options = this.answers.get(i) ?? [];
      let question: question = {
        questionText: this.questionList[i].questionText,
        id: this.questionList[i].id,
        options: options,
        type: this.questionList[i].type,
        comment: this.questionList[i].comment,
      };
      answersForEachQuestionScores.push(question);
    }

    this.questionService
      .getQuizResult(answersForEachQuestionScores)
      .subscribe((res: string) => {
        this.quizResult = res;
      });
  }

  saveComment() {
    this.questionList[this.currentQuestion].comment =
      this.commentkey.nativeElement.value;
    this.currentComment = this.commentkey.nativeElement.value;
  }
}
