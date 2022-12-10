using System.Collections.Generic;
using BackendSide.Models;
using Microsoft.Data.SqlClient;
using System.Data;
using Microsoft.Data.SqlClient.Server;

namespace BackendSide.Data
{
    public interface IAppDb
    {
        Dictionary<int, Question> GetQuestionsFromDb();
        void SaveCommentsForUser(Answer[] answers);
        void SaveScoreForUser(string userId, double score);
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
                    GetQuestionsFromRdr(rdr, questions);
                }
            }
            conn.Close();
            return questions;
        }

        public void SaveCommentsForUser(Answer[] answers)
        {
            SqlDataReader? rdr = null;
            Dictionary<int, Question> questions = new Dictionary<int, Question>();
            using var conn =
                new SqlConnection(System.Configuration.ConfigurationManager.AppSettings.Get("ConnectionString"));
            using var command = new SqlCommand("SaveCommentsForUser", conn)
            {
                CommandType = CommandType.StoredProcedure
            };

            var pList = new SqlParameter("@UserCommentsType", SqlDbType.Structured);
            pList.TypeName = "dbo.UserCommentsType";
            pList.Value = GetCommentsList(answers);
            command.Parameters.Add(pList);

            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();
        }

        public void SaveScoreForUser(string userId, double score)
        {
            using var conn =
                new SqlConnection(System.Configuration.ConfigurationManager.AppSettings.Get("ConnectionString"));
            using var command = new SqlCommand("SaveScoreForUser", conn)
            {
                CommandType = CommandType.StoredProcedure
            };
            command.Parameters.Add("@UserId", SqlDbType.VarChar).Value = userId;
            command.Parameters.Add("@Score", SqlDbType.Decimal).Value = score;

            conn.Open();
            command.ExecuteNonQuery();
            conn.Close();
        }

        private List<SqlDataRecord> GetCommentsList(Answer[] answers)
        {
            List<SqlDataRecord> datatable = new List<SqlDataRecord>();
            SqlMetaData[] sqlMetaData = new SqlMetaData[3];
            sqlMetaData[0] = new SqlMetaData("QuestionId", SqlDbType.Int);
            sqlMetaData[1] = new SqlMetaData("Comment", SqlDbType.VarChar,SqlMetaData.Max);
            sqlMetaData[2] = new SqlMetaData("UserId", SqlDbType.VarChar,SqlMetaData.Max);
            SqlDataRecord row;

            foreach (Answer answer in answers)
            {
                row = new SqlDataRecord(sqlMetaData);
                if (!string.IsNullOrEmpty(answer.Comment))
                {
                    if (answer.UserId != null)
                        row.SetValues(answer.QuestionId, answer.Comment, answer.UserId);
                    datatable.Add(row);
                }
            }

            return datatable;
        }

        private static void GetQuestionsFromRdr(SqlDataReader? rdr, Dictionary<int, Question> questions)
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
                        Type = rdr["Type"].ToString().Replace(" ", "")
                    }
                );
            }
        }
    }
}