<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload_To_Database.aspx.cs" Inherits="ProjectFLAME.admin.Upload_To_Database" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Project FLAME Upload Page</title>
    <link href="../css/bootstrap.css" rel="stylesheet" />
    <link href="../css/bootstrap-theme.css" rel="stylesheet" />
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script type="text/javascript">
        var count = 0;
        function ItemRow(file) {
            var row = this;
            this.ele = document.createElement('tr');
            var deleteTd = document.createElement('td');
                var deleteBtn = $('<button class="btn btn-sm btn-danger" data-id="'+file['id'][count]['id']+'"></button>');
                $(deleteBtn).text('Delete').click(function(){
                    if (confirm("Confirm to delete?")){
                        var condition = {
                            mode: 'DeleteRow',
                            id: $(this).attr('data-id')//to be modified
                        }
                        $(deleteBtn).text('Deleting');
                        $.ajax({
                            url: 'handle_File_Database.ashx',
                            type: 'POST',
                            data: condition,
                            success: function(response){
                                $(row.ele).fadeOut();
                            }
                        });
                    }
                });
                $(deleteTd).append(deleteBtn);
            var file_name = $('<td/>');
                $(file_name).text(file['file_name'][count]['file_name']);
            var location = $('<td/>');
            $(location).text("http://www6.cityu.edu.hk/projectflame/handle_URL.ashx?id=" + file['id'][count]['id']);
                $(this.ele).append(file_name).append(location).append(deleteTd);
                count ++;
            return this.ele;
        }
    </script>
    <script type="text/javascript">
        var load = function fetchData() {
            var condition = {
                mode: 'getdata'
            };
            $.ajax({
                url: 'handle_File_Database.ashx',
                type: 'POST',
                data: condition,
                success: function (data) {
                    for (i = 0; i < data['id'].length; i++) {
                        debugger;
                        var row = new ItemRow(data);//itemrow needed to be created
                        $('#manage_table').append(row);
                    }

                }
            });
        }
        load();
    </script>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="panel panel-default">
        
        <div class="panel-heading">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Back to admin home page" />
            <br />
            <br />
            -------------------------------------------------<br />
            <br />
            Upload Files to Database:</div>
        <div class="panel-body">
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br/>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <br/>
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>
        <h3><b>Uploaded Files:</b></h3>
        <!-- Table -->
        <table class="table" id="manage_table">
            <tr>
                <th class="col-lg-4">File Name</th>
                <th>File Destination</th>
                <th class="col-lg-1">Delete</th>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
