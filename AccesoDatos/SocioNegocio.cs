using Dominio;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace AccesoDatos
{
    public class SocioNegocio
    {
        public List<Socio> Listar() {
			List<Socio> Lista = new List<Socio>();
            AccesoDatos accesoDatos = new AccesoDatos();
			try
			{
                accesoDatos.setearConsulta("select IdSocio, DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono, Estado from Socio where Estado = 1");
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

        public Socio filtrarPorID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("select  DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono  from Socio where IdSocio = @id");
                accesoDatos.setearParametros("@id", id);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Socio socio = new Socio();

                    socio.DNI = (string)accesoDatos.Lector["DNI"];
                    socio.Nombre = (string)accesoDatos.Lector["Nombre"];
                    socio.Apellido = (string)accesoDatos.Lector["Apellido"];
                    socio.Correo = (string)accesoDatos.Lector["Correo"];
                    socio.Barrio = (string)accesoDatos.Lector["Barrio"];
                    socio.Direccion = (string)accesoDatos.Lector["Direccion"];
                    socio.Telefono = (string)accesoDatos.Lector["Telefono"];


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

        public void modificar(Socio socio)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("UPDATE Socio SET Direccion = @Direccion , Barrio = @Barrio ,DNI = @DNI, Nombre = @Nombre, Apellido = @Apellido , Correo = @Correo , Telefono = @Telefono WHERE IdSocio = @id;");
                
                accesoDatos.setearParametros("@Direccion", socio.Direccion);
                accesoDatos.setearParametros("@Barrio", socio.Barrio);
                accesoDatos.setearParametros("@DNI", socio.DNI);
                accesoDatos.setearParametros("@Nombre", socio.Nombre);
                accesoDatos.setearParametros("@Apellido", socio.Apellido);
                accesoDatos.setearParametros("@Correo", socio.Correo);
                accesoDatos.setearParametros("@Telefono", socio.Telefono);
                accesoDatos.setearParametros("@id", socio.IdSocio);
                accesoDatos.ejecutarConsulta();

               

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

        public void baja(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("UPDATE Socio SET Estado = 0 WHERE IdSocio = @id;");

                accesoDatos.setearParametros("@id", id);
                accesoDatos.ejecutarConsulta();



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

