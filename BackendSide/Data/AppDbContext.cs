using BackendSide.Models;
using Microsoft.EntityFrameworkCore;

namespace BackendSide.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Question>().HasKey(Q => new
            //{
            //    Q.Id
            //});

            //modelBuilder.Entity<Option>().HasKey(O => new
            //{
            //    O.OptionId
            //});

            //modelBuilder.Entity<Option>().HasForeignKey(O => O.QuestionId);


            base.OnModelCreating(modelBuilder);
        }

        public DbSet<Question> Question { get; set; }

        public DbSet<Option> Option { get; set; }
    }
}
