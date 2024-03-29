using System.Collections.Generic;

namespace BackendSide.Models
{
    public class Question
    {
        public int Id { get; set; }
        
        public string? QuestionText { get; set; }

        public List<Option>? Options { get; set; }
        
        public string? Type { get; set; }

        public string Comment { get; set; }
    }
}