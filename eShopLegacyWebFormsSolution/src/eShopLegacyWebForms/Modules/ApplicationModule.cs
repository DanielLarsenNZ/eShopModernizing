using Autofac;
using eShopLegacyWebForms.Models;
using eShopLegacyWebForms.Models.Infrastructure;
using eShopLegacyWebForms.Services;
using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace eShopLegacyWebForms.Modules
{
    public class ApplicationModule : Module
    {
        private bool useMockData;

        public ApplicationModule(bool useMockData)
        {
            this.useMockData = useMockData;
        }
        protected override void Load(ContainerBuilder builder)
        {
            if (this.useMockData)
            {
                builder.RegisterType<CatalogServiceMock>()
                    .As<ICatalogService>()
                    .SingleInstance();

                builder.RegisterType<QueueServiceMock>()
                    .As<IQueueService>()
                    .SingleInstance();
            }
            else
            {
                builder.RegisterType<CatalogService>()
                    .As<ICatalogService>()
                    .InstancePerLifetimeScope();

                builder.RegisterType<QueueService>()
                    .As<IQueueService>()
                    .SingleInstance();
            }

            builder.RegisterType<CatalogDBContext>()
                .InstancePerLifetimeScope();

            builder.RegisterType<CatalogDBInitializer>()
                .InstancePerLifetimeScope();

            builder.RegisterType<CatalogItemHiLoGenerator>()
                .SingleInstance();

            builder.RegisterType<TelemetryClient>()
                .SingleInstance();
        }
    }
}