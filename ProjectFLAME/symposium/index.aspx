<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectFLAME.symposium.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    p:first-letter {
        font-size: 120%;
    }
    p {
        font-size: 100%;
    }
    #pitchingAward img{
    	margin: auto;
    }
    #schedule table {
    	text-align:center;
        max-width: 900px;
    	margin: auto;
    	margin-top: 20px;
        
    }
    
    .dl-horizontal {
        font-size:120%;

    }
    .bordered {  
    font-family:Arial;
    font-size:100%;
    font-weight:400;
    border: solid #ccc 1px;  
    -moz-border-radius: 6px;  
    -webkit-border-radius: 6px;  
    border-radius: 6px;  
    -webkit-box-shadow: 0 1px 1px #ccc;  
    -moz-box-shadow: 0 1px 1px #ccc;  
    box-shadow: 0 1px 1px #ccc;  
    }

    .pitch {
    font-family:Arial;
     font-size:120%;
    line-height:120%;
    font-weight:200;
    }
    .header {
    width:300px;
    }
    .venue {
    width:150px;
    }
    
    
   /*  css for background transparent
       .opacity{
           filter:alpha(opacity=50); 
            -moz-opacity:0.5; 
            -khtml-opacity: 0.5; 
            opacity: 0.5;} */
  

</style>
<script type="text/javascript">
    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(6)').addClass('active');
    });
    function goRegister(index) {
		switch (index) {
			case 1: 
				$("#uploadFile").css("display", "none");
				$("#registrationTitle").text("Symposium Registration");
				$('#registrationForm').attr('src', 'https://docs.google.com/forms/d/1qWyapPyVvm1hXo8ygKs987Hf7ETC9fmCacbOgtwnegI/viewform ');
				break;
			
		    case 4:
		        window.open('upload.aspx', 'upload file', 'directories = 0, titlebar = 0, location = 0, statue = 0, menubar = 0, scrollbars = 0, resizable = no, width = 400, height = 200');
		        break;
		    case 3:
		        $("#uploadFile").css("display", "");
		        $("#registrationTitle").text("");
				$('#registrationForm').attr('src', 'https://docs.google.com/forms/d/1V6OVr7GXqCDgZhew-iJo76blHf-HRrko5ISuN25NKBc/viewform');
				$('.nav-tabs a[href="#registration"]').tab('show');
				break;
		}
	}
