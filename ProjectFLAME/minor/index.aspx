    <%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectFLAME.minor.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css">
   /* .header {
        text-align:center;
        font-family:Arial;
    }
    */
   .p1 {
        max-width:1200px;
        font-family: Georgia, serif;
        font-size:150%;
        padding-left:5%
      }
    .poster {
        max-width:400px;
        margin-right:50px;
        margin-bottom:25px;
        float:left;
    }
      .poster2 {
        max-width:330px;
        margin-right:20px;
         margin-bottom:15px;
        float:left;
    }
 
    .header {
        text-align: center;
        font-family: Georgia, serif;
        text-shadow: 0px 0px 2px black;
    }

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
    <script>
        $(function () {
            $('.navbar-collapse > .nav:first-child > li:nth-child(6)').addClass('active');
        })
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
   
    <div class="container">
   <cms:GetContent ID="GetContent" GC_id="24" runat="server" />
    </div>
    


    
</asp:Content>
