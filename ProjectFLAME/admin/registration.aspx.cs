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
    public partial class registration : System.Web.UI.Page
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
                    cmd.CommandText = "SELECT * FROM volunteer";
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        registration1.DataSource = ds;
                        registration1.DataBind();
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
            registration1.PageIndex = e.NewPageIndex;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                TextBox en_name = (TextBox)registration1.FooterRow.FindControl("txtAddEn_name");
                TextBox cn_name = (TextBox)registration1.FooterRow.FindControl("txtAddCn_name");
                TextBox  major= (TextBox)registration1.FooterRow.FindControl("txtAddMajor");
                TextBox department= (TextBox)registration1.FooterRow.FindControl("txtAddDepartment");
                TextBox email= (TextBox)registration1.FooterRow.FindControl("txtAddEmail");
                TextBox con_num= (TextBox)registration1.FooterRow.FindControl("txtAddContact_num");
                TextBox pf= (TextBox)registration1.FooterRow.FindControl("txtAddPF");
                TextBox wecan= (TextBox)registration1.FooterRow.FindControl("txtAddWC");
            

                using (SqlConnection Sqlcon = new SqlConnection(strCon))
                {
                    Literal1.Text = "tring...";
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO volunteer(en_name, cn_name, major,department,con_num,email,pf,wecan) VALUES(@en_name,@cn_name, @major,@department,@con_num,@email,@pf,@wecan)";
                        cmd.Parameters.Add("@en_name", SqlDbType.VarChar, 20);
                        cmd.Parameters["@en_name"].Value = en_name.Text.Trim();
                        cmd.Parameters.Add("@major", SqlDbType.VarChar, 20);
                        cmd.Parameters["@major"].Value = major.Text.Trim();
                        cmd.Parameters.Add("@cn_name", SqlDbType.NVarChar, 20);
                        cmd.Parameters["@cn_name"].Value = cn_name.Text.Trim();

                       
                        cmd.Parameters.Add("@department", SqlDbType.VarChar, 20);
                        cmd.Parameters["@department"].Value = department.Text.Trim();
                        cmd.Parameters.Add("@con_num", SqlDbType.VarChar, 20);
                        cmd.Parameters["@con_num"].Value =con_num.Text.Trim();
                        cmd.Parameters.Add("@email", SqlDbType.VarChar,40);
                        cmd.Parameters["@email"].Value = email.Text.Trim();
                        cmd.Parameters.Add("@pf", SqlDbType.VarChar, 20);
                        cmd.Parameters["@pf"].Value = pf.Text.Trim();
                        cmd.Parameters.Add("@wecan", SqlDbType.VarChar, 20);
                        cmd.Parameters["@wecan"].Value = wecan.Text.Trim();
                        cmd.ExecuteNonQuery();
                    }
                }
                registration1.EditIndex = -1;
                LoadData();
                Literal1.Text = "OK!";
            }
        }
        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            registration1.EditIndex = e.NewEditIndex;
            LoadData();
        }
        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label ID = (Label)registration1.Rows[e.RowIndex].FindControl("lblID");
            TextBox en_name = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtEn_name");
            TextBox cn_name = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtCn_name");
            TextBox major = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtMajor");
            TextBox department = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtDepartment");
            TextBox email = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtEmail");
            TextBox con_num = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtContact_num");
            TextBox pf = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtPF");
            TextBox wecan = (TextBox)registration1.Rows[e.RowIndex].FindControl("txtWC");

            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                Literal1.Text = "tring...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE volunteer SET en_name = @en_name,cn_name=@cn_name,major=@major,department=@department,
                                        con_num=@con_num,email=@email,pf=@pf,wecan=@wecan WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.Parameters.Add("@en_name", SqlDbType.VarChar, 20);
                    cmd.Parameters["@en_name"].Value = en_name.Text.Trim();
                    cmd.Parameters.Add("@cn_name", SqlDbType.NVarChar, 20);
                    cmd.Parameters["@cn_name"].Value =cn_name.Text.Trim();
                    cmd.Parameters.Add("@major", SqlDbType.VarChar, 20);
                    cmd.Parameters["@major"].Value = major.Text.Trim();
                    cmd.Parameters.Add("@department", SqlDbType.VarChar, 20);
                    cmd.Parameters["@department"].Value = department.Text.Trim();
                    cmd.Parameters.Add("@con_num", SqlDbType.VarChar, 20);
                    cmd.Parameters["@con_num"].Value = con_num.Text.Trim();
                    cmd.Parameters.Add("@email", SqlDbType.VarChar, 40);
                    cmd.Parameters["@email"].Value = email.Text.Trim();
                    cmd.Parameters.Add("@pf", SqlDbType.VarChar, 20);
                    cmd.Parameters["@pf"].Value = pf.Text.Trim();
                    cmd.Parameters.Add("@wecan", SqlDbType.VarChar, 20);
                    cmd.Parameters["@wecan"].Value = wecan.Text.Trim();
                    cmd.ExecuteNonQuery();
                }
            }
            registration1.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            registration1.EditIndex = -1;
            LoadData();
            Literal1.Text = "cancelled!";
        }
        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label ID = (Label)registration1.Rows[e.RowIndex].FindControl("lblID");
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                Literal1.Text = "trying...";
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE  FROM volunteer WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.ExecuteNonQuery();
                }
            }
            registration1.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
    }
}