</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<div class="container">
	<div class="row">
            <img src="images/Header 1.JPG" style="max-width:387px;float:left" />
            <img src="images/Header 2.JPG" style="max-width:387px;float:left"/>
            <img src="images/Header 3.JPG" style="max-width:387px"/>
		<div class="col-xs-12" style="background-color: #9b191f; width:1161px;padding-top: 40px; padding-bottom: 40px;">
            <em style="color: white">
				<h3 class="text-center">PROJECT FLAME SYMPOSIUM 2014</h3>
				<h3 class="text-center">UNIVERSITIES AS WORLD CHANGERS</h3>
			</em>
			<div style="color: #fdfdcd">
				<h3 class="text-center">31<sup>st</sup>October & 1<sup>st</sup> November</h3>
			</div>
		</div>
	</div>
	<div class="row">
		<ul class="nav nav-tabs">
			<li class="active"><a href="#about" data-toggle="tab">About the Symposium</a></li>
			<li><a href="#speakers" data-toggle="tab">Speakers</a></li>
			<li><a href="#schedule" data-toggle="tab">Schedule</a></li>
			<li><a href="#pitchingAward" data-toggle="tab">Pitching</a></li>
			<li><a href="#registration" data-toggle="tab">Registration</a></li>
			<li><a href="#contactus" data-toggle="tab">Contact us</a></li>
		</ul>
	</div>
	<div class="tab-content row">
		<div id="about" class="col-sm-12 tab-pane active">
			<h2>Whatever your age or experience do you wonder:</h2>
            <br /><br /><br />
			<div class="row">
				<div class="col-sm-8">
					<em>
						<p class="well" style="font-size:120%">
							-<i>With so many social, economic and environmental problems facing us, what parts universities, students, social innovators or entrepreneurs and other concerned individuals can play in creating a better world?</i><br />
							-<i>To discover some answers to this question, then you must join Project Flame Symposium: Universities as World Changers on Friday 31st October and Saturday 1st November 2014.</i>
					    </p>
                    </em>
					<div style="padding: 10px;">
						<p class="lead" style="font-size:150%;font-family:Arial;"> 
							<br/>During the symposium, international and local experts in social innovation and enterprise will be sharing their experiences. The focus will be on helping people who are passionate about fostering enterprising ideas for social innovation and on incubating, developing or scaling-up social ventures.
						</p>
					</div>
				</div>
				<div class="col-sm-4">
					<img style='max-width:310px;padding:10px' src="images/About 3.JPG" />
                    <img style='max-width:310px;float:right;padding:10px' src="images/About 1.JPG" />
 
				</div>
			</div>
		</div>
		<div id="speakers" class="col-sm-12 tab-pane">
			<h2>Speakers</h2>
            <h3><i>Keynote Speakers: </i></h3>
            <br/><br/><br/>
            <div>
                <div class="thumbnail" style="max-width:400px">
                         <img src="images/Keynote%20Speaker_M%20Norton.JPG" alt="Michael Norton OOBE"/>
						<div class="caption">
							<h3><strong>Michael Norton OBE</strong></h3>
							<p>
								Social Innovator, Co-Founder of UnLtd and the International Centre for Social Franchising; author of 365 Ways to Change the World, The Everyday Activist, The Complete Fundraising Handbook and the WorldWide Fundraisers Handbook.
							</p>
						</div>
					</div>
                <div class="thumbnail" style="max-width:450px;position:absolute;top:50px;left:500px">
						<div class="caption">
							<h3><strong>Adam O’Boyle </strong></h3>
							<p>
								Executive Director of Hub Ventures, Co-founder of Student Hubs and Turl Street Kitchen
							</p>
                            <img src="images/Keynote%20Speaker_Adam%20Boyle.jpeg" width="430"alt="Adam O'Boyle">
						    <span><small>photo from http://www.generationchange.org.uk/</small></span>
						</div>
					</div>
             </div>
            <br/><br/>
			<div class="row" style="">
				<div class="col-sm-9">
					<table class="table table-bordered" style="font-family:Verdana;font-size:120%">
						
                        <tr>
                            <td>
                            <strong>Other Speakers and Facilitators Include:</strong>
                            </td>
                        </tr>
                         <tr>
                            <td>
                          <strong>David Ai</strong> (Director of Knowledge Transfer, City University of Hong Kong)  
                            </td>
                        </tr>
                        <tr>
                            <td>
                          <strong>David Bishop</strong> (Principal Lecturer, School of Business, the University of Hong Kong)  
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Yanto Chandra</strong>  (PhD, Associate Co-Director, Project Flame, City University of Hong Kong)
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Kelvin Cheung</strong>  (CEO, UnLtd Hong Kong; Founder & CEO, FoodCycle UK)
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Wendy Cheung</strong>  (Manager of Green Ladies, St. James Settlement)
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Cora Chu</strong>  (General Manager of Dialogue Experience) 
                            </td>
                        </tr>
                         <tr>
                            <td>
                            <strong>Ryan Choi</strong>  (Operation Manager,Hong Kong TransLingual Services) 
                            </td>
                        </tr>
                         <tr>
                            <td>
                          <strong>Joseph Fernandez</strong> (Founder, Trade Without Borders)  
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Mark Hayllar</strong>  (PhD, Associate Director of Project Flame, City University of Hong Kong)
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>A. Reza Hoshmand </strong> (Professor, Director of General Education, Hong Kong Baptist University)
                            </td>
                        </tr>
                         <tr>
                            <td>
                            <strong>Felix Keuk</strong> (Business and Market Development, EDI Games Holdings LINFA Project, Malaysia)  
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Elizabeth Lai </strong> (PhD, Founder and Director of Reconnect Environment)
                             </td>
                        </tr>
                        <tr>
                            <td>
                           <strong>Josephine Lee </strong> (Deputy Chief Executive Officer, St. James Settlement) 
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Hugh Thomas</strong>  (Professor, Associate Director, Center for Entrepreneurship, Chinese University of Hong Kong) 
                            </td>
                        </tr>
                         <tr>
                            <td>
                            <strong>Eva Wong</strong> (Director, WeDo Global)  
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Linda Wong</strong> (Professor, Director of Project Flame, City University of Hong Kong)
                            </td>
                        </tr>
                        <tr>
                            <td>
                            <strong>Sania Yau</strong>  (Chief Executive Officer, New life Psychiatric Rehabilitation Association) 
                            </td>
                        </tr>
					</table>
                    <br/><br/>
                     <p style="text-align:center;font-size:150%;color:red;border:medium;font-style:italic">Keep watching for further updates on speakers!</p>
				</div>
				
			</div>
		</div>
		
        <div id="schedule" class="col-sm-12 tab-pane">
			<h3><strong>Program of Universities as World Changers</strong></h3>
			<hr/>
			<h4 class="text-center" style="font-size:180%"><strong><u>Day 1:</u></strong><br/><strong> October 31<sup>st</sup>(Friday) </strong></h4>
		    <table class="bordered" border="1" >
  <tr>
    <td  colspan="2" ><p>&nbsp;</p></td>
    <td class="header"><p>Speakers</p></td>
    <td class="venue"><p>Venue</p></td>
  </tr>
  <tr>
    <td  colspan="3"><p><strong>Morning Session</strong></p></td>
    <td rowspan="8" ><p>&nbsp;</p>
      <p>Room B5-311 Academic 1
        <br>City University of Hong Kong
      </p>
      
  </tr>
  <tr>
    <td ><p>9:00 </p></td>
    <td class="header"><p>Registration</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td ><p>9:30 </p></td>
    <td ><p>Welcoming Remarks</p></td>
    <td ><p>Mr. David Ai</p></td>
  </tr>
  <tr>
    <td ><p>9:50 </p></td>
    <td ><p>Introduction to the Symposium</p></td>
    <td ><p>Dr. Mark Hayllar</p></td>
  </tr>
  <tr>
    <td ><p>10:00</p></td>
    <td ><p>Keynote Sharing: <br>
      <em>Leveraging    on University Capacities for Building a Better World</em></p></td>
    <td ><p>Prof. Michael    Norton<br>Mr. Adam O'Boyle</p></td>
  </tr>
  <tr>
    <td ><p>10:45</p></td>
    <td ><p>Tea/ Coffee</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td ><p>11:00</p></td>
    <td ><p>Case Study Presentations: <br>
      <em>Promoting    Innovation in the University Context</em></p></td>
    <td ><p>Mr. David Bishop    (HKU)<br>
      Prof. Linda Wong    (CityU)<br>
      Prof. A.Reza    Hoshmand (HKBU)<br>
      Prof. Hugh    Thomas (CUHK) </p></td>
  </tr>
  <tr>
    <td ><p>12:45</p></td>
    <td ><p>Lunch Break</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td colspan="3"><p><strong>Afternoon Session</strong></p></td>
    <td rowspan="7" ><p>&nbsp;</p>
      <p>Room B5-211  Academic 1
        <br>City University of Hong Kong
      </p>
  </tr>
   
  <tr>
    <td><p>2:00</p></td>
    <td><p>Introduction to Pitching Enterprising Ideas    for Social Innovation</p></td>
    <td ><p>Prof. Michael    Norton</p></td>
  </tr>
  <tr>
    <td><p>2:15</p></td>
    <td><p><em>Pitching    Enterprising Ideas for Social Innovation </em><br>
      Presentations by    Finalists (Part I)</p></td>
    <td ><p>Finalists <br>  Judging Panel members: <br>Prof. Michael Norton, Mr. Adam O'Boyle, <br>Ms. Josephine Lee, Mr. Kelving Cheung, <br>Mr. Felix Kuek, Mr. David Ai</p></td>
  </tr>
  <tr>
    <td ><p>3:30</p></td>
    <td ><p>Tea/ Coffee</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td ><p>3:45</p></td>
    <td ><p><em>Pitching    Enterprising Ideas for Social Innovation</em><br>
      Presentations by Finalists (Part II)</p></td>
    <td><p>Finalists &amp;    Judging Panel members </p></td>
  </tr>
  <tr>
    <td ><p>5:15</p></td>
    <td ><p>Panel and Audience Feedback </p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><p>5:30</p></td>
    <td><p>Results Announced / Wrap-up</p></td>
    <td><p>Prof. Michael    Norton</p></td>
  </tr>
