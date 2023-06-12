using FirstBlazor_App.Shared.Class;
using System.Net.Http.Json;

namespace FirstBlazor_App.Client.Services
{
    public class ContactService : IContactService
    {
        private readonly HttpClient _httpClient;

        public ContactService(HttpClient httpClient)
        {
                _httpClient = httpClient;
        }

        public async Task<IEnumerable<Contact>> GetAll()
        {
            return await _httpClient.GetFromJsonAsync<IEnumerable<Contact>>($"api/contact/");

        }

        public async Task<Contact> GetDetails(int id)
        {
            return await _httpClient.GetFromJsonAsync<Contact>($"api/contact/{id}");
        }

        public async Task Delete(int id)
        {
            await _httpClient.DeleteAsync($"api/contact/{id}"); 
        }



        public async Task Save(Contact contact)
        {
            if(contact.Id == 0)
            {//insert
                await _httpClient.PostAsJsonAsync<Contact>($"api/contact/", contact);
            }else
            {//update
                await _httpClient.PutAsJsonAsync<Contact>($"api/contact/{contact.Id}", contact);
            }
        }
    }
}
