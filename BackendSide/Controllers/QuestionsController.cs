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
        public string PostQuizResult([FromBody] Question[] answersForEachQuestionScores)
        {
            if (!ModelState.IsValid) return "wrong body";
            double sum = 0;
            foreach (Question answer in answersForEachQuestionScores)
            {
                if (answer.Type == "Multiple")
                {
                    if (answer?.Options?.Count == 1)
                    {
                        sum = sum + answer.Options[0].Score??0 * 0.5;
                    }
                    if (answer?.Options?.Count > 1)
                    {
                        foreach (var option in answer.Options)
                        {
                            sum = sum + option.Score??0;
                        }
                    }
                }

                if (answer is {Type: "Single"})
                    if (answer.Options != null)
                        sum = sum + answer.Options[0].Score ?? 0;
            }
            var result = Math.Round((double) sum / (10 * answersForEachQuestionScores.Length) * 10, 2);
            return result.ToString(CultureInfo.InvariantCulture);
        }
}

}