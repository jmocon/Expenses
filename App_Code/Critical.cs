using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class Critical
{
    public Critical()
    {
    }

    public decimal GetAmount(int userId)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        decimal value = 0;

        dt = db.Critical_GetAmount(userId);
        foreach (DataRow row in dt.Rows)
        {
            value = decimal.Parse(row[0].ToString());
        }
        return value;
    }
}