using BackendSide.Data;
using BackendSide.Models;

namespace BackendSide.Repositories
{
    public interface IQuestionRepository
    {
        IEnumerable<Question> GetQuestions();
        
        void SaveCommentsForUser(Answer[] answers);
        
        void SaveScoreForUser(string? userId, double score);

        double CalculateScore(Answer[] answersForEachQuestionScores);
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
        
        public void SaveCommentsForUser(Answer[] answers)
        {
            _appDb.SaveCommentsForUser(answers);
        }
        
        public void SaveScoreForUser(string userId, double score)
        {
            _appDb.SaveScoreForUser(userId,score);
        }

        public double CalculateScore(Answer[] answersForEachQuestionScores)
        {
            double sum = 0;
            foreach (Answer answer in answersForEachQuestionScores)
            {
                if (answer.QuestionType == "Multiple")
                {
                    sum = SumMultipleQuestion(answer, sum);
                }

                if (answer is { QuestionType: "Single" }) sum = SumSingleQuestion(answer, sum);
            }

            var score = Math.Round((double)sum / (answersForEachQuestionScores.Length), 2);
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