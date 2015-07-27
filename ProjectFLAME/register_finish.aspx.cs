using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Text;

namespace ProjectFLAME
{
    public partial class register_finish : System.Web.UI.Page
    {
        readonly string _strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        StringBuilder sb=new StringBuilder();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string enName = Request.Form["english_name"].ToString().Trim();
                string cnName = Request.Form["chinese_name"].ToString().Trim();
                string major = Request.Form["position"].ToString().Trim();
                string department = Request.Form["department"].ToString().Trim();
                string conNum = Request.Form["phone_number"].ToString().Trim();
                string email = Request.Form["email"].ToString().Trim().Trim();
                string choice1 = Request.Form["volunteer"].ToString().Trim();
                string choice2 = Request.Form["wecan"].ToString().Trim();
            
             sb.Append("INSERT INTO volunteer(en_name, cn_name, major,department,con_num,email,pf,wecan) VALUES('")
                .Append(enName).Append("',N'")
                .Append(cnName).Append("','")
                .Append(major).Append("','")
                .Append(department).Append("','")
                .Append(conNum).Append("','")
                .Append(email).Append("','")
                .Append(choice1).Append("','")
                .Append(choice2).Append("')");
               }
            catch (Exception ex) 
            {
                literal1.Text = "plese retry";
                Console.WriteLine(ex);
            }

           try{
                 using (var sqlcon = new SqlConnection(_strCon))
                 {
                     using (var cmd = new SqlCommand())
                     {
                         literal1.Text = "trying..";
                         sqlcon.Open();
                         cmd.Connection = sqlcon;
                         cmd.CommandType = CommandType.Text;
                         cmd.CommandText = sb.ToString();
                         cmd.ExecuteNonQuery();
                         sqlcon.Close();
                     }
                 }
                 literal1.Text = "Thanks for registration!";
            }
            catch (Exception ex) {
               literal1.Text = "something wrong has happened.<br/> Please retry or contact administrator";
                Console.WriteLine(ex);
           }
                 
        }
    }
}