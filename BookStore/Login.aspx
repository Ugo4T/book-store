<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookStore.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            height: 26px;
        }
        .auto-style4 {
            height: 30px;
        }
        .auto-style5 {
            height: 33px;
        }
        .auto-style6 {
            height: 34px;
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br/><br/>
    <div align="center">
        <table border="1" align="center" width="300"><tr><td align="center">
        <table width="250">
            <tr>
                <td colspan="2" class="auto-style4">
                    <div align="center"><h3 style="background-color: #008000; color: #FFFFFF; height: 26px; ">Login</h3></div>
                </td>
            
            </tr>
            <tr>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="Username" Width="90px"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
                </td>
            
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Label ID="Label4" runat="server" Text="Password" Width="90px"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
           
            </tr>
            <tr>
                <td colspan="2">
                    <div align="center" style="margin: 15px auto 10px auto"><asp:Button ID="BtnSubmit" runat="server" Text="Submit" OnClick="BtnSubmit_Click" /><br/></div>
                    <div align="center"><asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label> 
                        <br />
                        <br />
                        <br />
                        <br />
                    </div>
                </td>
            </tr>
        </table>
        </td></tr></table>
    </div>
</asp:Content>
