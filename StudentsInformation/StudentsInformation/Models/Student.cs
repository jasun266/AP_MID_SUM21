using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace StudentsInformation.Models
{
	public class Student
	{
        public int Id { get; set; }

        [Required(ErrorMessage = "Enter your name")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Enter your DOB")]
        public string DOB { get; set; }

        [Required(ErrorMessage = "Enter your Credit")]
        public int Credit { get; set; }

        [Required(ErrorMessage = "Enter your CGPA")]
        public double CGPA { get; set; }

        [Required(ErrorMessage = "Enter your Dept_id")]
        public int Dept_id { get; set; }
    }
}