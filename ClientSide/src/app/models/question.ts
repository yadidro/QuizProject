export interface option {
  text: string;
  score: number;
}

export interface question {
  id: number;
  questionText: string;
  options: option[];
}
