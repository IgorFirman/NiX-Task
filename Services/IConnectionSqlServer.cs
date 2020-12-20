using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace N_iX_Task.Services
{
    public interface IConnectionSqlServer
    {
        SqlConnection GetConnection(string connectionInfo);
    }
}
