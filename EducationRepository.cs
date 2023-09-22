using Dapper;
using MusicDisneyAPI;
using MusicDisneyAPI.Models;
using MySql.Data.MySqlClient;



public class EducationRepository : IEducationRepository
{
    // conexão com o banco 
    private MySQLConfiguration _connectionString;
    public EducationRepository(MySQLConfiguration connectionString)
    {
        _connectionString = connectionString;
    }

    protected MySqlConnection dbConnection()
    {
        return new MySqlConnection(_connectionString.ConnectionString);
    }

    // Composer
    public async Task<IEnumerable<Composer>> GetAllComposers()
    {
        var db = dbConnection();

        var sql = @"
                        SELECT * FROM tbComposer ";
        return await db.QueryAsync<Composer>(sql, new { });
    }

    public async Task<Composer> GetComposerDetails(string name)
    {
        var db = dbConnection();

        var sql = @"
                        SELECT * from tbComposer WHERE NameComposer = @Name ";
        return await db.QueryFirstOrDefaultAsync<Composer>(sql, new { Name = name });
    }

    public async Task<bool> InsertCompser(Composer composer)
    {
        var db = dbConnection();

        var sql = @"
                        INSERT INTO tbComposer (NameComposer, LastName, Birth, ImgComposerURL)
                        values(@NameComposer,@LastName, @Birth, @ImgComposerURL)
                            ";
        var result = await db.ExecuteAsync(sql, new { composer.NameComposer, composer.LastName, composer.Birth, composer.ImgComposerURL });

        return result > 0;
    }

    // Film
    public async Task<IEnumerable<Film>> GetAllFilms()
    {
        var db = dbConnection();

        var sql = @"
                        SELECT IdFilm, Category, NameFilm, Premiere, Rating, Director, ImgURL 
                        FROM tbFilm,tbStyle
                        WHERE tbStyle.IdStyle = tbFilm.IdStyle;";
        return await db.QueryAsync<Film>(sql, new { });
    }

    public async Task<IEnumerable<Film>> GetFilmCategory(int id)
    {
        var db = dbConnection();

        var sql = @"
                        SELECT IdFilm, Category, NameFilm, Premiere, Rating, Director, ImgURL 
                        FROM tbFilm,tbStyle
                        WHERE tbStyle.IdStyle = tbFilm.IdStyle
                        AND tbStyle.IdStyle = @Id ";
        return await db.QueryAsync<Film>(sql, new { Id = id });
    }


    public async Task<bool> UpdateFilm(Film film)
    {
        var db = dbConnection();

        var sql = @"
                        UPDATE tbFilm
                        SET Rating = @Rating WHERE NameFilm = @NameFilm
                            ";
        var result = await db.ExecuteAsync(sql, new { film.Rating, film.NameFilm });

        return result > 0;

    }

    // Song
    public async Task<IEnumerable<Song>> GetAllSongs()
    {
        var db = dbConnection();

        var sql = @"
                        SELECT NameSong, NameFilm, NameComposer, Duration, TrackNumber, CoverURL, ImgURL, Premiere, SongURL, Director
                        FROM tbFilm,tbComposer, tbSong
                        WHERE tbFilm.IdFilm = tbSong.Film AND tbComposer.IdComposer = tbSong.Composer;";
        return await db.QueryAsync<Song>(sql, new { });
    }

    public async Task<IEnumerable<Song>> GetFilmSong(string name)
    {
        var db = dbConnection();

        var sql = @"
                        SELECT NameSong, NameFilm, NameComposer, Duration, TrackNumber, CoverURL, ImgURL, Premiere, SongURL, Category, Director
                        FROM tbFilm,tbComposer, tbSong, tbStyle
                        WHERE tbFilm.IdFilm = tbSong.Film AND tbComposer.IdComposer = tbSong.Composer AND tbStyle.IdStyle = tbFilm.IdStyle
                        AND tbFilm.NameFilm = @Name ";
        return await db.QueryAsync<Song>(sql, new { Name = name });
    }

    // Favorites
    public async Task<IEnumerable<Favorites>> GetAllFavorites()
    {
        var db = dbConnection();

        var sql = @"
                        SELECT IdFavorites, Song, LastUPDATE, SongURL, Duration
                        FROM tbFavorites,tbSong
                        WHERE tbFavorites.Song = tbSong.NameSong";
        return await db.QueryAsync<Favorites>(sql, new { });
    }

    public async Task<bool> UpdateFavorites(Favorites favorites)
    {
        var db = dbConnection();

        var sql = @"
                        UPDATE tbFavorites
                        SET Song = @Song, LastUPDATE = curdate()
                        WHERE IdFavorites = @IdFavorites
                            ";
        var result = await db.ExecuteAsync(sql, new { favorites.Song, favorites.IdFavorites });

        return result > 0;


    }


}