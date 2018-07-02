using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication4
{
    public class Customer: System.Web.UI.Page
    {
        private SqlCommand com;
        private DataSet ds;
        private DataTable dt;
        private SqlDataAdapter da;
        private Connect_SQL sql;
        private String id, name, gender, birth, phone, email, address;
        private int current_row, count_row;

        public Customer()
        {
            sql = new Connect_SQL();
            com = new SqlCommand();
            ds = new DataSet();
            dt = new DataTable();
            da = new SqlDataAdapter();

            id = "";
            name = "";
            gender = "";
            birth = "";
            phone = "";
            email = "";
            address = "";
            current_row = 0;
            count_row = 0;
        }

        public string get_id() { return id; }
        public string get_name() { return name; }
        public string get_birth() { return birth; }
        public string get_phone() { return phone; }
        public string get_email() { return email; }
        public string get_address() { return address; }
        public string get_gender() { return gender; }

        private void Set_Values()
        {
            id = Convert.ToString(dt.Rows[current_row]["id"]);
            name = Convert.ToString(dt.Rows[current_row]["name"]);
            birth = Convert.ToString(dt.Rows[current_row]["birth"]);
            gender = Convert.ToString(dt.Rows[current_row]["gender"]);
            phone = Convert.ToString(dt.Rows[current_row]["phone"]);
            email = Convert.ToString(dt.Rows[current_row]["email"]);
            address = Convert.ToString(dt.Rows[current_row]["address"]);
        }

        public DataSet Get_Data(SqlCommand com)
        {
            try
            {
                if(sql.Connect_Open())
                {
                    com.Connection = sql.conn;
                    com.CommandType = CommandType.StoredProcedure;
                    da = new SqlDataAdapter();
                    da.SelectCommand = com;
                    da.Fill(ds);
                    sql.Connect_Close();
                    return ds;
                }
                return null;
            }
            catch (Exception)
            {
                Session["exception"] = "error sql query";
                return null;
            }
        }
        public Boolean ExeCuteNonQuery(SqlCommand com)
        {
            try
            {
                Boolean check;
                sql.Connect_Open();
                com.Connection = sql.conn;
                com.CommandType = CommandType.StoredProcedure;
                if (com.ExecuteNonQuery() > 0) check = true;
                else check = false;
                SqlDataAdapter da = new SqlDataAdapter(com);
                sql.Connect_Close();
                return check;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        public DataTable Select_Customer(String id)
        {

            com.CommandText = "Select_Customer";
            com.Parameters.Clear();
            com.Parameters.AddWithValue("@id", id);
            dt = Get_Data(com).Tables[0];
            count_row = dt.Rows.Count;
            current_row = 0;
            if (count_row > 0)
                Set_Values();
            return dt;
        }

        public int Get_Count_Row()
        {
            try
            {
                com.CommandText = "Count_Row";
                com.Parameters.Clear();
                return Int32.Parse(Get_Data(com).Tables[0].Rows[0].ItemArray[0].ToString());
            }
            catch
            {
                return -1;
            }
        }

        public Boolean Add_Customer(String query, string id, String name, String birth, String gender, String phone, String email, String address)
        {
            try
            {
                com.CommandText = query;
                com.Parameters.Clear();
                com.Parameters.AddWithValue("@id", id);
                com.Parameters.AddWithValue("@name", name);
                com.Parameters.AddWithValue("@birth", birth);
                com.Parameters.AddWithValue("@gender", gender);
                com.Parameters.AddWithValue("@phone", phone);
                com.Parameters.AddWithValue("@email", email);
                com.Parameters.AddWithValue("@address", address);
                if (ExeCuteNonQuery(com))
                    return true;
                else
                    return false;
            }
            catch { return false; }
        }

        public Boolean Delete_Customer(String query, string id)
        {
            try
            {
                com = new SqlCommand();
                com.CommandText = query;
                com.Parameters.Clear();
                com.Parameters.AddWithValue("@id", id);
                if (ExeCuteNonQuery(com))
                    return true;
                else
                    return false;
            }
            catch { return false; }
        }

        public DataTable Find_Customer(string id, String name)
        {
            try
            {
                com.CommandText = "Find_Customer";
                com.Parameters.Clear();
                com.Parameters.AddWithValue("@id", id);
                com.Parameters.AddWithValue("@name", name);
                dt = Get_Data(com).Tables[0];
                return dt;
            }
            catch { return dt; }
        }
    }
}