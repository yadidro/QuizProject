using System.ComponentModel.DataAnnotations.Schema;

namespace BackendSide.Models
{
    public class Option
    {      
        public string? Text { get; set; }
        
        public int? Score { get; set; }  
    }
}