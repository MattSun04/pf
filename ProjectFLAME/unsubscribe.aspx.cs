using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectFLAME
{
    public partial class unsubscribe : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];
            head1.Text = "Unsubscribe Successfully!!";
            p.Text = "Dear " + email + ", your email address has been successfully removed from our list, thank you~";
            small.Text = "If you still want to receive our email, simply click: ";
            undo.Text = "Undo";
        }

        protected void undo_Click(object sender, EventArgs e)
        {
            if (undo.Text == "Undo")
            {
                undo.Text = "";
                undo.Visible = false;
                head1.Text = ":-)We knew it";
                p.Text = "Thank you for trusting us!";
                small.Text = "no more chance to regret, haha";
            }
        }
    }
}