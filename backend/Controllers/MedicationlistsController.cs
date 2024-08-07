using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using code_API.Models;

namespace code_API.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class MedicationlistsController : Controller
    {
        private readonly DemoDbContext _context;

        public MedicationlistsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Medicationlists
        [HttpGet("/medicationlists")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.Medicationlists.Include(m => m.Medication).Include(m => m.User);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: Medicationlists/Details/5
        [HttpGet("/medicationlists/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Medicationlists == null)
            {
                return NotFound();
            }

            var medicationlist = await _context.Medicationlists
                .Include(m => m.Medication)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MedicationListId == id);
            if (medicationlist == null)
            {
                return NotFound();
            }

            return Ok(medicationlist);
        }

        // GET: Medicationlists/Create
        [HttpGet("/medicationlists/new")]
        public IActionResult Create()
        {
            ViewData["MedicationId"] = new SelectList(_context.Medications, "MedicationId", "MedicationId");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: Medicationlists/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/medicationlists/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MedicationListId,MedicationId,UserId")] Medicationlist medicationlist)
        {
            if (ModelState.IsValid)
            {
                _context.Add(medicationlist);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MedicationId"] = new SelectList(_context.Medications, "MedicationId", "MedicationId", medicationlist.MedicationId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medicationlist.UserId);
            return Ok(medicationlist);
        }

        // GET: Medicationlists/Edit/5
        [HttpGet("/medicationlists/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Medicationlists == null)
            {
                return NotFound();
            }

            var medicationlist = await _context.Medicationlists.FindAsync(id);
            if (medicationlist == null)
            {
                return NotFound();
            }
            ViewData["MedicationId"] = new SelectList(_context.Medications, "MedicationId", "MedicationId", medicationlist.MedicationId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medicationlist.UserId);
            return Ok(medicationlist);
        }

        // POST: Medicationlists/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/medicationlists/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MedicationListId,MedicationId,UserId")] Medicationlist medicationlist)
        {
            if (id != medicationlist.MedicationListId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(medicationlist);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MedicationlistExists(medicationlist.MedicationListId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["MedicationId"] = new SelectList(_context.Medications, "MedicationId", "MedicationId", medicationlist.MedicationId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medicationlist.UserId);
            return Ok(medicationlist);
        }

        // GET: Medicationlists/Delete/5
        [HttpGet("/medicationlists/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Medicationlists == null)
            {
                return NotFound();
            }

            var medicationlist = await _context.Medicationlists
                .Include(m => m.Medication)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MedicationListId == id);
            if (medicationlist == null)
            {
                return NotFound();
            }

            return Ok(medicationlist);
        }

        // POST: Medicationlists/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Medicationlists == null)
            {
                return Problem("Entity set 'DemoDbContext.Medicationlists'  is null.");
            }
            var medicationlist = await _context.Medicationlists.FindAsync(id);
            if (medicationlist != null)
            {
                _context.Medicationlists.Remove(medicationlist);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MedicationlistExists(int id)
        {
          return (_context.Medicationlists?.Any(e => e.MedicationListId == id)).GetValueOrDefault();
        }
    }
}
