using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class HistorialPago : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["IdSocioSeleccionado"] != null)
                {
                    int idSocio = (int)Session["IdSocioSeleccionado"];


                    // Cargar los pagos del socio seleccionado
                    CargarPagos(idSocio);
                }

            }
        }
        private void CargarPagos(int idSocio)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("IdPago", typeof(int));
            dt.Columns.Add("FechaPago", typeof(DateTime));
            dt.Columns.Add("Monto", typeof(decimal));
            dt.Columns.Add("Metodo", typeof(string));

            // Pagos inventados según el IdSocio
            if (idSocio == 1)
            {
                dt.Rows.Add(1, new DateTime(2025, 10, 1), 15000, "Tarjeta");
                dt.Rows.Add(2, new DateTime(2025, 9, 1), 15000, "Efectivo");
            }
            else if (idSocio == 2)
            {
                dt.Rows.Add(3, new DateTime(2025, 10, 5), 12000, "Transferencia");
            }
            else
            {
                dt.Rows.Add(4, new DateTime(2025, 11, 1), 10000, "Efectivo");
            }

            gvPagos.DataSource = dt;
            gvPagos.DataBind();
        }

    }
}