using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME
{
    /// <summary>
    /// Summary description for handle_URL
    /// </summary>
    public class handle_URL : IHttpHandler
    {
        readonly string _strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter _sqlAda;
        DataSet _ds;
        DataRow _row;
        public void ProcessRequest(HttpContext context)
        {
            using (var sqlcon = new SqlConnection(_strCon))
            {
                using (var cmd = new SqlCommand())
                {
                    sqlcon.Open();
                    cmd.Connection = sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"
                                        SELECT _file, mime, size, file_name FROM UploadedFilesData WHERE id = @id
                                        ";
                    cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@id"].Value = context.Request.QueryString["id"].ToString();
                    try
                    {
                        _sqlAda = new SqlDataAdapter(cmd);
                        _ds = new DataSet();
                        _sqlAda.Fill(_ds);
                        _row = _ds.Tables[0].Rows[0];
                        context.Response.ContentType = _row["mime"].ToString();
                        context.Response.AddHeader("Content-Length", _row["size"].ToString());
                        context.Response.AddHeader("Content-Disposition", "inline;filename='" + _row["file_name"].ToString() + "'");
                        var fileData = (byte[])_row["_file"];//dont understand //this is to convert file into binary data for internet transportation
                        context.Response.BinaryWrite(fileData);
                    }
                    catch (Exception ex)
                    {

                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        sqlcon.Close();
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
