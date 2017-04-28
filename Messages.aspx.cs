using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class Default3 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
       
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into All_Messages values(@postedto,@postedfrom,@subject,@body,@postedtime)", con);
            cmd.Parameters.AddWithValue("@postedto", TextBox2.Text);
            cmd.Parameters.AddWithValue("@postedfrom", Session["email"].ToString());
            cmd.Parameters.AddWithValue("@subject", TextBox4.Text);
            cmd.Parameters.AddWithValue("@body", TextBox5.Text);
            cmd.Parameters.AddWithValue("@postedtime", DateTime.Now.ToString());
            cmd.ExecuteNonQuery();
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }

    }
}
