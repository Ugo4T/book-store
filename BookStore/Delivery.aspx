<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Delivery.aspx.cs" Inherits="BookStore.Delivery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style6 {
            width: 683px;
            height: 198px;
            margin-left: 379px;
        }
        .auto-style7 {
            width: 125px;
        }
        .auto-style8 {
            width: 109px;
        }
        .auto-style9 {
            width: 124px;
        }
        table{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px; font-weight: bold; font-size: xx-large; margin-bottom: 10px; color: #FF9933; font-family: 'Comic Sans MS', Monospace; text-align: center;">Delivery Time and Delivery Fees<br />
        <br/>
    </div>
   
    <p>
        TLL.com always try to bring a great buying experience to customers and the price is very reasonable.</p>
    <p>
        &nbsp;</p>
    <table  border="1" class="auto-style6"  >
        <thead>
              <tr>
            <th class="auto-style8">
                Content
            </th>
             <th class="auto-style7">
                 Ha Noi and Ho Chi Minh city
            </th>
             <th class="auto-style9">
                 Others location
            </th>
        </tr>
        </thead>
        <tbody>
         <tr>
            <td class="auto-style8">
                1. Delivery time
            </td>
            <td class="auto-style7">
                1 day
            </td>
            <td class="auto-style9">
                2 - 3 days
            </td>
        </tr>
              <tr>
            <td class="auto-style8">
                2. Delivery cost
            </td>
            <td class="auto-style7">
                1$
            </td>
            <td class="auto-style9">
                3$ for each 20km
            </td>
        </tr>
        </tbody>
       
    </table>
     <p>
         &nbsp;</p>
    <p>
        Delivery time does not include Saturday, Sunday, public holidays and New Year and does not include the remote island district.</p>
</asp:Content>
