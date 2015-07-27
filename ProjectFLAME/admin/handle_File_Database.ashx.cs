using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace ProjectFLAME.admin
{
    /// <summary>
    /// Summary description for handle_File_Database
    /// </summary>
    public class handle_File_Database : IHttpHandler
    {
        readonly string _strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter _sqlAdapter;
        DataSet _ds;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json; charset=utf-8";
            if (context.Request.HttpMethod == "POST") {
                if (context.Request.Form["mode"] == "getdata") {
                    context.Response.Write("{\"file_name\":"+GetList("file_name")+", \"id\":"+GetList("id")+"}");
                }
                // add delete button handle
                if (context.Request.Form["mode"] == "DeleteRow") {
                    context.Response.Write(ApplyChange(context.Request.Form["id"]));
                }
            }
            
            
        }

        public string ApplyChange(string id)
        {
            using (var Sqlcon = new SqlConnection(_strCon))
            {
                using (var cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE FROM UploadedFilesData WHERE id = @id";
                    cmd.Parameters.AddWithValue("@id", id);
                    try
                    {
                        _sqlAdapter = new SqlDataAdapter(cmd);
                        _ds = new DataSet();
                        _sqlAdapter.Fill(_ds);
                        return "success";
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
                    }
                }
            }
        }

        public string GetList(string sourceType)
        {
            using (var Sqlcon = new SqlConnection(_strCon)) {
                using (var cmd = new SqlCommand()) {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    if (sourceType == "file_name")
                        cmd.CommandText = @"SELECT file_name FROM UploadedFilesData";
                    
                    if (sourceType == "id")
                        cmd.CommandText = @"SELECT id FROM UploadedFilesData";

                    try
                    {
                        _sqlAdapter = new SqlDataAdapter(cmd);
                        _ds = new DataSet();
                        _sqlAdapter.Fill(_ds);
                        return DataTable2Json(_ds.Tables[0]);
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
                    }
                }
                
            }
            throw new NotImplementedException();
        }

        public static string DataTable2Json(DataTable dt)
        {
            var list = new List<Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                var dict = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    dict[dc.ColumnName] = dr[dc];
                }
                list.Add(dict);
            }
            return JsonConvert.SerializeObject(list);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }

        public SqlCommand Cmd { get; set; }

        
    }
}
