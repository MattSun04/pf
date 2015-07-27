using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME.symposium
{
    /// <summary>
    /// Summary description for d
    /// </summary>
    public class d : IHttpHandler
    {

        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        DataRow row;
        public void ProcessRequest(HttpContext context)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"
                                        SELECT * FROM pitching_upload WHERE ID = @ID
                                        ";
                    cmd.Parameters.Add("@ID", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@ID"].Value = context.Request.QueryString["id"];
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        row = ds.Tables[0].Rows[0];
                        context.Response.ContentType = "application/octet-stream";
                        context.Response.AddHeader("Content-Disposition", "attachment; filename=\"" + row["name"] + "\"");
                        byte[] fileData = (byte[])row["files"];
                        context.Response.BinaryWrite(fileData);
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}