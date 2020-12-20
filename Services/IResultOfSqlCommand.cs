using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Services
{
    public interface IResultOfSqlCommand
    {
        (List<object>, int) GetResult(SqlCommand command); 
    }
}
