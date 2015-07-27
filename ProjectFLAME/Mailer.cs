//how to send email through CityU SMTP server

using System.Net.Mail;///mail usage

class Mailer {
    private const string SmtpHost = "smtp.cityu.edu.hk";

    static public void SendEmail(string[] mailTos, string mailFrom, string mailSubject, string mailBody)
	{
		var message = new MailMessage {From = new MailAddress(mailFrom)};
        foreach (var mailTo in mailTos)
	    {
	    	message.To.Add(new MailAddress(mailTo));
	    }
	    message.Subject = mailSubject;
	    message.Body = mailBody;
	    var client = new SmtpClient {Host = SmtpHost};
        client.Send(message);
	}
}
