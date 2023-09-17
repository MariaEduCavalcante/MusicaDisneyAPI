DROP DATABASE if EXISTS dbMusicaDisney;

CREATE DATABASE dbMusicaDisney;
USE dbMusicaDisney;

/*STYLE*/
create table tbStyle(
IdStyle int primary key auto_increment,
Category varchar(25)
);
insert into tbStyle(Category)
	values('Animação'),
    ('Live Action');

/*FILM*/
create table tbFilm(
IdFilm int primary key auto_increment,
IdStyle int not null,
NameFilm varchar(100) not null,
Premiere int not null,
Rating int,
Director varchar(45) not null,
ImgURL varchar(2000) not null,
CoverURL varchar(2000) not null,
foreign key (IdStyle) references tbStyle(IdStyle)
);
insert into tbFilm(IdStyle, NameFilm, Premiere, Director, ImgURL, CoverURL)
    values(1, 'Tangled', 2010,'Nathan Greno','https://static.wikia.nocookie.net/disneyprincess/images/c/ca/Tangled_rapunzel_poster_20.jpg/revision/latest?cb=20130812152216', 'https://pbs.twimg.com/amplify_video_thumb/1642561545207947265/img/f7Dn-npeVm-QbPyJ?format=jpg&name=4096x4096'),
    (1, 'Frozen', 2014,'Chris Buck','https://static.wikia.nocookie.net/disneyprincess/images/2/27/Frozen_-_Poster.jpg/revision/latest/scale-to-width-down/1200?cb=20190222020351', 'https://m.media-amazon.com/images/I/817X6eMxkoL._UF1000,1000_QL80_.jpg'),
    (1, 'Moana', 2017,'John Musker', 'https://media.fstatic.com/gv5V2WCIXophntlUe4WSUazxUaA=/322x478/smart/filters:format(webp)/media/movies/covers/2016/09/moana_ver8.jpg', 'https://m.media-amazon.com/images/I/817ndX1Ez6L._UF1000,1000_QL80_.jpg'),
    (1, 'The Princess and the Frog', 2009,'Ron Clements','https://static.wikia.nocookie.net/disney/images/f/fa/Frog_official_poster_500.jpg/revision/latest?cb=20120915095456', 'https://m.media-amazon.com/images/I/71qgoH6CQ4S._UF1000,1000_QL80_.jpg'),
    (1, 'Mulan', 1998,'Tony Bancroft','https://images.moviesanywhere.com/e6a273ee71b892ebc91d442d8fc862c8/e6511d90-b7d1-4802-810a-9eb1b7c12db4.jpg', 'https://m.media-amazon.com/images/I/51NVn3iHSRL._UF1000,1000_QL80_.jpg');

insert into tbFilm(IdStyle, NameFilm, Premiere, Director, ImgURL, CoverURL)
    values(2, 'Aladdin', 2019,'Guy Ritchie','https://www.amespubliclibrary.org/sites/default/files/2019-11/aladdin2019.jpg', 'https://m.media-amazon.com/images/I/71oKV2TrpZL._UF1000,1000_QL80_.jpg'),
    (2, 'Beauty and the Beast', 2017,'Bill Condon','https://m.media-amazon.com/images/M/MV5BMTUwNjUxMTM4NV5BMl5BanBnXkFtZTgwODExMDQzMTI@._V1_.jpg', 'https://m.media-amazon.com/images/I/61tkrxoyl4L._AC_UF1000,1000_QL80_.jpg'),
    (2, 'The Little Mermaid', 2023,'Rob Marshall', 'https://upload.wikimedia.org/wikipedia/en/f/f4/The_Little_Mermaid_%282023_film%29.png', 'https://i.scdn.co/image/ab67616d0000b27391eee92ba7620a88de647ade'),
    (2, 'High School Musical', 2006,'Kenny Ortega', 'https://m.media-amazon.com/images/M/MV5BZmQ3MWEyNTYtOTY1OC00MTljLWI3OGUtMmU1ZDc2OTYxNDQ4L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTczNjQwOTY@._V1_.jpg', 'https://static.wikia.nocookie.net/disney/images/0/05/High_school_musical_soundtrack.jpg/revision/latest?cb=20200423130812'),
    (2, 'Camp Rock', 2008,'Matthew Diamond', 'https://static.wikia.nocookie.net/disneyfanon/images/d/d9/Camp_Rock_Poster.jpg/revision/latest?cb=20210722220836', 'https://upload.wikimedia.org/wikipedia/en/2/28/Camp_Rock_Soundtrack.JPG');

