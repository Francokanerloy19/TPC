using AccesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class VerMembresia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSocios();
            }
        }

        private void CargarSocios()
        {
            int id = int.Parse(Session["IdSocioSeleccionado"].ToString());
            if (id != 0)
            {
                IncripcionNegocio negocio = new IncripcionNegocio();
                Inscripción socio = negocio.filtrarPorID(id);
                if (socio != null)
                {
                    lblMembresia.Text = socio.membresia.Nombre.ToString();
                    lblActividad.Text = socio.actividadExtra.NombreActividad.ToString();
                    lblDescripcion.Text = socio.actividadExtra.Descripción.ToString();
                }
            }

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx", false);
        }
    }
}

