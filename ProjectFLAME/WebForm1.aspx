<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ProjectFLAME.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">

    <style type="text/css">
        .li {
        float:left;
        width:967px;
        
         }
        img {
        width:967px
        }

        #s {
            list-style:none;
            width:2000px
        }
        </style>


     <div class="container">
         <div>
         <ul ID="s">
             <li class="li">
                 <img src="images/team.jpg" /></li>
             <li class="li">
                 <img src="images/team.jpg" /> </li>
             
         </ul>
        </div>
     </div>
    <script type="text/javascript">
        var oUl = document.getElementById("s");
        var oLi = document.getElementsByClassName("li");
        oUl.style.width = oLi[0].offsetWidth * oLi.length+50+"px";
    </script>

    
</asp:Content>