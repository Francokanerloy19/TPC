using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class LogActividad
    {
        public int IdLog { get; set; }

        public string Accion { get; set; }

        public string Tabla { get; set; }
        public int IdRegistro { get; set; }

        public string NombreRegistro { get; set; }

        public string Usuario { get; set; }

        public string Descripcion { get; set; }

        public DateTime Fecha { get; set; }
    }
}
