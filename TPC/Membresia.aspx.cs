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
    public partial class Membresia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {

                Response.Redirect("Default.aspx", false);
            }
            cargarMembresia();
            cargarActividades();
        }
        private void cargarMembresia()
        {
            MembresiaNegocio negocio = new MembresiaNegocio();
            List<Dominio.Membresia> listaMembresias = negocio.Listar();

            repMembresias.DataSource = listaMembresias;
            repMembresias.DataBind();
        }
        private void cargarActividades()
        {
            gvActividadExtra.DataBind();

            ActividadExtraNegocio negocio = new ActividadExtraNegocio();
            List<Dominio.ActividadExtra> actividadExtra = negocio.Listar();
            gvActividadExtra.DataSource = actividadExtra;
            gvActividadExtra.DataBind();

        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }
    }
}