﻿<%@ Page Title="About" Language="C#" MasterPageFile="~/Shop.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="eShopLegacyWebForms.About" %>
<%@ OutputCache VaryByParam="*" Duration="60" Location="Downstream" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Your application description page.</h3>
    <p>Use this area to provide additional information.</p>
</asp:Content>
