<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.Master" AutoEventWireup="true" CodeBehind="upcoming_des.aspx.cs" Inherits="ProjectFLAME.admin.upcoming_des" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="message" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<asp:Literal ID="Literal1" runat="server"></asp:Literal>
<CKEditor:CKEditorControl ID="CKEditor1" runat="server" Toolbar="
    Source 
    Cut|Copy|Paste|PasteText|PasteFromWord|-|Undo|Redo 
    Form|Checkbox|Radio|TextField|Textarea|Select|Button|ImageButton|HiddenField
    Bold|Italic|Underline|Strike|Subscript|Superscript|-|RemoveFormat
    NumberList|BulletList|-|Outdent|Indent|-|Blockquote|CreateDiv|-|JustifyLeft|JustifyCenter|JustifyRight|JustifyBlock|-|BidiLtr|BidiRtl
    Link|Unlink|Anchor
    Image|Table|HorizontalRule|Smily|SpecialChar|PageBreak|Iframe
    Styles|Format|Font|FontSize
    TextColor|BGColor
    Maxmize|ShowBlocks">
</CKEditor:CKEditorControl>
<asp:Button ID="Button1" runat="server" Text="Preview" OnClick="Preview_Click" />
<asp:Button ID="Button2" runat="server" Text="Submit" OnClick="Submit_Click"/>

</asp:Content>
