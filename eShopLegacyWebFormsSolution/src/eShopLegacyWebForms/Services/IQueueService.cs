using System.Collections.Generic;
using System.Threading.Tasks;
using eShopLegacyWebForms.Models;

namespace eShopLegacyWebForms.Services
{
    public interface IQueueService
    {
        Task BuyCatalogItem(CatalogItem item, IDictionary<string, string> properties);
    }
}