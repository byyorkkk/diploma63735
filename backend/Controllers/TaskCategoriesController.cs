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
    public class TaskCategoriesController : Controller
    {
        private readonly DemoDbContext _context;

        public TaskCategoriesController(DemoDbContext context)
        {
            _context = context;
        }

        // GET: TaskCategories
        [HttpGet("/taskcategories")]
        public async Task<IActionResult> Index()
        {
            var demoDbContext = _context.TaskCategories.Include(t => t.Category).Include(t => t.Task);
            return Ok(await demoDbContext.ToListAsync());
        }

        // GET: TaskCategories/Details/5
        [HttpGet("/taskcategories/{id}")]
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.TaskCategories == null)
            {
                return NotFound();
            }

            var taskCategory = await _context.TaskCategories
                .Include(t => t.Category)
                .Include(t => t.Task)
                .FirstOrDefaultAsync(m => m.TaskId == id);
            if (taskCategory == null)
            {
                return NotFound();
            }

            return Ok(taskCategory);
        }

        // GET: TaskCategories/Create
        [HttpGet("/taskcategories/new")]
        public IActionResult Create()
        {
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId");
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId");
            return Ok();
        }

        // POST: TaskCategories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/taskcategories/new")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("TaskId,CategoryId")] TaskCategory taskCategory)
        {
            if (ModelState.IsValid)
            {
                _context.Add(taskCategory);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", taskCategory.CategoryId);
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", taskCategory.TaskId);
            return Ok(taskCategory);
        }

        // GET: TaskCategories/Edit/5
        [HttpGet("/taskcategories/{id}/edit")]
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.TaskCategories == null)
            {
                return NotFound();
            }

            var taskCategory = await _context.TaskCategories.FindAsync(id);
            if (taskCategory == null)
            {
                return NotFound();
            }
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", taskCategory.CategoryId);
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", taskCategory.TaskId);
            return Ok(taskCategory);
        }

        // POST: TaskCategories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost("/taskcategories/create")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("TaskId,CategoryId")] TaskCategory taskCategory)
        {
            if (id != taskCategory.TaskId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(taskCategory);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!TaskCategoryExists(taskCategory.TaskId))
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
            ViewData["CategoryId"] = new SelectList(_context.Categories, "CategoryId", "CategoryId", taskCategory.CategoryId);
            ViewData["TaskId"] = new SelectList(_context.Tasks, "TaskId", "TaskId", taskCategory.TaskId);
            return Ok(taskCategory);
        }

        // GET: TaskCategories/Delete/5
        [HttpGet("/taskcategories/{id}/delete")]
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.TaskCategories == null)
            {
                return NotFound();
            }

            var taskCategory = await _context.TaskCategories
                .Include(t => t.Category)
                .Include(t => t.Task)
                .FirstOrDefaultAsync(m => m.TaskId == id);
            if (taskCategory == null)
            {
                return NotFound();
            }

            return Ok(taskCategory);
        }

        // POST: TaskCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.TaskCategories == null)
            {
                return Problem("Entity set 'DemoDbContext.TaskCategories'  is null.");
            }
            var taskCategory = await _context.TaskCategories.FindAsync(id);
            if (taskCategory != null)
            {
                _context.TaskCategories.Remove(taskCategory);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool TaskCategoryExists(int id)
        {
          return (_context.TaskCategories?.Any(e => e.TaskId == id)).GetValueOrDefault();
        }
    }
}
