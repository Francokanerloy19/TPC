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
    public partial class ModificarMembresia : System.Web.UI.Page
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
            
                IncripcionNegocio negocio = new IncripcionNegocio();
                Inscripción socio = negocio.filtrarPorID(id);
                if (socio != null)
                {
                    lblMembresia.Text = socio.membresia.Nombre.ToString();
                    lblActividaEXtra.Text = socio.actividadExtra.NombreActividad.ToString();
                    lblDescripcion.Text = socio.actividadExtra.Descripción.ToString();
                    txtFechaVencimiento.Text = socio.FechaVencimiento.ToString("yyyy-MM-dd");
                    txtFechaInscripcion.Text = socio.FechaInscripcion.ToString("yyyy-MM-dd");
                }
            

        }
       
        protected void btnModificar_Click(object sender, EventArgs e)
        {
            IncripcionNegocio incripcionNegocio = new IncripcionNegocio();
            Inscripción inscripción = new Inscripción();
            int id = int.Parse(Session["IdSocioSeleccionado"].ToString());
            inscripción.IdSocio = id;
            inscripción.IdInscripcion = incripcionNegocio.ultimaInscripcion(id);
            inscripción.FechaVencimiento = DateTime.ParseExact(txtFechaVencimiento.Text, "yyyy-MM-dd", null);
            inscripción.FechaInscripcion = DateTime.ParseExact(txtFechaInscripcion.Text, "yyyy-MM-dd", null);
            incripcionNegocio.modificarInscripcion(inscripción);
            Response.Redirect("Gestion.aspx", false);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx", false);
        }
    }
}