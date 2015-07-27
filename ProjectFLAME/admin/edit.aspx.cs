using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectFLAME.admin
{
    public partial class edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            editContent.EC_id = Convert.ToInt32(Request.QueryString["cid"]);
        }
    }
}