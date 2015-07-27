
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EncodeMy;


namespace ProjectFLAME
{
    public partial class index : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        DataRow row;

        string lang = "en"; // Default

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getText();
            }

        }

        protected void getText()
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"
                                        SELECT * FROM third_content WHERE ID = 20
                                        ";
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        row = ds.Tables[0].Rows[0];
                        /// fetch content depending on the language from cookies.
                        System.Web.HttpCookie cookie = new System.Web.HttpCookie("language");

                        cookie = Request.Cookies["language"];

                        if (cookie != null && cookie.Value != null)

                            lang = cookie.Value;

                        if (lang == "en")
                        {   
                           
                            if (row["content_En"].ToString().Trim()!= "")
                            {
                                Literal1.Text = "<div><a href=''>" + row["content_En"].ToString() + "</a></div>";
                            }
                        }
                        if (lang == "zh-HK")
                        {
                            if (row["content_Ch"] == null)
                            {
                                if (row["content_En"].ToString().Trim()!= "")
                                {
                                    Literal1.Text = "<div><a href=''>" + row["content_En"].ToString() + "</a></div>";
                                }
                            }
                            else
                            {   
                                Literal1.Text = "<div><a href=''>" + row["content_Ch"].ToString() + "</a></div>";
                            }
                        }
                        if (lang == "zh-CN")
                        {
                            if (row["content_Ch"] != null)
                            {
                                Literal1.Text = "<div><a href=''>" + row["content_En"].ToString() + "</a></div>";
                            }
                            else
                            {
                                EncodeRobert edControl = new EncodeRobert();//创建一个简繁转换对象 
                                Literal1.Text = edControl.SCTCConvert(ConvertType.Traditional, ConvertType.Simplified, row["content_Ch"].ToString());//进行简繁转换 
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex+"captured");
                        Literal1.Text = "";
                    }
                    finally
                    {
                        Sqlcon.Close();
                    }
                }
            }
        }
    }
}
    

