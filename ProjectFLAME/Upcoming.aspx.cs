using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;

namespace ProjectFLAME
{
    public partial class Upcoming : System.Web.UI.Page
    {
        readonly string _strCon =
                ConfigurationManager.ConnectionStrings["MainConnStr"].ConnectionString;
        SqlDataAdapter _sqlAda;
        DataSet _ds;
        private const string Template = @"
                            <tr><td><a href='#{1}' data-toggle='modal' data-target='#{1}' style='font-family:Georgia,serif;font-size:180%;font-weight:300'><i>{0}</i></a><br/>
                            <img src='{2}' class='col-md-12 img-thumbnail'  style='max-width:400px;max-height:400px;'/><br/><br/></br></td>
                            
                            ";
        //<td><p style='font-family:Arial;font-size:180%;color:green'>Date:{2}<br>Time:{3}<br>{4}<p></td>
        private const string CalendarTemplate = @"<td>
        <table class='Calendar' >
        <br/>
            <td height='25' bgcolor='#78b3ed' width='212'>
                <table id='LHeader' height='21' width='212'>
                    <tbody>
                        <tr align='center'>
                            
                            <td align='center'>
                                <span id='showDate'>{0}</span>
                            </td>
                           
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td height='18'>
                <table  bgcolor='#e7f1fd' >
                    <tbody>
                        <tr>
                            <td width='30'>S</td>
                            <td width='30'>M</td>
                            <td width='30'>T</td>
                            <td width='30'>W</td>
                            <td width='30'>R</td>
                            <td width='30'>F</td>
                            <td width='30'>S</td>
                        </tr>
                    </tbody>
                </table>
            </td>
        </tr>
        <tr>
            <td height='20' width='212' id='Container{4}'>
            </td>
        </tr>
            <script>calendar({1},{2},{3},{4});
            </script>
    </table></td></tr>";
       
        private const string ModalTemplate = @"
                                <div id='{0}' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
                                    <div class='modal-dialog'>
                                        <div class='modal-content'>
                                            <div class='modal-header'>
                                                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>x</button>
                                                <h3>{1}</h3>
                                            </div>
                                            <div class='modal-body' style='max-height: 1000px; overflow-y: scroll'>
                                                {2}
                                                <img src='{3}' class='img-thumbnail' style='display: block;max-width: 100%; margin: auto;'/>
                                            </div>
                                            <div class='modal-footer'>
                                                <button class='btn' data-dismiss='modal' aria-hidden='true'>Close</button> 
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                ";
        string _ulInner, id, _name, _nameEn, _nameCh, _date, _time, _venue, _venueEn, _venueCh, _description, _image, _modalInner,_calendar,_merge,day,month,year;
        string _lang = "en"; // Default


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadData();
            }
        }
        private void LoadData()
        {
            using (var sqlcon = new SqlConnection(_strCon))
            {
                using (var cmd = new SqlCommand())
                {
                    int count = 0; 
                    sqlcon.Open();
                    cmd.Connection = sqlcon;
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = @"SELECT * FROM New_upcomings order by time asc";
                    try
                    {
                        _sqlAda = new SqlDataAdapter(cmd);
                        _ds = new DataSet();
                        _ulInner = "";
                        _sqlAda.Fill(_ds);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine(ex.Message);
                    }
                    finally
                    {
                        sqlcon.Close();// do remember to close sql connection
                    }
                    foreach (DataRow row in _ds.Tables[0].Rows)
                    {
                        id = "modal" + row["ID"].ToString();
                        _name = row["name"].ToString();
                        _venue = row["venue"].ToString();
                        _time = row["time"].ToString();
                        var eventTime = Convert.ToDateTime(row["time"]);
                        try
                        {
                            var now = DateTime.Now;
                            if (DateTime.Compare(now, eventTime) > 0)
                            {
                                continue;
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.Write(ex.Message);
                        }
                        count++;
                        _description = row["description"].ToString();
                        _image = row["image"].ToString();
                        _nameEn = _name;
                        _nameCh = row["nameCN"].ToString();
                        if (string.IsNullOrEmpty(_nameCh)) _nameCh = _nameEn;
                        _venueEn = _venue;
                        _venueCh = row["venueCN"].ToString();
                        if (string.IsNullOrEmpty(_venueCh)) _venueCh = _venueEn;
                        _date = Regex.Split(_time, " ")[0];
                        try
                        {
                            day = _date.Substring(3, 2);
                            month = _date.Substring(0, 2);
                            year = _date.Substring(6, 4);
                        }
                        catch (Exception ex)
                        {
                            Literal1.Text = "Something Wrong with the date input";
                        }
                        finally
                        {
                        var cookie = new System.Web.HttpCookie("language");

                        cookie = Request.Cookies["language"];

                        if (cookie != null && cookie.Value != null)

                            _lang = cookie.Value;

                        if (_lang != "en")
                        {
                            _name = _nameCh;
                            _venue = _venueCh;
                            _time = Regex.Split(_time, " ")[1];
                        }
                        else
                        {
                            _name = _nameEn;
                            _venue = _venueEn;
                            _time = Regex.Split(_time, " ")[1];
                            if (Regex.Split(_time, " ").Length > 2)
                                _time += " " + Regex.Split(_time, " ")[2];
                        }
                        if (year == "2100")
                        {
                            _calendar = "<td></td></tr>"; //"<tr><td class='long_term'>This event is <br/>long-term avaliable!!</td>";
                        }
                        else
                            _calendar = string.Format(CalendarTemplate, _date, day, month, year, count);

                        _ulInner = string.Format(Template, _name,id,_image);
                        _modalInner += string.Format(ModalTemplate, id, _name, _description, _image);
                        _merge = _merge + _ulInner + _calendar;
                    }
                    Literal1.Text = _merge;
                    modalPlaceholder.Text = _modalInner;
                    }
                }
            }
        }
    }
}