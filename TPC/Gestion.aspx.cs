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
                    // Ahora se puede usar el id para buscar en la base o mostrar info
                }
            }
        }

        

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarSocio.aspx", false);
        }

        protected void btnVerDatosPersonales_Click(object sender, EventArgs e)
        {
            //SocioNegocio negocio = new SocioNegocio();
            //Socio socio = negocio.filtrarPorID(int.Parse(Session["IdSocioSeleccionado"].ToString()));
            //Session["SocioSleccionado"] = socio;
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
           
            Response.Redirect("Pagos.aspx", false);
        }
    }
}