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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-QEN4LJI\SQLEXPRESS;Initial Catalog=BookStore;Integrated Security=SSPI");
            conn.Open();
  
            SqlCommand com = new SqlCommand("Select * From Account Where accountId = @accountId and password = @password", conn);
            com.Parameters.Add("@accountId", SqlDbType.NVarChar);
            com.Parameters.Add("@password", SqlDbType.NVarChar);
            com.Parameters["@accountId"].Value = txtUsername.Text;
            com.Parameters["@password"].Value = txtPass.Text;
            SqlDataReader dr = com.ExecuteReader();
            if (dr.Read())
            {
                //IsSuccessfull = true;
                //MessageBox.Show("The login is successful!");
                //this.Close();
                if ((bool)dr["role"]==false)
                {
                   
                } else
                Session["USERNAME"] = dr["fullname"];
                Response.Redirect("Admin.aspx");
             
            }
            else
            {
                String error = "The username or password is not correct!";
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + error + "');", true);
                //Login.MessageBox.Show("The login failed!");
                //txtUsername.Text = "";
                //txtPass.Text = "";
                //txtUsername.Focus();
            }
        }
    }
}