using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using BackendSide.Data;
using BackendSide.Models;
using Microsoft.AspNetCore.Mvc;

namespace BackendSide.Controllers
{
    [ApiController]
    [Route("")]
    public class QuestionsController : ControllerBase
    {
        Dictionary<int, Question> Questions = new Dictionary<int, Question>();
        List<Question> ListQuestions=new List<Question>();
        
        [Route("questions")]
        [HttpGet]
        public List<Question> Get()
        {
            if (ListQuestions.Count == 0)
            {
                Questions = AppDb.Initilize();
                ListQuestions = Questions.Values.ToList();
            }
            return ListQuestions;
            
        }

        [Route("quizResult")]
        [HttpPost]
        public string PostQuizResult([FromBody]Option[] answers)
        {
            if (answers == null) return "Oops! There is an issue With the Score";
            var sum = answers.Where(answer => answer.Score != null).Sum(answer => answer.Score ?? 0);
            var result =  Math.Round((double)sum / (10 * answers.Length) * 10,2);
            return result.ToString(CultureInfo.InvariantCulture);
        }
    }
}