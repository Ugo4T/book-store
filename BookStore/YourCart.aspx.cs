using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class YourCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CHECKOUTSS"] != null)
            {
                String status = "Check out successfuly";
           
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + status + "');", true);
                Session["CHECKOUTSS"] = null;
            }
            if (!IsPostBack)
            {
                // If the cart does not exist yet
                if (Session["CUSTCART"] == null)
                {
                    lbEmpty.Text = "Sorry, Your shopping cart is empty";
                    this.btnDelete.Enabled = false;
                    this.btnEmpty.Enabled = false;
                    this.btnCheckout.Enabled = false;
                }
                // If the cart exists
                else
                {
                    this.btnDelete.Enabled = true;
                    this.btnEmpty.Enabled = true;
                    this.btnCheckout.Enabled = true;
                    DataTable dataTable = (DataTable)Session["CUSTCART"];
                    DataList1.DataSource = dataTable;
                    DataList1.DataBind();
                }
            }
           
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            DataTable dataTable = (DataTable)Session["CUSTCART"];
            string itemID = "";
            foreach (DataListItem dataListItem in DataList1.Items)
            {
                CheckBox checkBox = (CheckBox)dataListItem.FindControl("chkID");
                if (checkBox.Checked)
                {
                    Label labelID = (Label)dataListItem.FindControl("lblID");
                    itemID += labelID.Text + ",";
                    DeleteItems(labelID.Text, dataTable);
                }
            }
            if (itemID != "")
            {
                DataList1.DataSource = dataTable;
                DataList1.DataBind();
                if (this.DataList1.Items.Count == 0)
                {
                    lbEmpty.Text = "Your cart is empty. Let's go shopping";
                    this.btnDelete.Enabled = false;
                    this.btnEmpty.Enabled = false;
                    this.btnCheckout.Enabled = false;
                }
                
            }
        }

        void DeleteItems(string itemID, DataTable dataTable)
        {
            foreach (DataRow dataRow in dataTable.Rows)
            {
                if (itemID == dataRow["ID"].ToString())
                {
                    dataTable.Rows.Remove(dataRow);
                    break;
                }
            }
            Session["CUSTCART"] = dataTable;
        }

        protected void btnEmpty_Click(object sender, EventArgs e)
        {
            Session.Remove("CUSTCART");
            DataList1.DataSource = null;
            DataList1.DataBind();
            lbEmpty.Text = "Your Shopping Cart has been removed";
            this.btnDelete.Enabled = false;
            this.btnEmpty.Enabled = false;
            this.btnCheckout.Enabled = false;
        }



        void UpdateCart(string itemID, int itemQuantity,int price, DataListItem DataListItem)
        {

            TextBox txtQuantity = (TextBox)DataListItem.FindControl("txtQuantity");
            txtQuantity.Text = itemQuantity + "";
            
        }


        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            // Searches the controls in each DataListItem control
            DataListItem DataListItem = e.Item;
            TextBox txtQuantity = (TextBox)DataListItem.FindControl("txtQuantity");
            int quantity = int.Parse(txtQuantity.Text);

            Label labelId = (Label)DataListItem.FindControl("lblID");
            Button btnCheckout = (Button)DataListItem.FindControl("btnCheckout");

            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-QEN4LJI\SQLEXPRESS;Initial Catalog=BookStore;Integrated Security=SSPI");
            conn.Open();
            SqlCommand com = new SqlCommand("Select * From Book Where bookID = @bookID", conn);
            com.Parameters.Add("@bookID", SqlDbType.Int);
            com.Parameters["@bookID"].Value = labelId.Text;
            SqlDataReader dr = com.ExecuteReader();
            dr.Read();
            string BDprice = dr["price"].ToString();
            int price = int.Parse(BDprice);
            int quantityDB = (int)dr["quantity"];
            
            Label lbQuantityErr = (Label)DataListItem.FindControl("lbQuantityErr");
            lbQuantityErr.Text = "";
            if (quantityDB < quantity)
            {
                lbQuantityErr.Text = "Out of stock";
                this.btnCheckout.Enabled = false;
                Label lblPrice = (Label)DataListItem.FindControl("lblPrice");
                lblPrice.Text = quantity * price + "";
                return;
            }
            else
            {
                Label lblPrice = (Label)DataListItem.FindControl("lblPrice");
                lblPrice.Text = quantity * price + "";

                DataTable dataTable = (DataTable)Session["CUSTCART"];
                this.btnCheckout.Enabled = true ;
                for (int dataRow = 0; dataRow < dataTable.Rows.Count; dataRow++)
                {
                    if (dataTable.Rows[dataRow]["ID"].ToString() == labelId.Text)
                     
                    {
                        dataTable.Rows[dataRow]["QUANTITY"] = quantity;
                        dataTable.Rows[dataRow]["PRICE"] = price;
                     
                    }
                }
                Session["CUSTCART"] = dataTable;
            }
            UpdateCart(labelId.Text, quantity,price,DataListItem);
           
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {

        }

        protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}