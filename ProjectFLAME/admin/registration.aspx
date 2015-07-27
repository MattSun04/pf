<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="registration.aspx.cs" Inherits="ProjectFLAME.admin.registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <legend>
        <ol class="breadcrumb">
            <li>Volunteer</li>
            <li>Registration information</li>
        </ol>
    </legend>

                <asp:GridView class="table table-striped table-condensed table-bordered" border="0" ID="registration1" runat="server" AutoGenerateColumns="false" AllowPaging="true" 
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
                        <asp:TemplateField HeaderText="en_name">
                            <ItemTemplate>
                                <asp:Label ID="lblEn_name" runat="server" Text='<%#Eval("en_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEn_name" runat="server" Text='<%#Eval("en_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddEn_name" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="cn_name">
                            <ItemTemplate>
                                <asp:Label ID="lblCn_name" runat="server" Text='<%#Eval("cn_name") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtCn_name" runat="server" Text='<%#Eval("cn_name") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddCn_name" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="major">
                            <ItemTemplate>
                                <asp:Label ID="lblMajor" runat="server" Text='<%#Eval("major") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtMajor" runat="server" Text='<%#Eval("major") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddMajor" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="department">
                            <ItemTemplate>
                                <asp:Label ID="lblDepartment" runat="server" Text='<%#Eval("department") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtDepartment" runat="server" Text='<%#Eval("department") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddDepartment" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                         <asp:TemplateField HeaderText="contact_num">
                            <ItemTemplate>
                                <asp:Label ID="lblContact_num" runat="server" Text='<%#Eval("con_num") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtContact_num" runat="server" Text='<%#Eval("con_num") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddContact_num" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField> 
                        
                        <asp:TemplateField HeaderText="email">
                            <ItemTemplate>
                                <asp:Label ID="lblEmail" runat="server" Text='<%#Eval("email") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtEmail" runat="server" Text='<%#Eval("email") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddEmail" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                     
                         <asp:TemplateField HeaderText="Volunteer for PF?">
                            <ItemTemplate>
                                <asp:Label ID="lblPF" runat="server" Text='<%#Eval("pf") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtPF" runat="server" Text='<%#Eval("pf") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddPF" runat="server"></asp:TextBox>
                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Volunteer for wecan?">
                            <ItemTemplate>
                                <asp:Label ID="lblWC" runat="server" Text='<%#Eval("wecan") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:TextBox ID="txtWC" runat="server" Text='<%#Eval("wecan") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:TextBox ID="txtAddWC" runat="server"></asp:TextBox>
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
    <asp:Literal ID="Literal1" runat="server"></asp:Literal>




</asp:Content>
