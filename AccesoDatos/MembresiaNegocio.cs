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
    }
}
