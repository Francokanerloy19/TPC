using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class Gestion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            Response.Redirect("ModificarSocio.aspx", false);
        }

        protected void btnVerDatosPersonales_Click(object sender, EventArgs e)
        {
            Response.Redirect("DatosPersonales.aspx", false);
        }
    }
}