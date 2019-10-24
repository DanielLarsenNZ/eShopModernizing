using eShopLegacyWebForms.Models;
using Microsoft.Azure.ServiceBus;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Threading.Tasks;

namespace eShopLegacyWebForms.Services
{
    public class QueueService : IQueueService
    {
        const string ServiceBusConnectionStringKey = "ServiceBusConnectionString";
        const string QueueNameKey = "QueueName";
        static Lazy<IQueueClient> _lazyQueueClient = new Lazy<IQueueClient>(InitialiseQueueClient);
        static IQueueClient _queueClient = _lazyQueueClient.Value;

        public QueueService()
        {
            if (string.IsNullOrEmpty(ConfigurationManager.AppSettings[ServiceBusConnectionStringKey]))
                throw new InvalidOperationException($"App Setting {ServiceBusConnectionStringKey} not found.");
            if (string.IsNullOrEmpty(ConfigurationManager.AppSettings[QueueNameKey]))
                throw new InvalidOperationException($"App Setting {QueueNameKey} not found.");
        }

        public async Task BuyCatalogItem(CatalogItem item, IDictionary<string, string> properties)
        {
            var message = new Message(Encoding.UTF8.GetBytes(JsonConvert.SerializeObject(item)));
            
            foreach(var prop in properties)
            {
                message.UserProperties.Add(prop.Key, prop.Value);
            }

            await _queueClient.SendAsync(message);
        }

        public static QueueClient InitialiseQueueClient()
        {
            return new QueueClient(ConfigurationManager.AppSettings[ServiceBusConnectionStringKey], ConfigurationManager.AppSettings[QueueNameKey]);
        }
    }
}