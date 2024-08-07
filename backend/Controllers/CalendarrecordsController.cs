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
    public class CalendarrecordsController : Controller
    {
        private readonly DemoDbContext _context;

        public CalendarrecordsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Calendarrecords
        [HttpGet("/calendarrecords")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.Calendarrecords.Include(c => c.MedicationList).Include(c => c.MoodList).Include(c => c.User);
              return Ok(await demoDbContext.ToListAsync());
        }

        // GET: Calendarrecords/Details/5
         [HttpGet("/calendarrecords/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Calendarrecords == null)
            {
                return NotFound();
            }

            var calendarrecord = await _context.Calendarrecords
                .Include(c => c.MedicationList)
                .Include(c => c.MoodList)
                .Include(c => c.User)
                .FirstOrDefaultAsync(m => m.CalendarRecordId == id);
            if (calendarrecord == null)
            {
                return NotFound();
            }

            return Ok(calendarrecord);
        }

        // GET: Calendarrecords/Create
         [HttpGet("/calendarrecords/new")]
        public IActionResult Create()
        {
            ViewData["MedicationListId"] = new SelectList(_context.Medicationlists, "MedicationListId", "MedicationListId");
            ViewData["MoodListId"] = new SelectList(_context.Moodlists, "MoodListId", "MoodListId");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: Calendarrecords/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/calendarrecords/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("CalendarRecordId,Date,MedicationListId,MoodListId,UserId")] Calendarrecord calendarrecord)
        {
            if (ModelState.IsValid)
            {
                _context.Add(calendarrecord);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MedicationListId"] = new SelectList(_context.Medicationlists, "MedicationListId", "MedicationListId", calendarrecord.MedicationListId);
            ViewData["MoodListId"] = new SelectList(_context.Moodlists, "MoodListId", "MoodListId", calendarrecord.MoodListId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", calendarrecord.UserId);
            return Ok(calendarrecord);
        }

        // GET: Calendarrecords/Edit/5
         [HttpGet("/cakendarrecords/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Calendarrecords == null)
            {
                return NotFound();
            }

            var calendarrecord = await _context.Calendarrecords.FindAsync(id);
            if (calendarrecord == null)
            {
                return NotFound();
            }
            ViewData["MedicationListId"] = new SelectList(_context.Medicationlists, "MedicationListId", "MedicationListId", calendarrecord.MedicationListId);
            ViewData["MoodListId"] = new SelectList(_context.Moodlists, "MoodListId", "MoodListId", calendarrecord.MoodListId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", calendarrecord.UserId);
            return Ok(calendarrecord);
        }

        // POST: Calendarrecords/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/calendarrecords/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("CalendarRecordId,Date,MedicationListId,MoodListId,UserId")] Calendarrecord calendarrecord)
        {
            if (id != calendarrecord.CalendarRecordId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(calendarrecord);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CalendarrecordExists(calendarrecord.CalendarRecordId))
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
            ViewData["MedicationListId"] = new SelectList(_context.Medicationlists, "MedicationListId", "MedicationListId", calendarrecord.MedicationListId);
            ViewData["MoodListId"] = new SelectList(_context.Moodlists, "MoodListId", "MoodListId", calendarrecord.MoodListId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", calendarrecord.UserId);
            return Ok(calendarrecord);
        }

        // GET: Calendarrecords/Delete/5
        [HttpGet("/calendarrecords/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Calendarrecords == null)
            {
                return NotFound();
            }

            var calendarrecord = await _context.Calendarrecords
                .Include(c => c.MedicationList)
                .Include(c => c.MoodList)
                .Include(c => c.User)
                .FirstOrDefaultAsync(m => m.CalendarRecordId == id);
            if (calendarrecord == null)
            {
                return NotFound();
            }

            return Ok(calendarrecord);
        }

        // POST: Calendarrecords/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Calendarrecords == null)
            {
                return Problem("Entity set 'DemoDbContext.Calendarrecords'  is null.");
            }
            var calendarrecord = await _context.Calendarrecords.FindAsync(id);
            if (calendarrecord != null)
            {
                _context.Calendarrecords.Remove(calendarrecord);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

[NonAction]
        private bool CalendarrecordExists(int id)
        {
          return (_context.Calendarrecords?.Any(e => e.CalendarRecordId == id)).GetValueOrDefault();
        }
    }
}
