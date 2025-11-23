using AccesoDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class EliminarPlanes : System.Web.UI.Page
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
                int membresiaSeleccionadaEliminar = int.Parse(ddlMembresia.SelectedValue);
                Session["membresiaSeleccionadaEliminar"] = membresiaSeleccionadaEliminar;
            }
            else
            {
                Session["membresiaSeleccionadaEliminar"] = null;
            }
        }

        protected void ddlActividadExtra_SelectedIndexChanged(object sender, EventArgs e)
        {


            if (!string.IsNullOrEmpty(ddlActividadExtra.SelectedValue))
            {
                int actividadExtraSeleccionadaEliminar = int.Parse(ddlActividadExtra.SelectedValue);
                Session["actividadExtraSeleccionadaEliminar"] = actividadExtraSeleccionadaEliminar;
            }
            else
            {
                Session["actividadExtraSeleccionadaEliminar"] = null;
            }



        }

        

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }

        protected void btnEliminarMembresía_Click(object sender, EventArgs e)
        {
            if (Session["membresiaSeleccionadaEliminar"] != null)
            {
                Session["TipoAccion"] = "1"; //EliminarMembresia
                Response.Redirect("ConfirmarAccion.aspx", false);
            }
            else
            {
                lbl.Text = "Seleciona una opcion para continuar";
            }
        }

        protected void btnEliminarActividades_Click(object sender, EventArgs e)
        {
            
            if (Session["actividadExtraSeleccionadaEliminar"] != null)
            {
                Session["TipoAccion"] = "2"; //EliminarActividad
                Response.Redirect("ConfirmarAccion.aspx", false);
            }
            else
            {
                lbl.Text = "Seleciona una opcion para continuar";
            }
        }
    }
}