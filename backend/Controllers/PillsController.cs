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
    public class PillsController : Controller
    {
        private readonly DemoDbContext _context;

        public PillsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Pills
        [HttpGet("/pills")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.Pills.Include(p => p.User);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: Pills/Details/5
        [HttpGet("/pills/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Pills == null)
            {
                return NotFound();
            }

            var pill = await _context.Pills
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PillId == id);
            if (pill == null)
            {
                return NotFound();
            }

            return Ok(pill);
        }

        // GET: Pills/Create
        [HttpGet("/pills/new")]
        public IActionResult Create()
        {
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: Pills/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/pills/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("PillId,PillName,PillDose,UserId")] Pill pill)
        {
            if (ModelState.IsValid)
            {
                _context.Add(pill);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", pill.UserId);
            return Ok(pill);
        }

        // GET: Pills/Edit/5
        [HttpGet("pills/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Pills == null)
            {
                return NotFound();
            }

            var pill = await _context.Pills.FindAsync(id);
            if (pill == null)
            {
                return NotFound();
            }
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", pill.UserId);
            return Ok(pill);
        }

        // POST: Pills/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/pills/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("PillId,PillName,PillDose,UserId")] Pill pill)
        {
            if (id != pill.PillId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(pill);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PillExists(pill.PillId))
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
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", pill.UserId);
            return Ok(pill);
        }

        // GET: Pills/Delete/5
        [HttpGet("/pills/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Pills == null)
            {
                return NotFound();
            }

            var pill = await _context.Pills
                .Include(p => p.User)
                .FirstOrDefaultAsync(m => m.PillId == id);
            if (pill == null)
            {
                return NotFound();
            }

            return Ok(pill);
        }

        // POST: Pills/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Pills == null)
            {
                return Problem("Entity set 'DemoDbContext.Pills'  is null.");
            }
            var pill = await _context.Pills.FindAsync(id);
            if (pill != null)
            {
                _context.Pills.Remove(pill);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PillExists(int id)
        {
          return (_context.Pills?.Any(e => e.PillId == id)).GetValueOrDefault();
        }
    }
}
