<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="YourCart.aspx.cs" Inherits="BookStore.YourCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            margin-left: 186px;
        }
        .auto-style4 {
            margin-left: 171px;
        }
        .auto-style5 {
            margin-left: 13px;
        }
        .auto-style6 {
            width: 385px;
            height: 102px;
        }
        .auto-style8 {
            width: 464px;
        }
        .auto-style9 {
            width: 464px;
            height: 18px;
        }
        .auto-style10 {
            width: 73px;
            height: 18px;
        }
        .auto-style11 {
            width: 9px;
            height: 18px;
        }
        .auto-style12 {
            width: 761px;
            height: 18px;
        }
        .auto-style13 {
            width: 73px;
        }
        .auto-style15 {
            width: 761px;
        }
        .auto-style16 {
            margin-left: 172px;
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px; font-weight: bold; font-size: xx-large; margin-bottom: 10px; color: #FF9933; font-family: 'Comic Sans MS', Monospace; text-align: center;">Your cart<br />
            <br/>
    </div>
    <asp:Label ID="lbEmpty" runat="server"></asp:Label>
    <asp:DataList ID="DataList1" runat="server"  RepeatColumns="2" RepeatDirection="Horizontal" Width="100%" BorderStyle="Groove" CellPadding="30" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" OnItemCommand="DataList1_ItemCommand" >
        <ItemTemplate>
            <table class="auto-style6">
                <tr>
                    <td valign="top" class="auto-style9">
                        &nbsp;<asp:CheckBox ID="chkID" runat="server" />
                    </td>
                    <td valign="top" class="auto-style10">ID </td>
                    <td valign="top" class="auto-style11">: </td>
                    <td valign="top" class="auto-style12">
                        <asp:Label ID="lblID" runat="server" ForeColor="#FF3300" Text='<%# Bind("ID") %>' Width="30px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style8">&nbsp;</td>
                    <td valign="top" class="auto-style13">Name </td>
                    <td style="width: 9px" valign="top">: </td>
                    <td valign="top" class="auto-style15">
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>' Width="154px"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style8">
                        <asp:Label ID="lbQuantityErr" runat="server"></asp:Label>
                    </td>
                    <td valign="top" class="auto-style13">Quantity </td>
                    <td style="width: 9px" valign="top">: </td>
                    <td valign="top" class="auto-style15">
                        <asp:TextBox ID="txtQuantity" runat="server" MaxLength="3" Text='<%# Bind("Quantity") %>' Width="58px" TextMode="Number"></asp:TextBox>
                        <asp:Button ID="btnUpdate" runat="server" CssClass="auto-style5" OnClick="btnUpdate_Click" Text="Update" Width="63px" />
                    </td>
                </tr>
                <tr>
                    <td valign="top" class="auto-style8"></td>
                    <td valign="top" class="auto-style13">SalesPrice </td>
                    <td style="width: 9px" valign="top">: </td>
                    <td valign="top" class="auto-style15">
                        <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>' Width="116px"></asp:Label>
                    </td>
                </tr>
            </table>
           
        </ItemTemplate>
           
    </asp:DataList>
    <br />
  <br />
            <asp:Button ID="btnEmpty" runat="server" OnClick="btnEmpty_Click" Text="Empty" Width="106px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnCheckout" runat="server" CssClass="auto-style4" Text="Check out" PostBackUrl="~/Checkout.aspx" />
            <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Remove" CssClass="auto-style16" OnClick="btnDelete_Click" Width="141px" />
            <br />
            <br />
</asp:Content>
