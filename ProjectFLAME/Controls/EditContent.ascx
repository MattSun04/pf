<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditContent.ascx.cs" Inherits="ProjectFLAME.Controls.EditContent" %>
<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>
<legend>
    <ol class="breadcrumb">
        <asp:Literal ID="Literal2" runat="server"></asp:Literal>
    </ol>
</legend>
<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
    <asp:ListItem Selected="True">English</asp:ListItem>
    <asp:ListItem>Chinese</asp:ListItem>
</asp:DropDownList>
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
