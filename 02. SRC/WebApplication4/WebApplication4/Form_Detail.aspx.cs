using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Drawing;
using System.Text;

namespace WebApplication4
{
    public partial class Form_Detail : System.Web.UI.Page
    {

        public String id = "";
        public String name = "", birth = "", gender = "", email = "", phone = "", address = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["status"] == null || Session["id"]==null)
                {
                    Response.Redirect("Form_Main.aspx");
                }
                else
                {
                    id = Session["id"].ToString();
                    txt_ID.Text = id;
                    txt_Birth.Attributes.Add("readonly", "true");
                }
                if (!IsPostBack)
                {
                    if (Session["status"].ToString() == "update")
                    {
                        Customer customer = new Customer();
                        DataTable dt = new DataTable();
                        dt = customer.Select_Customer(id);
                        if (dt != null)
                        {
                            txt_ID.Text = dt.Rows[0]["id"].ToString();
                            txt_Name.Text = dt.Rows[0]["name"].ToString();
                            txt_Birth.Text = dt.Rows[0]["birth"].ToString();
                            if (String.Compare(dt.Rows[0]["gender"].ToString(), HttpUtility.HtmlDecode("Male")) == 0)
                            {
                                rdb_Male.Checked = true; rdb_Female.Checked = false;
                            }
                            else
                            {
                                rdb_Female.Checked = true; rdb_Male.Checked = false;
                            }

                            txt_Phone.Text = dt.Rows[0]["phone"].ToString();
                            txt_Email.Text = dt.Rows[0]["email"].ToString();
                            txt_Address.Text = dt.Rows[0]["address"].ToString();

                            btnInsert.Text = "Update";
                        }
                        else
                        {
                            Label1.Text = "Cannot select data of customer";
                            Panel_Mess.Attributes.Add("style", "display: block");
                        }
                    }
                }
            }
            catch (SqlException)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        // Delete white space in string
        protected String Delete_Space(String s)
        {
            if (String.IsNullOrEmpty(s))
                return s;

            string result = "";

            // Get list of word in string 

            string[] words = s.Split(' ');

            foreach (string word in words)
            {
                // If words that have whitespace, remove whitespace
                if (word.Trim() != "")
                {
                    if (word.Length > 1)
                    {
                        result += word.Substring(0, 1).ToUpper() + word.Substring(1).ToLower() + " ";
                    }
                    else
                    {
                        result += word.ToUpper() + " ";
                    }
                }
            }
            return result.Trim();
        }

        // Insert or update customer into table
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                name = Delete_Space(txt_Name.Text.Trim());
                birth = txt_Birth.Text.Trim();
                if (rdb_Male.Checked == true)
                {
                    gender = "Male";
                }
                else
                {
                    gender = "Female";
                }               
                phone = txt_Phone.Text.Trim();
                email = txt_Email.Text.Trim();
                address = txt_Address.Text.Trim();
                Customer customer = new Customer();
                if (Session["status"].ToString() == "insert")
                {
                    Boolean check = false;
                    check = customer.Add_Customer("Insert_Customer", id, name, birth, gender, phone, email, address);
                    if (check == true)
                    {
                        Label1.Text = "Insert success into table";
                        Panel_Mess.Attributes.Add("style", "display: block");
                    }
                    else
                    {
                        Label1.Text = "Insert fail into table";
                        Panel_Mess.Attributes.Add("style", "display: block");
                    }
                }

                if (Session["status"].ToString() == "update")
                {
                    Boolean check = false;
                    check = customer.Add_Customer("Update_Customer", id, name, birth, gender, phone, email, address);
                    if (check == true)
                    {
                        Label1.Text = "Update success into table";
                        Panel_Mess.Attributes.Add("style", "display: block");
                    }
                    else
                    {
                        Label1.Text = "Update fail into table";
                        Panel_Mess.Attributes.Add("style", "display: block");
                    }
                }
                Session["id"] = null;
            }
            catch (SqlException)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        // When click will be returned to main form
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Form_Main.aspx");
            }
            catch (HttpException)
            {
                Label1.Text = "Cannot return to form main";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            try
            {
                Response.Redirect("Form_Main.aspx");
            }
            catch (HttpException)
            {
                Label1.Text = "Cannot return to form main";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        protected void btnOut_Click(object sender, EventArgs e)
        {
            try
            {
                Session["login"] = null;
                Response.Redirect("Login.aspx");
            }
            catch (HttpException)
            {
                Label1.Text = "Button log out error";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }
    }
}