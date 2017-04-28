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

    protected void Btngo_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("Select SecurityQuestion,SecurityAnswer from Regs Where Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", emailidtxt.Text);
            ViewState["em"] = emailidtxt.Text;
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Panel1.Visible = true;
                Label2.Text = dr[0].ToString();
                ViewState["ans"] = dr[1].ToString();
            }
            else
            {
                Panel2.Visible = true ;
            }
            dr.Close();


        }
        catch(SqlException se)
        {
            Response.Write(se.Message);
        }

    }
    protected void Btnxt_Click(object sender, EventArgs e)
    {
        try
        {
            if (secanstxt.Text == ViewState["ans"].ToString())
            {
                Panel3.Visible = true;

            }
            else
            {
                Panel3.Visible = false;
            }
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void Btnsavechg_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("update regs set password=@p where Email=@Email", con);
            cmd.Parameters.AddWithValue("@p", newpwdtxt.Text);
            cmd.Parameters.AddWithValue("@Email", ViewState["em"].ToString());
            int a = cmd.ExecuteNonQuery();
            if (a > 0)
            {
                Panel4.Visible = true;
            }
            else
            {
                Panel3.Visible = false;
            }
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login1.aspx");
    }
}