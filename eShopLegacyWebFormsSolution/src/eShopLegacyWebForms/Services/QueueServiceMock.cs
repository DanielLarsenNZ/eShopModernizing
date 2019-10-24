using eShopLegacyWebForms.Models;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace eShopLegacyWebForms.Services
{
    public class QueueServiceMock : IQueueService
    {
        public Task BuyCatalogItem(CatalogItem item, IDictionary<string, string> properties)
        {
            return Task.CompletedTask;
        }
    }
}