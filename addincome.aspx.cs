using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addincome : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckSession();
        if (!IsPostBack)
        {
            PopulateCategory();
        }
    }

    private void PopulateCategory()
    {
        Category clsCatergory = new Category();
        List<CategoryModel> lstCategory = new List<CategoryModel>();
        lstCategory = clsCatergory.Get(0);
        foreach (CategoryModel mdl in lstCategory)
        {
            selCategory.Items.Add(new ListItem(mdl.Name, mdl.Id.ToString()));
        }
    }

    public void AddNewExpense()
    {
        Transaction clsTransaction = new Transaction();
        TransactionModel mdlTransaction = new TransactionModel();

        mdlTransaction.Type = 0;
        mdlTransaction.User_Id = int.Parse(Session["User_Id"].ToString());
        mdlTransaction.Category_Id = int.Parse(selCategory.Value);
        mdlTransaction.Amount = decimal.Parse(txtAmount.Value);

        clsTransaction.Add(mdlTransaction);
    }

    protected void btnSubmit_ServerClick(object sender, EventArgs e)
    {
        string notif = "";
        if (txtAmount.Value == "")
        {
            notif += "<div class='alert alert-danger' role='alert'>";
            notif += "Please complete all fields!";
            notif += "</div>";
        }
        else
        {
            AddNewExpense();
            notif += "<div class='alert alert-success' role='alert'>";
            notif += "Successfully Added!";
            notif += "</div>";
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