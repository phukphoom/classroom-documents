using System.Diagnostics;
using System.Collections.Generic;
using System.Data;
using Microsoft.AspNetCore.Mvc;
using Calculator_ASP.NET.Models;

namespace Calculator_ASP.NET.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Calculate(string input)
    {
        try
        {
            return Ok(new DataTable().Compute(input, ""));
        }
        catch
        {
            return BadRequest();
        }
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}

