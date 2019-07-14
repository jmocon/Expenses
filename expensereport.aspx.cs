using System;
using System.Collections.Generic;

public partial class expensereport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        GenerateTableContent();
    }

    private void GenerateTableContent()
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        string output = "";

        lstTransaction = clsTransaction.Get(int.Parse(Session["User_Id"].ToString()), 0);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            output += "<tr>";
            output += "<td>" + mdlTransaction.DateCreated + "</td>";
            output += "<td>" + mdlTransaction.Category_Id + "</td>";
            output += "<td>" + mdlTransaction.Amount + "</td>";
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