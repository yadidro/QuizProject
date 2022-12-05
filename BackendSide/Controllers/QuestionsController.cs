using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace BackendSide.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class QuestionsController : ControllerBase
    {
        private readonly ILogger<QuestionsController> _logger;

        public QuestionsController(ILogger<QuestionsController> logger)
        {
            _logger = logger;
        }

        [HttpGet(Name = "GetQuestions")]
        public string Get()
        {
            using StreamReader r = new("questions.json");
            string json = r.ReadToEnd();
           // var questions = JsonConvert.DeserializeObject<List<Question>>(json);
            return json;
        }
    }
}