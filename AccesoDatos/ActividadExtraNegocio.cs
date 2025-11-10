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

    }
}
