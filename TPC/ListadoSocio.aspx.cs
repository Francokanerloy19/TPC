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
    public partial class ListadoSocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSocios();
            }
        }

        private void CargarSocios()
        {
            
            gvSocios.DataBind();
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> listaSocios = negocio.Listar();

            gvSocios.DataSource = listaSocios;
            gvSocios.DataBind();
        }

        protected void btnVer_Click(object sender, EventArgs e)
        { // codigo de peubra aca va la logica para recuperar el id del socio y guardarlo en sesion

            // Obtener el botón que disparó el evento
            Button btn = (Button)sender;

            // Obtener la fila donde se hizo clic
            GridViewRow fila = (GridViewRow)btn.NamingContainer;

            // Obtener el valor de la columna IdSocio (primer columna en tu caso)
            int idSocio = Convert.ToInt32(gvSocios.DataKeys[fila.RowIndex].Value);

            // Guardar el ID en sesión
            Session["IdSocioSeleccionado"] = idSocio;

            // Redirigir a la página de historial
            Response.Redirect("HistorialPago.aspx", false);
        }

        protected void btnPagar_Click(object sender, EventArgs e)
        {
            // Obtener el botón que disparó el evento
            Button btn = (Button)sender;

            // Obtener la fila donde se hizo clic
            GridViewRow fila = (GridViewRow)btn.NamingContainer;

            // Obtener el valor de la columna IdSocio (primer columna en tu caso)
            int idSocio = Convert.ToInt32(gvSocios.DataKeys[fila.RowIndex].Value);

            // Guardar el ID en sesión
            Session["IdSocioSeleccionado"] = idSocio;
            Response.Redirect("Pagos.aspx", false);
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            Response.Redirect("NuevoSocio.aspx", false);
        }

        protected void btnGestion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx", false);
        }
    }
}