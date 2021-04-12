<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore.Master" AutoEventWireup="true" CodeBehind="Category.aspx.cs" Inherits="BookStore.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            margin-left: 46px;
        }
        .auto-style4 {
            background-color: #E7E7FF;
        }
        .auto-style5 {
            text-align: left;
        }
        .auto-style7 {
            color: #003399;
        }
        .auto-style8 {
            color: #FF6666;
        }
        .auto-style9 {
            background-color: #FFFFFF;
        }
        .auto-style10 {
            color: #FF6666;
            background-color: #FFFFFF;
        }
        .auto-style11 {
        margin-left: 124px;
    }
        .auto-style12 {
            margin-left: 45px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [name], [author], [yearOfPublice], [price], [category], [bookID], [quantity],[image] FROM [Book] WHERE ([category] = @category and [status]=1)">
        <SelectParameters>
            <asp:QueryStringParameter Name="category" QueryStringField="type" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="bookID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" RepeatColumns="3" Width="1454px" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
            <div class="auto-style5">
               <asp:Image ID="Image1" runat="server" CssClass="auto-style3" Height="222px" Width="332px"  ImageUrl='<%# Eval("image", "image/{0}") %>' 
            AlternateText='<%# Eval("bookID") %>'  />
                <br />
                
                <asp:TextBox ID="txtbookID" runat="server" Visible="False" Text='<%# Eval("bookID") %>' CssClass="auto-style12" Width="322px"></asp:TextBox>
                <br />
                <br />
                <span class="auto-style4"><span class="auto-style10">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Book name</span></span><span class="auto-style8"><span class="auto-style9">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="nameLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("name") %>' />
                <br class="auto-style9" />
                <span class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="authorLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("author") %>' />
                <br class="auto-style9" />
                <span class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Category:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="categoryLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("category") %>' />
                <br class="auto-style9" />
                <span class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Published year:&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="yearOfPubliceLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("yearOfPublice") %>' />
                <br class="auto-style9" />
                <span class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Price:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="priceLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("price") %>' />
                <br class="auto-style9" />
                <span class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:Label ID="quantityLabel" runat="server" CssClass="auto-style9" Text='<%# Eval("quantity") %>' />
                <br />
                </span><span class="auto-style7">
                <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="lbDisplay" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnAdd" runat="server" CssClass="auto-style11" OnClick="btnAdd_Click" Text="Add to cart" Width="128px" />
                </span>
                <br />
            </div>
        </ItemTemplate>
    </asp:DataList>
    <p>
    </p>
</asp:Content>
