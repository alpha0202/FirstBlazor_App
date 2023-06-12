using FirstBlazor_App.Shared.Class;

namespace FirstBlazor_App.Client.Services
{
    public interface IContactService
    {
        Task<IEnumerable<Contact>> GetAll();
        Task<Contact> GetDetails(int id);
        Task Save(Contact contact);
        Task Delete(int id);



    }
}
