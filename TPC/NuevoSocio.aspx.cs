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
    public partial class NuevoSocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoSocio.aspx", false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Socio socio = new Socio();

            if (!string.IsNullOrWhiteSpace(txtDNI.Text) && !string.IsNullOrWhiteSpace(TextNombre.Text) && !string.IsNullOrWhiteSpace(TxtApellido.Text) && !string.IsNullOrWhiteSpace(validationtxtEmail.Text) && !string.IsNullOrWhiteSpace(txtBarrio.Text) && !string.IsNullOrWhiteSpace(txtDireccion.Text) && !string.IsNullOrWhiteSpace(txtCelular.Text))
            {
                socio.DNI = txtDNI.Text;
                socio.Nombre = TextNombre.Text;
                socio.Apellido = TxtApellido.Text;
                socio.Correo = validationtxtEmail.Text;
                socio.Barrio = txtBarrio.Text;
                socio.Direccion = txtDireccion.Text;
                socio.Telefono = txtCelular.Text;

                // validar que el socio no sea null
                SocioNegocio negocio = new SocioNegocio();
                int idNuevoSocio = negocio.agregar(socio);

                Session["IdSocioSeleccionado"] = idNuevoSocio;
                Response.Redirect("Gestion.aspx", false);
            }
        }
    }
}