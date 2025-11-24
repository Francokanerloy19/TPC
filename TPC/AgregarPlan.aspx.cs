using AccesoDatos;
using Dominio;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace TPC
{
    public partial class AgregarPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarMembresia_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextNombre.Text) || string.IsNullOrWhiteSpace(TxtDuracionDias.Text) || string.IsNullOrWhiteSpace(txtPrecio.Text))
            {
                
                return;
            }
            Dominio.Membresia membresia = new Dominio.Membresia();

            membresia.Nombre = TextNombre.Text;
            membresia.DuracionDias = int.Parse(TxtDuracionDias.Text);
            membresia.PrecioBase = decimal.Parse(txtPrecio.Text);

            MembresiaNegocio negocio = new MembresiaNegocio();
            int idMembresia = negocio.agregar(membresia);


            Usuario usuario = (Usuario)Session["usuario"];
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            logActividadesNegocio.agregar("Insert", "Membresia", idMembresia, membresia.Nombre, usuario.User, "");
            Response.Redirect("Membresia.aspx", false);
        }

        protected void btnAgregarActividad_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextNombreActividad.Text) || string.IsNullOrWhiteSpace(TxtPrecioActividad.Text) || string.IsNullOrWhiteSpace(TxtDescripcion.Text))
            {
                return;
            }
            Dominio.ActividadExtra actividadExtra = new Dominio.ActividadExtra();

            actividadExtra.NombreActividad = TextNombreActividad.Text;
            actividadExtra.PrecioExtra = decimal.Parse(TxtPrecioActividad.Text);
            actividadExtra.Descripción = TxtDescripcion.Text;

            ActividadExtraNegocio negocio = new ActividadExtraNegocio();
            int idActividadExtra = negocio.agregar(actividadExtra);
            Usuario usuario = (Usuario)Session["usuario"];
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            logActividadesNegocio.agregar("Insert", "Actividad Extra", idActividadExtra, actividadExtra.NombreActividad, usuario.User, "");
            Response.Redirect("Membresia.aspx", false);

        }
    }
}