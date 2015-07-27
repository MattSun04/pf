using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using EncodeMy;

namespace ProjectFLAME.Controls
{
    public partial class GetContent : System.Web.UI.UserControl
    {
        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        DataRow row;
        public string GC_type { get; set; }
        public string GC_location { get; set; }
        public int GC_id { get; set; }
        public string GC_sort { get; set; }
        string lang = "en"; // Default
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GC_type == "image")
            {
                getImage();
            }
            else 
            {
                getText();
            }
            Literal1.Text = "<small>[<a href='admin/edit.aspx?cid=" + GC_id + "' target='_blank'>Edit</a>]</small><br />";
        }
        protected void getImage()
        {
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
                                        SELECT * FROM third_content WHERE ID = @ID
                                        ";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = GC_id;
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
                            contentPlaceholder.Text = row["content_En"].ToString();
                        }
                        if (lang == "zh-HK")
                        {
                            if (row["content_Ch"] == null)
                            {
                                contentPlaceholder.Text = row["content_En"].ToString();
                            }
                            else
                            {
                                contentPlaceholder.Text = row["content_Ch"].ToString();
                            }
                        }
                        if (lang == "zh-CN")
                        {
                            if (row["content_Ch"] == null)
                            {
                                contentPlaceholder.Text = row["content_En"].ToString();
                            }
                            else
                            {
                                EncodeRobert edControl = new EncodeRobert();//创建一个简繁转换对象 
                                contentPlaceholder.Text = edControl.SCTCConvert(ConvertType.Traditional, ConvertType.Simplified, row["content_Ch"].ToString());//进行简繁转换 
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        contentPlaceholder.Text = "Sorry we meet a problem: \n" + ex.Message;
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
