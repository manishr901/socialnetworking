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
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }


    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "1")
        {
            Session["email"] = e.CommandArgument;
            Response.Redirect("~/Profile1.aspx");
        }
        else
        {
            con.Open();
          string cmdtext=  " DELETE FROM Friend_List WHERE " +
            " ((ToFriendEmailId LIKE @ToFriendEmailId) AND (FromFriendEmailId LIKE @FromFriendEmailId)) " +
            " OR ((FromFriendEmailId LIKE @ToFriendEmailId) AND (ToFriendEmailId LIKE @FromFriendEmailId))";
          SqlCommand cmd = new SqlCommand(cmdtext,con);
          cmd.Parameters.AddWithValue("@ToFriendEmailId",e.CommandArgument);
          cmd.Parameters.AddWithValue("@FromFriendEmailId",Session["email"].ToString ());
          cmd.ExecuteNonQuery();
          con.Close();
        }
    }
}
