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
    public class Connect_SQL: System.Web.UI.Page
    {
        public SqlConnection conn;
        public Boolean Connect_Open()
        {
            try
            {
                if (conn == null)
                    conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnect"].ConnectionString);
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
                return true;
            }
            catch (SqlException)
            {      
                Session["exception"] = "Connect to SQL server fail";
                return false;
            }
        }
        public Boolean Connect_Close()
        {
            try
            {
                if ((conn != null) && (conn.State == ConnectionState.Open))
                    conn.Close();
                return true;
            }
            catch (SqlException)
            {
                Session["exception"] = "Connect to SQL server fail";
                return false;
            }
        }
    }
}