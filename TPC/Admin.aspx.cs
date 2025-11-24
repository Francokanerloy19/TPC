using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string resultado = Session["ErrorEliminar"] as string;
                lblMensaje.Text = resultado;
            }
        }

       

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("CrearUsuario.aspx", false);
        }

        protected void btnEliminarPlan_Click(object sender, EventArgs e)
        {
            Response.Redirect("EliminarPlanes.aspx", false);
        }

        protected void btnAgregarPlan_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarPlan.aspx", false);
        }

        protected void btnVolverMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }

        protected void btnHistorialPlanes_Click(object sender, EventArgs e)
        {
            Session["origen"] = 1;
            
            Response.Redirect("Historial.aspx", false);
        }

        protected void btnHistorialSocios_Click(object sender, EventArgs e)
        {
            Session["origen"] = 2;
            Response.Redirect("Historial.aspx", false);

        }
    }
}