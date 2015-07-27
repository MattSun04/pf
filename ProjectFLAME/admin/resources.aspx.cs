using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;

namespace ProjectFLAME.admin
{
    public partial class resources : System.Web.UI.Page
    {
        string strCon =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
                Literal1.Text = "loaded";
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
                    cmd.CommandText = "SELECT * FROM New_usefulwebsites";
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        usefullinks.DataSource = ds;
                        usefullinks.DataBind();
                        Literal1.Text = "loaded";
                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = "Fail!";
                        Console.WriteLine(ex.Message);
                    }
                }
            }
        }
        protected void PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            usefullinks.PageIndex = e.NewPageIndex;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCommand(object sender, GridViewCommandEventArgs e) 
        {
            if (e.CommandName.Equals("Insert")) {
                TextBox description = (TextBox)usefullinks.FooterRow.FindControl("txtAddDes");
                TextBox link = (TextBox)usefullinks.FooterRow.FindControl("textAddLink");
                TextBox comment = (TextBox)usefullinks.FooterRow.FindControl("textAddComment");
                using (SqlConnection Sqlcon = new SqlConnection(strCon))
                {
                    Literal1.Text = "tring...";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO New_usefulwebsites
                                            (description, link, comment) VALUES
                                            (@description, @link, @comment)";
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@description"].Value = description.Text.Trim();
                        cmd.Parameters.Add("@link", SqlDbType.VarChar, 100);
                        cmd.Parameters["@link"].Value = description.Text.Trim();
                        cmd.Parameters.Add("@comment", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@comment"].Value = description.Text.Trim();
                        cmd.ExecuteNonQuery();
                    }
                }
                usefullinks.EditIndex = -1;
                LoadData();
                Literal1.Text = "OK!";
            }
        }
        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            usefullinks.EditIndex = e.NewEditIndex;
            LoadData();
        }
        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label ID = (Label)usefullinks.Rows[e.RowIndex].FindControl("lblID");
            TextBox description = (TextBox)usefullinks.Rows[e.RowIndex].FindControl("txtDes");
            TextBox link = (TextBox)usefullinks.Rows[e.RowIndex].FindControl("txtLink");
            TextBox comment = (TextBox)usefullinks.Rows[e.RowIndex].FindControl("txtComment");
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                Literal1.Text = "tring...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE New_usefulwebsites SET description = @description,
                                        link = @link, comment = @comment WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.Parameters.Add("@description", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@description"].Value = description.Text.Trim();
                    cmd.Parameters.Add("@link", SqlDbType.VarChar, 100);
                    cmd.Parameters["@link"].Value = link.Text.Trim();
                    cmd.Parameters.Add("@comment", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@comment"].Value = comment.Text.Trim();
                    cmd.ExecuteNonQuery();
                }
            }
            usefullinks.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            usefullinks.EditIndex = -1;
            LoadData();
            Literal1.Text = "cancelled!";
        }
        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label ID = (Label)usefullinks.Rows[e.RowIndex].FindControl("lblID");
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                Literal1.Text = "trying...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE  FROM New_usefulwebsites WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.ExecuteNonQuery();
                }
            }
            usefullinks.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
    }
}