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
    public class MoodlistsController : Controller
    {
        private readonly DemoDbContext _context;

        public MoodlistsController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: Moodlists
        [HttpGet("/moodlists")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.Moodlists.Include(m => m.Mood).Include(m => m.User);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: Moodlists/Details/5
        [HttpGet("/moodlists/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.Moodlists == null)
            {
                return NotFound();
            }

            var moodlist = await _context.Moodlists
                .Include(m => m.Mood)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MoodListId == id);
            if (moodlist == null)
            {
                return NotFound();
            }

            return Ok(moodlist);
        }

        // GET: Moodlists/Create
        [HttpGet("/moodlists/new")]
        public IActionResult Create()
        {
            ViewData["MoodId"] = new SelectList(_context.Moods, "MoodId", "MoodId");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: Moodlists/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/moodlists/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MoodListId,MoodId,UserId")] Moodlist moodlist)
        {
            if (ModelState.IsValid)
            {
                _context.Add(moodlist);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MoodId"] = new SelectList(_context.Moods, "MoodId", "MoodId", moodlist.MoodId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", moodlist.UserId);
            return Ok(moodlist);
        }

        // GET: Moodlists/Edit/5
        [HttpGet("/moodlists/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.Moodlists == null)
            {
                return NotFound();
            }

            var moodlist = await _context.Moodlists.FindAsync(id);
            if (moodlist == null)
            {
                return NotFound();
            }
            ViewData["MoodId"] = new SelectList(_context.Moods, "MoodId", "MoodId", moodlist.MoodId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", moodlist.UserId);
            return Ok(moodlist);
        }

        // POST: Moodlists/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/moodlists/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MoodListId,MoodId,UserId")] Moodlist moodlist)
        {
            if (id != moodlist.MoodListId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(moodlist);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!MoodlistExists(moodlist.MoodListId))
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
            ViewData["MoodId"] = new SelectList(_context.Moods, "MoodId", "MoodId", moodlist.MoodId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", moodlist.UserId);
            return Ok(moodlist);
        }

        // GET: Moodlists/Delete/5
        [HttpGet("/moodlists/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.Moodlists == null)
            {
                return NotFound();
            }

            var moodlist = await _context.Moodlists
                .Include(m => m.Mood)
                .Include(m => m.User)
                .FirstOrDefaultAsync(m => m.MoodListId == id);
            if (moodlist == null)
            {
                return NotFound();
            }

            return Ok(moodlist);
        }

        // POST: Moodlists/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.Moodlists == null)
            {
                return Problem("Entity set 'DemoDbContext.Moodlists'  is null.");
            }
            var moodlist = await _context.Moodlists.FindAsync(id);
            if (moodlist != null)
            {
                _context.Moodlists.Remove(moodlist);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool MoodlistExists(int id)
        {
          return (_context.Moodlists?.Any(e => e.MoodListId == id)).GetValueOrDefault();
        }
    }
}
