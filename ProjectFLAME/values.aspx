<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="values.aspx.cs" Inherits="ProjectFLAME.values" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style type="text/css">
   
 .tab1, .tab2,.tab3,.tab4,.tab5{
           font-family:'Segoe Marker'; 
           font-size: 130%;
        }
#mycustomscroll {
  width: 290px;
  height: 330px;
  overflow: auto;
  position: relative;
  }
</style>
    
<script>
 
    $(function () {

        /* Here is the slider using default settings */
        $('#liquid-slider-plan').liquidSlider({
            autoHeight: true,
            continuous: false,
            minHeight: 400,
            swipe: false,
            keyboardNavigation: true,
            crossLinks: true,
            dynamicTabsAlign: "center",
            hashLinking: true, //allows for us to use hashes (#) as a link to push or pull slides
            hashCrossLinks: true, //allows us to use cross link's hashes as links to go to specific slides
            hashNames: true, //allows us to use names rather than numbers for the hashes
            hashTitleSelector: "h1.title", //specifies the name of the hash which corresponds to the specific slide
            panelTitleSelector: "h1.legend",
        });


        /* If you want to adjust the settings, you set an option
           as follows:
  
            $('#slider-id').liquidSlider({
              autoSlide:false,
              autoHeight:false
            });
  
           Find more options at http://liquidslider.kevinbatdorf.com/
        */

        /* If you need to access the internal property or methods, use this:
  
        var sliderObject = $.data( $('#slider-id')[0], 'liquidSlider');
        console.log(sliderObject);
  
        */

        $(".ls-nav-right-arrow").click(function () {
            window.setTimeout(function () { var api = $.data($('#liquid-slider-plan')[0], 'liquidSlider'); api.adjustHeight(false, api.getHeight()); }, 1000);
        });
    });
    </script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
<script type="text/javascript">
    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(2)').addClass('active');
    })
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<!-- content 
    =========================================== -->
    <div class="container">
      <div class="liquid-slider row" id="liquid-slider-plan">
        <div id="slider1">
            <legend><h1 class="title">Academic and professional education</h1><h1 class="legend"><%=Resources.lang.nav3_1 %></h1></legend>
          <div class="col-md-8">
            <cms:GetContent GC_id="5" runat="server" />
        </div>
        <div class="col-md-4">
            <cms:GetContent GC_id="14" runat="server" />
        </div>

        </div>
        <div id="slider2">
            <legend><h1 class="title">Student service leadership</h1><h1 class="legend"><%=Resources.lang.nav3_2 %></h1></legend>
          <div class="col-md-6">
            <cms:GetContent ID="GetContent1" GC_id="6" runat="server" />
          </div>
            <div class="col-md-6">
                <cms:GetContent GC_id="15" runat="server" />
            </div>
        </div>

        <div id="slider3">
            <legend><h1 class="title">Research and Knowledge Transfer</h1><h1 class="legend"><%=Resources.lang.nav3_3 %></h1></legend>
          <div class="col-md-8">
            <cms:GetContent ID="GetContent2" GC_id="7" runat="server" />
          </div>
            <div class="col-md-4">
                <cms:GetContent GC_id="16" runat="server" />
                <cms:GetContent GC_id="17" runat="server" />
            </div>
        </div>

        <div id="Div1">
            <legend><h1 class="title">Social Innovation Incubation</h1><h1 class="legend"><%=Resources.lang.nav3_4 %></h1></legend>
          <div class="col-md-6">
            <cms:GetContent ID="GetContent3" GC_id="8" runat="server" />
          </div>
            <div class="col-md-6">
                <cms:GetContent GC_id="18" runat="server" />
            </div>
        </div>

        



      </div>
    </div>
    <!-- ==============================================
    /content -->
</asp:Content>
