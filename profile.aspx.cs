using System;

public partial class profile : System.Web.UI.Page
{
    public UserModel mdlUser;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();

        User clsUser = new User();
        mdlUser = clsUser.Get(Session["User_Id"].ToString());
    }

    public void CheckSession()
    {
        if (Session["User_Id"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {
            if (String.IsNullOrWhiteSpace(Session["User_Id"].ToString()) || Session["User_Id"].ToString() == "0")
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}