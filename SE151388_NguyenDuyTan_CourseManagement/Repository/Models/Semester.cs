using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

#nullable disable

namespace CrouseManagement.Repository.Models
{
    public partial class Semester
    {
        public Semester()
        {
            Courses = new HashSet<Course>();
            DateCreate = DateTime.Now;
            Status = 1;
        }
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string SemesterName { get; set; }
        public DateTime? DateCreate { get; set; }
        public int? Status { get; set; }
        public string SemesterCode { get; set; }

        public virtual ICollection<Course> Courses { get; set; }
    }
}
