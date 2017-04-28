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
public partial class getphotos : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        
            string name = Request.QueryString["name"].ToString();
            SqlCommand cmd = new SqlCommand("select Name,City,Photo from User_Profile,Profile_Image where User_Profile.EmailId=Profile_Image.EmailId and User_Profile.Name like '" + name + "%'", con);
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            dr.Read();
            Response.BinaryWrite((byte[])dr[2]);
            dr.Close();
            con.Close();
        

    }
}
