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
    public partial class GestionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

           
        }





        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();

            Usuario usuario = usuarioNegocio.BuscarUsuario(txtUser.Text);
            
            Session["usuarioeliminar"] = usuario;
            if (usuario == null)
            {
                lblMensaje.Text = "El usuario no existe.";
                lblMensaje.CssClass = "bg-danger";
                lblMensaje.Visible = true;
                return;
            }
            lblMensaje.Text = "El usuario existe.";
            lblMensaje.CssClass = "bg-success";
            lblMensaje.Visible = true;
            txtUser.Text = usuario.User;
            txtPass.Text = usuario.Pass;
        }

        protected void btneliminar_Click(object sender, EventArgs e)
        {
            
            Usuario usuario = (Usuario)Session["usuario"];
            Usuario usuarioEliminado = (Usuario)Session["usuarioeliminar"];
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarioNegocio.EliminarUsuario(usuarioEliminado.User);
            logActividadesNegocio.agregar("Delete", "Usuario", usuarioEliminado.Id, usuarioEliminado.User, usuario.User, "eliminacion");
            Response.Redirect("Admin.aspx", false);
        }

        protected void btnModificat_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["usuario"];
            Usuario usuarioModi = (Usuario)Session["usuarioeliminar"];
            Usuario usuarioAmodificar = new Usuario();
            usuarioAmodificar.User = txtUser.Text;
            usuarioAmodificar.Pass = txtPass.Text;
            usuarioAmodificar.TipoUsuario = usuarioModi.TipoUsuario;
            usuarioAmodificar.Id = usuarioModi.Id;
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            UsuarioNegocio usuarioNegocio = new UsuarioNegocio();
            usuarioNegocio.ModificarUsuario(usuarioAmodificar);
            logActividadesNegocio.agregar("Edit", "Usuario", usuarioAmodificar.Id, usuarioAmodificar.User, usuario.User, "Modificacion");
            Response.Redirect("Admin.aspx", false);
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx", false);
        }
    }
}