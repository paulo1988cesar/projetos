using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using AppGamer.Models;

namespace AppGamer.Controllers
{
    public class PlataformaController : Controller
    {
        private Modelo db = new Modelo();

        // GET: Plataforma
        public ActionResult Index()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult RetornaPlataformas(string id, string descricao)
        {
            Int32 codigo = !string.IsNullOrEmpty(id) ? Convert.ToInt32(id) : 0;
            List<PLATAFORMA> objPlataformas = null;

            if (codigo > 0 && String.IsNullOrEmpty(descricao))
                objPlataformas = db.PLATAFORMA.Where(c => c.CODPLATAFORMA.Equals(codigo)).ToList();

            if (codigo > 0 && !String.IsNullOrEmpty(descricao))
                objPlataformas = db.PLATAFORMA.Where(c => c.CODPLATAFORMA.Equals(codigo) && c.DESCRICAO.Contains(descricao)).ToList();

            if (codigo == 0 && !String.IsNullOrEmpty(descricao))
                objPlataformas = db.PLATAFORMA.Where(c => c.DESCRICAO.Contains(descricao)).ToList();

            objPlataformas = objPlataformas.OrderBy(c => c.DESCRICAO).ToList();

            var result = (from PLATAFORMA item in objPlataformas
                          select new
                          {
                              codigo = item.CODPLATAFORMA,
                              descricao = item.DESCRICAO,
                          }).ToList();

            return Json(result, JsonRequestBehavior.AllowGet);
        }

        // GET: Plataforma/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PLATAFORMA pLATAFORMA = db.PLATAFORMA.Find(id);
            if (pLATAFORMA == null)
            {
                return HttpNotFound();
            }
            return View(pLATAFORMA);
        }

        // GET: Plataforma/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Plataforma/Create
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "CODPLATAFORMA,DESCRICAO")] PLATAFORMA pLATAFORMA)
        {
            if (ModelState.IsValid)
            {
                db.PLATAFORMA.Add(pLATAFORMA);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(pLATAFORMA);
        }

        // GET: Plataforma/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PLATAFORMA pLATAFORMA = db.PLATAFORMA.Find(id);
            if (pLATAFORMA == null)
            {
                return HttpNotFound();
            }
            return View(pLATAFORMA);
        }

        // POST: Plataforma/Edit/5
        // Para se proteger de mais ataques, ative as propriedades específicas a que você quer se conectar. Para 
        // obter mais detalhes, consulte https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "CODPLATAFORMA,DESCRICAO")] PLATAFORMA pLATAFORMA)
        {
            if (ModelState.IsValid)
            {
                db.Entry(pLATAFORMA).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(pLATAFORMA);
        }

        // GET: Plataforma/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PLATAFORMA pLATAFORMA = db.PLATAFORMA.Find(id);
            if (pLATAFORMA == null)
            {
                return HttpNotFound();
            }
            return View(pLATAFORMA);
        }

        // POST: Plataforma/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PLATAFORMA pLATAFORMA = db.PLATAFORMA.Find(id);

            if (ValidaExclusaoPlataforma(id))
            {
                ModelState.AddModelError("ExclusaoPlataforma", "Não é possível excluir uma Plataforma que está sendo utilizada.");
                return View(pLATAFORMA);
            }
            
            db.PLATAFORMA.Remove(pLATAFORMA);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        /// <summary>
        /// Valida se a plataforma pode ser excluída
        /// </summary>
        /// <param name="id">Id do plataforma</param>
        /// <returns></returns>
        private bool ValidaExclusaoPlataforma(int id)
        {
            return (from GAME item in db.GAME
                    where item.CODPLATAFORMA == id
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
