<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="aboutus.aspx.cs" Inherits="ProjectFLAME.aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<!-- scroll bar -->
    <script type="text/javascript" src="plugin/flexcroll/recommended_styles/minimal/flexcroll.js"></script>
    <link rel="stylesheet" type="text/css" href="plugin/flexcroll/recommended_styles/minimal/flexcrollstyles.css" />
    <style>
        #team-member ul {
            list-style:none;
        }
        .para {
            font-family: 'Adobe Arabic';
            font-size: 200%;
            word-spacing: 2px;
            line-height: 110%;
            }

    </style>


    <script>
        $(function () {

            /* Here is the slider using default settings */
            $('#liquid-slider-aboutus').liquidSlider({
                autoHeight: true,
                minHeight: 500,
                keyboardNavigation: true,
                crossLinks: true,
                swipe: false,
                continuous: false,
                autoSlide: false,
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

        });
    </script> 
    <!-- for table hover event -->
    <script type="text/javascript">
        $("tr").mouseover(
          function () {
              var title = $(this).children(':nth-child(2)').html();
              prevSibling = $(this).prev();
              while (!title.length) {
                  title = prevSibling.children(':nth-child(2)').html();
                  prevSibling = prevSibling.prev();
              }
              var name = $(this).children(':nth-child(3)').html();
              var position = $(this).children(':nth-child(4)').html();
              var department = $(this).children(':nth-child(5)').html();
              var email = $(this).children(':nth-child(6)').html();
              var phone = $(this).children(':nth-child(7)').html();
              var photo = $(this).children(':nth-child(8)').children(':first-child').html();
              if (photo);
              else photo = 'images/metro/metro5.jpg';
              if (name && (document.getElementById("profile-name").innerHTML != name)) {
                  $('#profile-display').fadeOut(200, function () {
                      document.getElementById("profile-title").innerHTML = title;
                      document.getElementById("profile-name").innerHTML = name;
                      document.getElementById("profile-position").innerHTML = position;
                      document.getElementById("profile-department").innerHTML = department;
                      document.getElementById("profile-email").innerHTML = email;
                      document.getElementById("profile-phone").innerHTML = phone;
                      document.getElementById("profile-photo").src = photo;
                      $('#profile-display').fadeIn();
                  })
              };
          }
        );
    </script>

    <script type="text/javascript">
    //this for display team member
    function loadTeamMember(){
      function TeamTableHeadRow(title){
          return $('<hr><h3>' + title + '</h3>');
      }
      function ListItem(label, text, link){
        if (text == "") {
            return;
        }

        if (link === undefined){
          return $('<li><strong></strong> ' + text + '</li>');
        } else {
          return $('<li><strong></strong> <a href="' + link + '">' + text + '</a></li>');
        }
      }
      function TeamTableRow(info){
        var ele = $('<div class="media" ></div>');
        var body = $('<div class="media-body" ></div>');
        var info_list = $('<ul>');
        $(info_list).append(ListItem('Title', info['title']))
          .append(ListItem('Position', info['position']))
          .append(ListItem('Department', info['department']))
          .append(ListItem('Email', info['email'], 'mailto:' + info['email']))
          .append(ListItem('Tel', info['phone'], 'tel:' + info['phone']));
        $(body).append('<h4 class="media-heading">' + info['name']  + ' - <a target="_blank" href="' + info['link'] + '">Personal Page</a></h4>')
          .append(info_list);
        $(ele).append('<a class="pull-left" ><img style="max-width: 120px" class="media-object img-thumbnail" src="' + ((info['image_link'])? info['image_link'] : "images/metro/metro5.jpg")  + '"></a>')
          .append(body);
        //$(ele).append('<td>' + info['title'] + '</td>')
          //.append('<td><a' + ((info['link'] == null)? "" : (' href="' + info['link'] + '" target="_blank"')) + '>' + info['name'] + '</a></td>')
          //.append('<td>' + info['position'] + '</td>');
        return ele;
      }
      function sortList(data){
        var list = new Array();
        for (var i = 0; i < data['category'].length; i ++) {
          list[i] = new Array();
          for (var j = 0; j < data['list'].length; j ++) {
            if (data['list'][j]['category'] == data['category'][i]['ID']) {
              list[i].push(data['list'][j]);
            }
          }
        };
        return list;
      }
      $.get("service/aboutus_team.ashx", function(data){
        var teamList = sortList(data);
        for (var i = 0; i < data['category'].length; i++) {
            if (data['category'][i]['name'] != "none") {
                $('#team-member').append(TeamTableHeadRow(data['category'][i]['name']));//load the title of a category
            }
                
            for (var j = 0; j < teamList[i].length; j ++) {
                $('#team-member').append(TeamTableRow(teamList[i][j]));
            }
            //$('#team-member').append('<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>');
          }
        });
    }
    $(loadTeamMember);
    </script>

<style type="text/css">

#profile td:first-child,#profile td:nth-last-child(5),#profile td:nth-last-child(4), #profile td:nth-last-child(3), #profile td:nth-last-child(2),#profile td:last-child{
  display: none;
}
td[colspan="5"]{
  font-weight: bold;
}
span a{
  color: black;
  text-decoration:underline;
}

    
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
    <script type="text/javascript">
        $(function () {
            $('.navbar-collapse > .nav:first-child > li:nth-child(1)').addClass('active');
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <!-- content 
    =========================================== -->

    <div class="container">
      <div class="liquid-slider row" id="liquid-slider-aboutus">


        <div id="slider1">
          <legend><h1 class="title">About Us</h1><h1 class="legend"><%=Resources.lang.nav2%></h1></legend>
          <div class="col-md-6">
            <div>
              <cms:GetContent GC_id="1" runat="server"/>
            </div>
           </div>
        <div class="col-md-6">
            <cms:GetContent GC_id="10" runat="server" />
          </div>
        </div>
        <div id="slider2">
          <legend><h1 class="title">Our Mission</h1><h1 class="legend"><%=Resources.lang.nav2_2%></h1></legend>
          <div class="col-md-6">
              <cms:GetContent GC_id="11" runat="server" />
            <div class="hidden-phone" style="height:50px;"></div><!-- <=this is for padding on desktop -->
          </div>
          <div class="col-md-6">
            <cms:GetContent GC_id="2" runat="server" />
          </div>
        </div>

        <div id="slider3">
            <legend class=""><h1 class="title">Background</h1><h1 class="legend"><%=Resources.lang.nav2_3%></h1></legend>
            <div class="row">
                <div class="col-md-12 para">
                     <div style="max-width:45%;float:right">
                        <cms:GetContent ID="GetContent3" GC_id="12" runat="server" />
                     </div>    
                    <cms:GetContent ID="GetContent1" GC_id="3" runat="server" />
               </div>
            <br/>    
            </div>
            <div class="row">
                <div class="col-md-6">
                    <cms:GetContent GC_id="13" runat="server" />
                  </div>
                  <div class="col-md-6">
                      <cms:GetContent ID="GetContent2" GC_id="4" runat="server" />
                  </div>    
            </div>
          
        </div>

        <div id="slider4">
          <legend class=""><h1 class="title">Our Team</h1><h1 class="legend"><%=Resources.lang.nav2_4%></h1></legend>
                      
          <div class="col-xs-12" id="teamTable" style="">
            <div id="team-member">
              <!-- <tr dir='ltr'>
                <th>Title at the Project</th>
                <th>Name</th>
                <th>Position</th>
              </tr>
 -->            </div>
          </div>
        </div>


        <div class="row" id="slider5">
              <legend class="col-md-12"><h1 class="title">Contact Us</h1><h1 class="legend"><%=Resources.lang.nav2_5%></h1></legend>
              <ul class="list-inline">
                <li style="margin-bottom:0">

                <div class="input-group col-md-7 col-md-offset-1">
                    <input class="input-sm form-control" id="email" type="text" placeholder="<%=Resources.lang.enteremail%>">
                    <a class="btn btn-default btn-sm input-group-addon" onclick="subscribe(document.getElementById('email').value,'')"><%=Resources.lang.subscribe%></a><a id="unsubscribe" class="btn btn-danger btn-xs  input-group-addon unsubscribe"><%=Resources.lang.unsubscribe%></a><a id="sureUnsubscribe" style="display:none" class="btn btn-danger btn-xs input-group-addon unsubscribe"><%=Resources.lang.issure%></a>
                </div>
                    <script>
                        function subscribe(email, un) {
                            if (email == "") alert('Oh my god, you input nothing!!');
                            else {
                                var link = un + "subscribe.aspx?email=" + email;
                                window.location.href = link;
                            }
                        }
                        $("input#email").keyup(function (e) {
                            if (e.keyCode == 13) {
                                subscribe(document.getElementById('email').value, "")
                            }
                        });
                        $("#unsubscribe").click(function () {
                            $(this).hide();
                            $('#sureUnsubscribe').fadeIn();
                        });
                        $("#sureUnsubscribe").click(function () {
                            email = document.getElementById('email').value;
                            subscribe(email, "un")
                        })
                    </script>
                </li>
              </ul>
              <div class="col-md-7 col-md-offset-1">
                    <iframe style="box-shadow:1px 1px 1px 1px black; width: 100%; max-width: 600px; height: 480px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="https://maps.google.com.hk/maps?f=d&amp;source=s_d&amp;saddr=&amp;daddr=22.334923,114.173639&amp;hl=en&amp;geocode=&amp;sll=22.334841,114.173674&amp;sspn=0.002091,0.002411&amp;brcurrent=3,0x340407335121d4d5:0xea6602cb7ee084f0,0,0x340400d4376c85e1:0xcab6faa04b58a8a7&amp;mra=mift&amp;mrsp=1&amp;sz=19&amp;ie=UTF8&amp;t=m&amp;ll=22.334843,114.173672&amp;spn=0.002382,0.003433&amp;z=18&amp;output=embed"></iframe><br /><small><a href="https://maps.google.com.hk/maps?f=d&amp;source=embed&amp;saddr=&amp;daddr=22.334923,114.173639&amp;hl=en&amp;geocode=&amp;sll=22.334841,114.173674&amp;sspn=0.002091,0.002411&amp;brcurrent=3,0x340407335121d4d5:0xea6602cb7ee084f0,0,0x340400d4376c85e1:0xcab6faa04b58a8a7&amp;mra=mift&amp;mrsp=1&amp;sz=19&amp;ie=UTF8&amp;t=m&amp;ll=22.334843,114.173672&amp;spn=0.002382,0.003433&amp;z=18" style="color:#0000FF;text-align:left">View Larger Map</a></small>
              </div>
              <div class="col-md-3">
                <div>
                    <cms:GetContent GC_id="9" runat="server" />
                </div>
              </div>
            </div>


        </div>


    </div>
    <!-- ==============================================
    /content -->





</asp:Content>
