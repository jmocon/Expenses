using System;
using System.Globalization;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        DisplayTip();
        DisplayMoney();
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