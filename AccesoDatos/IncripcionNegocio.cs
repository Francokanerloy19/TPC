using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class IncripcionNegocio
    {
        public Inscripción filtrarPorID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();


            try
            {
                accesoDatos.setearConsulta("SELECT  m.Nombre AS NombreMembresia, a.NombreActividad,  a.Descripcion FROM Inscripcion i INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad where i.IdSocio = @id ORDER BY i.IdInscripcion DESC, a.Descripcion DESC;");
                accesoDatos.setearParametros("@id", id);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Inscripción socio = new Inscripción();

                    socio.membresia = new Membresia();
                    socio.membresia.Nombre = (string)accesoDatos.Lector["NombreMembresia"];
                    socio.actividadExtra = new ActividadExtra();
                    socio.actividadExtra.NombreActividad = (string)accesoDatos.Lector["NombreActividad"];
                    socio.actividadExtra.Descripción = (string)accesoDatos.Lector["Descripcion"];

                    return socio;


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
            return null;
        }

        public int RegistrarInscripcion(int idSocio, int idMembresia)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.setearConsulta("INSERT INTO Inscripcion (IdSocio, IdMembresia, FechaInscripcion, FechaVencimiento, Estado) " + "OUTPUT INSERTED.IdInscripcion " + "VALUES (@idSocio, @idMembresia, @fechaInscripcion, @fechaVencimiento, @estado)");

                datos.setearParametros("@idSocio", idSocio);
                datos.setearParametros("@idMembresia", idMembresia);
                datos.setearParametros("@fechaInscripcion", DateTime.Now);
                datos.setearParametros("@fechaVencimiento", DateTime.Now.AddDays(30));
                datos.setearParametros("@estado", 1);

                int idGenerado = (int)datos.ejecutarEscalar(); 
                return idGenerado;
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.cerrarConexion();
            }
        }


        public void eliminarUltimaInscripcion(int idSocio)
        {
            AccesoDatos datos = new AccesoDatos();
            int idInscripcion = 0;

            try
            {
                // 1️⃣ Buscar la última inscripción
                datos.setearConsulta("SELECT TOP 1 IdInscripcion FROM Inscripcion WHERE IdSocio = @id ORDER BY IdInscripcion DESC");
                datos.setearParametros("@id", idSocio);
                datos.ejecutarConsulta();

                if (datos.Lector.Read())
                {
                    idInscripcion = (int)datos.Lector["IdInscripcion"];
                }
                datos.cerrarConexion(); // cierro antes de seguir
            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }

            // Si no hay inscripción, salgo
            if (idInscripcion == 0)
                return;

            try
            {
                //  Eliminar pagos
                datos = new AccesoDatos();
                datos.setearConsulta("DELETE FROM Pago WHERE IdInscripcion = @idInscripcion");
                datos.setearParametros("@idInscripcion", idInscripcion);
                datos.ejecutarAccion();
                datos.cerrarConexion();

                //  Eliminar actividades de esa inscripción
                datos = new AccesoDatos();
                datos.setearConsulta("DELETE FROM InscripcionActividad WHERE IdInscripcion = @idInscripcion");
                datos.setearParametros("@idInscripcion", idInscripcion);
                datos.ejecutarAccion();
                datos.cerrarConexion();

                //  Eliminar la inscripción
                datos = new AccesoDatos();
                datos.setearConsulta("DELETE FROM Inscripcion WHERE IdInscripcion = @idInscripcion");
                datos.setearParametros("@idInscripcion", idInscripcion);
                datos.ejecutarAccion();
                datos.cerrarConexion();
            }
            catch (Exception ex)
            {
                datos.cerrarConexion();
                throw ex;
            }
        }


    }
}
