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

                var score = _questionsRepository.CalculateScore(answersForEachQuestionScores);

                _questionsRepository.SaveScoreForUser(answersForEachQuestionScores[0].UserId, score);

                return Ok(score.ToString(CultureInfo.InvariantCulture));
            }
            catch (Exception e)
            {
                return BadRequest(e.Message);
            }
        }
    }
}