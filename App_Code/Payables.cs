using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class Payables
{
    public Payables()
    {
    }

    public List<PayablesModel> Get(int userId)
    {
        Database db = new Database();
        DataTable dt = new DataTable();

        dt = db.Payables_Get(userId);

        return ToList(dt);
    }

    private PayablesModel ToModel(DataRow row)
    {
        PayablesModel mdl = new PayablesModel
        {
            Id = int.Parse(row["Payables_Id"].ToString()),
            User_Id = int.Parse(row["User_Id"].ToString()),
            Name = row["Payables_Name"].ToString(),
            Amount = decimal.Parse(row["Payables_Amount"].ToString()),
            DueDate = DateTime.Parse(row["Payables_DueDate"].ToString()),
            DueDay = int.Parse(row["Payables_DueDay"].ToString()),
            Type = int.Parse(row["Payables_Type"].ToString())
        };

        return mdl;
    }

    private List<PayablesModel> ToList(DataTable dt)
    {
        List<PayablesModel> lst = new List<PayablesModel>();
        foreach (DataRow row in dt.Rows)
        {
            PayablesModel mdl = new PayablesModel();
            mdl = ToModel(row);
            lst.Add(mdl);
        }
        return lst;
    }
}