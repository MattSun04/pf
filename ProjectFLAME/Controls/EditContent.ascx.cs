using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME.Controls
{
    public partial class EditContent : System.Web.UI.UserControl
    {
        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        DataRow row;
        public string EC_type { get; set; }
        public string EC_location { get; set; }
        public int EC_id { get; set; }
        public string EC_sort { get; set; }
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
                    cmd.CommandText = @"
                                        SELECT * FROM third_content WHERE ID = @ID
                                        ";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = EC_id;
                    if (EC_id == 0) { Literal2.Text = "Choose the item on the left to edit it!"; return; }
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        row = ds.Tables[0].Rows[0];
                        if (DropDownList1.SelectedValue == "English")
                        {
                            Literal1.Text = CKEditor1.Text = row["content_En"].ToString();
                        }
                        else
                        {
                            Literal1.Text = CKEditor1.Text = row["content_Ch"].ToString();
                        }
                        Literal2.Text = row["comment"].ToString();
                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = "Sorry we meet a problem: \n" + ex.Message;
                    }
                }
            }
        }
        protected void Preview_Click(object sender, EventArgs e)
        {
            Literal1.Text = CKEditor1.Text;
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    if (DropDownList1.SelectedValue == "English")
                    {
                        cmd.CommandText = @"
                                        UPDATE third_content SET content_En = @content WHERE ID = @ID
                                        ";
                    }
                    else
                    {
                        cmd.CommandText = @"
                                        UPDATE third_content SET content_Ch = @content WHERE ID = @ID
                                        ";
                    }
                    
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = EC_id;
                    cmd.Parameters.Add("@content", SqlDbType.NVarChar, -1);
                    cmd.Parameters["@content"].Value = CKEditor1.Text;
                    try
                    {
                        cmd.ExecuteNonQuery();
                        LoadData();
                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = "Sorry we meet a problem: \n" + ex.Message;
                    }
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadData();
        }
    }
}