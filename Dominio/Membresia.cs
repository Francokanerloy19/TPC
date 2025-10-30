using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Membresia
    {
        public int IdMembresia { get; set; }
        public int IdSocio { get; set; }
        public int IdTipoMembresia { get; set; }
        public DateTime FechaPago { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public string Estado { get; set; }

    }
}
