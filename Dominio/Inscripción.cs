using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Inscripción
    {
        public int IdInscripcion { get; set; }
        public int IdSocio { get; set; }
        public int IdMembresia { get; set; }
        public DateTime FechaInscripcion { get; set; }
        public DateTime FechaVencimiento { get; set; }
        public string Estado { get; set; }

    }
}
