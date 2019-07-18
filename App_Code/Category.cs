using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

public class Category
{
    public Category()
    {
    }

    public List<CategoryModel> Get()
    {
        Database db = new Database();
        DataTable dt = new DataTable();

        dt = db.Category_Get();

        return ToList(dt);
    }

    public List<CategoryModel> Get(int type)
    {
        Database db = new Database();
        DataTable dt = new DataTable();

        dt = db.Category_Get(type);

        return ToList(dt);
    }

    private CategoryModel ToModel(DataRow row)
    {
        CategoryModel mdl = new CategoryModel
        {
            Id = int.Parse(row["Category_Id"].ToString()),
            Type = int.Parse(row["Category_Type"].ToString()),
            Name = row["Category_Name"].ToString()
        };

        return mdl;
    }

    private List<CategoryModel> ToList(DataTable dt)
    {
        List<CategoryModel> lst = new List<CategoryModel>();
        foreach (DataRow row in dt.Rows)
        {
            CategoryModel mdl = new CategoryModel();
            mdl = ToModel(row);
            lst.Add(mdl);
        }
        return lst;
    }
}