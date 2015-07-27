<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="Upcoming.aspx.cs" Inherits="ProjectFLAME.Upcoming" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
<script type="text/javascript">
    function calendar(day,month,year,count) {
        var container = "Container" + count;
        //本月第一天是星期几（距星期日离开的天数）
        var startDay = new Date(year, month - 1, 1).getDay();

        //本月有多少天(即最后一天的getDate()，但是最后一天不知道，我们可以用“上个月的0来表示本月的最后一天”)
        var nDays = new Date(year, month, 0).getDate();

        //开始画日历
        var numRow = 0;  //记录行的个数，到达7的时候创建tr
        var i;        //日期
        var html = '';
        html += '<table class="calendar" width="212"><tbody>';
        //第一行
        html += '<tr>';
        for (i = 0; i < startDay; i++) {
            html += '<td></td>';
            numRow++;
        }
        for (var j = 1; j <= nDays; j++) {
            //如果是今天则显示红色
            if (j == day) {
                html += '<td style="color:red" ' + '">';
                html += j;    //开始加日期
            }
            else {
                html += '<td>';
                html += j;    //开始加日期
            }
            html += '</td>';
            numRow++;
            if (numRow == 7) {  //如果已经到一行（一周）了，重新创建tr
                numRow = 0;
                html += '</tr><tr>';
            }
        }
        html += '</tbody></table>';
        document.getElementById(container).innerHTML = html;
    }

    $(function () {
        $('.navbar-collapse > .nav:first-child > li:nth-child(3)').addClass('active');
    });
    $(function(){
        var modal_height = $(window).height()-250;
        $(".modal-body").css("max-height", modal_height);
    });
    $(function(){
        var modal = window.location.hash;
        if (modal)
        $(modal).modal();
    })
</script>
   <style type="text/css">
     
 /*
        #LDay td 
        {
           font-size:80%;
           font-family:Georgia,serif;
           font-weight:100;
           text-align:center;
           margin-right:5px
        }
       */
    .Calendar {
            width: 212px;
            padding: 0;
            margin: 0;
            border-top: 1px solid #A2ADBC;
            border-left: 1px solid #A2ADBC;
           font-family:Georgia,serif;
           font-weight:300;
            font-size:110%;
            color: #616B76;
            text-align: center;
            background-color: #fff;
        }
    .Calendar td {
        border-right: 1px solid #A2ADBC;
        border-bottom: 1px solid #A2ADBC;
        width: 30px;
        height: 20px;
        text-align: center;
        background: url(images/bg_calendar.gif) no-repeat right bottom;
        }
       .Calendar td a:link, td a:visited {
        color: #608194;
         background: url(images/bg_calendar.gif) no-repeat;
        }

        .Calendar td a:hover, td a:active {
    color: #6aa3ae;
    background: url(images/bg_calendar.gif) no-repeat right top;
        }


       .table-no-border 
       {
           border:hidden;
           text-align:center;
       }
       .long_term {
       font-family:Georgia, serif;
       font-size:150%;
       font-weight:800;
       }
       .th {
       font-size:180%;
       text-align:center;
       width:70%
       }
       
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <!-- Modal -->
    <asp:Literal ID="modalPlaceholder" runat="server"></asp:Literal>
    <!-- /Modal -->
    <div class="container">
    	<div class="row">
        
        <legend><h1 style="font-family: Georgia, serif;">Upcoming Events</h1></legend>
        <div class="col-md-1">
            
        </div>
        <div class="col-md-11">
                <table class="table-no-border">
                    <thead>
                        <tr >
                         <th class="th" >Events<i>(Click titles for more details)</i></th>
                         <th style="font-size:160%;text-align:center"></th>
                        </tr>
                    </thead>
                    <tbody>
                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </tbody>
                </table>
         </div>
    		</div>
    	</div>
	
</asp:Content>
