using System;
using System.Collections.Generic;
using System.Linq;

public partial class summaryreport : System.Web.UI.Page
{
    private List<CategoryModel> lstCategory;

    private class CategoryAmountModel
    {
        public int Id { get; set; }
        public int Type { get; set; }
        public string Name { get; set; }
        public decimal Amount { get; set; }
    }

    private List<CategoryAmountModel> lstCategoryAmount;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        Category clsCategory = new Category();
        lstCategory = clsCategory.Get();
        lstCategoryAmount = TransferCategoryList(lstCategory);

        if (Request.QueryString["c"] == null)
        {
            GenerateTableContent();
        }
        else
        {
            if (Request.QueryString["c"].ToString() == "annual")
            {
                GenerateTableContent(true);
            }
            else
            {
                GenerateTableContent();
            }
        }
        DisplayCategory();
    }

    private void DisplayCategory()
    {
        string outputIncome = "";
        string outputExpense = "";

        foreach (CategoryAmountModel mdl in lstCategoryAmount)
        {
            if (mdl.Type == 0)
            {
                outputIncome += "<tr>";
                outputIncome += "<td>" + mdl.Name + "</td>";
                outputIncome += "<td>" + mdl.Amount + "</td>";
                outputIncome += "</tr>";
            }
            else
            {
                outputExpense += "<tr>";
                outputExpense += "<td>" + mdl.Name + "</td>";
                outputExpense += "<td>" + mdl.Amount + "</td>";
                outputExpense += "</tr>";
            }
        }

        incomeBody.InnerHtml = outputIncome;
        expenseBody.InnerHtml = outputExpense;
    }

    private List<CategoryAmountModel> TransferCategoryList(List<CategoryModel> lstCategory)
    {
        List<CategoryAmountModel> lst = new List<CategoryAmountModel>();

        foreach (CategoryModel mdlCategory in lstCategory)
        {
            CategoryAmountModel mdl = new CategoryAmountModel
            {
                Id = mdlCategory.Id,
                Type = mdlCategory.Type,
                Name = mdlCategory.Name,
                Amount = 0
            };

            lst.Add(mdl);
        }

        return lst;
    }

    private void GenerateTableContent(bool annual = false)
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        string output = "";

        if (annual)
        {
            lstTransaction = clsTransaction.GetAnnual(int.Parse(Session["User_Id"].ToString()));
        }
        else
        {
            lstTransaction = clsTransaction.Get(int.Parse(Session["User_Id"].ToString()));
        }

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
            lstCategoryAmount.Where(w => w.Id == mdlTransaction.Category_Id).ToList().ForEach(s => s.Amount = (s.Amount + mdlTransaction.Amount));
        }

        tableBody.InnerHtml = output;
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