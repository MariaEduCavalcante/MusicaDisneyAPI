using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPIMySQL.Data.Repositories;
using NetCoreAPIMySQL.Model;

namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class FavoritesController : ControllerBase
    {
        private readonly IComposerRepository _composerRepository;

        public FavoritesController(IComposerRepository composerRepository)
        {
            _composerRepository = composerRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllFavorites()
        {
            return Ok(await _composerRepository.GetAllFavorites());
        }

        [HttpPut]
        public async Task<IActionResult> UpdateFavorites([FromBody] Favorites favorites)
        {
            if (favorites == null)
                return BadRequest();

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            await _composerRepository.UpdateFavorites(favorites);

            return NoContent();
        }
    }
}
