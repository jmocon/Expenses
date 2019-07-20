using System.Data;

public class Critical
{
    public Critical()
    {
    }

    public void Update(int userId, decimal amount)
    {
        Database db = new Database();
        db.Critical_UpdateInsert(userId, amount);
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