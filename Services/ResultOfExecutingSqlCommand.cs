using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Services
{
    public class ResultOfExecutingSqlCommand : IResultOfSqlCommand
    {
        public (List<object>, int) GetResult(SqlCommand command)
        {
            SqlDataReader reader = command.ExecuteReader();
            List<object> a = new List<object>();
            for(int i = 0; i<reader.FieldCount; i++)
            {
                a.Add(reader.GetName(i));
            }
            while (reader.Read())
            {
                for (int i = 0; i < reader.FieldCount; i++)
                    a.Add(reader.GetValue(i));
            }
            
            return (a, reader.FieldCount);
        }
    }
}
