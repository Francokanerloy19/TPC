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
    public partial class ConfirmarPago : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idMembresia = int.Parse(Session["membresiaSeleccionada"].ToString());
                int idActividadExtra = int.Parse(Session["actividadExtraSeleccionada"].ToString());
                CargargvOrdenPago(idMembresia, idActividadExtra);

            }

        }

        private void CargargvOrdenPago(int idMembresia, int idActividadExtra)
        {


            gvOrdenPago.DataBind();
            MembresiaNegocio negocio = new MembresiaNegocio();
            List<Dominio.Membresia> listado = negocio.filtrarPorID(idMembresia, idActividadExtra);

            gvOrdenPago.DataSource = listado;
            gvOrdenPago.DataBind();

            Dominio.Membresia membresia = listado[0];
            decimal precioExtra = membresia.actividadExtra.PrecioExtra;
            decimal precioFinal = membresia.PrecioBase + membresia.actividadExtra.PrecioExtra;

            // Guardamos el valor total para usarlo después en el botón Confirmar
            Session["PrecioExtra"] = precioExtra;
            Session["precioFinal"] = precioFinal;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestion.aspx", false);
        }

        protected void btnConFirmar_Click(object sender, EventArgs e)
        {
            
            
            int idSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());
            int idMembresia = int.Parse(Session["membresiaSeleccionada"].ToString());
            int idActividadExtra = int.Parse(Session["actividadExtraSeleccionada"].ToString());
            decimal precioFinal = Convert.ToDecimal(Session["precioFinal"]);
            decimal precioExtra = Convert.ToDecimal(Session["PrecioExtra"]);

            IncripcionNegocio negocio = new IncripcionNegocio();
            int idInscripcion = negocio.RegistrarInscripcion(idSocio, idMembresia);
            
            ActividadExtraNegocio extraNegocio = new ActividadExtraNegocio();
            extraNegocio.RegistrarInscripcionActividad(idInscripcion, idActividadExtra, precioExtra);

            PagoNegocio pagoNegocio = new PagoNegocio();
            string metodo = "Transferencia";
            pagoNegocio.RegistrarPago(idInscripcion, idSocio, precioFinal, metodo);
            
            SocioNegocio socioNegocio = new SocioNegocio();
            int IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());
            socioNegocio.baja(IdSocio, true);
            Response.Redirect("Gestion.aspx", false);
        }
    }
}


