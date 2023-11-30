using CourseReportEmailer.Models;
using CourseReportEmailer.Repository;
using CourseReportEmailer.Workers;

namespace CourseReportEmailer
{
    internal class Program
    {
        static void Main(string[] args)
        {
            try
            {
                EnrollmentDetailReportCommand command = new EnrollmentDetailReportCommand(@"Data Source=localhost;Initial Catalog=CourseReport;Integrated Security=True;Encrypt=False");
                IList<EnrollmentDetailReportModel> models = command.GetList();

                var reportFileName = "EnrollmentDetailsReport.xlsx";
                EnrollmentDataReportSpreadSheetCreator enrollmentSheetCreator = new EnrollmentDataReportSpreadSheetCreator();
                enrollmentSheetCreator.Create(reportFileName, models);

                EnrollmentDetailReportEmailSender emailer = new EnrollmentDetailReportEmailSender();
                Console.WriteLine("Sending email...");
                emailer.Send(reportFileName);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Something went wrong: \n{ex.Message}");
            }
        }
    }
}
