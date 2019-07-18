using System;
using System.Collections.Generic;

public partial class incomereport : System.Web.UI.Page
{
    private List<CategoryModel> lstCategory;

    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        Category clsCategory = new Category();
        lstCategory = clsCategory.Get();

        if (Request.QueryString["c"] == null)
        {
            GenerateTableContent();
        }
        else
        {
            if (Request.QueryString["c"].ToString() == "latest")
            {
                GenerateLatestTableContent();
            }
            else
            {
                GenerateTableContent();
            }
        }
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
            output += "<td>" + GetCategoryName(mdlTransaction.Category_Id) + "</td>";
            output += "<td>" + mdlTransaction.Amount + "</td>";
            output += "</tr>";
        }

        tableBody.InnerHtml = output;
    }

    private void GenerateLatestTableContent()
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        string output = "";

        lstTransaction = clsTransaction.GetCurrentMonth(int.Parse(Session["User_Id"].ToString()), 0);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            output += "<tr>";
            output += "<td>" + mdlTransaction.DateCreated + "</td>";
            output += "<td>" + GetCategoryName(mdlTransaction.Category_Id) + "</td>";
            output += "<td>" + mdlTransaction.Amount + "</td>";
            output += "</tr>";
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