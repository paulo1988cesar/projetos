namespace AppGamer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("EMPRESTIMO")]
    public partial class EMPRESTIMO
    {
        [Key]
        public int CODEMPRESTIMO { get; set; }

        [Required(ErrorMessage = "O Emprestando deve ser informado.")]
        [Display(Name = "Emprestando")]
        [StringLength(128)]
        public string CODUSER { get; set; }
        
        [Required(ErrorMessage = "O Game deve ser informado.")]
        [Display(Name = "Game")]
        public int CODGAME { get; set; }

        public DateTime DATAEMPRESTIMO { get; set; }

        public virtual GAME GAME { get; set; }
    }
}
