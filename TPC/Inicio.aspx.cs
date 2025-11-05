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
                CargarSociosPorVencer();
                //cargarinscipcionesvencidas();
                //cargarinscipcionesTresdiasPorVencer();

                //cargarSocioActivos();
                //cargarinscipcionesTresdiasPorVencer();
                //cargarinscipcionesTresdiasPorVencer();
                //cargarinscipcionesTresdiasPorVencer();
                SociosActivos.Text = "2";
                mbinactivas.Text = "1";
            }

        }

        private void CargarSociosPorVencer()
        {
            //// Crear tabla en memoria
            //DataTable dt = new DataTable();
            //dt.Columns.Add("IdSocio", typeof(int));
            //dt.Columns.Add("Nombre", typeof(string));
            //dt.Columns.Add("Apellido", typeof(string));
            //dt.Columns.Add("Correo", typeof(string));
            //dt.Columns.Add("FechaVencimiento", typeof(DateTime));

            //// Agregar filas de prueba (hardcodeadas)
            //dt.Rows.Add(1, "Franco", "Kaner", "franco@mail.com", new DateTime(2025, 10, 31));
            //dt.Rows.Add(2, "Lucía", "Infante", "lucia@mail.com", new DateTime(2025, 11, 2));
            //dt.Rows.Add(3, "Carlos", "Pérez", "carlos@mail.com", new DateTime(2025, 11, 5));
            gvSociosPorVencer.DataBind();
            SocioNegocio negocio = new SocioNegocio();
            List<Socio> listaSociosPorVencer = negocio.ListarPorVencer();
            // Cargar datos en el GridView
            gvSociosPorVencer.DataSource = listaSociosPorVencer;
            gvSociosPorVencer.DataBind();
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
    }


}