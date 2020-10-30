<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
    Inherits="eShopLegacyWebForms._Default" %>
<%@ OutputCache VaryByParam="index;size" Duration="30" Location="Downstream" %> 

<asp:Content ID="CatalogList" ContentPlaceHolderID="MainContent" runat="server">

    <div class="esh-table">

        <asp:ListView ID="productList" ItemPlaceholderID="itemPlaceHolder" runat="server" ItemType="eShopLegacyWebForms.Models.CatalogItem">
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <LayoutTemplate>
                <table class="table">
                    <thead>
                        <tr class="esh-table-header">
                            <th></th>
                            <th>Name
                            </th>
                            <th>Description
                            </th>
                            <th>Brand
                            </th>
                            <th>Type
                            </th>
                            <th>Price
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder"></asp:PlaceHolder>
                    </tbody>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td>
                        <asp:HyperLink NavigateUrl='<%# GetRouteUrl("ShopProductDetailsRoute", new {id =Item.Id}) %>' runat="server" CssClass="esh-table-link">
                            <image class="esh-thumbnail" src='/pics/<%#:Item.PictureFileName%>' />
                        </asp:HyperLink>
                    </td>
                    <td>
                        <p>
                            <asp:HyperLink NavigateUrl='<%# GetRouteUrl("ShopProductDetailsRoute", new {id =Item.Id}) %>' runat="server" CssClass="esh-table-link">
                            <%#:Item.Name%>
                            </asp:HyperLink>
                        </p>
                    </td>
                    <td>
                        <p>
                            <%#:Item.Description%>
                        </p>
                    </td>
                    <td>
                        <p>
                            <%#:Item.CatalogBrand.Brand%>
                        </p>
                    </td>
                    <td>
                        <p>
                            <%#:Item.CatalogType.Type%>
                        </p>
                    </td>
                    <td>
                        <p>
                            <span class="esh-price"><%#:Item.Price%></span>
                        </p>
                    </td>
                    <td>
                        <asp:HyperLink NavigateUrl='<%# GetRouteUrl("ShopProductDetailsRoute", new {id =Item.Id}) %>' runat="server" CssClass="esh-table-link">
                            Details
                        </asp:HyperLink>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <div class="esh-pager">
        <div class="container">
            <article class="esh-pager-wrapper row">
                <nav>
                    <asp:HyperLink ID="PaginationPrevious" runat="server" CssClass="esh-pager-item esh-pager-item--navigable">
                        Previous
                    </asp:HyperLink>

                    <span class="esh-pager-item">Showing <%: Model.ItemsPerPage%> of <%: Model.TotalItems%> products - Page <%: (Model.ActualPage + 1)%> - <%: Model.TotalPages%>
                    </span>

                    <asp:HyperLink ID="PaginationNext" runat="server" CssClass="esh-pager-item esh-pager-item--navigable">
                        Next
                    </asp:HyperLink>
                </nav>
            </article>
        </div>
    </div>
</asp:Content>
