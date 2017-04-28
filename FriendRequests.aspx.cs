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

public partial class FriendRequests : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {

    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            string nm = "";
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name from All_User where EmailId like '" + e.CommandArgument + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nm = dr["Name"].ToString();
            }
            dr.Close();
            
            // Update Friends' list table
            SqlCommand cmd1 = new SqlCommand("insert into Friend_List values(@fromfriendname,@fromfriendemailid,@tofriendname,@tofriendemailid,@fromfriendphoto,@tofriendphoto)", con);
            cmd1.Parameters.AddWithValue("@fromfriendname", nm);
            cmd1.Parameters.AddWithValue("@fromfriendemailid", e.CommandArgument);
            cmd1.Parameters.AddWithValue("@tofriendname", Session["username"].ToString());
            cmd1.Parameters.AddWithValue("@tofriendemailid", Session["email"].ToString());
            cmd1.Parameters.AddWithValue("@fromfriendphoto", "DisplayImage.aspx?em=" + e.CommandArgument);
            cmd1.Parameters.AddWithValue("@tofriendphoto", "DisplayImage.aspx?em=" + Session["email"].ToString());
            cmd1.ExecuteNonQuery();

            // Delete from Friends request table.
            SqlCommand delcmd = new SqlCommand("delete from Friend_Requests where FromEmailId='"+e.CommandArgument+"' and ToFriendEmailId='"+Session["email"].ToString()+"'",con);
            delcmd.ExecuteNonQuery();

            SqlCommand cmd2 = new SqlCommand("insert into All_Notifications values(@username,@userphoto,@message,@updatetime)", con);
            cmd2.Parameters.AddWithValue("@username", Session["username"].ToString());
            cmd2.Parameters.AddWithValue("@userphoto", "DisplayImage.aspx?em=" + Session["email"].ToString());
            cmd2.Parameters.AddWithValue("@message", Session["username"].ToString() + " is now friend with " + nm);
            cmd2.Parameters.AddWithValue("@updatetime", DateTime.Now.ToString());
            cmd2.ExecuteNonQuery();
            Response.Redirect("~/FriendRequests.aspx");
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
