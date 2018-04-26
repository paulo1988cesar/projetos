namespace AppGamer.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class Modelo : DbContext
    {
        public Modelo()
            : base("name=Modelo")
        {
        }

        public virtual DbSet<EMPRESTIMO> EMPRESTIMO { get; set; }
        public virtual DbSet<GAME> GAME { get; set; }
        public virtual DbSet<PLATAFORMA> PLATAFORMA { get; set; }
        public virtual DbSet<AspNetUsers> AspNetUsers { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<EMPRESTIMO>()
                .Property(e => e.CODUSER)
                .IsUnicode(false);

            modelBuilder.Entity<GAME>()
                .Property(e => e.DESCRICAO)
                .IsUnicode(false);

            modelBuilder.Entity<PLATAFORMA>()
                .Property(e => e.DESCRICAO)
                .IsUnicode(false);

            modelBuilder.Entity<PLATAFORMA>()
                .HasMany(e => e.GAME)
                .WithRequired(e => e.PLATAFORMA)
                .WillCascadeOnDelete(false);
            
        }
    }
}