/*COMPOSER*/
create table tbComposer(
IdComposer int primary key auto_increment,
NameComposer varchar(50) not null,
LastName varchar(50) not null,
Birth int ,
ImgComposerURL varchar(2000) not null
);
insert into tbComposer(NameComposer, LastName, Birth, ImgComposerURL)
    values('Alan', 'Menken', 1949, 'https://i.scdn.co/image/1c60f15a747fb966ac6f501e7633178263202bf0'),
    ('Kristen', 'Anderson-Lopez', 1972, 'https://static.wikia.nocookie.net/disneyfanon/images/3/31/Kristen_Anderson-Lopez.jpg/revision/latest/thumbnail/width/360/height/450?cb=20210209190521'),
    ('Lin-Manuel', 'Miranda', 1980, 'https://images.mubicdn.net/images/cast_member/441404/cache-166754-1488627742/image-w856.jpg'),
    ('Randy', 'Newman', 1943, 'https://cdn.britannica.com/10/174410-050-5A5C5405/Randy-Newman-song-Academy-Award-Monsters-Inc.jpg'),
    ('Coco', 'Lee', 1975, 'https://cinepop.com.br/wp-content/uploads/2023/07/coco-lee.jpg'),
    ('David', 'Lawrence', 1980, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfziz_VW2Nch3WPqmxNjXyg74XyRO__f_gD65R0iVT&s'),
    ('Danny', 'Lux', 1969, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfziz_VW2Nch3WPqmxNjXyg74XyRO__f_gD65R0iVT&s');

/*SONG*/
create table tbSong(
NameSong varchar(50) primary key,
Film int,
Composer int,
Duration varchar(10) not null,
TrackNumber int,
SongURL varchar(2000),
foreign key (Film) references tbFilm(IdFilm),
foreign key (Composer) references tbComposer(IdComposer)
);
/* ANIMAÇÃO */
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('When Will My Life Begin?', 1, 1, '2:32', 1, 'https://youtu.be/kRXmAIHYQR4?si=q7zyRlkY1HG6SNcW'),
    ('Ive Got a Dream', 1, 1, '3:11', 5, 'https://youtu.be/zi5Z6rNU9Hw?si=AfBakNd4AUjjIn_-'),
    ('I See the Light', 1, 1, '3:44', 7, 'https://youtu.be/ILRs2r6lcHY?si=xkonxiDARD7QG8vt');

insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Do You Want to Build a Snowman?', 2, 2, '3:27', 2, 'https://youtu.be/TeQ_TTyLGMs?si=4NFTNxkgtRZ4ailQ'),
    ('For the First Time in Forever', 2, 2, '3:45', 3, 'https://youtu.be/ZrX1XKtShSI?si=yt0SpMf88dnt-QKg'),
    ('Let It Go', 2, 2, '3:44', 5, 'https://youtu.be/moSFlvxnbgk?si=uR64Alr0CMxCQbwD');

insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Where You Are?', 3, 3, '3:30', 3, 'https://youtu.be/RTWhvp_OD6s?si=lpQ-3Bb08D7NisIN'),
    ('How Far Ill Go', 3, 3, '2:43', 4, 'https://youtu.be/cPAbx5kgCJo?si=qFR4RC3-Trs3hDU5'),
    ('Youre Welcome', 3, 3, '2:43', 7, 'https://youtu.be/79DijItQXMM?si=EIu-Fed7LcopgPmm');

insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Almost There', 4, 4, '2:24', 4, 'https://youtu.be/ThMwHKfzz1I?si=kaUAGQrc9AEJqHVH'),
    ('Friends on the Other Side', 4, 4, '2:24', 5, 'https://youtu.be/1BgfG4qEdxg?si=Mr-6C4_0bf8A_g8u'),
    ('Ma Belle Evangeline', 4, 4, '1:56', 8, 'https://youtu.be/-p0GD80gNjw?si=HmWEfUdNITxD0Y8A');

insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Honor to Us All', 5, 5, '3:03', 1, 'https://youtu.be/-1S9pYmpkG8?si=6buQNBmGl0yQRGpk'),
    ('Reflection', 5, 5, '2:27', 2, 'https://youtu.be/lGGXsm0a5s0?si=Q-4DwBuspj-t4JMa'),
    ('Ill Make a Man Out of You', 5, 5, '3:22', 3, 'https://youtu.be/TVcLIfSC4OE?si=G5z8LHKHbkII5_y2');
    
/* LIVE ACTION */
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('One Jump Ahead', 6, 1, '2:55', 2, 'https://youtu.be/Q0ukS1ceZa0?si=EA63gFrolloHM4Wp'),
    ('Friend Like Me', 6, 1, '2:35', 5, 'https://youtu.be/1at7kKzBYxI?si=xJ2KDsyCLHgVQKvH'),
    ('A Whole New World', 6, 1, '2:55', 7, 'https://youtu.be/eitDnP0_83k?si=27TGp_a-Sw5fWdh0');
    
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Belle', 7, 1, '5:33', 5, 'https://youtu.be/egQbaDRMxGI?si=i1LDmUL5E3ArY5hN'),
    ('Be Our Guest', 7, 1, '4:48', 9, 'https://youtu.be/9qQ__xrUF3Y?si=EBtB32Ed1in26hud'),
    ('Beauty and the Beast', 7, 1, '3:19', 13, 'https://youtu.be/aYdNOndwNcs?si=BwM2CQ689oqlzB0X&t=63');
    
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Part of Your World', 8, 1, '3:34', 2, 'https://youtu.be/kf7Dss2gCe0?si=XZpLKMGw2XjFjyEv'),
    ('Under the Sea', 8, 3, '3:04', 5, 'https://youtu.be/Wbv_huklr5E?si=pASM25i33RZoBHr7'),
    ('Poor Unfortunate Souls', 8, 3, '4:42', 7, 'https://youtu.be/YxrTRc0P_xs?si=8yNIDbKNSmnWNyWr');
    
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('Start of Something New', 9, 6, '3:17', 1, 'https://youtu.be/zBG-sEGlULs?si=v_WLfNRQAB08IxZl'),
    ('Breaking Free', 9, 6, '3:27', 8, 'https://youtu.be/0qj67KE5VXI?si=qBsNyUDIVB-Leujv'),
    ('Were All in This Together', 9, 6, '3:51', 9, 'https://youtu.be/DykVJl6wr_4?si=fjqtNaYBcWBtjOIX');
    
insert into tbSong(NameSong, Film, Composer, Duration, TrackNumber, SongURL)
    values('We Rock"', 10, 7, '3:14', 1, 'https://youtu.be/MsLTfqzEp20?si=f7TSHhyFZA23IhVf'),
    ('Play My Music', 10, 7, '3:21', 2, 'https://youtu.be/H6jTx5sUoxw?si=iTbY8vRLEzqabvet'),
    ('This Is Me', 10, 7, '3:10', 6, 'https://youtu.be/6HCUoMgviwU?si=d8Jc9Tzz9MMoFIrl');

/*FAVORITES*/
create table tbFavorites(
IdFavorites int primary key,
Song varchar(50),
LastUPDATE date,
foreign key (Song) references tbSong(NameSong)
);
insert into tbFavorites(IdFavorites, LastUPDATE)
    values(1,curdate()),
    (2,curdate()),
    (3,curdate()),
    (4,curdate()),
    (5,curdate());
    
CREATE USER 'disney'@'localhost' IDENTIFIED WITH mysql_native_password BY '123';
GRANT ALL PRIVILEGES ON dbMusicaDisney.* TO 'disney'@'localhost' WITH GRANT OPTION;
