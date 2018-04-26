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
    public class EmprestimoGameController : Controller
    {
        private Modelo db = new Modelo();

        // GET: EmprestimoGame
        public ActionResult Index()
        {
            var idUser = User.Identity.GetUserId();
            List<AspNetUsers> CODUSER = db.AspNetUsers.Where(c => !c.Id.Equals(idUser)).AsNoTracking().ToList();
            ViewBag.CODUSER = new SelectList(CODUSER, "Id", "UserName");
            return View();
        }

        /// <summary>
        /// Busca os jogos estão emprestados
        /// </summary>
        /// <param name="codigo"></param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult RetornaGamesEmprestadorByUser(string codigo)
        {
            List<EMPRESTIMO> objGamesEmprestados = db.EMPRESTIMO.AsNoTracking().ToList();
            
            if (!String.IsNullOrEmpty(codigo))
            {
                objGamesEmprestados = objGamesEmprestados.Where(c => c.CODUSER.Equals(codigo)).ToList();
            }
            
            var results = (from EMPRESTIMO item in objGamesEmprestados
                           join u in db.AspNetUsers on item.CODUSER equals u.Id
                           select new
                           {
                               codigo = item.CODEMPRESTIMO,
                               game = item.GAME.DESCRICAO,
                               usuario = u.UserName, 
                               data = item.DATAEMPRESTIMO.ToShortDateString()
                           }).ToList();

            return Json(results, JsonRequestBehavior.AllowGet);
        }

        /// <summary>
        /// Busca os jogaos por plataforma para futuro empréstimo
        /// </summary>
        /// <param name="codigo">Código da Plataforma</param>
        /// <returns></returns>
        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult RetornaGameByPlataforma(string codigo)
        {
            List<GAME> objGames = new List<GAME>();
            var idUser = User.Identity.GetUserId();
            int pCodigo = !String.IsNullOrEmpty(codigo) ? Convert.ToInt32(codigo) : 0;
            
            objGames = db.GAME.Where(c => c.CODUSER.Equals(idUser) && c.CODPLATAFORMA.Equals(pCodigo) && !c.TITULOEMPRESTADO).AsNoTracking().ToList();
            
            var results = (from GAME item in objGames
                           select new
                           {
                               codigo = item.CODGAME,
                               descricao = item.DESCRICAO
                           }).ToList();

            return Json(results, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Create()
        {
            var idUser = User.Identity.GetUserId();
            List<AspNetUsers> objUsuario = db.AspNetUsers.Where(c => !c.Id.Equals(idUser)).AsNoTracking().ToList();

            ViewBag.CODUSER = new SelectList(objUsuario, "Id", "UserName");
            ViewBag.CODPLATAFORMA = new SelectList(db.PLATAFORMA, "CODPLATAFORMA", "DESCRICAO");
            ViewBag.CODGAME = new SelectList("", "CODGAME", "DESCRICAO");

            return View();
        }

        // POST: EmprestimoGame/Create
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CODEMPRESTIMO,CODUSER,CODGAME")] EMPRESTIMO eMPRESTIMO)
        {
            if (ModelState.IsValid)
            {
                eMPRESTIMO.DATAEMPRESTIMO = DateTime.Now;
                db.EMPRESTIMO.Add(eMPRESTIMO);

                GAME objGame = db.GAME.Find(eMPRESTIMO.CODGAME);
                objGame.TITULOEMPRESTADO = true;

                db.SaveChanges();
                return RedirectToAction("Index");
            }

            var idUser = User.Identity.GetUserId();
            List<AspNetUsers> objUsuario = db.AspNetUsers.Where(c => !c.Id.Equals(idUser)).AsNoTracking().ToList();

            ViewBag.CODUSER = new SelectList(objUsuario, "Id", "UserName", eMPRESTIMO.CODUSER);
            ViewBag.CODPLATAFORMA = new SelectList(db.PLATAFORMA, "CODPLATAFORMA", "DESCRICAO");
            ViewBag.CODGAME = new SelectList("", "CODGAME", "DESCRICAO");

            return View(eMPRESTIMO);
        }

        // GET: EmprestimoGame/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            EMPRESTIMO eMPRESTIMO = db.EMPRESTIMO.Find(id);
            if (eMPRESTIMO == null)
            {
                return HttpNotFound();
            }
            return View(eMPRESTIMO);
        }

        // POST: EmprestimoGame/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            EMPRESTIMO eMPRESTIMO = db.EMPRESTIMO.Find(id);
            db.EMPRESTIMO.Remove(eMPRESTIMO);

            GAME objGame = db.GAME.Find(eMPRESTIMO.CODGAME);
            objGame.TITULOEMPRESTADO = false;

            db.SaveChanges();
            return RedirectToAction("Index");
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
