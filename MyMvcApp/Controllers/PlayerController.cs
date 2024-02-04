using System.Diagnostics;
using MyMvcApp.Models;
using Microsoft.AspNetCore.Mvc;

public class PlayersController : Controller
{
    private readonly SoccerService _service;

    public PlayersController(SoccerService service)
    {
        _service = service;
    }


    public IActionResult Index()
    {
        // Example
        PlayerModel examplePlayer = new PlayerModel
        {
            PlayerName = "Example Player",
            Position = "Forward",
            JerseyNumber = 10,
            GoalsScored = 20
        };

        return View(examplePlayer);
    }

    [HttpGet]
    public IActionResult ViewAllPlayers()
    {
        List<PlayerModel> players = _service.GetAllPlayers();
        if (players == null)
        {
            return RedirectToAction("Error", "Home");
        }
        else
        {
            return View(players);
        }
    }

    [HttpPost]
    public IActionResult AddPlayer(PlayerModel player)
    {
        if (ModelState.IsValid)
        {
            _service.AddPlayer(player);
            return RedirectToAction("ViewAllPlayers");
        }
        return View(player);
    }

    [HttpPost]
    public IActionResult UpdatePlayer(PlayerModel player)
    {
        if (ModelState.IsValid)
        {
            _service.UpdatePlayer(player);
            return RedirectToAction("ViewAllPlayers");
        }
        return View(player);
    }

    [HttpPost]
    public IActionResult RemovePlayer(int playerId)
    {
        if (playerId != 0)
        {
            _service.RemovePlayer(playerId);
        }
        return RedirectToAction("ViewAllPlayers");
    }
}
