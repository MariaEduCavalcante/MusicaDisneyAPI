﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NetCoreAPIMySQL.Model
{
    public class Song
    {
        public int IdSong { get; set; }
        public string NameSong { get; set; }
        public string NameFilm { get; set; }
        public string NameComposer { get; set; }
        public string Duration { get; set; }
        public int TrackNumber { get; set; }
        public string CoverURL { get; set; }
        public string ImgURL { get; set; }
        public int Premiere { get; set; }

    }
}
