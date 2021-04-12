using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CUSTCART"] == null)
            {
                Literal1.Text = "Sorry, Your shopping cart is empty";
                this.btnOrder.Enabled = false;
            }
            else
            {
                this.btnOrder.Enabled = true;
                // Retrieves the data from the Session object into the DataTable object
                DataTable dataTable = (DataTable)Session["CUSTCART"];
                // Calculate the total order value
                GetTotalAmount(dataTable, this.Literal2);
                DataList1.DataSource = dataTable;
                DataList1.DataBind();
            }
        }

        void GetTotalAmount(DataTable dataTable, Literal literal)
        {
            int totalAmount = 0;
            foreach (DataRow dataRow in dataTable.Rows)
            {
                totalAmount += Convert.ToInt32(dataRow["Quantity"])
                * Convert.ToInt32(dataRow["Price"]);
            }
            literal.Text = totalAmount.ToString("#,###,00");
        }

        protected void btnOrder_Click(object sender, EventArgs e)
        {
            SqlConnection conn = null;
            SqlCommand com = null;
            SqlDataReader dr = null;
            try
            {
                conn = new SqlConnection(@"Data Source=DESKTOP-QEN4LJI\SQLEXPRESS;Initial Catalog=BookStore;Integrated Security=SSPI");
                conn.Open();
                com = new SqlCommand("Insert into OrderHeader(customerName, contactPerson, " +
                    "address, tel, paymentType, description, totalValue, registerDate) values(@customerName, @contactPerson, " +
                    "@address, @tel, @paymentType, @description, @totalValue, @registerDate)", conn);
                com.Parameters.Add("@customerName", SqlDbType.VarChar, 50);
                com.Parameters.Add("@contactPerson", SqlDbType.VarChar, 100);
                com.Parameters.Add("@address", SqlDbType.VarChar, 100);
                com.Parameters.Add("@tel", SqlDbType.VarChar, 15);
                com.Parameters.Add("@paymentType", SqlDbType.VarChar, 50);
                com.Parameters.Add("@description", SqlDbType.VarChar, 100);
                com.Parameters.Add("@totalValue", SqlDbType.Float);
                com.Parameters.Add("@registerDate", SqlDbType.Date);
                com.Parameters["@customerName"].Value = this.txtFullName.Text;
                com.Parameters["@contactPerson"].Value = this.txtContact.Text;
                com.Parameters["@address"].Value = txtAddress.Text;
                com.Parameters["@tel"].Value = txtTel.Text;
                com.Parameters["@paymentType"].Value = ddlPayType.SelectedValue;
                com.Parameters["@description"].Value = txtDescription.Text;
                com.Parameters["@totalValue"].Value = Literal2.Text;
                com.Parameters["@registerDate"].Value = new DateTime();
                com.ExecuteScalar();

                com = new SqlCommand("Select Max(orderId) as id From OrderHeader" , conn);
                dr = com.ExecuteReader();
                dr.Read();
                string id = dr["id"].ToString();
                if (dr != null)
                {
                    dr.Close();
                }

                for (int i = 0; i < DataList1.Items.Count; i++)
                {
                    Label labelID = (Label)DataList1.Items[i].FindControl("lblID");
                    com = new SqlCommand("Insert into OrderDetail(orderId, bookId, quantity, price)" +
                        " values(@orderId, @bookId, @quantity, @price)", conn);
                    com.Parameters.Add("@orderId", SqlDbType.Int);
                    com.Parameters["@orderId"].Value = id;
                    com.Parameters.Add("@bookId", SqlDbType.Int);
                    com.Parameters["@bookId"].Value =  labelID.Text;
                    labelID = (Label)DataList1.Items[i].FindControl("lblQuantity");
                    com.Parameters.Add("@quantity", SqlDbType.Int);
                    com.Parameters["@quantity"].Value = labelID.Text;
                    labelID = (Label)DataList1.Items[i].FindControl("lblPrice");
                    com.Parameters.Add("@price", SqlDbType.Float);
                    com.Parameters["@price"].Value = labelID.Text;

                    com.ExecuteScalar();
                }


                Session.Remove("CUSTCART");
             
                Session["CHECKOUTSS"] = "SS";
                Response.Redirect("Yourcart.aspx"); ;

            }
            catch (Exception ex)
            {
                Literal1.Text = ex.Message;
            }
            finally
            {
                
                if(conn != null)
                {
                    conn.Close();
                }
            }
        }
    }
}