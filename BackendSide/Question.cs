using System;
using System.Collections.Generic;

namespace BackendSide
{
    public class Question
    {
        public string questionText { get; set; }

        public List<option> options { get; set; }

        public string explanation { get; set; }
    }

    public class option
    {
        public string text;
        public int score;
    }
}