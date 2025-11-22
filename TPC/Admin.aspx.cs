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

        }

       

        protected void btnCrearUsuario_Click(object sender, EventArgs e)
        {

        }

        protected void btnModificarPlan_Click(object sender, EventArgs e)
        {

        }

        protected void btnEliminarPlan_Click(object sender, EventArgs e)
        {

        }

        protected void btnAgregarPlan_Click(object sender, EventArgs e)
        {
            Response.Redirect("AgregarPlan.aspx", false);
        }

        protected void btnVolverMenu_Click(object sender, EventArgs e)
        {
            Response.Redirect("Inicio.aspx", false);
        }
    }
}