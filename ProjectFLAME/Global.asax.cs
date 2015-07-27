using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
using System.Globalization;

namespace ProjectFLAME
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            string lang = ""; // Default

            System.Web.HttpCookie cookie = new System.Web.HttpCookie("language");

            cookie = Request.Cookies["language"];

            if (cookie != null && cookie.Value != null)

                lang = cookie.Value;

            Thread.CurrentThread.CurrentUICulture = CultureInfo.GetCultureInfo(lang);

            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}