﻿<%@ Page Title="Details" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" 
    Inherits="eShopLegacyWebForms.Product" %>
<%@ OutputCache VaryByParam="id" Duration="30" Location="Downstream" %>

<asp:Content ID="Details" ContentPlaceHolderID="MainContent" runat="server">
    <h2 class="esh-body-title">Details</h2>

    <div class="container">
        <div class="row">
            <asp:Image runat="server" CssClass="col-md-6 esh-picture" ImageUrl='<%#"/Pics/" + product.PictureFileName%>' />
            <dl class="col-md-6 dl-horizontal">
                <dt>Name
                </dt>

                <dd>
                    <asp:Label runat="server" Text='<%#product.Name%>' />
                </dd>

                <dt>Description
                </dt>

                <dd>
                    <asp:Label runat="server" Text='<%#product.Description%>' />
                </dd>

                <dt>Brand
                </dt>

                <dd>
                    <asp:Label runat="server" Text='<%#product.CatalogBrand.Brand%>' />
                </dd>

                <dt>Type
                </dt>

                <dd>
                    <asp:Label runat="server" Text='<%#product.CatalogType.Type%>' />
                </dd>
                <dt>Price
                </dt>

                <dd>
                    <asp:Label CssClass="esh-price" runat="server" Text='<%#product.Price%>' />
                </dd>

                <dt>Picture name
                </dt>

                <dd>
                    <asp:Label runat="server" Text='<%#product.PictureFileName%>' />
                </dd>

            </dl>
        </div>

        <div class="form-actions no-color esh-link-list">
            <asp:Button runat="server" Text="Buy Now" ID="btnBuy" OnClick="btnBuy_Click"/>
            <a runat="server" href="~" class="esh-link-item">Back to list
            </a>
            <div id="divOrdered" runat="server" visible="false" style="background-color:lightgreen;color:white"><%#product.Name%> has been Ordered. 
                <div id="divOrderNumber" runat="server" style="font-family:monospace;font-size:0.8em"></div></div>
        </div>


    </div>
</asp:Content>