using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AppGamer.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "SGE - Empréstimos de Games";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Contate-nos";

            return View();
        }
    }
}