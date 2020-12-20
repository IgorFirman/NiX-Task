using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Services
{
    public class ConnectionSqlServer : IConnectionSqlServer
    {
        public SqlConnection GetConnection(string connectionInfo)
        {
            SqlConnection connection = new SqlConnection(connectionInfo);
            return connection;
        }
    }
}
