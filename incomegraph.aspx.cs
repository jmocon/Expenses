using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class incomegraph : System.Web.UI.Page
{
    public string months;
    public string value;

    private class MonthModel
    {
        public int Id { get; set; }
        public string Month { get; set; }
        public decimal Amount { get; set; }
    }

    private List<MonthModel> lstMonth = new List<MonthModel>();

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        GetTopTransaction();
        DisplayTopTransaction();
    }

    private void GetTopTransaction()
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        HashSet<string> selectedMonths = new HashSet<string>();
        MonthModel mdlMonth = new MonthModel();

        lstTransaction = clsTransaction.GetByMonth(int.Parse(Session["User_Id"].ToString()), -6, 0);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            selectedMonths.Add(mdlTransaction.DateCreated.ToString("MMM"));
        }

        foreach (string item in selectedMonths)
        {
            mdlMonth = new MonthModel();
            mdlMonth.Month = item;
            mdlMonth.Amount = 0;
            lstMonth.Add(mdlMonth);
        }

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            lstMonth.Where(w => w.Month == mdlTransaction.DateCreated.ToString("MMM")).ToList().ForEach(s => s.Amount = (s.Amount + mdlTransaction.Amount));
        }
    }

    private void DisplayTopTransaction()
    {
        foreach (MonthModel mdlMonth in lstMonth)
        {
            if (months == "" || months == null)
            {
                months += "\"" + mdlMonth.Month + "\"";
                value += mdlMonth.Amount.ToString();
            }
            else
            {
                months += ",\"" + mdlMonth.Month + "\"";
                value += "," + mdlMonth.Amount.ToString();
            }
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
}