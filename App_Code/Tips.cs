using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Tips
/// </summary>
public class Tips
{
    public Tips()
    {
        //
        // TODO: Add constructor logic here
        //
    }

    public string GetMessage(int id)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        string value = "";

        dt = db.Tips_GetMessage(id);

        foreach (DataRow row in dt.Rows)
        {
            value = row["Tips_Message"].ToString();
        }
        return value;
    }

    private TipsModel ToModel(DataRow row)
    {
        TipsModel mdl = new TipsModel
        {
            Id = int.Parse(row["Tips_Id"].ToString()),
            Message = row["Tips_Message"].ToString()
        };

        return mdl;
    }
}