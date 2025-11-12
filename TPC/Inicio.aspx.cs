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
                cargarinscipcionesPorVencer();


                cargarSocioActivos();
                
                cargarNuevosSocios();
                


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
        private void cargarSocioActivos()
        {
            SocioNegocio negocioNeg = new SocioNegocio();
            SociosActivos.Text = negocioNeg.contarSocios(true).ToString();
        }
        private void cargarIngresos()
        {
            IncripcionNegocio negocio = new IncripcionNegocio();
            DateTime fecha; 

            if (!string.IsNullOrWhiteSpace(txtDia.Text))
            {
                fecha = DateTime.ParseExact(txtDia.Text, "yyyy-MM-dd", null);
            }
            else
            {
                lblAlertaIngreso.Text = "Ingrese una fecha válida";
                return; 
            }

            decimal monto = negocio.ingresoDiario(fecha);

            lblIngresos.Text = monto.ToString("C");
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



        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            SocioNegocio negocioNeg = new SocioNegocio();

            negocioNeg.DarDeBajaSociosVencidos();
            mbinactivas.Text = negocioNeg.contarSocios(false).ToString();

        }

        protected void btnDia_Click(object sender, EventArgs e)
        {
            cargarIngresos();
        }


        private void cargarNuevosSocios()
        {
            SocioNegocio negocioNeg = new SocioNegocio();
            int nuevos = negocioNeg.contarNuevosSocios();
            lblNuevosSocios.Text = nuevos.ToString();
        }

    }


}