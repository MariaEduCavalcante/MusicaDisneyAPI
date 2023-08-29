using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPIMySQL.Data.Repositories;
using NetCoreAPIMySQL.Model;

namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FilmController : ControllerBase
    {
        private readonly IComposerRepository _composerRepository;

        public FilmController(IComposerRepository composerRepository)
        {
            _composerRepository = composerRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllFilms()
        {
            return Ok(await _composerRepository.GetAllFilms());
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetAllFilms(int id)
        {
            return Ok(await _composerRepository.GetFilmCategory(id));
        }

        [HttpPut]
        public async Task<IActionResult> UpdateFilm([FromBody] Film film)
        {
            if (film == null)
                return BadRequest();

            if(!ModelState.IsValid)
                return BadRequest(ModelState);

            await _composerRepository.UpdateFilm(film);

            return NoContent();
        }
    }
}
