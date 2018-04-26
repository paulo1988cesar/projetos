namespace AppGamer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AspNetUsers")]
    public class AspNetUsers
    {
        [Key]
        [StringLength(128)]
        public string Id { get; set; }

        [Required]
        [StringLength(256)]
        public string Email { get; set; }

        public string PasswordHash { get; set; }

        public string SecurityStamp { get; set; }

        public string PhoneNumber { get; set; }

        public bool PhoneNumberConfirmed { get; set; }

        public bool TwoFactorEnabled { get; set; }

        //[Required]
        //public DateTime LockoutEndDateUtc { get; set; }

        [Required]
        public int AccessFailedCount { get; set; }

        [Required]
        [StringLength(256)]
        public string UserName { get; set; }
    }

}