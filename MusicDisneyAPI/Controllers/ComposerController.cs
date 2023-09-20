using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MusicDisneyAPI.Models;

namespace MusicDisneyAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ComposerController : ControllerBase
    {
        private readonly IEducationRepository _composerRepository;

        public ComposerController(IEducationRepository composerRepository)
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
