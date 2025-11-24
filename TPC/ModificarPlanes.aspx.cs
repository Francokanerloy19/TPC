using Dominio;
using AccesoDatos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPC
{
    public partial class ModificarPlanes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                {
                    if (!IsPostBack)
                    {
                        // Ocultamos ambos por defecto
                        divMembresia.Visible = false;
                        divActividad.Visible = false;

                        if (Session["TipoAccion"] != null)
                        {
                            int tipo = Convert.ToInt32(Session["TipoAccion"]);
                            if (tipo == 1)
                            {
                                divMembresia.Visible = (tipo == 1);
                                cargarMembresiaModificar();


                            }
                            else
                            {
                                divActividad.Visible = (tipo == 2);
                                cargaActividadExtraModificar();
                            }
                        }
                    }
                }
            }
        }

        public void cargarMembresiaModificar()
        {

            int IdMembrsia = Convert.ToInt32(Session["membresiaSeleccionadaModificar"]);
            MembresiaNegocio membresiaNegocio = new MembresiaNegocio();
            Dominio.Membresia membresia = membresiaNegocio.buscarPorId(IdMembrsia);
            TextNombre.Text = membresia.Nombre;
            TxtDuracionDias.Text = membresia.DuracionDias.ToString();
            txtPrecio.Text = membresia.PrecioBase.ToString();
        }

        public void cargaActividadExtraModificar()
        {

            int IdActividad = Convert.ToInt32(Session["actividadExtraSeleccionadaModificar"]);
            ActividadExtraNegocio actividadExtraNegocio = new ActividadExtraNegocio();
            Dominio.ActividadExtra actividadExtra = actividadExtraNegocio.ObtenerPorId(IdActividad);
            TextNombreActividad.Text = actividadExtra.NombreActividad;
            TxtDescripcion.Text = actividadExtra.Descripción;
            TxtPrecioActividad.Text = actividadExtra.PrecioExtra.ToString();
        }

        protected void btnModificarActividad_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrWhiteSpace(TextNombreActividad.Text) || string.IsNullOrWhiteSpace(TxtDescripcion.Text) || string.IsNullOrWhiteSpace(TxtPrecioActividad.Text))
            {

                lblError.Text = "Todos los campos son obligatorios.";
                lblError.Visible = true;
                return;
            }


            decimal precio;
            if (!decimal.TryParse(TxtPrecioActividad.Text, out precio))
            {
                lblError.Text = "El precio debe ser un número válido.";
                lblError.Visible = true;
                return;
            }

            int IdActividad = Convert.ToInt32(Session["actividadExtraSeleccionadaModificar"]);
            ActividadExtraNegocio actividadExtraNegocio = new ActividadExtraNegocio();
            actividadExtraNegocio.ModificarActividad(IdActividad, TextNombreActividad.Text, precio, TxtDescripcion.Text);


            lblError.Text = "Actividad modificada correctamente.";
            lblError.CssClass = "text-success";
            lblError.Visible = true;

            Usuario usuario = (Usuario)Session["usuario"];
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            logActividadesNegocio.agregar("Edit", "Actividad Extra", IdActividad, TextNombreActividad.Text, usuario.User, "Modificacion");
        }

        protected void btnModificarMembresia_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextNombre.Text) || string.IsNullOrWhiteSpace(TxtDuracionDias.Text) || string.IsNullOrWhiteSpace(txtPrecio.Text))
            {

                lblError.Text = "Todos los campos son obligatorios.";
                lblError.Visible = true;
                return;
            }


            decimal precio;
            if (!decimal.TryParse(txtPrecio.Text, out precio))
            {
                lblError.Text = "El precio debe ser un número válido.";
                lblError.Visible = true;
                return;
            }

            int IdMembresia = Convert.ToInt32(Session["membresiaSeleccionadaModificar"]);
            MembresiaNegocio membresiaNegocio = new MembresiaNegocio();
            int dia = int.Parse(TxtDuracionDias.Text);
            membresiaNegocio.ModificarMembresia(IdMembresia, TextNombre.Text, precio, dia);


            lblError.Text = "Membresía modificada correctamente.";
            lblError.CssClass = "text-success";
            lblError.Visible = true;

            Usuario usuario = (Usuario)Session["usuario"];
            LogActividadesNegocio logActividadesNegocio = new LogActividadesNegocio();
            logActividadesNegocio.agregar("Edit", "Membresia", IdMembresia, TextNombre.Text, usuario.User, "Modificacion");
        }
    }
}