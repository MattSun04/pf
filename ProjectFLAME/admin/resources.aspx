<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="resources.aspx.cs" Inherits="ProjectFLAME.admin.resources" %>
<asp:Content ID="message" ContentPlaceHolderID="message" runat="server">
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>
        <ol class="breadcrumb">
            <li>Resources</li>
            <li>Useful Websites</li>
        </ol>
    </legend>

                <asp:GridView class="table table-striped table-condensed table-bordered" border="0" ID="usefullinks" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
                    ShowFooter="true" PageSize="15" OnPageIndexChanging="PageIndexChanging" OnRowCommand="RowCommand" 
                    OnRowCancelingEdit="RowCancelEdit" OnRowEditing="RowEditing" OnRowUpdating="RowUpdating" OnRowDeleting="RowDeleting" EmptyDataText="no link">
                    <Columns>
                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="lbladd" runat="server"></asp:Label>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="description">
                            <ItemTemplate>
                                <asp:Label ID="lblDes" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDes" runat="server" Text='<%#Eval("description") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddDes" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="link">
                            <ItemTemplate>
                                <asp:Label ID="lblLink" runat="server" Text='<%#Eval("link") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtLink" runat="server" Text='<%#Eval("link") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddLink" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="comment">
                            <ItemTemplate>
                                <asp:Label ID="lblComment" runat="server" Text='<%#Eval("comment") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtComment" runat="server" Text='<%#Eval("comment") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddComment" runat="server"></asp:TextBox>
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
