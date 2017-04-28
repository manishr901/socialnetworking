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
       
    }
    protected void BtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            con.Open();
            //SqlCommand cmd = new SqlCommand("Insert into Admin values(@adminid,@password)", con);
            //cmd.Parameters.AddWithValue("@adminid", adminidtxt.Text);
            //cmd.Parameters.AddWithValue("@password", passwordtxt.Text);
            //cmd.ExecuteNonQuery();
            SqlCommand cmd = new SqlCommand("Select * from Admin where AdminId=@a and Password=@p", con);
            cmd.Parameters.AddWithValue("@a", adminidtxt.Text);
            cmd.Parameters.AddWithValue("@p", passwordtxt.Text);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["adminid"] = dr[0].ToString();
            }
            dr.Close();
            con.Close();
            Response.Redirect("View.aspx");
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
}