using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Models
{
    public class ConnectionAttributes
    {
        public string Datasource { get; set; }
        public string DataBase { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string Query { get; set; }
    }
}
