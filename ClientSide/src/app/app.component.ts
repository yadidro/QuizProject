import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  public questions?: any[];

  constructor(http: HttpClient) {
    http.get<any[]>('/questions').subscribe(result => {
      this.questions = result;
    });
  }

  title = 'ClientSide';
}

interface WeatherForecast {
  date: string;
  temperatureC: number;
  temperatureF: number;
  summary: string;
}