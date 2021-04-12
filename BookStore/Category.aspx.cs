using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            // Searches the controls in each DataListItem control
            DataListItem DataListItem = e.Item;
            TextBox Text1 = (TextBox)DataListItem.FindControl("txtbookID");

          
            Label labelName = (Label)DataListItem.FindControl("nameLabel");
          
            Label labelPrice = (Label)DataListItem.FindControl("priceLabel");
            Label lbDisplay = (Label)DataListItem.FindControl("lbDisplay");

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-QEN4LJI\SQLEXPRESS;Initial Catalog=BookStore;Integrated Security=SSPI");
            conn.Open();
            SqlCommand com = new SqlCommand("Select * From Book Where bookID = @bookID", conn);
            com.Parameters.Add("@bookID", SqlDbType.Int);
            com.Parameters["@bookID"].Value = Text1.Text;
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
         
            int quantityDB = (int)dr["quantity"];

            int quantity = 0;
           
               
            if (Session["CUSTCART"] != null) {
                DataTable dataTable = (DataTable)Session["CUSTCART"];
                for (int dataRow = 0; dataRow < dataTable.Rows.Count; dataRow++)
                {
                    if (dataTable.Rows[dataRow]["ID"].ToString() == Text1.Text)

                    {

                        quantity = Convert.ToInt32(dataTable.Rows[dataRow]["Quantity"]);
                   
                    }
                }

                if (quantityDB <= quantity)
                {
                    lbDisplay.Text = "Out of stock";
                    return;
                }
            }
                



            AddToShoppingCart(Text1.Text,labelName.Text,labelPrice.Text);
           
        }

        void AddToShoppingCart(string itemID, string itemName, string itemPrice)
        {
            DataTable dataTable;
            // If this object does not already exist, initialize the DataTable object and 
            // then add the information of the selected product to the DataTable object
            if (Session["CUSTCART"] == null)
            {
                dataTable = new DataTable();
                dataTable.Columns.Add("ID");
                dataTable.Columns.Add("Name");
                dataTable.Columns.Add("Quantity");
                dataTable.Columns.Add("Price");
            }
            // If the Shopping Cart object already exists, you declare to convert the data 
            // type of this object into the DataTable object
            else
            {
                dataTable = (DataTable)Session["CUSTCART"];
            }
            // Check whether the product already exists in ShoppingCart
            Common cls = new Common();
            int indexOfItem = cls.IsExistItemInShoppingCart(itemID, dataTable);
            // If there are already, update add 1 
            if (indexOfItem != -1)
            {
                dataTable.Rows[indexOfItem]["Quantity"] = Convert.ToInt32(dataTable.Rows[indexOfItem]["Quantity"]) + 1;
            }
            // If not, add a new product to Shopping Cart
            else
            {
                DataRow dataRow = dataTable.NewRow();
                dataRow["ID"] = itemID;
                dataRow["Name"] = itemName;
                dataRow["Quantity"] = "1";
                dataRow["Price"] = itemPrice;
                dataTable.Rows.Add(dataRow);
            }
            // Assign the DataTable object to the Session object
            Session["CUSTCART"] = dataTable;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}