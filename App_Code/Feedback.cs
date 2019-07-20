using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Feedback : Database
{
    public Feedback()
    {
    }

    public void Add(int userId, string message)
    {
        Feedback_Add(userId, message);
    }
}