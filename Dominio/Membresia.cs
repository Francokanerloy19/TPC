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
        public string Nombre { get; set; }
        public int DuracionDias { get; set; }
        public decimal PrecioBase { get; set; }

        public ActividadExtra actividadExtra { get; set; }
    }
}
