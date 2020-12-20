using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using N_iX_Task.Models;
using N_iX_Task.Services;

namespace N_iX_Task.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IConnectionSqlServer _connectionSqlServer;
        private readonly IConnectionString _connectionString;
        private readonly IResultOfSqlCommand _resultOfSqlCommand;

        
        public HomeController(ILogger<HomeController> logger, IConnectionSqlServer connectionSqlServer, IConnectionString connectionString, IResultOfSqlCommand resultOfSqlCommand)
        {
            _resultOfSqlCommand = resultOfSqlCommand;
            _connectionSqlServer = connectionSqlServer;
            _connectionString = connectionString;
            _logger = logger;
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IActionResult GetResultFromQuery(ConnectionAttributes attributes)
        {
            string connectionString = _connectionString.GetConnectionString(attributes);
            SqlConnection connection = _connectionSqlServer.GetConnection(connectionString);

            try
            {
                connection.Open();
                
                SqlCommand command = new SqlCommand(attributes.Query, connection);
                var ( list, fieldsCount) = _resultOfSqlCommand.GetResult(command);
               

                if (attributes.Query.ToLower().StartsWith("select"))
                {
                    ViewBag.FieldsCount = fieldsCount;
                    if (list.Count() == fieldsCount)
                        return View("EmptyResult");
                    return View(list);
                }
                else
                    return View("InformationAboutExecution", attributes.Query);
            }
            catch (SqlException ex)
            {
                return View("ErrorMessage", ex);
            }
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}