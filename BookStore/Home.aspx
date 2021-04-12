<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BookStore.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <br />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <div style="margin-top: 10px; font-weight: bold; font-size: xx-large; margin-bottom: 10px; color: #FF9933; font-family: 'Comic Sans MS', Monospace; text-align: center;">Home<br />
            <asp:Image ID="Image1" runat="server" Height="870px" ImageUrl="~/image/home.jpg" Width="1468px" />
            <br/>
    </div>
 

</asp:Content>
