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

export const enum questionType {
  single,
  multiple,
}
