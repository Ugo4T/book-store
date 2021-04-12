using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BookStore
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
             if (Session["USERNAME"] == null) { Label1.Text = ""; }
              else
                Label1.Text = Session["USERNAME"].ToString();

            if (Session["ADMIN"] != null)
            {
                Label1.Text = "";
                Session["ADMIN"] = null;
                Session["USERNAME"] = null;
            }
           
        }
       
    }

    
}