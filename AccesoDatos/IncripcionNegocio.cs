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
                accesoDatos.setearConsulta("SELECT  m.Nombre AS NombreMembresia, a.NombreActividad,  a.Descripcion FROM Inscripcion i INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia LEFT JOIN InscripcionActividad ia ON i.IdInscripcion = ia.IdInscripcion LEFT JOIN ActividadExtra a ON ia.IdActividad = a.IdActividad where i.IdSocio = @id ORDER BY i.IdInscripcion ASC, a.Descripcion ASC;");
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



    }
}
