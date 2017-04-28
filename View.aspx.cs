using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("select fname,lname,email,sex,dob from Regs", con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds=new DataSet();
        da.Fill(ds);
        GridView1.DataSource = ds;
       // GridView1.DataMember = "Regs";
        GridView1.DataBind();
        ChangeGrdLayout();
        con.Close();
        
    }
    void ChangeGrdLayout()
    {
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            
           
            GridView1.Rows[i].Cells[1].Wrap = true;
            //GridView1.Rows[i].Cells[1].Width = 55;
            GridView1.Rows[i].Cells[2].Wrap = true;
            //GridView1.Rows[i].Cells[2].Width = 60;
            GridView1.Rows[i].Cells[3].Wrap = true;
            //GridView1.Rows[i].Cells[3].Width = 65;
            GridView1.Rows[i].Cells[4].Wrap = true;
            //GridView1.Rows[i].Cells[4].Width = 70;
            GridView1.Rows[i].Cells[5].Wrap = true;
            //GridView1.Rows[i].Cells[5].Width = 75;
            
           
          }
        

    }
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
       
            Session["adminid"] = null;
            Response.Redirect("Admin.aspx");

      
        
    }
    protected void GridView1_DataBinding(object sender, EventArgs e)
    {

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
       // e.Row.Cells[1].ForeColor = System.Drawing.Color.Red;
       // e.Row.Cells[6].Width = 100;
       // e.Row.Cells[7].Wrap = true;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
       // e.Row.Cells[1].BackColor = System.Drawing.Color.Red;
       
    }
}