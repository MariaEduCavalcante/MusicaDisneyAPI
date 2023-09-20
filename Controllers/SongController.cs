using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;


namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SongController : ControllerBase
    {
        private readonly IEducationRepository _composerRepository;

        public SongController(IEducationRepository composerRepository)
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
