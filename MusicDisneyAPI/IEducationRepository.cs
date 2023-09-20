
using MusicDisneyAPI.Models;


public interface IEducationRepository
{
    //Composer
    Task<IEnumerable<Composer>> GetAllComposers();
    Task<Composer> GetComposerDetails(string name);
    Task<bool> InsertCompser(Composer composer);

    //Film
    Task<IEnumerable<Film>> GetAllFilms();
    Task<IEnumerable<Film>> GetFilmCategory(int id);
    Task<bool> UpdateFilm(Film film);

    //Song
    Task<IEnumerable<Song>> GetAllSongs();
    Task<IEnumerable<Song>> GetFilmSong(string name);

    //Favorites
    Task<IEnumerable<Favorites>> GetAllFavorites();
    Task<bool> UpdateFavorites(Favorites favorites);
}