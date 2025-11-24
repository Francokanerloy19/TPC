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
    public partial class ConfirmarAccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEliminarAccion_Click(object sender, EventArgs e)
        {
            int tipoAccion = Convert.ToInt32(Session["TipoAccion"]);
            
            string motivo = txtDescripcion.Text;
            if (tipoAccion == 1)
            {
                int idMembresia = Convert.ToInt32(Session["membresiaSeleccionadaEliminar"]);
                MembresiaNegocio negocio = new MembresiaNegocio();
                Dominio.Membresia membresia = negocio.buscarPorId(idMembresia);
                Usuario usuario = (Usuario)Session["usuario"];
                LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
                logActividadesNegocio.agregar("Delete", "Membresia", idMembresia, membresia.Nombre, usuario.User, motivo);
                string resultado = negocio.Eliminar(idMembresia);
                if (resultado != null)
                {
                    Session["ErrorEliminar"] = "No se puede eliminar porque está siendo utilizada.";
                    
                }
                else
                {
                    // TODO OK → limpiar error previo
                    Session["ErrorEliminar"] = null;
                }
                Response.Redirect("Admin.aspx", false);
                
            }
            else if (tipoAccion == 2)
            {
                int idActividad = Convert.ToInt32(Session["actividadExtraSeleccionadaEliminar"]);
                ActividadExtraNegocio actividadExtraNegocio = new ActividadExtraNegocio();
                ActividadExtra actividadExtra = actividadExtraNegocio.ObtenerPorId(idActividad);
                Usuario usuario = (Usuario)Session["usuario"];
                LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
                logActividadesNegocio.agregar("Delete", "Membresia", idActividad, actividadExtra.NombreActividad, usuario.User, motivo);
                string resultadoActividad = actividadExtraNegocio.Eliminar(idActividad);
                if (resultadoActividad != null)
                {
                    Session["ErrorEliminar"] = "No se puede eliminar porque está siendo utilizadaa.";

                }
                else
                {
                    // TODO OK → limpiar error previo
                    Session["ErrorEliminar"] = null;
                }
                Response.Redirect("Admin.aspx", false);
                

            }
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx", false);
        }
    }
}