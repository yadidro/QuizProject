using System.Collections.Generic;

namespace BackendSide.Models
{
    public class Answer
    {
        public string? UserId { get; set; }
        
        public int QuestionId { get; set; }
        
        public List<Option>? ChosenOptions { get; set; }
        
        public string? QuestionType { get; set; }
        
        public string? Comment { get; set; }
    }
}