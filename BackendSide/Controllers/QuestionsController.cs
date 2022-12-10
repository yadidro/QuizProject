using System;
using System.Globalization;
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
        public IActionResult Get()
        {
            try
            {
                return Ok(_questionsRepository.GetQuestions());
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        [Route("quizResult")]
        [HttpPost]
        public IActionResult PostQuizResult([FromBody] Answer[] answersForEachQuestionScores)
        {
            try
            {
                if (!ModelState.IsValid) throw new Exception("Wrong body parameter");

                _questionsRepository.SaveCommentsForUser(answersForEachQuestionScores);

                var score = CalculateScore(answersForEachQuestionScores);

                _questionsRepository.SaveScoreForUser(answersForEachQuestionScores[0].UserId, score);

                return Ok(score.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }

        private static double CalculateScore(Answer[] answersForEachQuestionScores)
        {
            double sum = 0;
            foreach (Answer answer in answersForEachQuestionScores)
            {
                if (answer.QuestionType == "Multiple")
                {
                    sum = SumMultipleQuestion(answer, sum);
                }

                if (answer is {QuestionType: "Single"}) sum = SumSingleQuestion(answer, sum);
            }

            var score = Math.Round((double) sum / (answersForEachQuestionScores.Length), 2);
            return score;
        }

        private static double SumSingleQuestion(Answer answer, double sum)
        {
            if (answer.ChosenOptions != null)
                sum = sum + answer.ChosenOptions[0].Score ?? 0;
            return sum;
        }

        private static double SumMultipleQuestion(Answer answer, double sum)
        {
            if (answer?.ChosenOptions?.Count == 1)
            {
                sum = sum + answer.ChosenOptions[0].Score ?? 0 * 0.5;
            }

            if (answer?.ChosenOptions?.Count > 1)
            {
                foreach (var option in answer.ChosenOptions)
                {
                    sum = sum + option.Score ?? 0;
                }
            }

            return sum;
        }
    }
}