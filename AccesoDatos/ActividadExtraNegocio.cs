using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class ActividadExtraNegocio
    {
        public List<ActividadExtra> Listar()
        {
            List<ActividadExtra> Lista = new List<ActividadExtra>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("select IdActividad ,NombreActividad, PrecioExtra, Descripcion from ActividadExtra");
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    ActividadExtra aux = new ActividadExtra();
                    aux.IdActividad = (int)accesoDatos.Lector["IdActividad"];
                    aux.NombreActividad = (string)accesoDatos.Lector["NombreActividad"];
                    aux.PrecioExtra = (decimal)accesoDatos.Lector["PrecioExtra"];
                    aux.Descripción = (string)accesoDatos.Lector["Descripcion"];



                    Lista.Add(aux);
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
            return Lista;
        }

        public void RegistrarInscripcionActividad(int IdInscripcion, int IdActividad, decimal PrecioFinal)
        {
            AccesoDatos negocio = new AccesoDatos();
            try
            {
                negocio.setearConsulta("INSERT INTO InscripcionActividad (IdInscripcion, IdActividad, PrecioFinal) " + "VALUES(@idInscripcion, @IdActividad, @PrecioFinal)");

                negocio.setearParametros("@idInscripcion", IdInscripcion);
                negocio.setearParametros("@IdActividad", IdActividad);
                negocio.setearParametros("@PrecioFinal", PrecioFinal);
                negocio.ejecutarConsulta();



            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                negocio.cerrarConexion();
            }
        }

        public int agregar(ActividadExtra actividadExtra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            int idGenerado = 0;

            try
            {
                // Insertamos y devolvemos el ID recién generado
                accesoDatos.setearConsulta(@" INSERT INTO ActividadExtra (NombreActividad, PrecioExtra, Descripcion)   VALUES(@NombreActividad, @PrecioExtra, @Descripcion);  SELECT CAST(SCOPE_IDENTITY() AS INT);");

                accesoDatos.setearParametros("@NombreActividad", actividadExtra.NombreActividad);
                accesoDatos.setearParametros("@PrecioExtra", actividadExtra.PrecioExtra);
                accesoDatos.setearParametros("@Descripcion", actividadExtra.Descripción);

                // Ejecutamos la consulta y convertimos el resultado a int
                object resultado = accesoDatos.ejecutarEscalar();
                idGenerado = Convert.ToInt32(resultado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

            return idGenerado;
        }


        public string Eliminar(int IdActividadExtra)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("DELETE FROM ActividadExtra WHERE IdActividad = @IdActividad;");
                accesoDatos.setearParametros("@IdActividad", IdActividadExtra);
                accesoDatos.ejecutarAccion();
                return null;
            }
            catch (Exception ex)
            {

                return ex.Message;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

        }

        public ActividadExtra ObtenerPorId(int id)
        {
            ActividadExtra actividad = null;
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("SELECT IdActividad, NombreActividad, PrecioExtra, Descripcion FROM ActividadExtra WHERE IdActividad = @Id");
                accesoDatos.setearParametros("@Id", id);
                accesoDatos.ejecutarConsulta();

                if (accesoDatos.Lector.Read())
                {
                    actividad = new ActividadExtra();
                    actividad.IdActividad = (int)accesoDatos.Lector["IdActividad"];
                    actividad.NombreActividad = (string)accesoDatos.Lector["NombreActividad"];
                    actividad.PrecioExtra = (decimal)accesoDatos.Lector["PrecioExtra"];
                    actividad.Descripción = (string)accesoDatos.Lector["Descripcion"];
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

            return actividad; // Devuelve null si no existe
        }

    }
}
