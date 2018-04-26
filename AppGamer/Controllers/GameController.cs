using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppGamer.Models;
using Microsoft.AspNet.Identity;

namespace AppGamer.Controllers
{
    public class GameController : Controller
    {
        private Modelo db = new Modelo();

        // GET: Game
        public ActionResult Index()
        {
            List<PLATAFORMA> objPlataforma = db.PLATAFORMA.AsNoTracking().ToList();
            ViewBag.CODPLATAFORMA = new SelectList(objPlataforma, "CODPLATAFORMA", "DESCRICAO");

            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult RetornaGames(string codigo, string descricao, string plat)
        {
            var idUser = User.Identity.GetUserId();
            Int32 id = !String.IsNullOrEmpty(codigo) ? Convert.ToInt32(codigo) : 0;
            Int32 codPlat = !String.IsNullOrEmpty(plat) ? Convert.ToInt32(plat) : 0;

            List<GAME> objGames = db.GAME.Where(c=> c.CODUSER.Equals(idUser)).AsNoTracking().ToList();

            if (id > 0)
                objGames = objGames.Where(c => c.CODGAME.Equals(id)).ToList();

            if (codPlat > 0)
                objGames = objGames.Where(c => c.CODPLATAFORMA.Equals(codPlat)).ToList();

            if (!String.IsNullOrEmpty(descricao))
                objGames = objGames.Where(c => c.DESCRICAO.Contains(descricao)).ToList();

            var result = (from GAME item in objGames
                          select new
                          {
                              codigo = item.CODGAME,
                              descricao = item.DESCRICAO,
                              plat = item.PLATAFORMA.DESCRICAO,
                              emprestado = item.TITULOEMPRESTADO ? "Sim" : "Não"
                          }).OrderBy(c => c.descricao).ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // GET: Game/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAME.Find(id);
            if (gAME == null)
            {
                return HttpNotFound();
            }
            return View(gAME);
        }

        // GET: Game/Create
        public ActionResult Create()
        {
            var idUser = User.Identity.GetUserId();

            GAME objGame = new GAME();

            objGame.CODUSER = idUser;
            objGame.ANO = DateTime.Now.Year;

            ViewBag.CODPLATAFORMA = new SelectList(db.PLATAFORMA, "CODPLATAFORMA", "DESCRICAO");
            ViewBag.CODUSER = new SelectList(db.AspNetUsers, "Id", "UserName", idUser);
            return View(objGame);
        }

        // POST: Game/Create
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CODGAME,CODPLATAFORMA,CODUSER,DESCRICAO,ANO")] GAME gAME)
        {
            if (ModelState.IsValid)
            {
                gAME.TITULOEMPRESTADO = false;
                db.GAME.Add(gAME);
                db.SaveChanges();

                return RedirectToAction("Index");
            }

            return View(gAME);
        }

        // GET: Game/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAME.Find(id);

            ViewBag.CODPLATAFORMA = new SelectList(db.PLATAFORMA, "CODPLATAFORMA", "DESCRICAO", gAME.CODPLATAFORMA);
            ViewBag.CODUSER = new SelectList(db.AspNetUsers, "Id", "UserName", gAME.CODUSER);

            if (gAME == null)
            {
                return HttpNotFound();
            }
            return View(gAME);
        }

        // POST: Game/Edit/5
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CODGAME,CODUSER,CODPLATAFORMA,DESCRICAO,ANO")] GAME gAME)
        {
            if (ModelState.IsValid)
            {
                db.Entry(gAME).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(gAME);
        }

        // GET: Game/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            GAME gAME = db.GAME.Find(id);
            if (gAME == null)
            {
                return HttpNotFound();
            }
            return View(gAME);
        }

        // POST: Game/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            GAME gAME = db.GAME.Find(id);

            if (ValidaExclusaoGame(id))
            {
               ModelState.AddModelError("ExclusaoGame", "Não é possível excluir um Game que está emprestado.");
               return View(gAME);
            }
            
            db.GAME.Remove(gAME);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Valida se o game pode ser excluído
        /// </summary>
        /// <param name="id">Id do Game</param>
        /// <returns></returns>
        private bool ValidaExclusaoGame(int id)
        {
            return (from EMPRESTIMO item in db.EMPRESTIMO
                    where item.CODGAME == id
                    select item).ToList().Count > 0; 
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
