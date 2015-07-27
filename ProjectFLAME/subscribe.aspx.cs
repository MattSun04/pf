using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Text.RegularExpressions;

namespace ProjectFLAME
{
    public partial class subscribe : System.Web.UI.Page
    {
        Boolean stat = false;
        public static bool isEmail(string inputEmail)
        {
            if (inputEmail == null) return false;
            string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +
                  @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                  @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
            Regex re = new Regex(strRegex);
            if (re.IsMatch(inputEmail))
                return (true);
            else
                return (false);
        }

        private static string NulltoString(string inputEmail)
        {
            throw new NotImplementedException();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];
            if (isEmail(email) && undo.Text != "Undo")
            {
                string MessageContent = "报告老板，" + email + " 这个邮箱关注了我们的网站~有更新的时候记得给他/她发邮件哦~";
                MessageContent = MessageContent.Replace("^", System.Environment.NewLine);//'^'this will cause a new line in the email content
                Mailer.SendEmail("yutiansun2-c@my.cityu.edu.hk", "project.flame@cityu.edu.hk", "New Subscribe", MessageContent);
                Mailer.SendEmail("hangchow2@cityu.edu.hk", "project.flame@cityu.edu.hk", "New Subscribe", MessageContent);
                head1.Text = "Subscribe Successfully!!";
                p.Text = "Dear " + email + ", your email address has been successfully in our list, thank you~";
                small.Text = "If you don't want to receive our email, simply click: ";
                undo.Text = "Undo";
                undo1.Visible = false;
                undo1.Text = "subscribe again!";
            }
            else {
                head1.Text = "Invalid Email Address";
            }
            
        }

        protected void undo_Click(object sender, EventArgs e)
        {
            if (stat == false)
            {
                string email = Request.QueryString["email"];
                if (isEmail(email))
                {
                    string MessageContent1 = "报告老板，" + email + " 这个邮箱取消了关注我们的网站 T^T 以后可以不给他/她发邮件了...";
                    MessageContent1 = MessageContent1.Replace("^", System.Environment.NewLine);//'^'this will cause a new line in the email content
                    Mailer.SendEmail("yutiansun2-c@my.cityu.edu.hk", "project.flame@cityu.edu.hk", "Cancel Subscribe", MessageContent1);
                    Mailer.SendEmail("hangchow2@cityu.edu.hk", "project.flame@cityu.edu.hk", "Cancel Subscribe", MessageContent1);
                    undo.Visible = false;
                    undo1.Visible = true;
                    head1.Text = ":-(So sad to see it.";
                    p.Text = "But still thank you very much.";
                    small.Text = "but you can still subscribe it by simply click the button again: ";
                    stat = true;
                }
                else {
                    head1.Text = "Invalid Email Address";
                }
                
            }
        }
        protected void undo1_Click(object sender, EventArgs e)
        {
            string email = Request.QueryString["email"];
            if (isEmail(email))
            {
                string MessageContent2 = "报告老板，" + email + " 这个邮箱后悔取消关注我们的网站 T^T 以后可以继续给他/她发邮件啦~~~";
                MessageContent2 = MessageContent2.Replace("^", System.Environment.NewLine);//'^'this will cause a new line in the email content
                Mailer.SendEmail("yutiansun2-c@my.cityu.edu.hk", "project.flame@cityu.edu.hk", "Re-Subscribe", MessageContent2);
                Mailer.SendEmail("hangchow2@cityu.edu.hk", "project.flame@cityu.edu.hk", "Re-Subscribe", MessageContent2);
                undo1.Visible = false;
                undo.Visible = false;
                head1.Text = ":-)We knew it";
                p.Text = "Thank you for trusting us!";
                small.Text = "no more chance to regret, haha";
            }
            else {
                head1.Text = "Invalid Email Address";
            }
        }
    }
    class Mailer
    {
        static string smtpHost = "smtp.cityu.edu.hk";
        static public void SendEmail(string mailTo, string mailFrom, string mailSubject, string mailBody)
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(mailFrom);
            message.To.Add(new MailAddress(mailTo));
            message.Subject = mailSubject;
            message.Body = mailBody;
            SmtpClient client = new SmtpClient();
            client.Host = smtpHost;
            client.Send(message);
        }
    }
    
}