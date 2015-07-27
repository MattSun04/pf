//how to send email through CityU SMTP server

using System.Net.Mail;///mail usage

class Mailer {
	static string smtpHost = "smtp.cityu.edu.hk";
	static public void SendEmail(string[] mailTos, string mailFrom, string mailSubject, string mailBody)
	{
		MailMessage message = new MailMessage();
	    message.From = new MailAddress(mailFrom);
	    foreach (string mailTo in mailTos)
	    {
	    	message.To.Add(new MailAddress(mailTo));
	    }
	    message.Subject = mailSubject;
	    message.Body = mailBody;
	    SmtpClient client = new SmtpClient();
	    client.Host = smtpHost;
	    client.Send(message);
	}
}
