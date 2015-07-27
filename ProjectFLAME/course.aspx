<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="course.aspx.cs" Inherits="ProjectFLAME.course" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
<script type="text/javascript">
    $(function () {
        $('.nav-collapse > .nav:first-child > li:nth-child(6)').addClass('active');
    })
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<div class="container">
        <legend><h1><%=Resources.lang.nav5_3 %></h1></legend>
    <div class="row">
        <div class="col-md-6" id="video">
            <iframe class="col-xs-12 img-thumbnail" style="min-height:330px" src="//www.youtube.com/embed/d52TgASMwr8" frameborder="0" allowfullscreen></iframe>
        </div>
        <div class="col-md-6">
            <img class="img-thumbnail col-md-12" src="https://lh3.googleusercontent.com/-g18zSyvVmAI/Uf8_yBYDEXI/AAAAAAAACHk/4QVWr8wVQ5U/w1183-h792-no/DSC_0131.JPG" />
        </div>
    </div>
</div>
<script type="text/javascript">
</script>
</asp:Content>
