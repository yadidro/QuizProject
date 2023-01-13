import { Component, Input, Output , EventEmitter } from '@angular/core';
import { question, option } from '../models/question';

@Component({
  selector: 'app-option',
  templateUrl: './option.component.html',
  styleUrls: ['./option.component.css']
})
export class OptionComponent {
  @Input() currentQuestion = 0;
  @Input() answers = new Map<number, option[]>();
  @Input()  questionList: question[] = [];
  @Output() setProgressPrecent = new EventEmitter();

  isOptionSelected(option: option) {
    return (
      this.answers
        .get(this.currentQuestion)
        ?.find((selectedOption) => selectedOption.text === option.text) !=
      undefined
    );
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
    this.setProgressPrecent.emit();
  }

  private singleAnswerHandle(option: option) {
    this.answers.get(this.currentQuestion)?.pop();
    this.answers.get(this.currentQuestion)?.push(option);
  }

  private newAnswerHandle(option: option) {
    let selectedOptions: option[] = [];
    selectedOptions.push(option);
    this.answers.set(this.currentQuestion, selectedOptions);
    this.setProgressPrecent.emit();
  }
}
