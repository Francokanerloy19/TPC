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
                

            } else if (tipoAccion == 3)
            {
                btnEliminarAccion.CssClass += " btn-success";

                int IdSocio = int.Parse(Session["IdSocioSeleccionado"].ToString());
                PagoNegocio pagoNegocio = new PagoNegocio();
                List<Pago> Listapago = pagoNegocio.Listar(IdSocio);
                if (Listapago == null || Listapago.Count == 0)
                {
                    
                    Session["ErrorEliminar"] = "El socio no tiene pagos registrados.";
                    return;
                }
                Pago pago = Listapago[Listapago.Count - 1];
                if (pago.FechaPago.Month == DateTime.Now.Month && pago.FechaPago.Year == DateTime.Now.Year)
                {
                    IncripcionNegocio negocio = new IncripcionNegocio();
                    negocio.eliminarUltimaInscripcion(IdSocio);
                    SocioNegocio socioNegocio = new SocioNegocio();
                    socioNegocio.baja(IdSocio, false);
                    Response.Redirect("ListadoSocio.aspx", false);

                    Usuario usuario = (Usuario)Session["usuario"];
                    LogSocioNegocio logSocioNegocio = new LogSocioNegocio();
                    Socio socio = socioNegocio.filtrarPorID(IdSocio);
                    logSocioNegocio.agregar("Delete", "Socio", IdSocio, socio.Nombre, usuario.User, motivo);

                }
                else
                {
                    Session["ErrorEliminar"] = "No hay Pagos registrado este mes";
                }
            }
            
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx", false);
        }
    }
}