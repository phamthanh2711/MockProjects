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
        private DataTable dt = new DataTable();
        private Connect_SQL sql = new Connect_SQL();
        private SqlCommand com = new SqlCommand();

        // Clear all of textbox on form
        public void Clear_TextBox()
        {
            txt_Name.Text = "";
            txt_ID.Text = "";
            GridView1.SelectedRowStyle.BackColor = Color.Transparent;
        }

        public void Find_Customer(int pageIndex)
        {
            try
            {
                com.Parameters.Clear();
                com.Parameters.AddWithValue("@id", txt_ID.Text);
                com.Parameters.AddWithValue("@name", txt_Name.Text);
                com.Parameters.AddWithValue("@PageSize", DropDownList1.SelectedValue);
                com.Parameters.AddWithValue("@PageNum", pageIndex);
                com.Parameters.Add("@RecordCount", SqlDbType.Int, 4);
                com.Parameters["@RecordCount"].Direction = ParameterDirection.Output;
                com.CommandText = "Find_Customer";
                dt= sql.Get_Data(com);
                int recordCount = Convert.ToInt32(com.Parameters["@RecordCount"].Value);
                this.PopulatePager(recordCount, pageIndex);
                GridView1.DataSource= dt;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Page_Changed(object sender, EventArgs e)
        {
            int pageIndex = int.Parse((sender as LinkButton).CommandArgument);
            this.Find_Customer(pageIndex);
            Session["index"] = pageIndex;
        }

        private void PopulatePager(int recordCount, int currentPage)
        {
            List<ListItem> pages = new List<ListItem>();
            int startIndex, endIndex;
            int pagerSpan = 3;

            //Calculate the Start and End Index of pages to be displayed.
            double dblPageCount = (double)((decimal)recordCount / Convert.ToDecimal(DropDownList1.SelectedValue));
            int pageCount = (int)Math.Ceiling(dblPageCount);
            startIndex = currentPage > 1 && currentPage + pagerSpan - 1 < pagerSpan ? currentPage : 1;
            endIndex = pageCount > pagerSpan ? pagerSpan : pageCount;
            if (currentPage > pagerSpan % 2)
            {
                if (currentPage == 2)
                {
                    endIndex = 3;
                }
                else
                {
                    endIndex = currentPage + 1;
                }
            }
            else
            {
                endIndex = (pagerSpan - currentPage) + 1;
            }

            if (endIndex - (pagerSpan - 1) > startIndex)
            {
                startIndex = endIndex - (pagerSpan - 1);
            }

            if (endIndex > pageCount)
            {
                endIndex = pageCount;
                startIndex = ((endIndex - pagerSpan) + 1) > 0 ? (endIndex - pagerSpan) + 1 : 1;
            }

            //Add the First Page Button.
            if (currentPage > 1)
            {
                pages.Add(new ListItem("First", "1"));
            }

            //Add the Previous Button.
            if (currentPage > 2)
            {
                pages.Add(new ListItem("<<", (currentPage - 2).ToString()));
            }

            for (int i = startIndex; i <= endIndex; i++)
            {
                pages.Add(new ListItem(i.ToString(), i.ToString(), i != currentPage));
            }

            //Add the Next Button.
            if (currentPage < pageCount-1)
            {
                pages.Add(new ListItem(">>", (currentPage + 2).ToString()));
            }

            //Add the Last Button.
            if (currentPage != pageCount)
            {
                pages.Add(new ListItem("Last", pageCount.ToString()));
            }

            ///////////////////////////////////////////////////////////////
            

           
            rptPager.DataSource = pages;
            rptPager.DataBind();
        }

        protected void PageSize_Changed(object sender, EventArgs e)
        {
            this.Find_Customer(1);
        }

        //load page 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null) Response.Redirect("Login.aspx");
            if (!IsPostBack)
            {
                if (Session["index"] != null && Session["status"] != null && Session["status"].ToString() == "update")
                {
                    Find_Customer((int)(Session["index"]));
                }
                else
                {
                    Find_Customer(1);
                }
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
                    if (stt < 99999)
                    {
                        Session["full_data"] = null;
                        String ma = Constant.head_ID + (stt + 1).ToString("00000");
                        Session["id"] = ma;
                    }
                    else Session["full_data"] = 1;
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
                Find_Customer(1);
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
            Find_Customer(1);
        }

      
       
        //Open the detail page to insert a customer into table
        protected void btnOpenInsert_Click(object sender, EventArgs e)
        {
            try
            {
                Session["status"] = "insert";
                Get_ID();
                if (Session["id"] != null && Session["full_data"]==null)
                {
                    Response.Redirect("Form_Detail.aspx");
                }
                else
                {
                    Label1.Text = "Cannot add anymore";
                    Panel_Mess.Attributes.Add("style", "display: block");
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
                    Label1.Text = "Choose check box to delete";
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
            Find_Customer(1);
        }

        //Export data of table to file excel
        protected void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "List_"+DateTime.Today.ToString("yyyyMMdd").Trim()+".xls"));
                Response.ContentType = "application/ms-excel";
                Response.ContentEncoding = System.Text.Encoding.Unicode;
                Response.BinaryWrite(System.Text.Encoding.Unicode.GetPreamble());

                StringWriter stringWriter = new StringWriter();

                HtmlTextWriter textWriter = new HtmlTextWriter(stringWriter);

                GridView1.HeaderRow.Style.Add("background-color", "#111");
                GridView1.Columns[7].Visible = false;
                GridView1.Columns[8].Visible = false;
                GridView1.AllowPaging = false;
                GridView1.DataSource= customer.Select_Customer("");
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