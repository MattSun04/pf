<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="Programs.aspx.cs" Inherits="ProjectFLAME.Programs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!-- BEGIN Timeline Embed -->
    <div id="timeline-embed"></div>
    <style type="text/css">
    .slider-item > .content {
        padding-top: 10px;
    }
    .vco-storyjs, .storyjs-embed, .vco-timeline .vco-navigation .timenav-background .timenav-interval-background {
        background-color: transparent;
    }
    .vco-timeline .vco-navigation .timenav-background {
        background-color: #e9e9e9;
        background-color: rgba(233,233,233,.4);
    }
    </style>
    <script type="text/javascript" src="plugin/TimelineJS/js/storyjs-embed.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            createStoryJS({
                type: 'timeline',
                width: '100%',
                height: '634',
                source: '<%=Resources.lang.Programs_link %>',
                embed_id: 'Programs-timeline',
                css: 'plugin/TimelineJS/css/timeline.css',     //OPTIONAL PATH TO CSS
                js: 'plugin/TimelineJS/js/timeline-min-modified.js',    //OPTIONAL PATH TO JS
                font: 'Bevan-PotanoSans',
                hash_bookmark: true,
            });
            window.setTimeout(function () { $('.marker.active > .flag').trigger("click") }, 2000);//fix the hash problem
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {

        });
    </script>
<!-- END Timeline Embed-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
<script type="text/javascript">
    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(4)').addClass('active');
    })
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<!-- content 
    =========================================== -->
    <div class="container-fluid">
      <div class="row-fluid">

        <div id="Programs-timeline"></div>

      </div>
    </div>
<!-- ==============================================
    /content -->
</asp:Content>
