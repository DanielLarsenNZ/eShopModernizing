using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace eShopLegacyWebForms
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute(
                "",
                "Default",
                "~/Default.aspx"
                );
            routes.MapPageRoute(
                "ProductsByPageRoute",
                "Default/index/{index}/size/{size}",
                "~/Default.aspx"
                );
            routes.MapPageRoute(
                "CreateProductRoute",
                "Catalog/Create",
                "~/Catalog/Create.aspx"
                );
            routes.MapPageRoute(
                "EditProductRoute",
                "Catalog/Edit/{id}",
                "~/Catalog/Edit.aspx"
                );
            routes.MapPageRoute(
                "ProductDetailsRoute",
                "Catalog/Details/{id}",
                "~/Catalog/Details.aspx"
                );
            routes.MapPageRoute(
                "DeleteProductRoute",
                "Catalog/Delete/{id}",
                "~/Catalog/Delete.aspx"
                );
            routes.MapPageRoute(
                "AdminDefaultRoute",
                "Admin",
                "~/Admin.aspx"
                );
            routes.MapPageRoute(
                "ShopProductDetailsRoute",
                "Product/{id}",
                "~/Product.aspx"
                );
            routes.MapPageRoute(
                "ShopAboutRoute",
                "About",
                "~/About.aspx"
                );
            routes.MapPageRoute(
                "ShopContactRoute",
                "Contact",
                "~/Contact.aspx"
                );
            routes.MapPageRoute(
                "AdminByPageRoute",
                "Admin/index/{index}/size/{size}",
                "~/Admin.aspx"
                );
        }
    }
}
