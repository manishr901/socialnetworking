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
using System.Data.SqlClient ;

public partial class Profile1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        else
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from User_Profile where EmailId like '" + Session["email"].ToString() + "' ", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    lblname.Text = dr[0].ToString();
                    lblemail.Text = dr[1].ToString();
                    lblage.Text = dr[2].ToString();
                    lblrelgn.Text = dr[3].ToString();
                    lblnation.Text = dr[4].ToString();
                    lblgender.Text = dr[5].ToString();
                    lbldob.Text = dr[6].ToString();
                    lbladdress.Text = dr[7].ToString();
                    lblcity.Text = dr[8].ToString();
                    lblmobile.Text = dr[9].ToString();
                    lblschool.Text = dr[10].ToString();
                    lblcollege.Text = dr[11].ToString();
                    lblhobbies.Text = dr[12].ToString();
                    lblactivity.Text = dr[13].ToString();
                    lblmovies.Text = dr[14].ToString();
                    lblmusic.Text = dr[15].ToString();
                    con.Close();
                }
            }
            catch (SqlException se)
            {
                Response.Write(se.Message);
            }
        }
        
                
    }
}
