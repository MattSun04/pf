<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="resources2.aspx.cs" Inherits="ProjectFLAME.admin.resources2" %>
<asp:Content ID="message" ContentPlaceHolderID="message" runat="server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>
        <ol class="breadcrumb">
            <li>Resources</li>
            <li>Reports & Govertment Documents</li>
        </ol>
    </legend>
                <asp:GridView class="table table-striped table-condensed table-bordered" border="0" ID="usefullinks2" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                    ShowFooter="true" PageSize="15" OnPageIndexChanging="PageIndexChanging2" OnRowCommand="RowCommand2" 
                    OnRowCancelingEdit="RowCancelEdit2" OnRowEditing="RowEditing2" OnRowUpdating="RowUpdating2" OnRowDeleting="RowDeleting2" EmptyDataText="no link">
                    <Columns>
                        <asp:TemplateField HeaderText="ID">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Title">
                            <ItemTemplate>
                                <asp:Label ID="lblTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtTitle" runat="server" Text='<%#Eval("Title") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddTitle" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Introduction">
                            <ItemTemplate>
                                <asp:Label ID="lblIntro" runat="server" Text='<%#Eval("Introduction") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtIntro" runat="server" Text='<%#Eval("Introduction") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddIntro" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Label ID="lblImage" runat="server" Text='<%#Eval("Image") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtImage" runat="server" Text='<%#Eval("Image") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddImage" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>
                                <asp:Label ID="lblFile" runat="server" Text='<%#Eval("_File") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtFile" runat="server" Text='<%#Eval("_File") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddFile" runat="server"></asp:TextBox>
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