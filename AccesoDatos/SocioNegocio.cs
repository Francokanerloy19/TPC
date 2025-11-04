using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;


namespace AccesoDatos
{
    public class SocioNegocio
    {
        public List<Socio> Listar() {
			List<Socio> Lista = new List<Socio>();
            AccesoDatos accesoDatos = new AccesoDatos();
			try
			{
                accesoDatos.setearConsulta("select IdSocio, DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono, Estado from Socio");
                accesoDatos.ejecutarConsulta();

				while (accesoDatos.Lector.Read())
				{
					Socio aux = new Socio();
					aux.IdSocio = (int)accesoDatos.Lector["IdSocio"];
					aux.DNI = (string)accesoDatos.Lector["DNI"];
					aux.Nombre = (string)accesoDatos.Lector["Nombre"];
                    aux.Apellido = (string)accesoDatos.Lector["Apellido"];
                    aux.Correo = (string)accesoDatos.Lector["Correo"];
                    aux.Barrio = (string)accesoDatos.Lector["Barrio"];
                    aux.Direccion = (string)accesoDatos.Lector["Direccion"];
                    aux.Telefono = (string)accesoDatos.Lector["Telefono"];
                    aux.Estado = (bool)accesoDatos.Lector["Estado"];


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
