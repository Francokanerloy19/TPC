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
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarSociosPorVencerCorreo();
                //cargarinscipcionesvencidas();
                cargarinscipcionesPorVencer();

                //cargarSocioActivos();
                //cargarinscipcionesTresdiasPorVencer();
                //cargarinscipcionesTresdiasPorVencer();
                //cargarinscipcionesTresdiasPorVencer();
                //MVencer.Text = "234";
                SociosActivos.Text = "2";
                mbinactivas.Text = "1";
            }

        }

        private void CargarSociosPorVencerCorreo()
        {
            int diasAntesVencer = 3;
            gvSociosPorVencer.DataBind();
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> CargarSociosPorVencerCorreo = negocio.ListarPorVencer(diasAntesVencer);
          

            // Cargar datos en el GridView
            gvSociosPorVencer.DataSource = CargarSociosPorVencerCorreo;
            gvSociosPorVencer.DataBind();
        }
        private void cargarinscipcionesPorVencer()
        {
            int diasParaVencer = 7;
       
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> listadoSocioPorVencer = negocio.ListarPorVencer(diasParaVencer);
            int cantidad = listadoSocioPorVencer.Count; // Cuento los socios agregados a la lista

            MVencer.Text = cantidad.ToString(); // Mostrás la cantidad en tu Label

        }


     protected void gvSociosPorVencer_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Contactar")
            {
                string correo = e.CommandArgument.ToString();
                // Acá podés implementar el envío de mail, por ejemplo:
                // EnviarCorreo(correo);
            }
        }

        protected void btnMVencer_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoSociosPorVencer.aspx", false);
        }
    }


}