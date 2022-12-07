using System.Collections.Generic;
using System.Configuration;
using BackendSide.Models;
using Microsoft.Data.SqlClient;
using System.Data;

namespace BackendSide.Data
{
    public class AppDb
    {
        public static Dictionary<int, Question> Initilize()
        {
            SqlDataReader rdr = null;
            Dictionary<int, Question>  Questions = new Dictionary<int, Question>();
            using (var conn = new SqlConnection(System.Configuration.ConfigurationManager.AppSettings.Get("ConnectionString")))
            using (var command = new SqlCommand("GetQuestions", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                conn.Open();
                rdr = command.ExecuteReader();
                while (rdr.Read())
                {
                    int id = (int)rdr["Id"];
                    if (Questions.ContainsKey(id))
                    {
                        Questions[id].Options.Add(new Option() { Text = (string)rdr["Text"], Score = (int?)rdr["Score"] });
                    }
                    else
                    {
                        Questions.Add(id, new Question
                        {
                            Id = id,
                            Options = new List<Option>() {new Option() { Text = (string)rdr["Text"], Score = (int?)rdr["Score"] } },
                            QuestionText = rdr["QuestionText"].ToString()
                        }
                        );
                    }
                }
            }
            return Questions;
        }
         
    }
}
