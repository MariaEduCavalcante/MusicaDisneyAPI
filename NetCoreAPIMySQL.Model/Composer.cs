using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetCoreAPIMySQL.Model
{
    public class Composer
    {
        public int IdComposer { get; set; }
        public string NameComposer { get; set;}
        public string LastName { get; set; }
        public int Birth { get; set; }
        public string ImgComposerURL { get; set; }
    }
}
