using System;
using System.Collections.Generic;

public partial class MasterPage : System.Web.UI.MasterPage
{
    public string user_name = "";
    private string alertOutput = "";
    private int alertCounter = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        if (!IsPostBack)
        {
            CheckBalance();
            CheckDueDates();
            User clsUser = new User();
            user_name = clsUser.GetName(Session["User_Id"].ToString());
            DisplayAlert();
        }
    }

    private void DisplayAlert()
    {
        if (alertOutput == "")
        {
            alertOutput = "<span class=\"dropdown-item text-center small text-gray-500\">No Alerts</span>";
            counterAlert.Attributes.Add("style", "display:none;");
        }
        else
        {
            counterAlert.InnerText = alertCounter.ToString();
        }

        divAlert.InnerHtml = divAlert.InnerHtml + alertOutput;
    }

    private void CheckDueDates()
    {
        Payables clsPayables = new Payables();
        List<PayablesModel> lstPayables = new List<PayablesModel>();
        DateTime dateToday = DateTime.Now;

        lstPayables = new List<PayablesModel>();
        lstPayables = clsPayables.GetUpcomming(int.Parse(Session["User_Id"].ToString()), 3);

        foreach (PayablesModel mdl in lstPayables)
        {
            if (mdl.Type == 0)
            {
                int addDay = 0;
                if (dateToday.Day > mdl.DueDay)
                {
                    addDay = DateTime.DaysInMonth(dateToday.Year, dateToday.Month) - dateToday.Day + mdl.DueDay;
                }
                else
                {
                    addDay = mdl.DueDay - dateToday.Day;
                }
                mdl.DueDate = DateTime.Now.AddDays(addDay);
            }
        }

        lstPayables.Sort((x, y) => x.DueDate.CompareTo(y.DueDate));

        foreach (PayablesModel mdl in lstPayables)
        {
            alertCounter++;

            alertOutput += AlertContainer(
               "calendar-day",
               "warning",
               "Due Date: " + mdl.DueDate.ToString("MMM dd, yyyy"),
               "<p class='m-0'>Name: " + mdl.Name + "</p><p class='m-0'>" + "Amount: Php " + mdl.Amount + "</p>"
               );
            //if (mdl.Type == 0)
            //{
            //    alertOutput += AlertContainer(
            //       "calendar-day",
            //       "warning",
            //       "Due Date: " + dateToday.ToString("MMM") + " " + mdl.DueDay + ", " + dateToday.Year.ToString(),
            //       "<p class='m-0'>Name: " + mdl.Name + "</p><p class='m-0'>" + "Amount: Php " + mdl.Amount + "</p>"
            //       );
            //}
            //else
            //{
            //    alertOutput += AlertContainer(
            //       "calendar-day",
            //       "warning",
            //       "Due Date: " + mdl.DueDate.ToString("MMM dd, yyyy"),
            //       "<p class='m-0'>Name: " + mdl.Name + "</p><p class='m-0'>" + "Amount: Php " + mdl.Amount + "</p>"
            //       );
            //}
        }
    }

    private void CheckBalance()
    {
        Critical clsCritical = new Critical();
        Transaction clsTransaction = new Transaction();

        decimal critical = clsCritical.GetAmount(int.Parse(Session["User_Id"].ToString()));
        decimal amount = clsTransaction.GetTotal(int.Parse(Session["User_Id"].ToString()));

        if (critical >= amount)
        {
            alertCounter++;
            alertOutput += AlertContainer(
                "exclamation-triangle",
                "danger",
                "Balance Within Critical Level",
                "Spending Alert: We've noticed unusually high spending for your account."
                );
        }
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

    private string AlertContainer(string icon, string iconcolor, string title, string message)
    {
        string value = "";
        value += "<span class='dropdown-item d-flex align-items-center'>";
        value += "<div class='mr-3'>";
        value += "<div class='icon-circle bg-" + iconcolor + "'>";
        value += "<i class='fas fa-" + icon + " text-white'></i>";
        value += "</div>";
        value += "</div>";
        value += "<div>";
        value += "<div class='small text-gray-500'>" + title + "</div>";
        value += message;
        value += "</div>";
        value += "</span>";

        return value;
    }

    protected void btnLogout_ServerClick(object sender, EventArgs e)
    {
        Session.Clear();
        Session.Abandon();
        Response.Redirect("login.aspx");
    }
}