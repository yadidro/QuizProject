import { QuestionService } from '../service/question.service';
import { question, option, answer } from '../models/question';
import { Component } from '@angular/core';
@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css'],
})
export class QuestionComponent {

  public name: string = '';
  public userId: string = '';
  public quizResult: string = '';
  public questionList: question[] = [];
  public currentQuestion: number = 0;
  public progress: string = '0';
  answers = new Map<number, option[]>();
  textError: string = '';
  public textErrorComment = '';

  constructor(private questionService: QuestionService) { }

  ngOnInit(): void {
    this.name = localStorage.getItem('name')!;
    this.userId = localStorage.getItem('id')!;
    this.getAllQuestions();
  }

  getAllQuestions() {
    this.questionService.getQuestionJson().subscribe(
      (res: question[]) => {
        this.questionList = res;
        this.textError = '';
      },
      (err) => {
        console.log(err);
        this.textError = 'An error has occured, please try again later';
      }
    );
  }

  nextQuestion() {
    this.currentQuestion =
      (this.currentQuestion + 1) % this.questionList.length;

    this.textErrorComment = '';
  }

  previousQuestion() {
    this.currentQuestion = this.currentQuestion - 1;
    if (this.currentQuestion < 0)
      this.currentQuestion = this.questionList.length - 1;

    this.textErrorComment = '';
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
    this.currentQuestion = 0;
    this.quizResult = '';
    this.answers = new Map<number, option[]>();
    this.textErrorComment = '';
  }

  submit() {
    let answersForEachQuestionScores: answer[] = this.buildAnswers();

    this.questionService.getQuizResult(answersForEachQuestionScores).subscribe(
      (res: string) => {
        this.quizResult = res;
        this.textError = '';
      },
      (err) => {
        console.log(err);
        this.textError = 'An error has occured, please try again later';
      }
    );
  }

  buildAnswers() {
    let answersForEachQuestionScores: answer[] = [];
    for (let i = 0; i < this.answers.size; i++) {
      let options = this.answers.get(i) ?? [];
      let answer: answer = {
        userId: this.userId,
        questionId: this.questionList[i].id,
        chosenOptions: options,
        questionType: this.questionList[i].type,
        comment: this.questionList[i].comment,
      };
      answersForEachQuestionScores.push(answer);
    }
    return answersForEachQuestionScores;
  }

  setTextErrorComment(textErrorComment: string) {
    this.textErrorComment = textErrorComment;
  }
}
