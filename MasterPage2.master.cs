using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Data.SqlClient;
using ASPNETChatControl;
using ASPNETChat;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
        
            string imageurl = "DisplayImage.aspx?em=" + Session["email"].ToString();
            ImageButton1.ImageUrl = imageurl;
            lbl2.Text = Session["username"].ToString();
       
        
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Session["email"] = e.CommandArgument;
        Response.Redirect("~/Profile1.aspx");
    }
   
    protected void Button1_Click1(object sender, EventArgs e)
    {
        Session["email"] = Session["original"];
        Response.Redirect("~/wall.aspx");
    }
    
    protected void LnkLogout_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("delete from Online_Users where EmailId like '" + Session["email"].ToString() + "'", con);
            cmd.ExecuteNonQuery();
            ASPNETChatControl.ChatControl.StopSession();
            Session["email"] = null;
            Session["original"] = null;
            Session["username"] = null;
            Response.Redirect("Login1.aspx");
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
}
