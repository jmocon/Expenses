using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public class Database
{
    private static string conString = "";
    private string err = "";
    private SqlConnection con;
    private SqlCommand cmd;
    private SqlDataAdapter adapter;
    private DataTable dt;

    public Database()
    {
        conString = ConfigurationManager.AppSettings["ExpensesDB"];

        con = new SqlConnection(conString);
        cmd = new SqlCommand();
        adapter = new SqlDataAdapter();
        dt = new DataTable();
    }

    public DataTable Category_Get()
    {
        string sql = "Category_Get";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Category_Get(int type)
    {
        string sql = "Category_GetByType";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public void Critical_UpdateInsert(int userId, decimal amount)
    {
        string sql = "Critical_UpdateInsert";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@amount", amount));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    public DataTable Critical_GetAmount(int userId)
    {
        string sql = "Transaction_GetCriticalByUser_Id";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    protected void Feedback_Add(int userId, string message)
    {
        string sql = "Feedback_Add";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@message", message));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    public void Payable_Add(PayablesModel mdl)
    {
        string sql = "Payable_Add";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", mdl.User_Id));
            cmd.Parameters.Add(new SqlParameter("@name", mdl.Name));
            cmd.Parameters.Add(new SqlParameter("@amount", mdl.Amount));
            cmd.Parameters.Add(new SqlParameter("@duedate", mdl.DueDate));
            cmd.Parameters.Add(new SqlParameter("@dueday", mdl.DueDay));
            cmd.Parameters.Add(new SqlParameter("@type", mdl.Type));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    public DataTable Payables_Get(int userId)
    {
        string sql = "Payables_GetByUserId";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Payables_GetUpcomming(int userId,int days)
    {
        string sql = "Payables_GetUpcommingByUser_IdDays";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@days", days));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Tips_GetMessage(int id)
    {
        string sql = "Tips_GetMessageById";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@id", id));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public void Transaction_Add(TransactionModel mdl)
    {
        string sql = "Transaction_Add";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@type", mdl.Type));
            cmd.Parameters.Add(new SqlParameter("@userId", mdl.User_Id));
            cmd.Parameters.Add(new SqlParameter("@categoryId", mdl.Category_Id));
            cmd.Parameters.Add(new SqlParameter("@amount", mdl.Amount));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    public void Transaction_Delete(int id)
    {
        string sql = "Transaction_Delete";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@id", id));
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.ExecuteNonQuery();
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }
    }

    public DataTable Transaction_Get(int userId)
    {
        string sql = "Transaction_GetByUser_Id";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_Get(int userId, int type)
    {
        string sql = "Transaction_GetByUser_IdType";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetTotal(int userId)
    {
        string sql = "Transaction_GetTotalByUserId";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetByMonth(int userId, int type, int month)
    {
        string sql = "Transaction_GetByUser_IdTypeMonth";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.Parameters.Add(new SqlParameter("@month", month));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetByUserIdDayLimit(int userId, int days, int limit)
    {
        string sql = "Transaction_GetByUserIdDayLimit";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@days", days));
            cmd.Parameters.Add(new SqlParameter("@limit", limit));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetByPastMonth(int userId, int month, int type)
    {
        string sql = "Transaction_GetByMonthType";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.Parameters.Add(new SqlParameter("@month", month));
            cmd.Parameters.Add(new SqlParameter("@type", type));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetThisYear(int userId)
    {
        string sql = "Transaction_GetThisYearByUser_Id";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetTotalIncome(int userId)
    {
        string sql = "Transaction_GetTotalIncomeByUser_Id";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable Transaction_GetTotalExpense(int userId)
    {
        string sql = "Transaction_GetTotalExpenseByUser_Id";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@userId", userId));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable User_Login(string username, string password)
    {
        string sql = "login_verify";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@username", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable User_GetName(int id)
    {
        string sql = "User_GetNameById";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@id", id));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }

    public DataTable User_Get(int id)
    {
        string sql = "User_GetById";

        try
        {
            cmd = new SqlCommand(sql, con);

            if (con.State != System.Data.ConnectionState.Open)
            {
                con.Open();
            }

            cmd.Parameters.Add(new SqlParameter("@id", id));
            cmd.CommandType = CommandType.StoredProcedure;
            adapter.SelectCommand = cmd;
            adapter.Fill(dt);
        }
        catch (Exception ex)
        {
            err = ex.ToString();
        }
        finally
        {
            con.Close();
        }

        return dt;
    }
}