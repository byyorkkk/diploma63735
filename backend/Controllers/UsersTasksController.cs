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
    public class UsersTasksController : Controller
    {
        private readonly DemoDbContext _context;

        public UsersTasksController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: UsersTasks
        [HttpGet("/userstasks")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.UsersTasks.Include(u => u.Task).Include(u => u.User);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: UsersTasks/Details/5
        [HttpGet("/userstasks/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.UsersTasks == null)
            {
                return NotFound();
            }

            var usersTask = await _context.UsersTasks
                .Include(u => u.Task)
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usersTask == null)
            {
                return NotFound();
            }

            return Ok(usersTask);
        }

        // GET: UsersTasks/Create
        [HttpGet("/userstasks/new")]
        public IActionResult Create()
        {
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId");
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId");
            return Ok();
        }

        // POST: UsersTasks/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/userstasks/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("UserId,TaskId")] UsersTask usersTask)
        {
            if (ModelState.IsValid)
            {
                _context.Add(usersTask);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", usersTask.TaskId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", usersTask.UserId);
            return Ok(usersTask);
        }

        // GET: UsersTasks/Edit/5
        [HttpGet("/userstasks/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.UsersTasks == null)
            {
                return NotFound();
            }

            var usersTask = await _context.UsersTasks.FindAsync(id);
            if (usersTask == null)
            {
                return NotFound();
            }
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", usersTask.TaskId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", usersTask.UserId);
            return Ok(usersTask);
        }

        // POST: UsersTasks/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/userstasks/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("UserId,TaskId")] UsersTask usersTask)
        {
            if (id != usersTask.UserId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(usersTask);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UsersTaskExists(usersTask.UserId))
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
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", usersTask.TaskId);
            ViewData["UserId"] = new SelectList(_context.Users, "UserId", "UserId", usersTask.UserId);
            return Ok(usersTask);
        }

        // GET: UsersTasks/Delete/5
        [HttpGet("/userstasks/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.UsersTasks == null)
            {
                return NotFound();
            }

            var usersTask = await _context.UsersTasks
                .Include(u => u.Task)
                .Include(u => u.User)
                .FirstOrDefaultAsync(m => m.UserId == id);
            if (usersTask == null)
            {
                return NotFound();
            }

            return Ok(usersTask);
        }

        // POST: UsersTasks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.UsersTasks == null)
            {
                return Problem("Entity set 'DemoDbContext.UsersTasks'  is null.");
            }
            var usersTask = await _context.UsersTasks.FindAsync(id);
            if (usersTask != null)
            {
                _context.UsersTasks.Remove(usersTask);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool UsersTaskExists(int id)
        {
          return (_context.UsersTasks?.Any(e => e.UserId == id)).GetValueOrDefault();
        }
    }
}
