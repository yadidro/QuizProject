import { QuestionService } from '../service/question.service';
import { question, option, answer } from '../models/question';
import { Component, ViewChild, ElementRef } from '@angular/core';
@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css'],
})
export class QuestionComponent {
  @ViewChild('comment') commentkey!: ElementRef;
  public name: string = '';
  public userId: string = '';
  public quizResult: string = '';
  public questionList: question[] = [];
  public currentQuestion: number = 0;
  public progress: string = '0';
  answers = new Map<number, option[]>();
  public currentComment: string = '';
  textError: string = '';
  textErrorComment: string = '';

  constructor(private questionService: QuestionService) {}

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

    this.currentComment = this.questionList[this.currentQuestion].comment ?? '';
    this.textErrorComment = '';
  }

  previousQuestion() {
    this.currentQuestion = this.currentQuestion - 1;
    if (this.currentQuestion < 0)
      this.currentQuestion = this.questionList.length - 1;

    this.currentComment = this.questionList[this.currentQuestion].comment ?? '';
    this.textErrorComment = '';
  }

  answer(option: option) {
    if (!this.answers.has(this.currentQuestion)) {
      this.newAnswerHandle(option);
    } else {
      if (this.questionList[this.currentQuestion].type === 'Single') {
        this.singleAnswerHandle(option);
      } else {
        this.multipleAnswerHandle(option);
      }
    }
  }

  private multipleAnswerHandle(option: option) {
    if (this.isOptionSelected(option)) {
      this.answers.get(this.currentQuestion)?.pop();
      if (this.answers.get(this.currentQuestion)?.length == 0) {
        this.answers.delete(this.currentQuestion);
      }
    } else {
      this.answers.get(this.currentQuestion)?.push(option);
    }
    this.setProgressPrecent();
  }

  private singleAnswerHandle(option: option) {
    this.answers.get(this.currentQuestion)?.pop();
    this.answers.get(this.currentQuestion)?.push(option);
  }

  private newAnswerHandle(option: option) {
    let selectedOptions: option[] = [];
    selectedOptions.push(option);
    this.answers.set(this.currentQuestion, selectedOptions);
    this.setProgressPrecent();
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
    this.currentComment = '';
    this.textErrorComment = '';
  }

  isOptionSelected(option: option) {
    return (
      this.answers
        .get(this.currentQuestion)
        ?.find((selectedOption) => selectedOption.text === option.text) !=
      undefined
    );
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

  checkTextValid(text: string): boolean {
    return /^$|^[a-zA-ZÀ-ÖØ-öø-ÿ0-9 ]+$/.test(text);
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

  saveComment() {
    if (this.checkTextValid(this.commentkey.nativeElement.value)) {
      this.questionList[this.currentQuestion].comment =
        this.commentkey.nativeElement.value;
      this.currentComment = this.commentkey.nativeElement.value;
      this.textErrorComment = '';
    } else
      this.textErrorComment = 'Text should not contain any special character';
  }
}
