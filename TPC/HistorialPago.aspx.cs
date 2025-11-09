using AccesoDatos;
using Dominio;
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
                    int idSocio = Convert.ToInt32(Session["IdSocioSeleccionado"]);


                    // Cargar los pagos del socio seleccionado
                    CargarPagos(idSocio);
                }

            }
        }
        private void CargarPagos(int idSocio)
        {
            gvPagos.DataBind();
            PagoNegocio negocio = new PagoNegocio();
            List<Pago> pago = negocio.Listar(idSocio);

            gvPagos.DataSource = pago;
            gvPagos.DataBind();
        }

    }
}