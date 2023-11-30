using CourseReportEmailer.Models;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CourseReportEmailer.Repository
{
    internal class EnrollmentDetailReportCommand
    {
        private string _connectionString;

        public EnrollmentDetailReportCommand(string connectionString)
        {
            _connectionString = connectionString;
        }

        public IList<EnrollmentDetailReportModel> GetList()
        {
            List<EnrollmentDetailReportModel> enrollmentDetailReports = new List<EnrollmentDetailReportModel>();

            var sql = "EnrollmentReport_GetList";

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                enrollmentDetailReports = connection.Query<EnrollmentDetailReportModel>(sql).ToList();
            }

            return enrollmentDetailReports;
        }
    }
}
