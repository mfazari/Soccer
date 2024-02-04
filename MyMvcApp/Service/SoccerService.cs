using MyMvcApp.Models;



public class SoccerService
{
    private readonly DatabaseService _sp;

    public SoccerService(DatabaseService sp)
    {
        _sp = sp;
    }

    public List<PlayerModel> GetAllPlayers()
    {
        return new List<PlayerModel>(); 
    }

    public void AddPlayer(PlayerModel player)
    {
    }

    public void UpdatePlayer(PlayerModel player)
    {
    }

    public void RemovePlayer(int playerId)
    {
    }

}