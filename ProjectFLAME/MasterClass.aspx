<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="MasterClass.aspx.cs" Inherits="ProjectFLAME.MasterClass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
<script>
    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(9)').addClass('active');
    })
    </script>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
   <style type="text/css">
     
   </style>
    <div class="container">
     <div class="col-md-12" style="text-align:center">
     <img src="http://www6.cityu.edu.hk/projectflame/handle_URL.ashx?id=5c99b739-e7ea-42e2-8986-1dcbf7eecef1" width="900" height="1273" alt="1" usemap="#map"/><map name="map"><area shape="rect" coords="393,1030,505,1075" alt="registration" href="http://www6.cityu.edu.hk/projectflame/MasterClassRegistration.aspx"/></map>
    <img src="http://www6.cityu.edu.hk/projectflame/handle_URL.ashx?id=f05d1eb3-39bb-4b38-b1a5-1f987826a30f" width="900" height="1273" alt="2" />
    </div>
    
    </div>
</asp:Content>