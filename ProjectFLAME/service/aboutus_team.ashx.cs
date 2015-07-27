using System;
using System.Collections.Generic;
using System.Web;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using Newtonsoft.Json;

namespace ProjectFLAME.service
{
    /// <summary>
    /// Summary description for aboutus_team
    /// </summary>
    public class aboutus_team : IHttpHandler
    {
        string strCon =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "application/json; charset=utf-8";
            if (context.Request.HttpMethod.ToString() == "POST")
            {
                if (context.Request.Form["q"] == "edit")
                {
                    var info = new Dictionary<string, object>();
                    foreach (string key in context.Request.Form.Keys)
                    {
                        info.Add(key, context.Request.Form[key]);
                    }
                    context.Response.Write(ApplyChange(info));
                }
                if (context.Request.Form["q"] == "delete")
                {
                    context.Response.Write(ApplyChange(context.Request.Form["ID"]));
                }
            }
            else
            {
                context.Response.Write("{\"category\":" + GetList("c") + ", \"list\":" + GetList("t") + "}");
            }
        }

        public string GetList(string source)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    if (source == "c")
                        cmd.CommandText = @"SELECT * FROM New_team_category ORDER BY sort";
                    if (source == "t")
                        cmd.CommandText = @"SELECT * FROM New_team ORDER BY sort";
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        return DataTable2JSON(ds.Tables[0]);
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
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

        public static string DataTable2JSON(DataTable dt)
        {
            List<Dictionary<string, object>> list = new List<Dictionary<string, object>>();
            foreach (DataRow dr in dt.Rows)
            {
                Dictionary<string, object> dict = new Dictionary<string, object>();
                foreach (DataColumn dc in dt.Columns)
                {
                    dict[dc.ColumnName] = dr[dc];
                }
                list.Add(dict);
            }
            return JsonConvert.SerializeObject(list);
        }

        public string ApplyChange(string ID)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE FROM New_team WHERE ID = @ID";
                    cmd.Parameters.AddWithValue("@ID", ID);
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        return "success";
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
                    }
                }
            }
        }

        public string ApplyChange(Dictionary<string, object> info)
        {
            if (info["ID"] == "" || info["ID"] == null)
            {
                using (SqlConnection Sqlcon = new SqlConnection(strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO New_team (link, name, title, position, department, phone, email, image_link, category, sort) VALUES (@link, @name, @title, @position, @department, @phone, @email, @image_link, @category, @sort)";
                        cmd.Parameters.AddWithValue("@link", info["link"]);
                        cmd.Parameters.AddWithValue("@name", info["name"]);
                        cmd.Parameters.AddWithValue("@title", info["title"]);
                        cmd.Parameters.AddWithValue("@position", info["position"]);
                        cmd.Parameters.AddWithValue("@department", info["department"]);
                        cmd.Parameters.AddWithValue("@phone", info["phone"]);
                        cmd.Parameters.AddWithValue("@email", info["email"]);
                        cmd.Parameters.AddWithValue("@image_link", info["image_link"]);
                        cmd.Parameters.AddWithValue("@category", info["category"]);
                        cmd.Parameters.AddWithValue("@sort", info["sort"]);
                        try
                        {
                            SqlAda = new SqlDataAdapter(cmd);
                            ds = new DataSet();
                            SqlAda.Fill(ds);
                            return "success";
                        }
                        catch (Exception ex)
                        {
                            return ex.Message;
                        }
                    }
                }
            }
            else 
            {
                using (SqlConnection Sqlcon = new SqlConnection(strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"UPDATE New_team SET link = @link, name = @name, title = @title, position = @position, department = @department, phone = @phone, email = @email, image_link = @image_link, category = @category, sort = @sort WHERE ID = @ID";
                        cmd.Parameters.AddWithValue("@ID", info["ID"]);
                        cmd.Parameters.AddWithValue("@link", info["link"]);
                        cmd.Parameters.AddWithValue("@name", info["name"]);
                        cmd.Parameters.AddWithValue("@title", info["title"]);
                        cmd.Parameters.AddWithValue("@position", info["position"]);
                        cmd.Parameters.AddWithValue("@department", info["department"]);
                        cmd.Parameters.AddWithValue("@phone", info["phone"]);
                        cmd.Parameters.AddWithValue("@email", info["email"]);
                        cmd.Parameters.AddWithValue("@image_link", info["image_link"]);
                        cmd.Parameters.AddWithValue("@category", info["category"]);
                        cmd.Parameters.AddWithValue("@sort", info["sort"]);
                        try
                        {
                            SqlAda = new SqlDataAdapter(cmd);
                            ds = new DataSet();
                            SqlAda.Fill(ds);
                            return "success";
                        }
                        catch (Exception ex)
                        {
                            return ex.Message;
                        }
                    }
                }
            }
            
        }

        public string Add2List(Dictionary<string, object> info)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"INSERT INTO New_team (link, name, title, position, department, phone, email, image_link, category, sort) VALUES (@link, @name, @title, @position, @department, @phone, @email, @image_link, @category, @sort)";
                    cmd.Parameters.AddWithValue("@link", info["link"]);
                    cmd.Parameters.AddWithValue("@name", info["name"]);
                    cmd.Parameters.AddWithValue("@title", info["title"]);
                    cmd.Parameters.AddWithValue("@position", info["position"]);
                    cmd.Parameters.AddWithValue("@department", info["department"]);
                    cmd.Parameters.AddWithValue("@phone", info["phone"]);
                    cmd.Parameters.AddWithValue("@email", info["email"]);
                    cmd.Parameters.AddWithValue("@image_link", info["image_link"]);
                    cmd.Parameters.AddWithValue("@category", info["category"]);
                    cmd.Parameters.AddWithValue("@sort", info["sort"]);
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        return "success";
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
                    }
                }
            }
        }
    }
}