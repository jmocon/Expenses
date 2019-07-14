using System;
using System.Data;

public class User
{
    public User()
    {
    }

    public int Login(string username, string password)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        int id = 0;

        dt = db.User_Login(username, password);
        foreach (DataRow row in dt.Rows)
        {
            id = int.Parse(row["User_Id"].ToString());
        }
        return id;
    }

    public string GetName(string id)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        string value = "";

        dt = db.User_GetName(int.Parse(id));

        foreach (DataRow row in dt.Rows)
        {
            value = row["User_Name"].ToString();
        }
        return value;
    }

    public UserModel Get(string id)
    {
        Database db = new Database();
        DataTable dt = new DataTable();
        UserModel mdlUser = new UserModel();

        dt = db.User_Get(int.Parse(id));

        foreach (DataRow row in dt.Rows)
        {
            mdlUser = ToModel(row);
        }

        return mdlUser;
    }

    private UserModel ToModel(DataRow row)
    {
        UserModel mdlUser = new UserModel
        {
            Id = int.Parse(row["User_Id"].ToString()),
            Name = row["User_Name"].ToString(),
            Username = row["User_Username"].ToString(),
            Password = row["User_Password"].ToString(),
            DateCreated = DateTime.Parse(row["User_DateCreated"].ToString())
        };

        return mdlUser;
    }
}