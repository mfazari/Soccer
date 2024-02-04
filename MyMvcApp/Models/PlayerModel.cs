namespace MyMvcApp.Models;

public class PlayerModel
{
    public int PlayerId { get; set; }
    public string PlayerName { get; set; } = "";
    public string Position { get; set; } = "";
    public int JerseyNumber { get; set; }
    public int GoalsScored { get; set; }
}
