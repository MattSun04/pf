using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Web;

namespace ProjectFLAME.service
{
    /// <summary>
    /// This file is for transfer google spreadsheet for program page incase some area (china) cannot access it
    /// </summary>
    public class GoogleSpreadSheetFetcher : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            var request = (HttpWebRequest)WebRequest.Create(@"https://spreadsheets.google.com/feeds/list/" + context.Request.QueryString["key"] + "/" + context.Request.QueryString["worksheet"] + "/public/values?alt=json");
            request.ContentType = "application/json; charset=utf-8";
            request.Accept = "application/json, text/javascript, */*";
            var response = (HttpWebResponse)request.GetResponse();
            string content = new StreamReader(response.GetResponseStream()).ReadToEnd();
            context.Response.ContentType = "application/json";
            context.Response.Write(content);
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}