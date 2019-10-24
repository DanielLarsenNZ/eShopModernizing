using eShopLegacyWebForms.Models;
using eShopLegacyWebForms.Services;
using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace eShopLegacyWebForms
{
    public partial class Product : System.Web.UI.Page
    {
        protected CatalogItem product;
        protected string orderNumber;

        public ICatalogService CatalogService { get; set; }
        public IQueueService QueueService { get; set; }
        public TelemetryClient Telemetry { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            var productId = Convert.ToInt32(Page.RouteData.Values["id"]);
            product = CatalogService.FindCatalogItem(productId);

            this.DataBind();
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            var productId = Convert.ToInt32(Page.RouteData.Values["id"]);
            var product = CatalogService.FindCatalogItem(productId);
            orderNumber = Guid.NewGuid().ToString("N");
            var properties = new Dictionary<string, string>();
            properties.Add("product_id", productId.ToString());
            properties.Add("order_number", orderNumber);
            QueueService.BuyCatalogItem(product, properties);
            divOrdered.Visible = true;
            divOrderNumber.InnerText = $"Order no: {orderNumber}";
            Telemetry.TrackEvent("eshop/product/buy", properties: properties);            
        }
    }
}