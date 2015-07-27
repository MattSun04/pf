<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="upcoming.aspx.cs" Inherits="ProjectFLAME.admin.Upcoming" %>

<asp:Content ID="message" ContentPlaceHolderID="message" runat="server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/jquery.simple-dtpicker.css" rel="stylesheet" />
    <script src="js/jquery.simple-dtpicker.js"></script>
    <script>
        $(function () {
            $('input[id$="Time"]').appendDtpicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>
        <ol class="breadcrumb">
            <li>Upcoming Events</li>
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
            <asp:TemplateField HeaderText="NameCN">
                <ItemTemplate>
                    <asp:Label ID="lblNameCN" runat="server" Text='<%#Eval("nameCN") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNameCN" runat="server" Text='<%#Eval("nameCN") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddNameCN" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Time">
                <ItemTemplate>
                    <asp:Label ID="lblTime" runat="server" Text='<%#Eval("time") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtTime" runat="server" Text='<%#Eval("time") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddTime" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Venue">
                <ItemTemplate>
                    <asp:Label ID="lblVenue" runat="server" Text='<%#Eval("venue") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtVenue" runat="server" Text='<%#Eval("venue") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddVenue" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="VenueCN">
                <ItemTemplate>
                    <asp:Label ID="lblVenueCN" runat="server" Text='<%#Eval("venueCN") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtVenueCN" runat="server" Text='<%#Eval("venueCN") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddVenueCN" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="lblDescription" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:HyperLink ID="HyperLink1" Target="_blank" NavigateUrl='<%#"upcoming_des.aspx?cid=" + Eval("ID") %>' runat="server">Edit</asp:HyperLink>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox Rows="4" ID="txtAddDescription" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="DescriptionCN">
                <ItemTemplate>
                    <asp:Label ID="lblDescriptionCN" runat="server" Text='<%#Eval("descriptionCN") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:HyperLink ID="HyperLink2" Target="_blank" NavigateUrl='<%#"upcoming_des.aspx?cid=" + Eval("ID") %>' runat="server">Edit</asp:HyperLink>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox Rows="4" ID="txtAddDescriptionCN" runat="server"></asp:TextBox>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Image link (if any)">
                <ItemTemplate>
                    <asp:Image ID="lblImage" style="max-width: 200px;" ImageUrl='<%#Eval("image") %>' runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtImage" runat="server" Text='<%#Eval("image") %>'></asp:TextBox>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtAddImage" runat="server"></asp:TextBox>
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
