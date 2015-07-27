<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subscribe.aspx.cs" Inherits="ProjectFLAME.subscribe" %>


<!DOCTYPE html>
<html>
<head><meta charset="utf-8" /><title>
	Project Flame
</title><meta name="viewport" content="width=device-width, initial-scale=1.0" /><link rel="shortcut icon" href="images/PR_Logo_nobkgrd_130412.png" type="image/x-icon" />
    <!-- Bootstrap -->
    <link href="css/bootstrap.css" rel="stylesheet" media="screen" /><link href="css/bootstrap-responsive.css" rel="stylesheet" /><link rel="stylesheet" type="text/css" href="css/global.css" />

    <!-- plug css -->
    <link rel="stylesheet" type="text/css" href="plugin/liquid-slider/css/liquid-slider.css" />
    <!-- js -->
    <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
    <script src="plugin/liquid-slider/js/jquery.easing.1.3.js"></script>
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<form runat="server">
<div class="hero-unit">
  <h1><asp:Literal ID="head1" runat="server" /></h1>
  <h3><asp:Literal ID="p" runat="server" /></h3>
  <h5><small><asp:Literal ID="small" runat="server" /><asp:Button ID="undo" class="btn btn-danger btn-small" Text="" runat="server" OnClick="undo_Click"/><asp:Button ID="undo1" class="btn btn-danger btn-small" Text="" runat="server" OnClick="undo1_Click"/></small></h5>
  <p>
    <a href="index.aspx" class="btn btn-inverse btn-large">
      Back to ProjectFlame
    </a>
  </p>
</div>
</form>
</body>
</html>