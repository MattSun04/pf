<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProjectFLAME.admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Project FLAME admin</title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script>
        $(function () {
            $("form").height($(window).height());
            $("#login").css("top", ($(window).height() / 2 - $("#login").height()));
        });
    </script>
</head>
<body style="margin: 0; padding: 0">
    
        <form runat="server" class="form-horizontal" role="form">
            <div class="col-md-4 col-md-offset-4" id="login">
                <div class="form-group">
                    <label class="col-lg-2 control-label">User:</label>
                    <div class="col-lg-10">
                        <asp:TextBox class="form-control" ID="user" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-lg-2 control-label">Password:</label>
                    <div class="col-lg-10">
                        <asp:TextBox TextMode="Password" ID="pass" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-offset-2 col-lg-10">
                      <asp:Button ID="Button1" runat="server" Text="Sign in" class="btn btn-default" OnClick="Button1_Click" />
                    </div>
                  </div>
                </div>
            
        </form>
    
    
</body>
</html>
