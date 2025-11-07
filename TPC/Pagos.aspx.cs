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
    public partial class Pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarMembresia();
            CargarActividadExtra();
        }

        private void CargarMembresia()
        {
            
            MembresiaNegocio negocio = new MembresiaNegocio();
            List<Dominio.Membresia> ListarMembresias = negocio.Listar();
            ddlMembresia.DataSource = ListarMembresias;
            ddlMembresia.DataTextField = "Nombre";        // lo que se muestra
            ddlMembresia.DataValueField = "IdMembresia";  // el valor interno
            ddlMembresia.DataBind();
            
        }
        private void CargarActividadExtra()
        {

            ActividadExtraNegocio negocio = new ActividadExtraNegocio();
            List<Dominio.ActividadExtra> ListarActividadExtra = negocio.Listar();
            ddlActividadExtra.DataSource = ListarActividadExtra;
            ddlActividadExtra.DataTextField = "NombreActividad";        // lo que se muestra
            ddlActividadExtra.DataValueField = "IdActividad";  // el valor interno
            ddlActividadExtra.DataBind();

        }

        protected void ddlMembresia_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["membresiaSeleccionada"] = ddlMembresia.SelectedValue;
        }

        protected void ddlActividadExtra_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["ActividadExtraSeleccionada"] = ddlActividadExtra.SelectedValue;
        }
    }
}