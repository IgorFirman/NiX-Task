using N_iX_Task.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace N_iX_Task.Services
{
    public interface IConnectionString
    {
        string GetConnectionString(ConnectionAttributes attribute);
    }
}
