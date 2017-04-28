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

public partial class Default2 : System.Web.UI.Page
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
            SqlCommand cmd1 = new SqlCommand("select PostedTime,ShareMessage,Photo,PostedBy from Share_Table where PostedBy = any(SELECT FromFriendEmailId FROM Friend_List WHERE ToFriendEmailId LIKE '" + Session["email"].ToString() + "' UNION SELECT ToFriendEmailId FROM Friend_List AS Friend_List_1 WHERE FromFriendEmailId LIKE '" + Session["email"].ToString() + "') or PostedBy like '" + Session["email"].ToString() + "' order by ID desc", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd1);
            DataSet ds = new DataSet();
            da.Fill(ds, "Share_Table");
            ListView3.DataSource = ds;
            ListView3.DataBind();
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Share_Table values(@postedby,@postedtime,@sharemessage,@photo)", con);
            cmd.Parameters.AddWithValue("@postedby", Session["email"].ToString());
            cmd.Parameters.AddWithValue("@postedtime", DateTime.Now.ToString());
            cmd.Parameters.AddWithValue("@sharemessage", TextBox1.Text);
            cmd.Parameters.AddWithValue("@photo", Session["image"].ToString());
            cmd.ExecuteNonQuery();
          
            con.Close();
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
        Response.Redirect ("~/Home.aspx");
    }
    protected void ListView3_DataBinding(object sender, EventArgs e)
    {

    }

    protected void ListView3_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewDataItem dataitem = (ListViewDataItem)e.Item;

        DataRowView drv = dataitem.DataItem as DataRowView;
        Image img = (Image)e.Item.FindControl("Image1");
        img.ImageUrl = "DisplayImage.aspx?em=" + drv["PostedBy"].ToString();

        Label lblMessage = (Label)e.Item.FindControl("LblMessage");
        lblMessage.Text = drv["ShareMessage"].ToString();


        Label lblTime = (Label)e.Item.FindControl("LblTime");
        lblTime.Text = drv["PostedTime"].ToString();
    }
    
}
                