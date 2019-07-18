using System;
using System.Collections.Generic;

public partial class payablereport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        GenerateTableContent();
    }

    private void GenerateTableContent()
    {
        Payables clsPayables = new Payables();
        List<PayablesModel> lstPayables = new List<PayablesModel>();
        string output = "";

        lstPayables = clsPayables.Get(int.Parse(Session["User_Id"].ToString()));

        foreach (PayablesModel mdlPayables in lstPayables)
        {
            output += "<tr>";
            output += "<td>" + mdlPayables.Name + "</td>";
            output += "<td>" + mdlPayables.Amount + "</td>";
            if (mdlPayables.Type == 0)
            {
                output += "<td>Every '" + mdlPayables.DueDay + "' of the month</td>";
            }
            else
            {
                output += "<td>" + mdlPayables.DueDate + "</td>";
            }
            output += "</tr>";
        }

        tableBody.InnerHtml = output;
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