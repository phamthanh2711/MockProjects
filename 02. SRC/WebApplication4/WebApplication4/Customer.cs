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
        private DataTable dt= new DataTable();
        private Connect_SQL sql =new Connect_SQL();
        private String id, name, gender, birth, phone, email, address;
        private int current_row=0, count_row=0;

        public Customer()
        {
            id = "";
            name = "";
            gender = "";
            birth = "";
            phone = "";
            email = "";
            address = "";
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
        
        //Select customer in table by id
        public DataTable Select_Customer(String id)
        {
            try
            {
                var param = new List<Tuple<string, string>>();
                param.Add(Tuple.Create("@id", id));
                String query = "Select_Customer";

                dt = sql.Get_Data(query, param);
                count_row = dt.Rows.Count;
                current_row = 0;
                if (count_row > 0)
                {
                    Set_Values();
                }
                return dt;
            }
            catch(Exception ex)
            {
                throw ex;
            }   
        }
        
        //get count of row in table
        public int Get_Count_Row()
        {
            try
            {
                String query = "Count_Row";
                return Int32.Parse(sql.Get_Data(query,null).Rows[0].ItemArray[0].ToString());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        
        //insert or update customer into table
        public Boolean Add_Customer(String query, string id, String name, String birth, String gender, String phone, String email, String address)
        {
            try
            {
                var param = new List<Tuple<string, string>>();
                param.Add(Tuple.Create("@id", id));
                param.Add(Tuple.Create("@name", name));
                param.Add(Tuple.Create("@birth", birth));
                param.Add(Tuple.Create("@gender", gender));
                param.Add(Tuple.Create("@phone", phone));
                param.Add(Tuple.Create("@email", email));
                param.Add(Tuple.Create("@address", address));

                if (sql.ExeCuteNonQuery(query, param))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        
        //delete customer in table
        public Boolean Delete_Customer(String query, string id)
        {
            try
            {
                var param = new List<Tuple<string, string>>();
                param.Add(Tuple.Create("@id", id));

                if (sql.ExeCuteNonQuery(query,param))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch(Exception ex)
            {
                throw ex;
            }       
        }
        
        //find customer in table
        public DataTable Find_Customer(string id, String name)
        {
            try
            {
                var param = new List<Tuple<string, string>>();
                param.Add(Tuple.Create("@id", id));
                param.Add(Tuple.Create("@name", name));
                String query = "Find_Customer";

                dt = sql.Get_Data(query,param);
                return dt;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
