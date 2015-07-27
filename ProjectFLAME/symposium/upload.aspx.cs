using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;

namespace ProjectFLAME.symposium
{
    public partial class upload : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter SqlAda;
        DataSet ds;
        DataRow row;

        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "After you upload the file, you will get a code identify your file. please copy the code into your online form.";
            TextBox1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (!FileUpload1.HasFile)
            {
                Label2.Text = "Please Select a File First.";
            }
            else
            {
                int length = FileUpload1.PostedFile.ContentLength;
                byte[] file = new byte[length];
                string name = FileUpload1.PostedFile.FileName;
                FileUpload1.PostedFile.InputStream.Read(file, 0, length);
                using (SqlConnection Sqlcon = new SqlConnection(strCon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        Sqlcon.Open();
                        cmd.Connection = Sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO pitching_upload (name, files) VALUES (@name, @file)";
                        cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                        cmd.Parameters["@name"].Value = name;
                        cmd.Parameters.Add("@file", SqlDbType.VarBinary, -1);
                        cmd.Parameters["@file"].Value = file;
                        try
                        {
                            cmd.ExecuteNonQuery();
                            Label2.Text = "success!";
                            getID(name);
                        }
                        catch (Exception ex)
                        {
                            Label2.Text = ex.Message;
                        }
                    }
                }
            }
        }

        private void getID(string name)
        {
            using (SqlConnection Sqlcon = new SqlConnection(strCon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    Sqlcon.Open();
                    cmd.Connection = Sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = "SELECT * FROM pitching_upload WHERE name = @name ORDER BY ID DESC";
                    cmd.Parameters.Add("@name", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@name"].Value = name;
                    try
                    {
                        SqlAda = new SqlDataAdapter(cmd);
                        ds = new DataSet();
                        SqlAda.Fill(ds);
                        row = ds.Tables[0].Rows[0];
                        TextBox1.Visible = true;
                        if (Convert.ToInt32(row["ID"].ToString())< 10)
                            TextBox1.Text = "sp30" + row["ID"];
                        else
                            TextBox1.Text = "sp3" + row["ID"];
                        Label1.Text = "Please copy the code below into your online form.";
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