namespace AppGamer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PLATAFORMA")]
    public partial class PLATAFORMA
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PLATAFORMA()
        {
            GAME = new HashSet<GAME>();
        }

        [Key]
        public int CODPLATAFORMA { get; set; }

        [Required(ErrorMessage = "A Plataforma � obrigat�ria.")]
        [Display(Name = "Descri��o")]
        [StringLength(100, ErrorMessage = "A Descri��o da Plataforma � muito pequena.", MinimumLength = 3)]
        public string DESCRICAO { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<GAME> GAME { get; set; }
    }
}
