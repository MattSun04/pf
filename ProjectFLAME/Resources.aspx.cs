using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME
{
    public partial class Resources : System.Web.UI.Page
    {
        string strCon =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        string ulInner;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"SELECT * FROM New_usefulwebsites";
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        ulInner = "";
                        SqlAda.Fill(ds);
                        foreach (DataRow row in ds.Tables[0].Rows)
                        {
                            ulInner += "<li><a href=\"";
                            ulInner += row["link"];
                            ulInner += "\" target=\"_blank\">";
                            ulInner += row["description"];
                            ulInner += "</a></li>";
                            ulInner += Environment.NewLine;
                        }
                        Literal1.Text = ulInner;
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
    }
}