using System.ComponentModel.DataAnnotations.Schema;

namespace BackendSide.Models
{
    public class Option
    {  
        public int OptionId { get; set; }
        
        public string? Text { get; set; }
        
        public string? Score { get; set; }

        [ForeignKey("QuestionId")]
        public string? QuestionId { get; set; }
    }
}