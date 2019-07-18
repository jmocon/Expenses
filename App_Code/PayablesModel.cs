using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class PayablesModel
{
    public PayablesModel()
    {
    }

    public int Id { get; set; }
    public int User_Id { get; set; }
    public string Name { get; set; }
    public decimal Amount { get; set; }
    public DateTime DueDate { get; set; }
    public int DueDay { get; set; }
    public int Type { get; set; }
}