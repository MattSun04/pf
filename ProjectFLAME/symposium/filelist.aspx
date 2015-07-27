<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="filelist.aspx.cs" Inherits="ProjectFLAME.symposium.filelist" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>File List</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True" OnRowDeleting="RowDeleting" >
                    <Columns>
                        <asp:TemplateField HeaderText="id">
                            <ItemTemplate>
                                <asp:Label ID="lblPre" Text='<%# "sp3" + Eval("prefix") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="id">
                            <ItemTemplate>
                                <asp:Label ID="lblID" Text='<%# Eval("ID") %>' runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText ="file name">
                            <ItemTemplate>
                                <asp:HyperLink ID="linkFile" NavigateUrl='<%# "d.ashx?id=" + Eval("id") %>' Text='<%# Eval("name") %>' runat="server"></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="delete">
                            <ItemTemplate>
                                <span onclick="return confirm('Are you want to delete?')">
                                    <asp:LinkButton ID="btnDelete" Text="x" CommandName="Delete" runat="server"/>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
    
</asp:Content>
