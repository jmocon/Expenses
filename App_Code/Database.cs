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
        //db_config db_data = new db_config();
        //conString = db_data.conString;
        conString = ConfigurationManager.AppSettings["ExpensesDB"];

        con = new SqlConnection(conString);
        cmd = new SqlCommand();
        adapter = new SqlDataAdapter();
        dt = new DataTable();
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
        int id = 0;
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