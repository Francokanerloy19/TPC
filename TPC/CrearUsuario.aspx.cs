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
    public partial class CrearUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUser.Text) || string.IsNullOrWhiteSpace(txtPass.Text))
            {
               
                return;
            }
            UsuarioNegocio negocio = new UsuarioNegocio();
            bool existe = negocio.ExisteUsuario(txtUser.Text);
            if (existe == true)
            {
                lblMensaje.Text = "Elusuario ya existe.";
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
            else
            {

               
                int ultimoID = negocio.AgregarUsuario(txtUser.Text, txtPass.Text, 1);
                Usuario usuario = (Usuario)Session["usuario"];
                LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
                logActividadesNegocio.agregar("Insert", "Usuario", ultimoID, txtUser.Text, usuario.User, "nuevo empleado");

                lblMensaje.Text = "¡Se agregó correctamente!";
                lblMensaje.Visible = true;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx",false);
        }

        protected void btnAgregarAdmin_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(txtUser.Text) || string.IsNullOrWhiteSpace(txtPass.Text))
            {

                return;
            }
            UsuarioNegocio negocio = new UsuarioNegocio();
            bool existe = negocio.ExisteUsuario(txtUser.Text);
            if (existe == true)
            {
                lblMensaje.Text = "Elusuario ya existe.";
                lblMensaje.CssClass = "text-danger";
                lblMensaje.Visible = true;
            }
            else
            {


                int ultimoID = negocio.AgregarUsuario(txtUser.Text, txtPass.Text, 2);
                
                Usuario usuario = (Usuario)Session["usuario"];
                LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
                logActividadesNegocio.agregar("Insert", "Usuario", ultimoID, txtUser.Text, usuario.User, "nuevo empleado rol admin");

                lblMensaje.Text = "¡Se agregó correctamente!";
                lblMensaje.Visible = true;
            }
        }
    }
}