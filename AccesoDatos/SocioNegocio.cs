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
    public class SocioNegocio
    {
        public List<Socio> Listar()
        {
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

        public Socio filtrarPorID(int id)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("select  DNI, Nombre, Apellido, Correo, Barrio, Direccion, Telefono, Estado  from Socio where IdSocio = @id");
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
                    socio.Estado = (bool)accesoDatos.Lector["Estado"];

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

        public void baja(int id, bool estado)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("UPDATE Socio SET Estado = @Estado WHERE IdSocio = @id;");

                accesoDatos.setearParametros("@Estado", estado);
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

        public void DarDeBajaSociosVencidos()
        {
            AccesoDatos accesoDatos = new AccesoDatos();
            SocioNegocio socioNegocio = new SocioNegocio();
            

           
            try
            {
                accesoDatos.setearConsulta("SELECT S.IdSocio, I.FechaVencimiento FROM Socio S INNER JOIN Inscripcion I ON S.IdSocio = I.IdSocio WHERE S.Estado = 1;");
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    int idSocio = (int)accesoDatos.Lector["IdSocio"];
                    DateTime fechaVenc = (DateTime)accesoDatos.Lector["FechaVencimiento"];

                    if (fechaVenc < DateTime.Now)
                    {
                        socioNegocio.baja(idSocio, false); //  baja automática
                        
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                accesoDatos.cerrarConexion();
            }

          
        }

        public int contarSocios(bool estado)
        {
            
            AccesoDatos datos = new AccesoDatos();
            int contadorBajas = 0;
            try
            {
                datos.setearConsulta("SELECT COUNT(*) FROM Socio WHERE Estado = @Estado;");
                datos.setearParametros("@Estado", estado);
                contadorBajas = (int)datos.ejecutarEscalar();

            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.cerrarConexion();
            }
            return contadorBajas;
        }

        public List<Socio> ListarPorVencer(int diasAntesVencer)
        {
            List<Socio> Lista = new List<Socio>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT S.IdSocio ,S.Nombre, S.Apellido,S.Correo , I.FechaInscripcion, I.FechaVencimiento, I.Estado FROM Socio S INNER JOIN Inscripcion I ON S.IdSocio = I.IdSocio WHERE S.Estado = 1;");
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Socio aux = new Socio();
                    aux.IdSocio = (int)accesoDatos.Lector["IdSocio"];
                    aux.Nombre = (string)accesoDatos.Lector["Nombre"];
                    aux.Apellido = (string)accesoDatos.Lector["Apellido"];
                    aux.Correo = (string)accesoDatos.Lector["Correo"];
                    aux.Estado = (bool)accesoDatos.Lector["Estado"];
                    aux.inscripcion = new Inscripción();
                    aux.inscripcion.FechaInscripcion = (DateTime)accesoDatos.Lector["FechaInscripcion"];
                    aux.inscripcion.FechaVencimiento = (DateTime)accesoDatos.Lector["FechaVencimiento"];


                    // Calcular días restantes
                    TimeSpan diferencia = aux.inscripcion.FechaVencimiento - DateTime.Now;
                    int diasRestantes = diferencia.Days;

                    if (diasRestantes <= diasAntesVencer && aux.inscripcion.FechaVencimiento.Month == DateTime.Now.Month && aux.inscripcion.FechaVencimiento.Year == DateTime.Now.Year)
                    {
                        Lista.Add(aux);
                    }

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

        public int agregar(Socio socio)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta(" INSERT INTO Socio (DNI, Nombre, Apellido, Correo, Telefono, Direccion, Barrio, Estado) VALUES (@DNI, @Nombre, @Apellido, @Correo, @Telefono, @Direccion, @Barrio, 1) SELECT SCOPE_IDENTITY()");

                accesoDatos.setearParametros("@Direccion", socio.Direccion);
                accesoDatos.setearParametros("@Barrio", socio.Barrio);
                accesoDatos.setearParametros("@DNI", socio.DNI);
                accesoDatos.setearParametros("@Nombre", socio.Nombre);
                accesoDatos.setearParametros("@Apellido", socio.Apellido);
                accesoDatos.setearParametros("@Correo", socio.Correo);
                accesoDatos.setearParametros("@Telefono", socio.Telefono);

                int nuevoid = Convert.ToInt32(accesoDatos.ejecutarEscalar()); // devulve el id del nuevo socio
                return nuevoid;
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

