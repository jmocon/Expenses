using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class deleteTransaction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Form["Id"] != null)
        {
            if (Request.Form["Id"] != "")
            {
                Transaction clsTransaction = new Transaction();
                clsTransaction.Delete(int.Parse(Request.Form["Id"].ToString()));
            }
        }
    }
}