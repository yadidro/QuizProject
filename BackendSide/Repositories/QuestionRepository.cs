using System.Collections.Generic;
using System.Linq;
using BackendSide.Data;
using BackendSide.Models;

namespace BackendSide.Repositories
{
    public interface IQuestionRepository
    {
        IEnumerable<Question> GetQuestions();
    }

    public class QuestionRepository : IQuestionRepository
    {
        private readonly IAppDb _appDb;
        private Dictionary<int, Question> _listQuestions;

        public QuestionRepository(IAppDb appDb)
        {
            _appDb = appDb;
            _listQuestions = new Dictionary<int, Question>();
        }

        public IEnumerable<Question> GetQuestions()
        {
            if (_listQuestions.Count != 0) return _listQuestions.Values.ToList();
            _listQuestions = _appDb.GetQuestionsFromDb();

            return _listQuestions.Values.ToList();
        }
    }
}