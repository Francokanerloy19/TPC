using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class MembresiaNegocio
    {
        public List<Membresia> Listar()
        {
            List<Membresia> Lista = new List<Membresia>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("select IdMembresia ,Nombre, DuracionDias, PrecioBase from Membresia");
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Membresia aux = new Membresia();
                    aux.IdMembresia = (int)accesoDatos.Lector["IdMembresia"];
                    aux.Nombre = (string)accesoDatos.Lector["Nombre"];
                    aux.DuracionDias = (int)accesoDatos.Lector["DuracionDias"];
                    aux.PrecioBase = (decimal)accesoDatos.Lector["PrecioBase"];
                    


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

        public List<Membresia> filtrarPorID(int idMembresia, int idActiExtra )
        {
            List<Membresia> Lista = new List<Membresia>();
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("SELECT  M.Nombre AS NombreMembresia, M.PrecioBase, A.NombreActividad, A.PrecioExtra FROM Membresia M, ActividadExtra A WHERE M.IdMembresia = @idMembresia  AND A.IdActividad = @idActividad;");
                accesoDatos.setearParametros("@idMembresia", idMembresia);
                accesoDatos.setearParametros("@idActividad", idActiExtra);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Membresia aux = new Membresia();

                    aux.Nombre = (string)accesoDatos.Lector["NombreMembresia"];
                    aux.PrecioBase = (decimal)accesoDatos.Lector["PrecioBase"];

                    aux.actividadExtra = new ActividadExtra();
                    aux.actividadExtra.NombreActividad = (string)accesoDatos.Lector["NombreActividad"];
                    aux.actividadExtra.PrecioExtra = (decimal)accesoDatos.Lector["PrecioExtra"];

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

        public void agregar(Membresia membresia)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta(" INSERT INTO Membresia (Nombre, DuracionDias, PrecioBase) VALUES (@Nombre, @DuracionDias, @PrecioBase);");

                accesoDatos.setearParametros("@Nombre", membresia.Nombre);
                accesoDatos.setearParametros("@DuracionDias", membresia.DuracionDias);
                accesoDatos.setearParametros("@PrecioBase", membresia.PrecioBase);
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


        public string Eliminar(int IdMembresia)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("DELETE FROM Membresia WHERE IdMembresia = @IdMembresia;");
                accesoDatos.setearParametros("@IdMembresia", IdMembresia);
                accesoDatos.ejecutarAccion();

                return null; // ✅ sin errores
            }
            catch (Exception ex)
            {
                return ex.Message; // ✅ devolvemos el error real
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }
        }

        public Membresia buscarPorId(int id)
        {
            Membresia membresia = null;
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta(
                    "SELECT M.IdMembresia, M.Nombre, M.PrecioBase " +
                    "FROM Membresia M WHERE M.IdMembresia = @idMembresia"
                );

                accesoDatos.setearParametros("@idMembresia", id);

                accesoDatos.ejecutarConsulta();

                if (accesoDatos.Lector.Read())
                {
                    membresia = new Membresia();
                    membresia.IdMembresia = (int)accesoDatos.Lector["IdMembresia"];
                    membresia.Nombre = (string)accesoDatos.Lector["Nombre"];
                    membresia.PrecioBase = (decimal)accesoDatos.Lector["PrecioBase"];
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

            return membresia;
        }

    }
}
