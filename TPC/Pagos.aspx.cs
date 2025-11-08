using AccesoDatos;
using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace TPC
{
    public partial class Pagos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
    {
        CargarMembresia();
        CargarActividadExtra();
    }
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
            if (!string.IsNullOrEmpty(ddlMembresia.SelectedValue))
            {
                int membresiaSeleccionada = int.Parse(ddlMembresia.SelectedValue);
                Session["membresiaSeleccionada"] = membresiaSeleccionada;
            }
            else
            {
                Session["membresiaSeleccionada"] = null;
            }
        }

        protected void ddlActividadExtra_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(ddlActividadExtra.SelectedValue))
            {
                int actividadExtraSeleccionada = int.Parse(ddlActividadExtra.SelectedValue);
                Session["actividadExtraSeleccionada"] = actividadExtraSeleccionada;
            }
            else
            {
                Session["actividadExtraSeleccionada"] = null;
            }

            
          
        }

        protected void btnContinuar_Click(object sender, EventArgs e)
        {
            if (Session["membresiaSeleccionada"] != null && Session["actividadExtraSeleccionada"] != null)
                lbl.Text = "Membresía seleccionada: " + Session["membresiaSeleccionada"].ToString() + " " + "Actividad extra seleccionada: " + Session["actividadExtraSeleccionada"].ToString();
            else
                lbl.Text = "No se seleccionó ninguna membresía.";
        }
    }
}