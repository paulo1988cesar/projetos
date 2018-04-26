namespace AppGamer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("GAME")]
    public partial class GAME
    {
        [Key]
        public int CODGAME { get; set; }

        [Required(ErrorMessage = "A Plataforma é obrigatória.")]
        [Display(Name = "Plataforma")]
        public int CODPLATAFORMA { get; set; }

        [Required]
        [StringLength(128)]
        public string CODUSER { get; set; }

        [Required(ErrorMessage = "A Descrição do Game é obrigatória.")]
        [Display(Name = "Descrição")]
        [StringLength(100, ErrorMessage = "A Descrição do Game é muito pequena.", MinimumLength = 3)]
        public string DESCRICAO { get; set; }

        public int ANO { get; set; }

        public bool TITULOEMPRESTADO { get; set; }

        public virtual PLATAFORMA PLATAFORMA { get; set; }
    }
}
