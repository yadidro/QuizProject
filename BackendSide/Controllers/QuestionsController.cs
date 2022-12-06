using BackendSide.Data;
using BackendSide.Models;
using Microsoft.AspNetCore.Mvc;

namespace BackendSide.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class QuestionsController : ControllerBase
    {
        private readonly ILogger<QuestionsController> _logger;

        Dictionary<int, Question> Questions = new Dictionary<int, Question>();
        List<Question> ListQuestions=new List<Question>();

        public QuestionsController(ILogger<QuestionsController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetQuestions")]
        public List<Question> Get()
        {
            if (ListQuestions.Count == 0)
            {
                Questions = AppDb.Initilize();
                ListQuestions = Questions.Values.ToList();
            }
            return ListQuestions;
        }
    }
}