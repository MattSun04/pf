using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectFLAME.admin
{
    public partial class Upload_To_Database : System.Web.UI.Page
    {
        readonly string _strCon = ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;//error

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var uuid = Guid.NewGuid();

            if (!FileUpload1.HasFile)
            {
                Literal1.Text = "Please Select a File First.";
            }
            else
            {
                var length = FileUpload1.PostedFile.ContentLength;
                var file = new byte[length];
                FileUpload1.PostedFile.InputStream.Read(file, 0, length);
                using (var sqlcon = new SqlConnection(_strCon))
                {
                    using (var cmd = new SqlCommand())
                    {
                        sqlcon.Open();
                        cmd.Connection = sqlcon;
                        cmd.CommandType = CommandType.Text;
                        cmd.CommandText = @"INSERT INTO UploadedFilesData (id, _file, file_name, mime, size) VALUES (@id, @file, @file_name, @mime, @size)";
                        cmd.Parameters.Add("@id", SqlDbType.NVarChar, 50);
                        cmd.Parameters["@id"].Value = uuid.ToString();
                        cmd.Parameters.Add("@file", SqlDbType.VarBinary, -1);
                        cmd.Parameters["@file"].Value = file;
                        cmd.Parameters.Add("@file_name", SqlDbType.NVarChar, -1);
                        cmd.Parameters["@file_name"].Value = FileUpload1.FileName;
                        cmd.Parameters.Add("@mime", SqlDbType.NVarChar, 50);
                        cmd.Parameters["@mime"].Value = FileUpload1.PostedFile.ContentType;
                        cmd.Parameters.Add("@size", SqlDbType.Int);
                        cmd.Parameters["@size"].Value = FileUpload1.PostedFile.ContentLength;
                        try
                        {
                            cmd.ExecuteNonQuery();
                            Literal1.Text = "Congratulation! the file link is <span contenteditable='true'>http://www6.cityu.edu.hk/projectflame/handle_URL.ashx?id=" + uuid.ToString() + "</span>";
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("index.aspx");
        }

       
    }
}