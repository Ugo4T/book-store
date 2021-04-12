<%@ Page Title="" Language="C#" MasterPageFile="~/BookStore2.master" AutoEventWireup="true" CodeBehind="ViewProducts.aspx.cs" Inherits="BookStore.ViewProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top: 10px; font-weight: bold; font-size: xx-large; margin-bottom: 10px; color: #FF9933; font-family: 'Comic Sans MS', Monospace; text-align: center;">Product Management</div><br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" DataKeyNames="bookID" 
        DataSourceID="SqlDataSource1" PageSize="5" Width="100%" CellPadding="4" 
        ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="bookID" HeaderText="bookID" 
                InsertVisible="False" ReadOnly="True" SortExpression="bookID" >
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="name" 
                SortExpression="name" >
            </asp:BoundField>
            <asp:BoundField DataField="author" HeaderText="author" 
                SortExpression="author" >
            </asp:BoundField>
            <asp:BoundField DataField="yearOfPublice" HeaderText="yearOfPublice" 
                SortExpression="yearOfPublice" >
            </asp:BoundField>
            <asp:BoundField DataField="category" HeaderText="category" 
                SortExpression="category" >
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" 
                SortExpression="price" >
            </asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="quantity" 
                SortExpression="quantity" >
            </asp:BoundField>
            <asp:BoundField DataField="image" HeaderText="image" 
                SortExpression="image" >
            </asp:BoundField>
            <asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />
        </Columns>
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#FFCC66" HorizontalAlign="Center" ForeColor="Blue" />
        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
        <SelectedRowStyle BackColor="White" Font-Bold="False" ForeColor="Blue" />
        <SortedAscendingCellStyle BackColor="#FDF5AC" />
        <SortedAscendingHeaderStyle BackColor="#4D0000" />
        <SortedDescendingCellStyle BackColor="#FCF6C0" />
        <SortedDescendingHeaderStyle BackColor="#820000" />
    </asp:GridView>
     Get image here: <asp:FileUpload ID="FileUpload1"  runat="server" Width="70px" ClientIDMode="Static"  />
  
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Get name of Image"  />
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <br />
    <asp:DetailsView ID="DetailsView1" runat="server" Height="16px" Width="92%" 
        AutoGenerateRows="False" DataKeyNames="bookID" 
        DataSourceID="SqlDataSource2" BackColor="White" 
        BorderColor="#CC9966" BorderWidth="1px" CellPadding="4" BorderStyle="None" AllowPaging="True">
        <EditRowStyle BackColor="#FFCC66" ForeColor="#663399" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="bookID" HeaderText="bookID" 
                InsertVisible="False" ReadOnly="True" SortExpression="bookID">
            </asp:BoundField>
            <asp:BoundField DataField="name" HeaderText="name" 
                SortExpression="name">
            </asp:BoundField>
            <asp:BoundField DataField="author" HeaderText="author" 
                SortExpression="author">
            </asp:BoundField>
            <asp:BoundField DataField="yearOfPublice" HeaderText="yearOfPublice" 
                SortExpression="yearOfPublice">
            </asp:BoundField>
            <asp:BoundField DataField="category" HeaderText="category" 
                SortExpression="category">
            </asp:BoundField>
            <asp:BoundField DataField="price" HeaderText="price" 
                SortExpression="price">
            </asp:BoundField>
            <asp:BoundField DataField="quantity" HeaderText="quantity" 
                SortExpression="quantity">
            </asp:BoundField>
            <asp:BoundField DataField="image" HeaderText="image" 
                SortExpression="image">
            </asp:BoundField>
            <asp:CheckBoxField DataField="status" HeaderText="status" SortExpression="status" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" 
            HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        SelectCommand="SELECT * FROM [Book]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn %>" 
        DeleteCommand="UPDATE [Book] SET [status]  = 0
WHERE [bookID]= @bookID" 
        InsertCommand="INSERT INTO 
[Book] 
([name],[author],[yearOfPublice],[Category],[price],[quantity],[image],[status]) VALUES (@name,@author,@yearOfPublice,@Category,@price,@quantity,@image,1)" 
        SelectCommand="SELECT * FROM [Book] WHERE ([BookID] = @BookID)" 
        UpdateCommand="UPDATE [Book] SET [name] = @name, [author] = @author, 
[yearOfPublice]=@yearOfPublice,
[Category]=@Category,
[price]=@price,
[quantity]=@quantity,

[image]=@image,
[status]=@status
WHERE [bookID]= @bookID">
        <DeleteParameters>
            <asp:Parameter Name="BookID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="yearOfPublice" />
            <asp:Parameter Name="Category" />
            <asp:Parameter Name="price" />
            <asp:Parameter Name="quantity" />
            <asp:Parameter Name="image" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="BookID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" />
            <asp:Parameter Name="author" />
            <asp:Parameter Name="yearOfPublice" />
            <asp:Parameter Name="Category" />
            <asp:Parameter Name="price" />
            <asp:Parameter Name="quantity" />
            <asp:Parameter Name="image"  />
            <asp:Parameter Name="status" />
            <asp:Parameter Name="bookID" />
        </UpdateParameters>
    </asp:SqlDataSource>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
</asp:Content>
