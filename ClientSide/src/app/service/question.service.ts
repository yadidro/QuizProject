import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import {} from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class QuestionService {

  constructor(private http: HttpClient) { }

  getQuestionJson(){
    return this.http.get<any[]>('/questions')
  }
}
