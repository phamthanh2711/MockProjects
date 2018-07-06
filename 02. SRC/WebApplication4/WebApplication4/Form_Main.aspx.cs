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

        public void Load_Data()
        {
            try
            {
                if(Session["index"]!=null)
                GridView1.PageIndex = Int32.Parse(Session["index"].ToString());
                GridView1.DataSource = customer.Find_Customer(txt_ID.Text, txt_Name.Text);
                GridView1.DataBind();
            }
            catch(SqlException)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }          
        }

        //load page 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                Load_Data();
            }
        }

        // Auto create ID of customer 
        public void Get_ID()
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
                throw ex;
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
            catch (Exception)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            //Verify Rendering In Server Form
        }

        // refresh table to original default
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Clear_TextBox();
            Load_Data();
        }

        //Open dropdownlist to select count row will display in gridview
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            GridView1.PageSize = Int32.Parse(DropDownList1.SelectedItem.ToString());
            Load_Data();
        }

        //Open the detail page to insert a customer into table
        protected void btnOpenInsert_Click(object sender, EventArgs e)
        {
            try
            {
                Session["status"] = "insert";
                Get_ID();
                if (Session["id"] != null)
                {
                    Response.Redirect("Form_Detail.aspx");
                }
                    
            }
            catch(SqlException)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
            catch (HttpException)
            {
                Label1.Text = "Cannot open form detail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        //Remove customers from table
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
                    Label1.Text = "Please choose textbox to delete";
                    Panel_Mess.Attributes.Add("style", "display: block");
                }
            }
            catch (SqlException)
            {
                Label1.Text = "Connect to Database fail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }
        }

        // button log out the page
        protected void btnOut_Click(object sender, EventArgs e)
        {
            try {
                Session["login"] = null;
                Response.Redirect("Login.aspx");
            } catch(HttpException)
            {
                Label1.Text = "Button log out error";
                Panel_Mess.Attributes.Add("style", "display: block");
            }  
        }

        // change index page of gridview
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try {
                GridView1.PageIndex = e.NewPageIndex;
                Session["index"] = GridView1.PageIndex;
                Load_Data();
            } catch(ArgumentOutOfRangeException)
            {
                Label1.Text = "property is set to a value less than 0";
                Panel_Mess.Attributes.Add("style", "display: block");
            }   
        }


        //event when click the cell in gridview
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            try {
                GridView1.SelectedRowStyle.BackColor = Color.DarkCyan;
                GridViewRow gr = GridView1.SelectedRow;
                Session["id"] = gr.Cells[0].Text.Trim();
                Session["status"] = "update";
                Response.Redirect("Form_Detail.aspx");
            } catch(HttpException)
            {
                Label1.Text = "Cannot open form detail";
                Panel_Mess.Attributes.Add("style", "display: block");
            }           
        }

        protected void btnReturn_Click(object sender, EventArgs e)
        {
            Panel_Mess.Attributes.Add("style", "display: hidden");
            Load_Data();         
        }


        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Pager)
            {
                int i = 0;
                foreach (Control ctl in e.Row.Cells[0].Controls[0].Controls[0].Controls)
                {
                    i++;
                    if (ctl.Controls[0].GetType().ToString() == "System.Web.UI.WebControls.DataControlPagerLinkButton")
                    {
                        LinkButton lnk = (LinkButton)ctl.Controls[0];
                        if (lnk.Text == "...")
                        {
                            if (i < 3)
                            {
                                lnk.Text = "<<";
                            }
                            else
                            {
                                lnk.Text = ">>";
                            }
                        }
                    }
                }
            }
        }

        //Export data of table to file excel
        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", ""+DateTime.Today.ToString("yyyyMMdd").Trim()+".xls"));
                Response.ContentType = "application/ms-excel";
                Response.ContentEncoding = System.Text.Encoding.Unicode;
                Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

                StringWriter stringWriter = new StringWriter();

                HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);

                GridView1.HeaderRow.Style.Add("background-color", "#111");
                GridView1.Columns[7].Visible = false;
                GridView1.Columns[8].Visible = false;
                GridView1.AllowPaging = false;
                GridView1.DataSource= customer.Find_Customer(txt_ID.Text, txt_Name.Text);
                GridView1.DataBind();

                GridView1.RenderControl(textWriter);
                Response.Write(stringWriter.ToString());
                Response.End();
            }
            catch(Exception) {
                Label1.Text = "Cannot export file excel";
                Panel_Mess.Attributes.Add("style", "display: block");
            }  
        }
    }
}