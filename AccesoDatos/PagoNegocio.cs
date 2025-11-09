using Dominio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AccesoDatos
{
    public class PagoNegocio
    {
        public List<Pago> Listar(int id)
        {
            List<Pago> Lista = new List<Pago>();
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta("SELECT s.Nombre , s.Apellido, p.FechaPago, p.Monto, p.MetodoPago FROM Pago p INNER JOIN Socio s ON p.IdSocio = s.IdSocio INNER JOIN Inscripcion i ON p.IdInscripcion = i.IdInscripcion INNER JOIN Membresia m ON i.IdMembresia = m.IdMembresia WHERE S.IdSocio = @id;");
                accesoDatos.setearParametros("@id", id);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    Pago aux = new Pago();
                    aux.FechaPago = (DateTime)accesoDatos.Lector["FechaPago"];
                    aux.Monto = (decimal)accesoDatos.Lector["Monto"];
                    aux.MetodoPago = (string)accesoDatos.Lector["MetodoPago"];

                    aux.socio = new Socio();
                    aux.socio.Nombre = (string)accesoDatos.Lector["Nombre"];
                    aux.socio.Apellido = (string)accesoDatos.Lector["Apellido"];


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
