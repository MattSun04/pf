<%@ Import Namespace="System.Data.OleDb" %>
<html>
<head>
<title>Subscribe List</title>
</head>
<body>
<script runat="server" language="vb">
Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control) 
End Sub

Sub export_excel(ByVal sender As Object, ByVal e As EventArgs)
	Response.AddHeader("content-disposition", "attachment;filename=subscribe_list.xls")
	Response.Charset = "utf-8"
	Response.ContentType = "application/vnd.xls"
	Dim sw As System.IO.StringWriter = New System.IO.StringWriter()
	Dim hw As System.Web.UI.HtmlTextWriter = New HtmlTextWriter(sw)
	GridView1.RenderControl(hw)
	Response.Write(sw.ToString())
	Response.End()
End Sub
</script>
	<a href="../">Back to Project Home Page</a>
	<h1>Subscribe List</h1>
	<form runat="server">
		<asp:GridView ID="GridView1" runat="server"
		AutoGenerateColumns="False" DataKeyNames="email" DataSourceID="subscribe">
			<Columns>
				<asp:BoundField DataField="email" HeaderText="Email" />
                <asp:BoundField DataField="time" HeaderText="Subscribe Time" />
			</Columns>
		</asp:GridView>

		<asp:SqlDataSource ID="subscribe" runat="server" 
		connectionstring="<%$ ConnectionStrings:MainConnStr %>"
		SelectCommand="select email,time from subscribe order by time ASC">
		</asp:SqlDataSource>

		<br />

		<asp:Button OnClick="export_excel" Text="Export as Excel" runat="server" />
	</form>
</body>
</html>
