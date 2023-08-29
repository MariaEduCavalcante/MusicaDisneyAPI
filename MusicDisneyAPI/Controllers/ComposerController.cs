using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using NetCoreAPIMySQL.Data.Repositories;
using NetCoreAPIMySQL.Model;

namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComposerController : ControllerBase
    {
        private readonly IComposerRepository _composerRepository;

        public ComposerController(IComposerRepository composerRepository)
        {
            _composerRepository = composerRepository;
        }

        [HttpGet]
        public async Task<IActionResult> GetAllComposers()
        {
            return Ok(await _composerRepository.GetAllComposers());
        }

        [HttpGet("{name}")]
        public async Task<IActionResult> GetAllComposers(string name)
        {
            return Ok(await _composerRepository.GetComposerDetails(name));
        }

        [HttpPost]
        public async Task<IActionResult> InsertComposer([FromBody] Composer composer)
        {
            if (composer == null)
                return BadRequest();

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            await _composerRepository.InsertCompser(composer);

            return NoContent();
        }


    }
}
