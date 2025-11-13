using AccesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class ListadoSocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {

                Response.Redirect("Default.aspx", false);
            }
            if (!IsPostBack)
            {
                CargarSocios();
            }
        }

        private void CargarSocios()
        {
            
            gvSocios.DataBind();
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> listaSocios = negocio.Listar();

            gvSocios.DataSource = listaSocios;
            gvSocios.DataBind();
        }

        

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoSocio.aspx", false);
        }

        protected void gvSocios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "GestionarSocio")
            {
                string idSocio = e.CommandArgument.ToString();

                // Guardás el ID en sesión
                Session["IdSocioSeleccionado"] = idSocio;

                // Redirigís a la otra página
                Response.Redirect("Gestion.aspx", false);
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            SocioNegocio negocio = new SocioNegocio();
            Socio socio = negocio.buscarSocioDNI(txtSearch.Text);

            if (socio != null)
            {
                gvSocios.DataSource = new List<Socio> { socio }; 
                gvSocios.DataBind();
            }
            else
            {
                gvSocios.DataSource = null;
                gvSocios.DataBind();
                lblErrorSearch.Text = "El cliente no existe";
            }
        }
    }
}