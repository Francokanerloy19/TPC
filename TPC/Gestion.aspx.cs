using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using AccesoDatos;


namespace TPC
{
    public partial class Gestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdSocioSeleccionado"] != null)
                {
                    int idSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());
                    
                }
            }
        }



        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarSocio.aspx", false);
        }

        protected void btnVerDatosPersonales_Click(object sender, EventArgs e)
        {
            Response.Redirect("DatosPersonales.aspx", false);
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoSocio.aspx", false);
        }

        protected void btnVerHistorialDePagos_Click(object sender, EventArgs e)
        {

            Response.Redirect("HistorialPago.aspx", false);
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["IdSocioSeleccionado"].ToString());
            SocioNegocio negocio = new SocioNegocio();
            Socio socio = negocio.filtrarPorID(id);
            if (socio.Estado == false) 
            { 
                Response.Redirect("Pagos.aspx", false);
            }
            else
            {
                Response.Redirect("Yapago.aspx", false);
            }

        }

        protected void btnDarDeBaja_Click(object sender, EventArgs e)
        {
            Socio socioaux = new Socio();
            socioaux.IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());

            SocioNegocio negocio = new SocioNegocio();
            negocio.baja(socioaux.IdSocio, false);
        }

        protected void btnReactivar_Click(object sender, EventArgs e)
        {
            Socio socioaux = new Socio();
            socioaux.IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());

            SocioNegocio negocio = new SocioNegocio();
            negocio.baja(socioaux.IdSocio, true);
        }

        protected void btnMembresia_Click(object sender, EventArgs e)
        {
            int id = int.Parse(Session["IdSocioSeleccionado"].ToString());
            SocioNegocio negocio = new SocioNegocio();
            Socio socio = negocio.filtrarPorID(id);
            if (socio.Estado == true) 
            {
                Response.Redirect("VerMembresia.aspx", false);
            }
            else
            {
                lblAlerta.Text = "No tiene membresia activa.";
            }
        }

        protected void btnDarDeBajaMembresia_Click(object sender, EventArgs e)
        {

            int IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());
            PagoNegocio pagoNegocio = new PagoNegocio();
            List<Pago> Listapago = pagoNegocio.Listar(IdSocio);
            Pago pago = Listapago[Listapago.Count - 1];
            if(pago.FechaPago.Month == DateTime.Now.Month && pago.FechaPago.Year == DateTime.Now.Year)
            {
                IncripcionNegocio negocio = new IncripcionNegocio();
                negocio.eliminarUltimaInscripcion(IdSocio);
            }
            else
            {
                lblAlerta.Text = "No hay Pagos registrado este mes";
            }

                
        }

        protected void btnModificarMembresia_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarMembresia.aspx", false);
        }
    }
}