using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace ProjectFLAME.admin
{
    public partial class resources2 : System.Web.UI.Page
    {
        string strCon2 =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda2;
        DataSet ds2;
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                LoadData2();
                Literal1.Text = "loaded";
            }
        }
        private void LoadData2()
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon2))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT uuid AS ID, title AS Title, intro AS Introduction, _file AS _File, image AS Image FROM [reports-govertment-documents]";
                    try
                    {
                        SqlAda2 = new SqlDataAdapter(cmd);
                        ds2 = new DataSet();
                        SqlAda2.Fill(ds2);
                        usefullinks2.DataSource = ds2;
                        usefullinks2.DataBind();
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
        protected void PageIndexChanging2(object sender, GridViewPageEventArgs e)
        {
            usefullinks2.PageIndex = e.NewPageIndex;
            LoadData2();
            Literal1.Text = "OK!";
        }
        protected void RowCommand2(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                TextBox Title = (TextBox)usefullinks2.FooterRow.FindControl("txtAddTitle");
                TextBox Image = (TextBox)usefullinks2.FooterRow.FindControl("txtAddImage");
                TextBox File = (TextBox)usefullinks2.FooterRow.FindControl("txtAddFile");
                TextBox Introduction = (TextBox)usefullinks2.FooterRow.FindControl("txtAddIntro");
                using (SqlConnection Sqlcon = new SqlConnection(strCon2))
                {
                    Literal1.Text = "tring...";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        String UUID = Guid.NewGuid().ToString();
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO [reports-govertment-documents]
                                            (uuid, title, intro, image, _file) VALUES
                                            (@ID, @Title, @Introduction, @Image, @_File)";
                        cmd.Parameters.Add("@ID", SqlDbType.NVarChar,4000 );
                        cmd.Parameters["@ID"].Value = UUID;
                        cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 4000);
                        cmd.Parameters["@Title"].Value = Title.Text.Trim();
                        cmd.Parameters.Add("@Introduction", SqlDbType.NVarChar, 4000);
                        cmd.Parameters["@Introduction"].Value = Introduction.Text.Trim();
                        cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 4000);
                        cmd.Parameters["@Image"].Value = Image.Text.Trim();
                        cmd.Parameters.Add("@_File", SqlDbType.NVarChar, 4000);
                        cmd.Parameters["@_File"].Value = File.Text.Trim();
                        cmd.ExecuteNonQuery();
                    }
                }
                usefullinks2.EditIndex = -1;
                LoadData2();
                Literal1.Text = "OK!";
            }
        }
        protected void RowEditing2(object sender, GridViewEditEventArgs e)
        {
            usefullinks2.EditIndex = e.NewEditIndex;
            LoadData2();
        }
        protected void RowUpdating2(object sender, GridViewUpdateEventArgs e)
        {
            Label id = (Label)usefullinks2.Rows[e.RowIndex].FindControl("lblID");     //这里需要改
            TextBox Title = (TextBox)usefullinks2.Rows[e.RowIndex].FindControl("txtTitle");
            TextBox Image = (TextBox)usefullinks2.Rows[e.RowIndex].FindControl("txtImage");
            TextBox File = (TextBox)usefullinks2.Rows[e.RowIndex].FindControl("txtFile");
            TextBox Introduction = (TextBox)usefullinks2.Rows[e.RowIndex].FindControl("txtIntro");
            using (SqlConnection Sqlcon = new SqlConnection(strCon2))
            {
                Literal1.Text = "tring...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE [reports-govertment-documents] SET title = @Title,
                                        intro = @Introduction, image = @Image, _file = @_File WHERE uuid = @ID";
                    cmd.Parameters.Add("@Title", SqlDbType.NVarChar, 4000);
                    cmd.Parameters["@Title"].Value = Title.Text.Trim();
                    cmd.Parameters.Add("@Introduction", SqlDbType.NVarChar, 4000);
                    cmd.Parameters["@Introduction"].Value = Introduction.Text.Trim();
                    cmd.Parameters.Add("@ID", SqlDbType.NVarChar, 4000);
                    cmd.Parameters["@ID"].Value = id.Text.Trim();
                    cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 4000);
                    cmd.Parameters["@Image"].Value = Image.Text.Trim();
                    cmd.Parameters.Add("@_File", SqlDbType.NVarChar, 4000);
                    cmd.Parameters["@_File"].Value = File.Text.Trim();
                    cmd.ExecuteNonQuery();
                }
            }
            usefullinks2.EditIndex = -1;
            LoadData2();
            Literal1.Text = "OK!";
        }
        protected void RowCancelEdit2(object sender, GridViewCancelEditEventArgs e)
        {
            usefullinks2.EditIndex = -1;
            LoadData2();
            Literal1.Text = "cancelled!";
        }
        protected void RowDeleting2(object sender, GridViewDeleteEventArgs e)
        {
            Label id = (Label)usefullinks2.Rows[e.RowIndex].FindControl("lblID");
            using (SqlConnection Sqlcon = new SqlConnection(strCon2))
            {
                Literal1.Text = "trying...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE  FROM [reports-govertment-documents] WHERE uuid = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.VarChar, 50);
                    cmd.Parameters["@ID"].Value = id.Text.Trim();
                    cmd.ExecuteNonQuery();
                }
            }
            usefullinks2.EditIndex = -1;
            LoadData2();
            Literal1.Text = "OK!";
        }
        protected void btnUploadClick(object sender, EventArgs e)
{
    HttpPostedFile file = Request.Files["myFile"];

    //check file was submitted
    if (file != null && file.ContentLength > 0)
    {
        string fname = Path.GetFileName(file.FileName);
        file.SaveAs(Server.MapPath(Path.Combine("~/App_Data/", fname)));
    }
}
    }
}