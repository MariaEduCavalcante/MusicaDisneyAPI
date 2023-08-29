using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPIMySQL.Data.Repositories;
using NetCoreAPIMySQL.Model;

namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SongController : ControllerBase
    {
        private readonly IComposerRepository _composerRepository;

        public SongController(IComposerRepository composerRepository)
        {
            _composerRepository = composerRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllSongs()
        {
            return Ok(await _composerRepository.GetAllSongs());
        }

        [HttpGet("{name}")]
        public async Task<IActionResult> GetAllSongs(string name)
        {
            return Ok(await _composerRepository.GetFilmSong(name));
        }

    }
}
