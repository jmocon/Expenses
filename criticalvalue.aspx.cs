using System;

public partial class criticalvalue : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        if (!IsPostBack)
        {
            DisplayCritical();
        }
    }

    public void DisplayCritical()
    {
        Critical clsCritical = new Critical();
        txtAmount.Value = clsCritical.GetAmount(int.Parse(Session["User_Id"].ToString())).ToString();
    }

    public void UpdateValue()
    {
        Critical clsTransaction = new Critical();

        clsTransaction.Update(int.Parse(Session["User_Id"].ToString()), decimal.Parse(txtAmount.Value));
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
        if (txtAmount.Value == "")
        {
            notif += "<div class='alert alert-danger' role='alert'>";
            notif += "Please complete all fields!";
            notif += "</div>";
        }
        else
        {
            UpdateValue();
            notif += "<div class='alert alert-success' role='alert'>";
            notif += "Successfully Added!";
            notif += "</div>";
        }
        divNotif.InnerHtml = notif;
    }
}