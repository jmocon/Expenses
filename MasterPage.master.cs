using System;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string user_name = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();

        User clsUser = new User();
        user_name = clsUser.GetName(Session["User_Id"].ToString());
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