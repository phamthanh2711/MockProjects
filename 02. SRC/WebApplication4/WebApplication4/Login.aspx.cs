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
    public partial class Login : System.Web.UI.Page
    {
        SqlCommand com = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null) Response.Redirect("Form_Main.aspx");
        }

        protected string EncodePassword(string input)
        {
            MD5 md5 = System.Security.Cryptography.MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hashBytes = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hashBytes.Length; i++)
            {
                sb.Append(hashBytes[i].ToString("X2"));
            }
            return sb.ToString();
        }
        protected void btn_Click(object sender, EventArgs e)
        {
            try
            {
                String pass = EncodePassword(password.Text);
                Customer customer = new Customer();
                com.CommandText = "select_Account";
                com.Parameters.AddWithValue("@name", user.Text);
                com.Parameters.AddWithValue("@pass", pass);
                if (customer.Get_Data(com).Tables[0].Rows.Count > 0)
                {
                    Session["login"] = 1;
                    Response.Redirect("Form_Main.aspx");
                }
                else
                {
                    Session["login"] = null;
                    lblCheck.Text = "Incorrect username or password";
                }
            }
            catch (Exception)
            {
                lblCheck.Text = Session["exception"].ToString();
            }
        }
    }
}