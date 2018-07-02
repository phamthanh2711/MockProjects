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
using System.IO;

namespace WebApplication4
{
    public partial class Form_Main : System.Web.UI.Page
    {
        Customer customer = new Customer();

        // Clear all of textbox on form
        public void Clear_TextBox()
        {
            txt_Name.Text = "";
            txt_ID.Text = "";
            GridView1.SelectedRowStyle.BackColor = Color.Transparent;
        }


        //load page 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                DataTable dt = new DataTable();
                GridView1.DataSource = customer.Find_Customer(txt_ID.Text, txt_Name.Text);
                GridView1.DataBind();
            }
        }

        // Auto create ID of customer 
        public void get_ID()
        {
            try
            {    
                if(customer.Get_Count_Row()!=-1)
                { 
                int stt = 0;
                stt = customer.Get_Count_Row();
                String ma = Constant.head_ID + (stt+1).ToString("000000");
                Session["id"] = ma;
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
           
        }

        //Find customer by name or ID input
        protected void btnFind_Click(object sender, EventArgs e)
        {
            try
            { 
                GridView1.DataSource = customer.Find_Customer(txt_ID.Text.Trim(), txt_Name.Text.Trim());
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {

        }

        // refresh table to original default
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear_TextBox();
            GridView1.DataSource = customer.Select_Customer("");
            GridView1.DataBind();
        }

        //Open dropdownlist to select count row will display in gridview
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridView1.PageSize = Int32.Parse(DropDownList1.SelectedItem.ToString());
            GridView1.DataSource = customer.Find_Customer(txt_ID.Text.Trim(), txt_Name.Text.Trim());
            GridView1.DataBind();
        }

        //Open the detail page to insert a customer into table
        protected void btnOpenInsert_Click(object sender, EventArgs e)
        {
            Session["status"] = "insert";
            get_ID();
            Response.Redirect("Form_Detail.aspx");
        }

        //remove customers from table
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                bool check= false;
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox status = ((CheckBox)row.Cells[8].FindControl("CheckBox1"));
                    String id = row.Cells[0].Text;
                    if(status.Checked)
                    {
                        check=customer.Delete_Customer("Delete_Customer", id);
                    }
                }
                if(check==true)
                {
                    Label1.Text = "Delete success";
                    Panel_Mess.Attributes.Add("style", "display: block");
                }
                else
                {
                    Label1.Text = "Delete fail";
                    Panel_Mess.Attributes.Add("style", "display: block");
                }
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        // button log out the page
        protected void btnOut_Click(object sender, EventArgs e)
        {
            Session["login"] = null;
            Response.Redirect("Login.aspx");
        }

        // change index page of gridview
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = customer.Find_Customer(txt_ID.Text.Trim(), txt_Name.Text.Trim());
            GridView1.DataBind();
        }


        //event when click the cell in gridview
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                GridView1.SelectedRowStyle.BackColor = Color.DarkCyan;
                GridViewRow gr = GridView1.SelectedRow;
                Session["id"] = gr.Cells[0].Text.Trim();
                Session["status"] = "update";
                Response.Redirect("Form_Detail.aspx");
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Form_Main.aspx");
        }
    }
}