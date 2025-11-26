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
    public partial class Historial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["origen"] != null)
                {
                    int origen = (int)Session["origen"];

                    if (origen == 2)
                    {
                        gvLog1.Visible = true;
                        gvLog2.Visible = false;
                         LogSocioNegocio logSocioNegocio = new LogSocioNegocio();;
                        List<LogActividad> logActividads = logSocioNegocio.ListarLogs();
                        gvLog1.DataSource = logActividads;
                        gvLog1.DataBind();
                    }
                    else if (origen == 1)
                    {
                        gvLog1.Visible = false;
                        gvLog2.Visible = true;


                        LogActividadesNegocio actividadesNegocio = new LogActividadesNegocio();
                        List<LogActividad> logActividads = actividadesNegocio.ListarLogs();
                        gvLog2.DataSource = logActividads;
                        gvLog2.DataBind();
                    }
                }
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx", false);
        }
    }
}