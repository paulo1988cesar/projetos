using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace AppGamer
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );

            routes.MapRoute("RetornaPlataformas",
                            "Plataforma/RetornaPlataformas/",
                            new { controller = "Plataforma", action = "RetornaPlataformas" },
                            new[] { "AppGamer.Controllers" });

            routes.MapRoute("RetornaGames",
                            "Game/RetornaGames/",
                            new { controller = "Plataforma", action = "RetornaGames" },
                            new[] { "AppGamer.Controllers" });

            routes.MapRoute("RetornaSitEmprestimo",
                            "Game/RetornaSitEmprestimo/",
                            new { controller = "RetornaSitEmprestimo", action = "RetornaSitEmprestimo" },
                            new[] { "AppGamer.Controllers" });

            routes.MapRoute("RetornaGameByPlataforma",
                            "EmprestimoGame/RetornaGameByPlataforma/",
                            new { controller = "RetornaGameByPlataforma", action = "RetornaGameByPlataforma" },
                            new[] { "AppGamer.Controllers" });

            routes.MapRoute("RetornaGamesEmprestadorByUser",
                            "EmprestimoGame/RetornaGamesEmprestadorByUser/",
                            new { controller = "RetornaGamesEmprestadorByUser", action = "RetornaGamesEmprestadorByUser" },
                            new[] { "AppGamer.Controllers" });

        }
    }
}