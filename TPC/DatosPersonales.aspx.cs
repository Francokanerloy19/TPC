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
    public partial class DatosPersonales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdSocioSeleccionado"] != null)
                {
                    int id = int.Parse(Session["IdSocioSeleccionado"].ToString());
                    SocioNegocio negocio = new SocioNegocio();
                    Socio socio = negocio.filtrarPorID(id);

                    if (socio != null)
                    {
                        lblDNI.Text = socio.DNI;
                        lblNombre.Text = socio.Nombre;
                        lblApellido.Text = socio.Apellido;
                        lblCorreo.Text = socio.Correo;
                        lblBarrio.Text = socio.Barrio;
                        lblDireccion.Text = socio.Direccion;
                        lblTelefono.Text = socio.Telefono;
                    }

                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx", false);
        }
    }
}