<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore2.master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="BookStore.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-family: "Times New Roman";
            font-size: 20px;
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px; font-weight: bold; font-size: xx-large; margin-bottom: 10px; color: #FF9933; font-family: 'Comic Sans MS', Monospace; text-align: center;">Share Permission of User</div><br />
<hr />
<table>
    <tr>
        <td height="250">
            <p><span style="font-family: 'Times New Roman', Times, serif; color: navy; font-size: 20px; font-weight: bold;">For&nbsp; Administrators</span></p>
            <p><span style="font-family: 'Times New Roman'; color: maroon; font-size: 20px;">+ For users who belong to Admin rules:</span>
            <span style="font-size: 20px">Have full control over all data of Book</span></p>
            <p><span style="font-family: 'Times New Roman', Times, serif; color: navy; font-size: 20px; font-weight: bold;">The program is written by:</span>
            <span class="auto-style1">TLL</span></p>
            <p style="text-align: justify; font-family: 'Times New Roman'; color: navy; font-size: 20px; vertical-align: middle;">Email:<span style="font-family: 'Times New Roman'; color: #0000FF; font-size: 20px;"> tlggdv4@gmail.com</span></p>
        </td>
    </tr>
</table>
<hr /><br /><br />
</asp:Content>
