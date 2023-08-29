using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetCoreAPIMySQL.Model
{
    public class Film
    {
        public int IdFilm { get; set; }
        public string Category { get; set; }
        public string NameFilm { get; set; }
        public int Premiere { get; set; }
        public int Rating { get; set; }
        public string Director { get; set; }
        public string ImgURL { get; set; }
    }
}
