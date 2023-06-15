using FirstBlazor_App.Data;
using FirstBlazor_App.Shared.Class;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace FirstBlazor_App.Server.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ContactController : Controller

    {
        //inyectar dependencia
        private readonly IContactRepository _contactRepository;

        public ContactController(IContactRepository contactRepository)
        {
            _contactRepository = contactRepository;
        }





        // GET: api/Contact
        [HttpGet]
        public async Task<IEnumerable<Contact>> Get()
        {
            return await _contactRepository.GetAll();
        }


        // GET api/Contact/5
        [HttpGet("{id}")]
        public async Task<Contact> Get(int id)
        {
            return await _contactRepository.GetDetails(id);
        }



        // POST api/Contact
        [HttpPost]
        public async Task<IActionResult> Post([FromBody] Contact contact)
        {
            if (contact == null)
            {

                return BadRequest();
            }

            if (string.IsNullOrEmpty(contact.LastName))
                ModelState.AddModelError("Contact", "Last Name can't be empty");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            await _contactRepository.Insert(contact);

            return NoContent();

        }

        // PUT api/Contact/5
        [HttpPut("{id}")]
        public async Task<IActionResult> Put(int id, [FromBody] Contact contact)
        {
            if (contact == null)
            {

                return BadRequest();
            }

            if (string.IsNullOrEmpty(contact.LastName))
                ModelState.AddModelError("Contact", "Last Name can't be empty");

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (contact.Id == 0)
                contact.Id = id;

            await _contactRepository.Update(contact);

            return NoContent();

        }

        // DELETE api/Contact/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Delete(int id)
        {
            await _contactRepository.Delete(id);
            return NoContent();
        }
    }
}