</table>

		  
            
         
            <h4 class="text-center" style="font-size:180%"><br/><br/><strong><u>Day 2:</u></strong><br/><strong> November 1<sup>st</sup>(Saturday) </strong></h4>
            <table border="1" class="bordered">
    <tr>
         <td colspan="2"><p>&nbsp;</p></td>
        <td style="width:300px">Speakers</td>
        <td class="venue"><p>Venue</p></td>
    </tr>
    <tr>
      <td colspan="3"><p><strong>Morning Session</strong></p></td>
      <td rowspan="15"><p>&nbsp;</p>
      <p>Room Y5-306 Academic 1<br>
        City University of Hong Kong</p>
      </td>
     </tr>
  <tr>
    <td><p>9:00 </p></td>
    <td ><p>Registration</p></td>
    <td ><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><p>9:30 </p></td>
    <td><p>Keynote Sharing:<br>
      <em>Getting from Ideation to Implementation</em></p></td>
    <td><p>Mr. Adam O&rsquo;Boyle</p></td>
  </tr>
  <tr>
    <td><p>10:00</p></td>
    <td ><p>Case Study Presentations: <br>
      <em>Critical    Factors in Implementing Social Innovations</em></p></td>
    <td><p>
      Dr. Elizabeth    Lai (Reconnect Environment)
        <br>Ms. Eva Wong(WeDo Global)
        </p></td>
  </tr>
  <tr>
    <td ><p>11:00</p></td>
    <td><p>Tea/ Coffee</p></td>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td><p>11:15</p></td>
    <td><p>Case Study Presentations: <br>
      <em>Critical    Factors for Helping Start-ups to become End-ups</em></p></td>
    <td><p>Mr. Joseph    Fernandez (Trade Without Borders)  Mr. Ryan Choi (TransLingual Language Service) </p></td>
  </tr>
  <tr>
    <td ><p>12:45</p></td>
    <td ><p>Lunch Break</p></td>
    <td><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td  colspan="3"><p><strong>Afternoon Session</strong></p></td>
  </tr>
  <tr>
    <td width="71" valign="top"><p>2:00</p></td>
    <td width="255" valign="top"><p>Keynote Sharing:<br>
      <em>Making    a Bigger Impact on the World</em></p></td>
    <td width="216" valign="top"><p>Prof. Michael    Norton<br>
      Mr. Kelvin    Cheung</p></td>
  </tr>
  <tr>
    <td width="71" valign="top"><p>2:30</p></td>
    <td width="255" valign="top"><p>Case Study Presentations:<br>
      <em>Critical Factors    for </em><em>Successful    Scaling-up</em></p></td>
    <td width="216" valign="top"><p>Ms. Wendy Cheung (Green Ladie)  
    <br>
     Ms. Cora Chu (Dialogue Experience)<br>Mr. Felix Keuk (EDI Games Holdings LINFA Project, Malaysia)  <br>Ms. Sania Yau (New Life Psychiattric Rehabilitation Association)</p></td>
  </tr>
  <tr>
    <td width="71" valign="top"><p>4:30</p></td>
    <td width="255" valign="top"><p>Tea/ Coffee</p></td>
    <td width="216" valign="top"><p>&nbsp;</p></td>
  </tr>
  <tr>
    <td width="71" valign="top"><p>4:45</p></td>
    <td width="255" valign="top"><p>Expert Views:<br>
      <em>Building    Capacity for Scaling Up Impact  through    Social Enterprise Endorsement</em></p></td>
    <td width="216" valign="top"><p>Dr. Mark Hayllar</p></td>
  </tr>
  <tr>
    <td width="71" valign="top"><p>5:00</p></td>
    <td width="255" valign="top"><p>Concluding Plenary:<br>
      <em>Sustaining    Impact</em></p></td>
    <td width="216" valign="top"><p>Prof. Michael    Norton</p></td>
  </tr>
