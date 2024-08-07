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
    public class MoodsController : Controller
    {
        private readonly DemoDbContext _context;

        public MoodsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Moods
        [HttpGet("/moods")]
        public async Task<IActionResult> Index()
        {
              return _context.Moods != null ? 
                          Ok(await _context.Moods.ToListAsync()) :
                          Problem("Entity set 'DemoDbContext.Moods'  is null.");
        }

        // GET: Moods/Details/5
        [HttpGet("/moods/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Moods == null)
            {
                return NotFound();
            }

            var mood = await _context.Moods
                .FirstOrDefaultAsync(m => m.MoodId == id);
            if (mood == null)
            {
                return NotFound();
            }

            return Ok(mood);
        }

        // GET: Moods/Create
        [HttpGet("/moods/new")]
        public IActionResult Create()
        {
            return Ok();
        }

        // POST: Moods/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/moods/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MoodId,MoodName,MoodDescription")] Mood mood)
        {
            if (ModelState.IsValid)
            {
                _context.Add(mood);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return Ok(mood);
        }

        // GET: Moods/Edit/5
        [HttpGet("/moods/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Moods == null)
            {
                return NotFound();
            }

            var mood = await _context.Moods.FindAsync(id);
            if (mood == null)
            {
                return NotFound();
            }
            return Ok(mood);
        }

        // POST: Moods/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/moods/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MoodId,MoodName,MoodDescription")] Mood mood)
        {
            if (id != mood.MoodId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(mood);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MoodExists(mood.MoodId))
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
            return Ok(mood);
        }

        // GET: Moods/Delete/5
        [HttpGet("/moods/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Moods == null)
            {
                return NotFound();
            }

            var mood = await _context.Moods
                .FirstOrDefaultAsync(m => m.MoodId == id);
            if (mood == null)
            {
                return NotFound();
            }

            return Ok(mood);
        }

        // POST: Moods/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Moods == null)
            {
                return Problem("Entity set 'DemoDbContext.Moods'  is null.");
            }
            var mood = await _context.Moods.FindAsync(id);
            if (mood != null)
            {
                _context.Moods.Remove(mood);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MoodExists(int id)
        {
          return (_context.Moods?.Any(e => e.MoodId == id)).GetValueOrDefault();
        }
    }
}
