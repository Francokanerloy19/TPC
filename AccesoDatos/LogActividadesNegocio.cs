using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;

namespace AccesoDatos
{
    public class LogActividadesNegocio
    {
        public void agregar(string Accion, string tabla, int idRegistro, string nombre, string nombreUsuario, string comentario )
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("INSERT INTO LogActividades (Accion, Tabla, IdRegistro, NombreRegistro, Usuario, Descripcion) VALUES(@Accion, @Tabla, @IdRegistro, @NombreRegistro, @Usuario, @Descripcion); ");

                accesoDatos.setearParametros("@Accion", Accion);
                accesoDatos.setearParametros("@Tabla", tabla);
                accesoDatos.setearParametros("@IdRegistro", idRegistro);
                accesoDatos.setearParametros("@NombreRegistro", nombre);
                accesoDatos.setearParametros("@Usuario", nombreUsuario);
                accesoDatos.setearParametros("@Descripcion", comentario);

                accesoDatos.ejecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

        }
    }
}
