using System;

public class UserModel
{
    public UserModel()
    {
    }

    public int Id { get; set; }
    public string Name { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public DateTime DateCreated { get; set; }
}