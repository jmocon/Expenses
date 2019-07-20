using System;
using System.Collections.Generic;

public partial class expensereport : System.Web.UI.Page
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

        lstTransaction = clsTransaction.Get(int.Parse(Session["User_Id"].ToString()), 1);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            output += "<tr id='tr" + mdlTransaction.Id + "'>";
            output += "<td>" + mdlTransaction.DateCreated + "</td>";
            output += "<td>" + GetCategoryName(mdlTransaction.Category_Id) + "</td>";
            output += "<td>" + mdlTransaction.Amount + "</td>";
            output += "<td class='text-center'><button type='button' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#del_" + mdlTransaction.Id + "'><i class='fas fa-trash'></i> Delete</button>";

            output += "<div class='modal fade' id='del_" + mdlTransaction.Id + "' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>";
            output += "  <div class='modal-dialog' role='document'>";
            output += "    <div class='modal-content'>";
            output += "      <div class='modal-header'>";
            output += "        <h5 class='modal-title' id='exampleModalLabel'>Delete Transaction?</h5>";
            output += "        <button class='close' type='button' data-dismiss='modal' aria-label='Close'>";
            output += "          <span aria-hidden='true'>×</span>";
            output += "        </button>";
            output += "      </div>";
            output += "      <div class='modal-body text-left'><h3>Delete this Transaction?</h3>";
            output += "      <p class='m-0'>Date Added: " + mdlTransaction.DateCreated + "</p>";
            output += "      <p class='m-0'>Category: " + GetCategoryName(mdlTransaction.Category_Id) + "</p>";
            output += "      <p class='m-0'>Amount: " + mdlTransaction.Amount + "</p>";
            output += "      </div>";
            output += "      <div class='modal-footer'>";
            output += "        <button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>";
            output += "        <button class='btn btn-primary' onclick='deleteTransaction(" + mdlTransaction.Id + ")' data-dismiss='modal'>Delete</button>";
            output += "      </div>";
            output += "    </div>";
            output += "  </div>";
            output += "</div>";
            output += "</td>";
            output += "</tr>";
        }

        tableBody.InnerHtml = output;
    }

    private void GenerateLatestTableContent()
    {
        Transaction clsTransaction = new Transaction();
        List<TransactionModel> lstTransaction = new List<TransactionModel>();
        string output = "";

        lstTransaction = clsTransaction.GetCurrentMonth(int.Parse(Session["User_Id"].ToString()), 1);

        foreach (TransactionModel mdlTransaction in lstTransaction)
        {
            output += "<tr id='tr" + mdlTransaction.Id + "'>";
            output += "<td>" + mdlTransaction.DateCreated + "</td>";
            output += "<td>" + GetCategoryName(mdlTransaction.Category_Id) + "</td>";
            output += "<td>" + mdlTransaction.Amount + "</td>";
            output += "<td class='text-center'><button type='button' class='btn btn-danger btn-sm' data-toggle='modal' data-target='#del_" + mdlTransaction.Id + "'><i class='fas fa-trash'></i> Delete</button>";

            output += "<div class='modal fade' id='del_" + mdlTransaction.Id + "' tabindex='-1' role='dialog' aria-labelledby='exampleModalLabel' aria-hidden='true'>";
            output += "  <div class='modal-dialog' role='document'>";
            output += "    <div class='modal-content'>";
            output += "      <div class='modal-header'>";
            output += "        <h5 class='modal-title' id='exampleModalLabel'>Delete Transaction?</h5>";
            output += "        <button class='close' type='button' data-dismiss='modal' aria-label='Close'>";
            output += "          <span aria-hidden='true'>×</span>";
            output += "        </button>";
            output += "      </div>";
            output += "      <div class='modal-body text-left'><h3>Delete this Transaction?</h3>";
            output += "      <p class='m-0'>Date Added: " + mdlTransaction.DateCreated + "</p>";
            output += "      <p class='m-0'>Category: " + GetCategoryName(mdlTransaction.Category_Id) + "</p>";
            output += "      <p class='m-0'>Amount: " + mdlTransaction.Amount + "</p>";
            output += "      </div>";
            output += "      <div class='modal-footer'>";
            output += "        <button class='btn btn-secondary' type='button' data-dismiss='modal'>Cancel</button>";
            output += "        <button class='btn btn-primary' onclick='deleteTransaction(" + mdlTransaction.Id + ")' data-dismiss='modal'>Delete</button>";
            output += "      </div>";
            output += "    </div>";
            output += "  </div>";
            output += "</div>";
            output += "</td>";
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