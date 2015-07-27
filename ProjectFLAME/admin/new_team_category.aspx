<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="new_team_category.aspx.cs" Inherits="ProjectFLAME.admin.new_team_category" %>


<asp:Content ID="message" ContentPlaceHolderID="message" runat="server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
    <script src="js/jquery.simple-dtpicker.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>
        <ol class="breadcrumb">
            <li>Team Category</li>
        </ol>
    </legend>
    <asp:GridView ID="GridView1"  class="table table-striped table-condensed table-bordered" border="0" runat="server"
         ShowFooter="True" PageSize="15" OnPageIndexChanging="PageIndexChanging" OnRowCommand="RowCommand" 
        OnRowCancelingEdit="RowCancelEdit" OnRowEditing="RowEditing" OnRowUpdating="RowUpdating" OnRowDeleting="RowDeleting" AutoGenerateColumns="False" EnableModelValidation="True">
        <Columns>
            <asp:TemplateField HeaderText="ID" Visible="false">
                <ItemTemplate>
                    <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                </ItemTemplate> 
                <FooterTemplate>
                    <asp:Label ID="lbladd" runat="server"></asp:Label>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Name">
                <ItemTemplate>
                    <asp:Label ID="lblName" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtName" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddName" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="order">
                <ItemTemplate>
                    <asp:Textbox ID="sort"  Text='<%#Eval("sort") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtSort" runat="server" Text='<%#Eval("sort") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddSort" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Edit/Delete">
                <ItemTemplate>
                    <asp:LinkButton ID="btnEdit" Text="Edit" runat="server" CommandName="Edit" />
                    <span onclick="return confirm('Are you want to delete?')">
                        <asp:LinkButton ID="btnDelete" Text="Delete" CommandName="Delete" runat="server"/>
                    </span>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="btnUpdate" Text="Update" runat="server" CommandName="Update" />
                    <asp:LinkButton ID="btnCancel" Text="Cancel" runat="server" CommandName="Cancel" />
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:Button class="btn btn-xs btn-default" ID="btnInsert" runat="server" text="Add" CommandName="Insert" />
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>
