using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class InscripcionActividad
    {
        public int IdInscripcionActividad { get; set; }
        public int IdInscripcion { get; set; }
        public int IdActividad { get; set; }
        public decimal PrecioFinal { get; set; }
    }
}
