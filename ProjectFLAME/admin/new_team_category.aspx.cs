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
    public partial class new_team_category : System.Web.UI.Page
    {
        readonly string _strCon =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter _sqlAda;
        DataSet _ds;
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
            using (var sqlcon = new SqlConnection(_strCon))
            {
                using (var cmd = new SqlCommand())
                {
                    sqlcon.Open();
                    cmd.Connection = sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM New_team_category";
                    try
                    {
                        _sqlAda = new SqlDataAdapter(cmd);
                        _ds = new DataSet();
                        _sqlAda.Fill(_ds);
                        GridView1.DataSource = _ds;
                        GridView1.DataBind();
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
            GridView1.PageIndex = e.NewPageIndex;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName.Equals("Insert"))
            {
                var name = (TextBox)GridView1.FooterRow.FindControl("txtAddName");
                var sort= (TextBox)GridView1.FooterRow.FindControl("txtAddSort");
             
                using (var sqlcon = new SqlConnection(_strCon))
                {
                    Literal1.Text = "trying...";
                    using (var cmd = new SqlCommand())
                    {
                        sqlcon.Open();
                        cmd.Connection = sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO New_team_category
                                            (name, sort) VALUES
                                            (@name, @sort)";
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@name"].Value = name.Text.Trim();
                        cmd.Parameters.Add("@sort", SqlDbType.Int);
                        cmd.Parameters["@sort"].Value = Convert.ToInt32(sort.Text.ToString());
                        cmd.ExecuteNonQuery();
                    }
                }
                GridView1.EditIndex = -1;
                LoadData();
                Literal1.Text = "OK!";
            }
        }
        protected void RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadData();
        }
        protected void RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            var ID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblID");
            var name = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtName");
            var sort = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtSort");
            using (var Sqlcon = new SqlConnection(_strCon))
            {
                Literal1.Text = "trying...";
                using (var cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE New_team_category SET name = @name, sort= @sort
                                       WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@name"].Value = name.Text.Trim();
                    cmd.Parameters.Add("@sort", SqlDbType.Int);
                    cmd.Parameters["@sort"].Value = Convert.ToInt32(sort.Text.ToString());
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = "Fail!";
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            GridView1.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
        protected void RowCancelEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadData();
            Literal1.Text = "cancelled!";
        }
        protected void RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var ID = (Label)GridView1.Rows[e.RowIndex].FindControl("lblID");
            using (var sqlcon = new SqlConnection(_strCon))
            {
                Literal1.Text = "trying...";
                using (var cmd = new SqlCommand())
                {
                    sqlcon.Open();
                    cmd.Connection = sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"DELETE  FROM New_team_category WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text);
                    try
                    {
                        cmd.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        Literal1.Text = "Fail!";
                        Console.WriteLine(ex.Message);
                    }
                }
            }
            GridView1.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
    }
}