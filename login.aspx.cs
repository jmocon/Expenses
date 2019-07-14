using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    public string notif = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User_Id"] != null)
        {
            Response.Redirect("index.aspx");
        }
    }

    protected void BtnLogin_ServerClick(object sender, EventArgs e)
    {
        int id = 0;

        string username = txtUsername.Value;
        string password = txtPassword.Value;

        User clsUser = new User();

        id = clsUser.Login(username, password);

        if (id != 0)
        {
            notif = "<div class='alert alert-success' role='alert'>";
            notif += "<h4 class='alert-heading'>Successfully Logged In.</h4>";
            notif += "<p>Please wait. Redirecting...</p>";
            notif += "</div>";
            Session["User_Id"] = id;
            Response.Redirect("index.aspx");
        }
        else
        {
            notif = "<div class='alert alert-danger' role='alert'>";
            notif += "<h4 class='alert-heading'>Authentication Failed.</h4>";
            notif += "<p>Please check your Username and Password.</p>";
            notif += "</div>";
        }
    }
}