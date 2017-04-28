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

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string email;
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        
            if (Request.QueryString["em"] != null)
            {
                email = Request.QueryString["em"].ToString();
            }
            else
            {
                throw new ArgumentException("Parameter not defined");
            }
        
        SqlCommand cmd = new SqlCommand("select Photo from Profile_Image where EmailId=@email", con);
        cmd.Parameters.AddWithValue("@email",email);
        con.Open();
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        Response.BinaryWrite((byte[])dr[0]);
        dr.Close();
        con.Close();
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
    }
}