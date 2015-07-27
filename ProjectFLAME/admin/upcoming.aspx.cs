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
    public partial class Upcoming : System.Web.UI.Page
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
                    cmd.CommandText = "SELECT * FROM New_upcomings";
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
                var nameCN = (TextBox)GridView1.FooterRow.FindControl("txtAddNameCN");
                var time = (TextBox)GridView1.FooterRow.FindControl("txtAddTime");
                var venue = (TextBox)GridView1.FooterRow.FindControl("txtAddVenue");
                var venueCN = (TextBox)GridView1.FooterRow.FindControl("txtAddVenueCN");
                var description = (TextBox)GridView1.FooterRow.FindControl("txtAddDescription");
                var descriptionCN = (TextBox)GridView1.FooterRow.FindControl("txtAddDescriptionCN");
                var image = (TextBox)GridView1.FooterRow.FindControl("txtAddImage");
                using (var sqlcon = new SqlConnection(_strCon))
                {
                    Literal1.Text = "trying...";
                    using (var cmd = new SqlCommand())
                    {
                        sqlcon.Open();
                        cmd.Connection = sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO New_upcomings
                                            (name, nameCN, time, venue, venueCN, description, descriptionCN, image) VALUES
                                            (@name, @nameCN, @time, @venue, @venueCN, @description, @descriptionCN, @image)";
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@name"].Value = name.Text.Trim();
                        cmd.Parameters.Add("@nameCN", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@nameCN"].Value = nameCN.Text.Trim();
                        cmd.Parameters.Add("@time", SqlDbType.VarChar, 100);
                        cmd.Parameters["@time"].Value = time.Text.Trim();
                        cmd.Parameters.Add("@venue", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@venue"].Value = venue.Text.Trim();
                        cmd.Parameters.Add("@venueCN", SqlDbType.NVarChar, 100);
                        cmd.Parameters["@venueCN"].Value = venueCN.Text.Trim();
                        cmd.Parameters.Add("@description", SqlDbType.NVarChar);
                        cmd.Parameters["@description"].Value = description.Text.Trim();
                        cmd.Parameters.Add("@descriptionCN", SqlDbType.NVarChar);
                        cmd.Parameters["@descriptionCN"].Value = descriptionCN.Text.Trim();
                        cmd.Parameters.Add("@image", SqlDbType.VarChar);
                        cmd.Parameters["@image"].Value = image.Text.Trim();
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
            var nameCN = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtNameCN");
            var time = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtTime");
            var venue = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtVenue");
            var venueCN = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtVenueCN");
            var description = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDescription");
            var descriptionCN = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtDescriptionCN");
            var image = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtImage");
            using (var Sqlcon = new SqlConnection(_strCon))
            {
                Literal1.Text = "trying...";
                using (var cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"UPDATE New_upcomings SET name = @name, nameCN = @nameCN,
                                        time = @time, venue = @venue, venueCN = @venueCN, 
                                        image = @image WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text.ToString());
                    cmd.Parameters.Add("@name", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@name"].Value = name.Text.Trim();
                    cmd.Parameters.Add("@nameCN", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@nameCN"].Value = nameCN.Text.Trim();
                    cmd.Parameters.Add("@time", SqlDbType.VarChar, 100);
                    cmd.Parameters["@time"].Value = time.Text.Trim();
                    cmd.Parameters.Add("@venue", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@venue"].Value = venue.Text.Trim();
                    cmd.Parameters.Add("@venueCN", SqlDbType.NVarChar, 100);
                    cmd.Parameters["@venueCN"].Value = venueCN.Text.Trim();
                    cmd.Parameters.Add("@image", SqlDbType.VarChar);
                    cmd.Parameters["@image"].Value = image.Text.Trim();
                    cmd.ExecuteNonQuery();
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
                    cmd.CommandText = @"DELETE  FROM New_upcomings WHERE ID = @ID";
                    cmd.Parameters.Add("@ID", SqlDbType.Int);
                    cmd.Parameters["@ID"].Value = Convert.ToInt32(ID.Text);
                    cmd.ExecuteNonQuery();
                }
            }
            GridView1.EditIndex = -1;
            LoadData();
            Literal1.Text = "OK!";
        }
    }
}