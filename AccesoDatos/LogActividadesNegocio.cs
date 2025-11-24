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
        public List<LogActividad> ListarLogs()
        {
            List<LogActividad> lista = new List<LogActividad>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                // Consulta para traer todos los logs
                accesoDatos.setearConsulta("SELECT IdLog, Accion, Tabla, IdRegistro, NombreRegistro, Usuario, Descripcion, Fecha FROM LogActividades");
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    LogActividad log = new LogActividad();

                    log.IdLog = (int)accesoDatos.Lector["IdLog"];
                    log.Accion = accesoDatos.Lector["Accion"].ToString();
                    log.Tabla = accesoDatos.Lector["Tabla"].ToString();
                    log.IdRegistro = (int)accesoDatos.Lector["IdRegistro"];
                    log.NombreRegistro = accesoDatos.Lector["NombreRegistro"] != DBNull.Value ? accesoDatos.Lector["NombreRegistro"].ToString() : null;
                    log.Usuario = accesoDatos.Lector["Usuario"].ToString();
                    log.Descripcion = accesoDatos.Lector["Descripcion"] != DBNull.Value ? accesoDatos.Lector["Descripcion"].ToString() : null;
                    log.Fecha = (DateTime)accesoDatos.Lector["Fecha"];

                    lista.Add(log);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

            return lista;
        }
    }
}
