<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="aboutus_team.aspx.cs" Inherits="ProjectFLAME.admin.aboutus_team" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="message" runat="server">
Our Team
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<legend>
    <ol class="breadcrumb">
        <li>About Us</li><li>Our Team</li>
    </ol>
</legend>

<script type="text/javascript">
//this for display team member
var numForCategory = new Array();
function deleting(ID) {
  var data = new Object();
  data['q'] = "delete";
  data['ID'] = ID;
  $.ajax({
    url: '../service/aboutus_team.ashx',
    type: 'POST',
    data: data,
    dataType: 'text'
  }).done(function(msg) {
    loadTeamMember();
    resetForm();
    if (msg == "success") {
      alert('Yeah');
    } else {
      alert(msg);
    }
  }).fail(function(){
    alert('fail');
  });
}
function edited(){
  var data = new Object();
  data['q'] = 'edit';
  data['ID'] = $('#idTxt').val();
  data['name'] = $('#nameTxt').val();
  data['title'] = $('#titleTxt').val();
  data['position'] = $('#positionTxt').val();
  data['link'] = $('#linkTxt').val();
  data['department'] = $('#departmentTxt').val();
  data['phone'] = $('#phoneTxt').val();
  data['email'] = $('#emailTxt').val();
  data['image_link'] = $('#imageTxt').val();
  data['category'] = $('#categorySelect').val();
  data['sort'] = $('#sortTxt').val();
  if (data['sort'] == null || data['sort'] == '') {
    data['sort'] = numForCategory[data['category']] + 1;
  }
  $.ajax({
    url: '../service/aboutus_team.ashx',
    type: 'POST',
    data: data,
    dataType: 'text'
  }).done(function(msg) {
    loadTeamMember();
    resetForm();
    if (msg == "success") {
      alert('Yeah');
    } else {
      alert(msg);
    }
  }).fail(function(){
  	alert('fail');
  });
}
function resetForm() {
	$('#edit-area input, #edit-area select').val(null);//reset the form
	$('#edit-area select option').remove();
}
function loadTeamMember(){
  var teamList;
  function TeamTableHeadRow(title){
    return $('<hr /><h3>' + title + '</h3>');
  }
  function TeamTableRow(info){
    var ele = $('<div style="margin: 5px" class="btn-group"/>');
    var a = $('<a type="button" class="btn btn-sm btn-default" data-id="' + info['ID'] + '">' + info['name'] + '</a>');
    $(a).click(function(){editMember($(this).attr('data-id'))});
    var del = $('<a type="button" class="btn btn-sm btn-danger" data-id="' + info['ID'] + '">x</a>');
    $(del).click(function(){
      deleting($(this).attr('data-id'));
    });
    $(ele).append(a).append(del);
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
    }
    return list;
  }

  function editMember(ID) {
    var info = findMember(ID);
    if (info != -1) {
      $('#idTxt').val(info['ID']);
      $('#nameTxt').val(info['name']);
      $('#titleTxt').val(info['title']);
      $('#positionTxt').val(info['position']);
      $('#linkTxt').val(info['link']);
      $('#departmentTxt').val(info['department']);
      $('#phoneTxt').val(info['phone']);
      $('#emailTxt').val(info['email']);
      $('#imageTxt').val(info['image_link']);
      $('#categorySelect').val(info['category']);
      $('#sortTxt').val(info['sort']);
    } else {

    }
  }

  function findMember(ID) {
    for (var i = 0; i < teamList.length; i ++) {
      for (var j = 0; j < teamList[i].length; j ++) {
        if (teamList[i][j]['ID'] == ID) {
          return teamList[i][j];
        }
      }
    }
    return -1;
  }
  $.get("../service/aboutus_team.ashx", function(data){
    $('#team-member').children().remove();
    teamList = sortList(data);
    debugger;
    for (var i = 0; i < data['category'].length; i ++){
      numForCategory[data['category'][i]['ID']] = teamList[i].length//
      $('#categorySelect').append('<option value="' + data['category'][i]['ID'] + '">' + data['category'][i]['name'] + '</option>');
      if (data['category'][i]['name'] != "none")
        $('#team-member').append(TeamTableHeadRow(data['category'][i]['name']));//load the title of a category
      for (var j = 0; j < teamList[i].length; j ++) {
        $('#team-member').append(TeamTableRow(teamList[i][j]));
        debugger;
      }
    }
  });
}
$(loadTeamMember);
</script>
<div id="team-member"></div>
<div class="text-center">
  <hr />
  <a class="btn btn-sm btn-primary" onclick="$('#edit-area input, #edit-area select').val(null);">add new member</a>
  <hr />
</div>
<div id="edit-area">
  <input type="hidden" id="idTxt">
  <label>Name: </label><input id="nameTxt" type="text"></input> <br>
  <label>Category: </label><select id="categorySelect">
    
  </select>
  <label>Title: </label><input id="titleTxt" type="text"/> <br>
  <label>Position: </label><input id="positionTxt" type="text"></input> <br>
  <label>Personal Page: </label><input id="linkTxt" type="url"></input> <br>
  <label>Department: </label><input id="departmentTxt" type="text"></input> <br>
  <label>Phone: </label><input id="phoneTxt" type="tel"></input> <br>
  <label>Email: </label><input id="emailTxt" type="email"></input> <br>
  <label>Image Link: </label><input id="imageTxt" type="url"></input> <br>
  <label>Order in this category</label><input id="sortTxt" type="number"></input><br>
  <a class="btn btn-sm btn-primary" onclick="edited();">ok</a>
</div>
</asp:Content>
