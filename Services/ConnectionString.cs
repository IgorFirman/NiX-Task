using N_iX_Task.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Services
{
    public class ConnectionString : IConnectionString
    {
        public string GetConnectionString(ConnectionAttributes attribute)
        {
            return @"Data Source=" + attribute.Datasource + ";Initial Catalog="
                           + attribute.DataBase + ";Persist Security Info=True;User ID=" + attribute.UserName + ";Password=" + attribute.Password;
        }
    }
}
