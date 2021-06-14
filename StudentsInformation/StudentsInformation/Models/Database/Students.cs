using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace StudentsInformation.Models.Database
{
	public class Students
	{
        SqlConnection conn;

        public Students(SqlConnection conn)
        {
            this.conn = conn;
        }
        public void Insert(Student p)
        {

            string query = "Insert into Students values(@Name,@DOB,@Credit,@CGPA,@Dept_id)";
            SqlCommand cmd = new SqlCommand(query, conn);
            cmd.Parameters.AddWithValue("@Name", p.Name);
            cmd.Parameters.AddWithValue("@DOB", p.DOB);
            cmd.Parameters.AddWithValue("@Credit", p.Credit);
            cmd.Parameters.AddWithValue("@CGPA", p.CGPA);
            cmd.Parameters.AddWithValue("@Dept_id", p.Dept_id);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

        }
        public List<Student> GetAll()
        {
            List<Student> students = new List<Student>();
            string query = "select * from Students";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                Student p = new Student()
                {
                    Id = reader.GetInt32(reader.GetOrdinal("Id")),
                    Name = reader.GetString(reader.GetOrdinal("Name")),
                    DOB = reader.GetString(reader.GetOrdinal("DOB")),
                    Credit = reader.GetInt32(reader.GetOrdinal("Credit")),
                    CGPA = reader.GetDouble(reader.GetOrdinal("CGPA")),
                    Dept_id = reader.GetInt32(reader.GetOrdinal("Dept_id")),
                };
                students.Add(p);
            }
            conn.Close();
            return students;
        }
        public Student Get(int id)
        {
            Student p = null;
            string query = $"select * from Students Where Id={id}";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                p = new Student()
                {
                    Id = reader.GetInt32(reader.GetOrdinal("Id")),
                    Name = reader.GetString(reader.GetOrdinal("Name")),
                    DOB = reader.GetString(reader.GetOrdinal("DOB")),
                    Credit = reader.GetInt32(reader.GetOrdinal("Credit")),
                    CGPA = reader.GetDouble(reader.GetOrdinal("CGPA")),
                    Dept_id = reader.GetInt32(reader.GetOrdinal("Dept_id")),
                };
            }
            conn.Close();
            return p;
        }
        public void Update(Student p)
        {
            string query = $"Update Students Set Name='{p.Name}', DOB={p.DOB} ,Credit={p.Credit}, CGPA='{p.CGPA}' ,Dept_id='{p.Dept_id}' Where ID = {p.Id}";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        public void Delete(Student p)
        {
            string query = $"DELETE FROM Students WHERE ID = {p.Id}";
            SqlCommand cmd = new SqlCommand(query, conn);
            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}