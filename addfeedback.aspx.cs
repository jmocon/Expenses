using System;

public partial class addFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
    }

    public void AddFeedback()
    {
        Feedback clsFeedback = new Feedback();
        clsFeedback.Add(int.Parse(Session["User_Id"].ToString()), txtMessage.Value);
    }

    private void CheckSession()
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

    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        string notif = "";
        if (txtMessage.Value == "")
        {
            notif += "<div class='alert alert-danger' role='alert'>";
            notif += "Please complete all fields!";
            notif += "</div>";
        }
        else
        {
            AddFeedback();
            txtMessage.Value = "";
            notif += "<div class='alert alert-success' role='alert'>";
            notif += "Successfully Added!";
            notif += "</div>";
        }
        divNotif.InnerHtml = notif;
    }
}