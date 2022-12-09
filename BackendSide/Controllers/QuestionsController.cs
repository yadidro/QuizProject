using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using BackendSide.Models;
using BackendSide.Repositories;
using Microsoft.AspNetCore.Mvc;

namespace BackendSide.Controllers
{
    [ApiController]
    [Route("")]
    public class QuestionsController : ControllerBase
    {
        private readonly IQuestionRepository _questionsRepository;
        public QuestionsController(IQuestionRepository questionsRepository)
        {
            _questionsRepository = questionsRepository;
        }
        
        [Route("questions")]
        [HttpGet]
        public IEnumerable<Question> Get()
        {
            return _questionsRepository.GetQuestions();
        }

        [Route("quizResult")]
        [HttpPost]
        public string PostQuizResult([FromBody] Option[] answers)
        {
            if (!ModelState.IsValid) return "wrong body";
            var sum = answers.Where(answer => answer.Score != null).Sum(answer => answer.Score ?? 0);
            var result = Math.Round((double) sum / (10 * answers.Length) * 10, 2);
            return result.ToString(CultureInfo.InvariantCulture);

        }
}

}