<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="ProjectFLAME.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="http://www.cityu.edu.hk/ipconference2015/Styles/css/bootstrap.css" rel="stylesheet" />
    <link href="http://www.cityu.edu.hk/ipconference2015/Styles/css/logos.css" rel="stylesheet">
   
     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <script>
        $('.navbar-header').removeClass();
        $('.navbar-brand').removeClass();

        function validate_required(field, alerttxt) {
            with (field) {
                if (value == null || value == "")
                { alert(alerttxt); return false }
                else { return true }
            }
        }
        
        function validate_form(thisform) {
            with (thisform) {
              
               if (validate_required(english_name, "englishname must be filled out!") == false)
                { english_name.focus(); return false; }
               else if (validate_required(phone_number, "contact number must be filled out!") == false)
                { phone_number.focus(); return false; }
               else if (validate_required(email, "Email must be filled out!") == false)
               { email.focus(); return false }
               else if (validate_required(volunteer, "please choose all options!") == false)
               {  return false }
               else if (validate_required(wecan, "please choose all options!") == false)
               { return false }


            }
        }


     </script>
    <style type="text/css">
        #_navbar1 {
            box-sizing: border-box;
            color: rgb(119, 119, 119);
            cursor: auto;
            display: block;
            float: left;
            font-family: Arial, Helvetica, sans-serif;
            font-size: 18px;
            font-weight: 200;
            height: 40px;
            line-height: 20px;
            margin-left: -50px;
            padding-bottom: 10px;
            padding-left: 20px;
            padding-right: 20px;
            padding-top: 10px;
            text-decoration: none;
            text-shadow: rgba(255, 255, 255, 0.247059) 0px 1px 0px;
        }
        #_navbar {
        box-sizing: border-box;
        color: rgb(51, 51, 51);
        display: block;
        float: left;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 14px;
        height: 40px;
        line-height: 20px;
        margin-left: 0px;
        margin-right: 0px;
        
        }
        .navbar-collapse {
        border-top-color: rgb(51, 51, 51);
        border-top-style: none;
        border-top-width: 0px;
        box-shadow: none;
        box-sizing: border-box;
        color: rgb(51, 51, 51);
        display: block;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 14px;
        height: 42px;
        line-height: 15px;
        margin-left: 0px;
        margin-right: 0px;
        max-height: 340px;
        overflow-x: visible;
        overflow-y: visible;
        padding-bottom: 0px;
        padding-left: 15px;
        padding-right: 15px;
        width: 1553px;
        }
    </style>
   
     <div class="container-fluid mycontainer" style="background: #9d56a2;">
        <div class="container">
            <div class="col-md-1"></div>
            <div class="col-md-11">
                <p class="tbanner">
                    Registration
                </p>
            </div>
        </div>
    </div>

    <div>
        <p style="position: absolute; right: 20%; font-size: 15px;"><b>please tick the appropriate boxes.</b></p>
    </div>
    <br><br>
    <div class="container" style="text-align: left;">

        <form method="post" action="register_finish.aspx" onsubmit="return validate_form(this)" id="myform">
          <div class="col-md-12">
              <div class="col-md-10 col-md-offset-2" style="text-align: left;">
                    <span class="titleName">Name(English): </span>
                    <input type="text" name="english_name">
                </div>
             </div>
            <div class="col-md-12" style="height: 30px;"></div>
            <div class="col-md-12 ">
                <div class="col-md-10 col-md-offset-2" style="text-align: left;">
                    <span class="titleName">Name(Chinese): </span>
                    <input type="text" name="chinese_name">
                </div>
            </div>
            <div class="col-md-12" style="height: 30px;"></div>
            <div class="col-md-12">
              <div class="col-md-10 col-md-offset-2">
                  <span class="titleName">Major/Position:  </span>
                  <input type="text" name="position">
              </div>

                <div class="col-md-12" style="height: 30px;"></div>
                <div class="col-md-10 col-md-offset-2">
                    <p><span class="titleName">Department/Organization</span><span class="titleName">: </span>
                      <input type="text" name="department">
                    </p>
                </div>

                <div class="col-md-12" style="height: 30px;"></div>

                 <div class="col-md-10 col-md-offset-2"><span class="titleName">Contact Number:  </span>
                    <input type="text" name="phone_number">
                </div>

                <div class="col-md-12" style="height: 30px;"></div>

                <div class="col-md-10 col-md-offset-2">
                    <span class="titleName"> Email:  </span>
                    <input type="text" name="email">
                </div>

                <div class="col-md-12" style="height: 30px;"></div>

               

                <div class="col-md-10 col-md-offset-2">
                <span class="titleName">Would you like to be a volunteer for PROJECT FLAME?</span></div>
                
                <div class="col-md-4 col-md-offset-2">
                    <input type="radio" name="volunteer" value="Yes" id="in1"><label for="in1"></label>
                    <span class="titleLabel">Yes</span>
                
                    <input type="radio" name="volunteer" value="No" id="in2"><label for="in2"></label>
                    <span class="titleLabel">No</span>
                 
                </div>
                   <div class="col-md-12" style="height: 30px;"></div>
                <div class="col-md-10 col-md-offset-2">
                <span class="titleName">Would you like to join Project WeCan and become a volunteer?</span></div>
                
                <div class="col-md-4 col-md-offset-2">
                    <input type="radio" name="wecan" value="Yes" id="in3"><label for="in3"></label>
                    <span class="titleLabel">Yes</span>
                
                    <input type="radio" name="wecan" value="No" id="in4"><label for="in4"></label>
                    <span class="titleLabel">No</span>
                 
                </div>
                <div class="col-md-12" style="height: 30px;"></div>
                </div>
                <div class="col-md-8 col-md-offset-2" style="text-align: center;">
                    <button type="submit" style="display: inline-block; background: #98F900; font-size: 24px; padding: 3px 35px 3px 35px; color: #ffffff; border: 0px;">submit</button>
                </div>
                <div class="col-md-8 col-md-offset-2" style="height:20px;">
              </div>
            </form>
            </div>
    




</asp:Content>
