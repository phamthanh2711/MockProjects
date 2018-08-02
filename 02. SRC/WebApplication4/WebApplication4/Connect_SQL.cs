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
        private SqlCommand com;
        private DataSet ds;
        private DataTable dt;
        private SqlDataAdapter da;

        public Connect_SQL()
        {
            com = new SqlCommand();
            ds = new DataSet();
            dt = new DataTable();
            da = new SqlDataAdapter();
        }

        public void Connect_Open()
        {
            try
            {
                if (conn == null)
                    conn = new SqlConnection(ConfigurationManager.ConnectionStrings["dbConnect"].ConnectionString);

                if (conn.State == ConnectionState.Closed)
                    conn.Open();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
           
        }
        public void Connect_Close()
        {
            try
            {
                if ((conn != null) && (conn.State == ConnectionState.Open))
                    conn.Close();
            }
            catch (SqlException ex)
            {
                throw ex;
            }
        }

        public DataTable Get_Data(SqlCommand com)
        {
            try
            {
                Connect_Open();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                da = new SqlDataAdapter();
                da.SelectCommand = com;
                da.Fill(dt);
                Connect_Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public DataTable Get_Data(String query, List<Tuple<string, string>> param)
        {
            try
            {
                Connect_Open();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = query;
                com.Parameters.Clear();
                if (param != null)
                {
                    for (int i = 0; i < param.Count; i++)
                    {
                        com.Parameters.AddWithValue(param[i].Item1, param[i].Item2);
                    }
                }
                da = new SqlDataAdapter();
                da.SelectCommand = com;
                da.Fill(dt);
                Connect_Close();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public Boolean ExeCuteNonQuery(String query, List<Tuple<string, string>> param)
        {
            try
            {
                Connect_Open();
                com.Connection = conn;
                com.CommandType = CommandType.StoredProcedure;
                com.CommandText = query;
                com.Parameters.Clear();
                for (int i = 0; i < param.Count; i++)
                {
                    com.Parameters.AddWithValue(param[i].Item1, param[i].Item2);
                }
                if (com.ExecuteNonQuery() > 0)
                {
                    Connect_Close();
                    return true;
                }
                else
                {
                    Connect_Close();
                    return false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}