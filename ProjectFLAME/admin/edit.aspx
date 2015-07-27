<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="edit.aspx.cs" Inherits="ProjectFLAME.admin.edit" %>
<%@ Register Src="~/Controls/EditContent.ascx" TagName="EditContent" TagPrefix="cms" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <cms:EditContent ID="editContent" runat="server" />
</asp:Content>
