using System;
using System.Collections.Generic;
using System.Globalization;

public partial class index : System.Web.UI.Page
{
    private List<CategoryModel> lstCategory;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        Category clsCategory = new Category();
        lstCategory = clsCategory.Get();
        DisplayTip();
        DisplayMoney();
        DisplayTopTransaction();
    }

    private void DisplayTopTransaction()
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        string output = "";

        lstTransaction = clsTransaction.GetByDays(int.Parse(Session["User_Id"].ToString()),-30,20);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            output += "<tr>";
            output += "<td>" + mdlTransaction.DateCreated + "</td>";
            output += "<td>" + GetCategoryName(mdlTransaction.Category_Id) + "</td>";
            if (mdlTransaction.Type == 0)
            {
                output += "<td class='text-success font-weight-bold'>Php " + mdlTransaction.Amount + "</td>";
            }
            else
            {
                output += "<td class='text-danger font-weight-bold'>Php " + mdlTransaction.Amount + "</td>";
            }
            output += "</tr>";
        }

        tableBody.InnerHtml = output;
    }

    private void DisplayMoney()
    {
        Transaction clsTransaction = new Transaction();
        decimal income = 0;
        decimal expense = 0;
        decimal wallet = 0;

        income = clsTransaction.GetTotalIncome(int.Parse(Session["User_Id"].ToString()));
        expense = clsTransaction.GetTotalExpense(int.Parse(Session["User_Id"].ToString()));
        wallet = income - expense;

        totalIncome.InnerText = "Php " + income.ToString();
        totalExpense.InnerText = "Php " + expense.ToString();
        totalWallet.InnerText = "Php " + wallet.ToString();
    }

    private void DisplayTip()
    {
        Tips clsTips = new Tips();
        txtTip.InnerText = clsTips.GetMessage(GetWeekNumber(DateTime.Now));
    }

    private int GetWeekNumber(DateTime date)
    {
        DateTimeFormatInfo dfi = DateTimeFormatInfo.CurrentInfo;
        System.Globalization.Calendar cal = dfi.Calendar;

        return cal.GetWeekOfYear(date, dfi.CalendarWeekRule, dfi.FirstDayOfWeek);
    }

    private string GetCategoryName(int id)
    {
        return lstCategory.Find(x => x.Id == id).Name;
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