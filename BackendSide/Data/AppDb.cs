using System.Collections.Generic;
using BackendSide.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace BackendSide.Data
{
    public interface IAppDb
    {
        Dictionary<int, Question> GetQuestionsFromDb();
    }

    public class AppDb : IAppDb
    {
        public Dictionary<int, Question> GetQuestionsFromDb()
        {
            SqlDataReader? rdr = null;
            Dictionary<int, Question> questions = new Dictionary<int, Question>();
            using var conn =
                new SqlConnection(System.Configuration.ConfigurationManager.AppSettings.Get("ConnectionString"));
            using var command = new SqlCommand("GetQuestions", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            conn.Open();
            rdr = command.ExecuteReader();
            if (rdr != null)
            {
                while (rdr.Read())
                {
                    int id = (int) rdr["Id"];
                    if (questions.ContainsKey(id))
                    {
                        questions[id].Options?.Add(new Option()
                            {Text = (string) rdr["Text"], Score = (int?) rdr["Score"]});
                    }
                    else
                    {
                        questions.Add(id, new Question
                            {
                                Id = id,
                                Options = new List<Option>()
                                    {new Option() {Text = (string) rdr["Text"], Score = (int?) rdr["Score"]}},
                                QuestionText = rdr["QuestionText"].ToString(),
                                Type = rdr["Type"].ToString().Replace( " ", "" )
                            }
                        );
                    }
                }
            }

            return questions;
        }
    }
}