export interface option {
  text: string;
  score: number;
}

export interface question {
  id: number;
  questionText: string;
  options: option[];
  type: string;
  comment: string;
}

export interface answer {
  userId: string;
  questionId: number;
  chosenOptions: option[];
  questionType: string;
  comment: string;
}

export const enum questionType {
  single,
  multiple,
}
