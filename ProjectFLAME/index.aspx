<%@ Page Language="C#" MasterPageFile="main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectFLAME.index" %>
<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">

    <link rel="stylesheet" type="text/css" href="css/index.css" />
   
    <style type="text/css">
        #slider1 {
        width:1138px;
        height:455px
        }
    div.ikon h6{
       text-align:center;
       font-size: 20px;
       position: relative;
       top: 0px;
       color: rgba(0,0,0,1);
       background-color: rgba(0,0,0,0);
       padding-top: 0px;
       padding-bottom: 0px;
       transition: top 0.7s ease, color 0.7s ease, background-color 0.7s ease, padding-top 0.7s ease, padding-bottom 0.7s ease;
    }
    div.ikon{
      padding-top: 10px;
    }
    div.ikon img{
      width: 75%;
      margin-left: 12.5%;
      margin-bottom: 0px;
      transition: width 0.5s ease, margin-left 0.5s ease, margin-bottom 0.5s ease;
    }
    div.ikon a {
    text-decoration: none;
    }
    div.ikon div.col-md-3:hover img{
      width: 100%;
      margin-left: 0;
      margin-bottom: -50px;
    }
    div.ikon div.col-md-3:hover h6{
      top:-100px;
      color: rgba(255,255,255,0.7);
      background-color: rgba(0,0,0,0.5);
      padding-top: 10px;
      padding-bottom: 10px;
    }

    .wrap{
    width:1600px;
    height:455px;
    margin:0px;
    overflow:hidden;
    position:relative;
    float:left;
    }
    .dynamic-img {
     overflow:hidden;
     
     }

    .dynamic-img img{
        width:300px;
        height:250px;  
    }

     .butt {
        height:40px;
        width:200px;
        position:absolute;
        top:100px;
        left:60px;
        border:hidden;
        background:url('images/opacity.png');
        color:white;
      }


        .butt span {
        font-size:18px;
        font-family:LiSu;
       
        }

  
    </style>
    <script>

        var width;       
        $(function () {

            /* Here is the slider using default settings */
            $(function () {
                $('#slider-1').liquidSlider({
                    autoHeight: false,
                    slideEaseFunction: 'animate.css',
                    slideEaseDuration: 250,
                    heightEaseDuration: 200,
                    animateIn: "fadeIn",
                    animateOut: "fadeOut",
                    dynamicTabs:false,
                    callback: function () {
                        var self = this;
                        $('.slider-1-panel').each(function () {
                            $(this).removeClass('animated ' + self.options.animateIn);
                        })
                        $('.wrap img').css({
                            'top': '-100px',
                            'left': '-200px',
                            'width': '2000px',
                            'height': '655px'

                        });
                        $('.wrap img').stop().animate({
                            'width': '1600px',
                            'height': '535px',
                            'top': '0px',
                            'left': '0px',
                          },8000);
                    }
                }
                );
            })


            $(document).ready(function () {
                width = document.getElementById("wrap").offsetWidth;
                $('.wrap img').css({
                    'top': '-100px',
                    'left': '-200px',
                    'width': '2000px',
                    'height': '655px'
                });

                $('.wrap img').stop().animate({
                    'width': '1600px',
                    'height':'535px',
                    'top': '0px',
                    'left': '0px',
                               
                               
                },8000
                );
            });

            $('.butt').mouseover(function () {
                var self = this;
                $(this).css({
                    'background': 'white',
                    'color':'black'
                });

            });
                    
            $('.butt').mouseout(function () {
                var self = this;
                $(this).css({
                    'background': 'url("images/opacity.png")',
                    'color': 'white'
                });

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
    
</asp:Content>


<asp:Content ID="navScriptContent" runat="server" ContentPlaceHolderID="navScript">
   <script type="text/javascript">
       </script>
    </asp:Content>

<asp:Content ID="ContentContent" runat="server" ContentPlaceHolderID="content">
    <!-- content 
    =========================================== -->
    <div class="col-md-12 col-xs-12">
      <div class="liquid-slider row" id="slider-1">
          <asp:Literal ID="Literal1" runat="server"></asp:Literal>
          
         <!-- <div>
          <a href="">
              <cms:GetContent GC_id="20" runat="server" />
          </a>
        </div>
             -->
        <div id="slider1">
          <div class="wrap" id="wrap">
            <cms:GetContent GC_id="21" runat="server"/>         
            <div class="col-md-6 focus-word-left-bottom font-white">
            <h1 class="title"><%=Resources.lang.pf%></h1>
            <h3><%=Resources.lang.Socialie %></h3>
            <a class="btn btn-danger separate" onclick="location.href='aboutus.aspx'"><%=Resources.lang.knowmore %></a>
            </div>
            </div>
        </div>
        <div id="slider2">
          <div class="wrap">
          <cms:GetContent GC_id="22" runat="server" />
          <div class="col-md-6 focus-word-right-top">
            <br/>
            <h1 class="title"><%=Resources.lang.nav7%></h1>
            <h3><%=Resources.lang.apfht%></h3>
            <a class="btn btn-success" onclick="location.href='http://www6.cityu.edu.hk/sa_flame/hand2spot/'"><%=Resources.lang.enterH2S%></a>
          </div>
        </div>
       </div>
      </div>
    </div>
    <br>
    <div class="container">
        <div class="col-md-12 dynamic-img">
           <div class="col-md-1">
            </div>
            <div class="col-md-3">
                <img src="images/metro/metro5.jpg" />
                 <button onclick="window.location.href='register.aspx';return false;" class="butt">
                    <span>Registration</span>
                </button>  
            </div>
            <div class="col-md-1">
            </div>
            <div class="col-md-3 ">
                <img src="images/metro/metro2.jpg" />
                <button onclick="window.location.href='values.aspx';return false;" class="butt">
                    <span>Our Values</span>
                </button>  
           </div>
             <div class="col-md-1">
            </div>
            <div class="col-md-3">
                <img src="images/team.jpg" />
               
                <button onclick="window.location.href='aboutus.aspx#our-team';return false;" class="butt">
                    <span>Our Team</span>
                </button>  
           </div>
        </div>
    </div>



    <div class="container ikon">
    <legend><h1 style="padding-left:20px;"><%=Resources.lang.nav3Cap%></h1></legend>
      <div class="row">
        <div class="col-md-3">
          <a href="values.aspx#academic-and-professional-education"><img src="images/indexikon/withHat.png">
          <h6><%=Resources.lang.nav3_1%></h6></a>
        </div>
        <div class="col-md-3">
          <a href="values.aspx#student-service-leadership"><img src="images/indexikon/leadership.png">
          <h6><%=Resources.lang.nav3_2%></h6></a>
        </div>
        <div class="col-md-3">
          <a href="values.aspx#research-and-knowledge-transfer"><img src="images/indexikon/knowledgeTransfer.png">
          <h6><%=Resources.lang.nav3_3%></h6></a>
        </div>
        <div class="col-md-3">
          <a href="values.aspx#social-innovation-incubation"><img src="images/indexikon/socialInnovation.png">
          <h6><%=Resources.lang.nav3_4%></h6></a>
        </div>
      </div>
    </div>
    <!-- ==============================================
    /content -->
    </asp:Content>

