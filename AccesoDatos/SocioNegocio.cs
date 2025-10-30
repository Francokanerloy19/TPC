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
                accesoDatos.setearConsulta("SELECT s.IdSocio,s.DNI, s.Nombre, s.Apellido, s.Correo, s.Barrio, s.Direccion, s.Telefono, m.FechaVencimiento FROM Socios s inner join Membresia m ON s.IdSocio = m.IdSocio;");
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

					aux.Membresia = new Membresia();
					aux.Membresia.FechaVencimiento = (DateTime)accesoDatos.Lector["FechaVencimiento"];

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
