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
    public class Connect_SQL
    {
        public SqlConnection conn;
        public void Connect_Open()
        {
            try
            {
                if (conn == null)
                    conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnect"].ConnectionString);
                if (conn.State == ConnectionState.Closed)
                    conn.Open();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
        public void Connect_Close()
        {
            try
            {
                if ((conn != null) && (conn.State == ConnectionState.Open))
                    conn.Close();
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }
    }
}