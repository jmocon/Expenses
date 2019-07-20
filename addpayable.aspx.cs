using System;

public partial class addpayable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
    }

    public void AddNewDueDate()
    {
        Payables clsPayables = new Payables();
        PayablesModel mdlPayables = new PayablesModel();

        mdlPayables.User_Id = int.Parse(Session["User_Id"].ToString());
        mdlPayables.Name = txtName.Value;
        mdlPayables.Amount = decimal.Parse(txtAmount.Value);
        if (selType.Value== "0")
        {
            DateTime date = new DateTime(1800, 1, 1);
            mdlPayables.DueDate = date;
            mdlPayables.DueDay = int.Parse(txtDueDay.Value);
        }
        else
        {
            mdlPayables.DueDate = DateTime.Parse(txtDueDate.Value);
            mdlPayables.DueDay = 0;
        }
        mdlPayables.Type = int.Parse(selType.Value);

        clsPayables.Add(mdlPayables);
    }

    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        string notif = "";
        if (txtAmount.Value == "" || txtName.Value == "")
        {
            notif += "<div class='alert alert-danger' role='alert'>";
            notif += "Please complete all fields!";
            notif += "</div>";
        }
        else
        {
            if (selType.Value == "0")
            {
                if (txtDueDay.Value == "")
                {
                    notif += "<div class='alert alert-danger' role='alert'>";
                    notif += "Please complete all fields!";
                    notif += "</div>";
                }
                else
                {
                    AddNewDueDate();
                    notif += "<div class='alert alert-success' role='alert'>";
                    notif += "Successfully Added!";
                    notif += "</div>";
                }
            }
            else
            {
                if (txtDueDate.Value == "")
                {
                    notif += "<div class='alert alert-danger' role='alert'>";
                    notif += "Please complete all fields!";
                    notif += "</div>";
                }
                else
                {
                    AddNewDueDate();
                    notif += "<div class='alert alert-success' role='alert'>";
                    notif += "Successfully Added!";
                    notif += "</div>";
                }
            }
        }
        divNotif.InnerHtml = notif;
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
}