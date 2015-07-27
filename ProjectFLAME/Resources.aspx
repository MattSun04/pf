<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="Resources.aspx.cs" Inherits="ProjectFLAME.Resources" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <!-- pdf data -->
    <script type="text/javascript" src="resources/pdf/pdfdata.js"></script>
    <script type="text/javascript" src="js/makeResourceList.js"></script>
    <style type="text/css">
        #slider1 {
        font-size:75%;
        font-family:'Adobe Arabic';
        
        }
    #liquid-slider-resources{
      padding-top: 20px;
    }
    .pdf-grid{
      background: white;
      padding: 5px;
      margin-bottom: 5px;
      min-height:300px;
      box-shadow: 1px 1px 2px rgba(0,0,0,0.3);
    }
    .pdf-grid > h6{
      min-height: 80px;
      border-bottom: 1px solid black;
    }
    .pdf-grid > p{
      height: 100px;
      overflow: hidden;
    }
    .pdf-thumb{
      border: 1px solid rgba(0,0,0,0.3);
    }
    </style>
    <script>
        $(function () {

            /* Here is the slider using default settings */
            $('#liquid-slider-resources').liquidSlider({
                autoHeight: true,
                autoHeightMin: 500,
                dynamicTabsAlign: "center",
                keyboardNavigation: true,
                crossLinks: true,
                swipe: false,
                autoSlide: false,
                continuous: false,
                hashLinking: true, //allows for us to use hashes (#) as a link to push or pull slides
                hashCrossLinks: true, //allows us to use cross link's hashes as links to go to specific slides
                hashNames: true, //allows us to use names rather than numbers for the hashes
                hashTitleSelector: "h1.title", //specifies the name of the hash which corresponds to the specific slide
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


        });
    </script> 
<style type="text/css">

#mycustomscroll {
  width: 290px;
  height: 330px;
  overflow: auto;
  position: relative;
  }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
    <script>
    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(8)').addClass('active');
    })
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<!-- content 
    =========================================== -->
    <div class="container">
      <div class="liquid-slider" id="liquid-slider-resources">
        <div id="slider1">
        <legend><h1 class="title">Useful Websites</h1></legend>
          <div class="col-md-6">
              <ul>
                  <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                </ul>
        </div>
        <div class="col-md-6">
            <cms:GetContent GC_id="19" runat="server" />
          </div>
        </div>
        <div id="slider2">
          <legend><h1 class="title">Reports</h1></legend>
            <div class="row">
              <div class="col-md-3 col-md-offset-9"> 
              Display Option:
              <div class="btn-group">
                <a id="list-btn" class="btn btn-default active">List</a><a id="grid-btn" class="btn btn-default">Grid</a>
              </div>
              </div>
            </div>
          <div id="gridContainer" class="col-md-12">
            <script type="text/javascript">
                document.getElementById('gridContainer').innerHTML = makeResourceList('list');
                var viewNow = 'list';
                $('#list-btn').click(function () { toggleView('list') });
                $('#grid-btn').click(function () { toggleView('grid') });
            </script>

            
          </div> 
        </div>

        



      </div>
    </div>
    <!-- ==============================================
    /content -->
</asp:Content>
