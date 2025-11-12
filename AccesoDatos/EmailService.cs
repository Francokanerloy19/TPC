using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential( "francokaner@gmail.com", "mmgt pvwm atly dwyu");
            server.EnableSsl = true;
            server.Port = 587;
            server.Host = "smtp.gmail.com"; 
        }

        public void armarCorreo(string correo, string asunto)
        {
            email = new MailMessage();
            email.From = new MailAddress("francokaner@gmail.com", "Connectis Gym");
            email.To.Add(correo);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = "<p>¡Atención! Te quedan solo 3 días antes de que venza tu inscripción. Una vez que venza, podrás renovarla.</p>";
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
