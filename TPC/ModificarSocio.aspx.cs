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
    public partial class ModificarSocio : System.Web.UI.Page
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
                        txtDNI.Text = socio.DNI;
                        TextNombre.Text = socio.Nombre;
                        TxtApellido.Text = socio.Apellido;
                        validationtxtEmail.Text = socio.Correo;
                        txtBarrio.Text = socio.Barrio;
                        txtDireccion.Text = socio.Direccion;
                        txtCelular.Text = socio.Telefono;
                    }

                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx",false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Socio socioaux = new Socio();
            socioaux.IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());

            socioaux.DNI = txtDNI.Text;
            socioaux.Nombre = TextNombre.Text ;
            socioaux.Apellido = TxtApellido.Text ;
            socioaux.Correo = validationtxtEmail.Text ;
            socioaux.Barrio = txtBarrio.Text ;
            socioaux.Direccion = txtDireccion.Text ;
            socioaux.Telefono = txtCelular.Text ;
            SocioNegocio negocio = new SocioNegocio();
            negocio.modificar(socioaux);

            Usuario usuario = (Usuario)Session["usuario"];
            LogSocioNegocio logSocioNegocio = new LogSocioNegocio();
            logSocioNegocio.agregar("Edit", "Socio", socioaux.IdSocio, socioaux.Nombre, usuario.User, "Actualizacion de datos personales");

            Response.Redirect("Gestion.aspx", false);
        }
    }
}