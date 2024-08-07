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
    public class MedicationsController : Controller
    {
        private readonly DemoDbContext _context;

        public MedicationsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Medications
        [HttpGet("/medications")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.Medications.Include(m => m.Pill).Include(m => m.User);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: Medications/Details/5
        [HttpGet("/medications/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Medications == null)
            {
                return NotFound();
            }

            var medication = await _context.Medications
                .Include(m => m.Pill)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MedicationId == id);
            if (medication == null)
            {
                return NotFound();
            }

            return Ok(medication);
        }

        // GET: Medications/Create
        [HttpGet("/medications/new")]
        public IActionResult Create()
        {
            ViewData["PillId"] = new SelectList(_context.Pills, "PillId", "PillId");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: Medications/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/medications/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MedicationId,PillId,NumberOfPills,MedicationDesc,UserId")] Medication medication)
        {
            if (ModelState.IsValid)
            {
                _context.Add(medication);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["PillId"] = new SelectList(_context.Pills, "PillId", "PillId", medication.PillId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medication.UserId);
            return Ok(medication);
        }

        // GET: Medications/Edit/5
        [HttpGet("/medications/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Medications == null)
            {
                return NotFound();
            }

            var medication = await _context.Medications.FindAsync(id);
            if (medication == null)
            {
                return NotFound();
            }
            ViewData["PillId"] = new SelectList(_context.Pills, "PillId", "PillId", medication.PillId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medication.UserId);
            return Ok(medication);
        }

        // POST: Medications/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/medications/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MedicationId,PillId,NumberOfPills,MedicationDesc,UserId")] Medication medication)
        {
            if (id != medication.MedicationId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(medication);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MedicationExists(medication.MedicationId))
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
            ViewData["PillId"] = new SelectList(_context.Pills, "PillId", "PillId", medication.PillId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", medication.UserId);
            return Ok(medication);
        }

        // GET: Medications/Delete/5
        [HttpGet("/medications/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Medications == null)
            {
                return NotFound();
            }

            var medication = await _context.Medications
                .Include(m => m.Pill)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MedicationId == id);
            if (medication == null)
            {
                return NotFound();
            }

            return Ok(medication);
        }

        // POST: Medications/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Medications == null)
            {
                return Problem("Entity set 'DemoDbContext.Medications'  is null.");
            }
            var medication = await _context.Medications.FindAsync(id);
            if (medication != null)
            {
                _context.Medications.Remove(medication);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MedicationExists(int id)
        {
          return (_context.Medications?.Any(e => e.MedicationId == id)).GetValueOrDefault();
        }
    }
}
