using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace Dominio
{
    public class Pago
    {
        public int IdPago { get; set; }
        public int IdSocio { get; set; }
        public int IdInscripcion { get; set; }
        public DateTime FechaPago { get; set; }
        public string MetodoPago { get; set; }
        public decimal Monto { get; set; }

        public Socio socio { get; set; }


    }
}
