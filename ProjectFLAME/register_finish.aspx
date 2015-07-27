<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="register_finish.aspx.cs" Inherits="ProjectFLAME.register_finish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
    .warning {
    font-size:30px;
    text-align:center;
    font-family:'Adobe Arabic';
    
    
    }
    
</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="container">
   <div class="col-md-12 warning">
    <asp:literal ID="literal1" runat="server"></asp:literal>
       <br>
    <a href="register.aspx">back to registration page</a>
   </div>
   </div>
</asp:Content>
