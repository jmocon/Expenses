using System;
using System.Collections.Generic;
using System.Data;

public class Transaction
{
    public Transaction()
    {
    }

    public List<TransactionModel> Get(int userId, int type)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        List<TransactionModel> lst = new List<TransactionModel>();
        decimal value = 0;

        dt = db.Transaction_Get(userId, type);
        lst = ToList(dt);
        return lst;
    }

    public decimal GetTotalIncome(int userId)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        decimal value = 0;

        dt = db.Transaction_GetTotalIncome(userId);
        foreach (DataRow row in dt.Rows)
        {
            value = decimal.Parse(row[0].ToString());
        }
        return value;
    }

    public decimal GetTotalExpense(int userId)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        decimal value = 0;

        dt = db.Transaction_GetTotalExpense(userId);
        foreach (DataRow row in dt.Rows)
        {
            value = decimal.Parse(row[0].ToString());
        }
        return value;
    }

    private TransactionModel ToModel(DataRow row)
    {
        TransactionModel mdl = new TransactionModel
        {
            Id = int.Parse(row["Transaction_Id"].ToString()),
            Type = int.Parse(row["Transaction_Type"].ToString()),
            User_Id = int.Parse(row["User_Id"].ToString()),
            Category_Id = int.Parse(row["Category_Id"].ToString()),
            Amount = decimal.Parse(row["Transaction_Amount"].ToString()),
            DateCreated = DateTime.Parse(row["Transaction_DateCreated"].ToString())
        };

        return mdl;
    }

    private List<TransactionModel> ToList(DataTable dt)
    {
        List<TransactionModel> lst = new List<TransactionModel>();
        foreach (DataRow row in dt.Rows)
        {
            TransactionModel mdl = new TransactionModel();
            mdl = ToModel(row);
            lst.Add(mdl);
        }
        return lst;
    }
}