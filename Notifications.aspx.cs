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
        else
        {
            SqlCommand cmd1 = new SqlCommand("SELECT UserName, UserPhoto, Message, UpdateTime FROM All_Notifications where UserName = any(SELECT FromFriendName FROM Friend_List WHERE ToFriendEmailId LIKE '" + Session["email"].ToString() + "' UNION SELECT ToFriendName FROM Friend_List AS Friend_List_1 WHERE FromFriendEmailId LIKE '" + Session["email"].ToString() + "') or UserName like '" + Session["username"].ToString() + "'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, "Share_Table");
            ListView3.DataSource = ds;
            ListView3.DataBind();
        }
    }
    protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewDataItem dataitem = (ListViewDataItem)e.Item;

        DataRowView drv = dataitem.DataItem as DataRowView;
        Image img = (Image)e.Item.FindControl("Image1");
        img.ImageUrl =  drv["UserPhoto"].ToString();

        Label lblMessage = (Label)e.Item.FindControl("MessageLabel");
        lblMessage.Text = drv["Message"].ToString();


        Label lblTime = (Label)e.Item.FindControl("UpdateTimeLabel");
        lblTime.Text = drv["UpdateTime"].ToString();
    
    }
}
