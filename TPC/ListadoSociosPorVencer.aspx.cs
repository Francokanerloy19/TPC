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
    public partial class ListadoSociosPorVencer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            cargarinscipcionesPorVencer();
        }

        private void cargarinscipcionesPorVencer()
        {
            int diasParaVencer = 7;
            gvSocios.DataBind();
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> listadoSocioPorVencer = negocio.ListarPorVencer(diasParaVencer);

            gvSocios.DataSource = listadoSocioPorVencer;
            gvSocios.DataBind();
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

        protected void volver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }
    }
}