</table>
            
            
            
            
            
            
            
            
            
            
           

		</div>
		<div id="pitchingAward" class="col-sm-12 tab-pane">
			<nav id="navbar-pitching" style="background-color: rgba(255,255,255,.9)" class="navbar navbar-default navbar-fixed-bottom" role="navigation">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".bs-js-navbar-scrollspy">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand">Pitching Award</a>
				</div>
				<div class="collapse navbar-collapse bs-js-navbar-scrollspy">
					<ul class="nav navbar-nav">
						<li><a href="#pitching1">Important Dates</a></li>
						<li><a href="#pitching2">Awards and Prizes</a></li>
                        <li><a href="#pitching3">Eligibility</a></li>
						<li><a href="#pitching4">Entry Submission & Regulations</a></li>
						<li><a href="#pitching5">Presentation and consultation</a></li>
						<li><a href="#pitching6">Judging Panel</a></li>
						<li id="removeClass"><a href="#pitching7">Terms & Conditions</a></li>
						<script type="text/javascript">
						$(function(){
							window.setInterval(function(){
							if ($("#removeClass").hasClass("active")) {
								$("#removeClass").removeClass("active");
							}
						}, 2000);
						});
						</script>
					</ul>
				</div>
			</nav>
			<div data-spy="scroll" data-target="#navbar-pitching" style="max-width: 700px; margin: auto">
				<h6 class="well">
					You can navigate this page by the navigator bar in the bottom.
				</h6>
				
				<h1 class="text-center">Pitching Enterprising Ideas for Social Innovation</h1>
				<p class="pitch">There are so many social, economic and environmental today. To create a better world, we need more creative and enterprising ideas urgently. 
                 <br/><br/>Are you a student, entrepreneurs or anyone else with an innovative idea that could make a difference, however big or small, and create social and/or environmental impacts?
                 <br/><br/>Come and pitch your creative idea at the Project Flame Symposium and engage with a supportive panel of international and local experts in social innovation and enterprise.
                 <br/><br/>Applicants will have the privilege of attending the Symposium and finalists will be able to pitch their ideas and maybe win a Project Flame award.<br/><br/>
                 </p>
				<h2 class="text-center">ACT NOW! </h2>
				<div class="text-center"><a href='javascript: goRegister(3);' class="btn btn-danger" >Register</a></div>
				<p class="lead" style="color:brown"><br/>Project Flame is calling for aspiring or practicing social innovators, entrepreneurs and students to share and improve their ideas and potential impact by joining our International Symposium in Universities as World Changers.
                 </p>
				<h2 style="padding-top: 50px" id="pitching1"><strong>IMPORTANT DATES:</strong></h2>
                <img src="images/important%20dates.png" class="opacity"/>
                <br/>
                <h2 style="padding-top: 50px" id="pithiching2"><strong>Awards and Prizes:</strong></h2>
                <img class="opacity" src="images/awards.png" />

				<h2 style="padding-top: 50px" id="pitching3"><strong>ELIGIBILITY:</strong></h2>
				<ul class="pitch">
					<li>Students, social innovators and entrepreneurs wanting to make an impact on social or environmental problems. </li>
					<li>Contestants can be individuals or teams of no more than 5 members.</li>
					<li>Each contestant may not submit more than 2 entries for the award. </li>
				</ul>
				<h2 style="padding-top: 50px" id="pitching4"><strong>ENTRY SUBMISSION and REGULATIONS:</strong></h2>
				<ul class="pitch">
					<li>Entries must be submitted in ENGLISH only.</li>
					<li>The entries must be made using the official entry form and be no longer than 750 words length in total.  </li>
					<li>Entries must indicate for which award group (Social Innovation and Enterprise Start-up or Scaling-up Social Impact) they are being entered.</li>
					<li>Once your entry is submitted, it may not be modified.</li>
					<li>Entries shortlisted as finalists will be expected to attend both the pitching and symposium.</li>
					<li>The Awards are classified into Champion, First Runner-up, Second Runner-up. </li>
					<li>All contestants must register for the symposium and pay the appropriate registration fee when submitting their application. </li>
					<li>Registration fees for the symposium will be waived for contestants registered as full-time students at any university or college.  </li>
					<li>Teams should not add or change team members once they have submitted their entry summary to the judging panel.</li>

				</ul>
				<h2 style="padding-top: 50px" id="pitching5"><strong>PRESENTATION and CONSULTATION:</strong></h2>
				<ul class="pitch">
					<li>All entries must be submitted through the online registration platform by 5pm 29th October 2014. </li>
					<li>The Finalists will be notified of their successful entry on 30th October 2014 and are required to attend the pitching on 31st October 2014. </li>
					<li>Finalists will be informed by email and by announcement on the Project Flame Website </li>
					<li>Finalists have 4 minutes to pitch their enterprising ideas and will then be questioned by a panel of experts.  </li>
				</ul>
				<h2 style="padding-top: 50px" id="pitching6"><strong>JUDGING PANEL:</strong></h2>
				<p class="pitch">The Final Judging Panel, chaired by Michael Norton, will consist of both local and international experts, including Adam O'Boyle, Josephine Lee, Kelvin Cheung, Felix Keuk and David Ai. </p>

				<h2><br/>Judging criteria will include:</h2>
                <br/>
                <img src="images/judging.png" />
				<h2 style="padding-top: 50px" id="pitching7"><strong>TERMS and CONDITIONS:</strong></h2>
				<ul class="pitch">
					<li>The organizers reserve the right to invite entrants to attend an interview during the shortlisting.</li>
					<li>All decisions of the Judging Panel will be final and binding. </li>
					<li>Finalists maybe required to assist the Organizer in associated publicity activities</li>
					<li>All entries and any copyright subsisting in the entries will remain the property of the contestant. Each contestant shall have the sole responsibility for securing any potential intellectual property rights. The organizer shall not be liable for any costs incurred or loss, damage, injury, expense or liability suffered by contestant in relation to any failure to successfully secure any intellectual property rights related to the entries as a result of participation in the contest. </li>
					<li>Any form plagiatism will result in disqualification.</li>
				</ul>
				
				<hr />
				<div class="text-center"><a href='javascript: goRegister(3);' class="btn btn-danger">Register</a></div>
			</div>
		</div>
		
        
        
        
        
        <div id="registration" class="col-sm-12 tab-pane">
			<h3>Online Registration</h3>
			<div style="text-align: center">
				<a href="javascript: goRegister(1) " class="btn btn-info btn-sm" style="font-size:18px">Symposium Registration</a> 
				and
				<a href='javascript: goRegister(3);' class="btn btn-danger" style="font-size:18px">Pitching Registration</a>
			</div>
			<hr />
			<h4 class="text-center" id="registrationTitle"></h4>
            
			<iframe id="registrationForm" style="width: 630px; min-height: 700px; border: none; margin: auto; display: block;" src=""></iframe>
		 </div>
		<div id="contactus" class="col-sm-12 tab-pane">
			<h2>
				Registration / Enquiry: 
			</h2>
			<dl class="dl-horizontal">
				<dt>Tel:</dt>
				<dd><a href="tel:(852)3442-8273">(852)3442-8273</a></dd>
			</dl>
			<dl class="dl-horizontal">
				<dt>Email:</dt>
				<dd><a href="mailto:qianqmai2@cityu.edu.hk">qianqmai2@cityu.edu.hk</a></dd>
			</dl>
                
            <h3>
				<a href="http://www6.cityu.edu.hk/wayfinder/GettingToU/bymtr-kt1.htm"><i>Ways to CityU</i></a>
			</h3>
			<a href="http://www6.cityu.edu.hk/projectflame/"><img alt="" style="width: 180px;" src="http://www6.cityu.edu.hk/sa_flame/hand2spot/Styles/images/PF_logo_2013_NB_black_s.png"></a>
			<a href="http://www.cityu.edu.hk/"><img id="cityuLogo" alt="" src="http://www.cityu.edu.hk/cityu/images/logo_cityu_home.png"></a>
			<a href="http://www.the-icsf.org/"><img src="http://www.the-icsf.org/wp-content/themes/yamidoo/images/logo-footer.png"></a>
		</div>
	</div>
</div>
</asp:Content>
