using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetCoreAPIMySQL.Model
{
    public class Favorites
    {
        public int IdFavorites { get; set; }
        public string Song { get; set; }
        public DateTime LastUPDATE { get; set; }

    }
}
