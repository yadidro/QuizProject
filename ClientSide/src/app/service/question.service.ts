import { HttpClient, HttpParams } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {} from '@angular/common/http';
import { question, option } from '../models/question';

@Injectable({
  providedIn: 'root',
})
export class QuestionService {
  constructor(private http: HttpClient) {}

  getQuestionJson() {
    return this.http.get<question[]>('/questions');
  }

  getQuizResult(answersForEachQuestionScores: question[]) {
    return this.http.post<string>('/quizResult', answersForEachQuestionScores);
  }
}
