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
    public class UsuarioNegocio
    {
        public bool Loguar(Usuario usuario)
        {
           
            AccesoDatos accesoDatos = new AccesoDatos();
            try
            {
                accesoDatos.setearConsulta(" select Id, TipoUser FROM Usuario WHERE usuario = @usuario AND Pass = @Pass;");
                accesoDatos.setearParametros("@usuario", usuario.User);
                accesoDatos.setearParametros("@Pass", usuario.Pass);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    usuario.Id = (int)accesoDatos.Lector["Id"];
                    usuario.TipoUsuario = (int)(accesoDatos.Lector["TipoUser"]) == 2 ? TipoUsuario.ADMIN : TipoUsuario.NORMAL;
                    return true;
                }
                return false;
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

        public int AgregarUsuario(string user, string pass, int rol)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("INSERT INTO Usuario (Usuario, Pass, TipoUser) " +"VALUES (@Usuario, @Pass, @TipoUser); " + "SELECT SCOPE_IDENTITY();");

                accesoDatos.setearParametros("@Usuario", user);
                accesoDatos.setearParametros("@Pass", pass);
                accesoDatos.setearParametros("@TipoUser", rol);

                object resultado = accesoDatos.ejecutarEscalar();
                int idGenerado = Convert.ToInt32(resultado);

                return idGenerado;
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
        public bool ExisteUsuario(string user)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.setearConsulta("SELECT * FROM Usuario WHERE Usuario = @user");
                accesoDatos.setearParametros("@user", user);
                accesoDatos.ejecutarConsulta();

                while (accesoDatos.Lector.Read())
                {
                    
                    return true;
                }
                return false;
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
