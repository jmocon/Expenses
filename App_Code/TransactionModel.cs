using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class TransactionModel
{
    public TransactionModel()
    {
    }

    public int Id { get; set; }
    public int Type { get; set; }
    public int User_Id { get; set; }
    public int Category_Id { get; set; }
    public decimal Amount { get; set; }
    public DateTime DateCreated { get; set; }
}