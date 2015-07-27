using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME.admin
{
    public partial class install : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        protected void Page_Load(object sender, EventArgs e)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"
                                        IF OBJECT_ID('third_content') IS NULL 
                                        BEGIN 
                                        CREATE TABLE third_content 
                                        (
                                        ID int IDENTITY(1,1) PRIMARY KEY,
                                        type nvarchar(20),
                                        content_En nvarchar(max),
                                        content_Ch nvarchar(max),
                                        comment nvarchar(max),
                                        lastmodified datetime
                                        )
                                        END";
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Label1.Text = ex.Message;
                    }
                }
            }
        }
    }
}