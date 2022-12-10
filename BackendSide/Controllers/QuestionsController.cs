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
        public string PostQuizResult([FromBody] Answer[] answersForEachQuestionScores)
        {
            if (!ModelState.IsValid) return "wrong body";
            _questionsRepository.SaveCommentsForUser(answersForEachQuestionScores);
            double sum = 0;
            foreach (Answer answer in answersForEachQuestionScores)
            {
                if (answer.QuestionType == "Multiple")
                {
                    if (answer?.ChosenOptions?.Count == 1)
                    {
                        sum = sum + answer.ChosenOptions[0].Score??0 * 0.5;
                    }
                    if (answer?.ChosenOptions?.Count > 1)
                    {
                        foreach (var option in answer.ChosenOptions)
                        {
                            sum = sum + option.Score??0;
                        }
                    }
                }

                if (answer is {QuestionType: "Single"})
                    if (answer.ChosenOptions != null)
                        sum = sum + answer.ChosenOptions[0].Score ?? 0;
            }
            var score = Math.Round((double) sum / (10 * answersForEachQuestionScores.Length) * 10, 2);
            
            _questionsRepository.SaveScoreForUser(answersForEachQuestionScores[0].UserId,score);
            
            return score.ToString(CultureInfo.InvariantCulture);
        }
}

}