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
    protected void Button11_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name , User_Profile.EmailId ,City,Photo from User_Profile,Profile_Image where User_Profile.EmailId=Profile_Image.EmailId and User_Profile.Name like '" + TextBox2.Text  + "%'", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "User_Profile");
            ListView1.DataSource = ds;
            ListView1.DataBind();
            con.Close();
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void ListView1_DataBinding(object sender, EventArgs e)
    {
        
    }
    public string GetUrl(string name)
    {
        return "getphotos.aspx?name=" + name;
    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewDataItem dataitem = (ListViewDataItem)e.Item;

        DataRowView drv = dataitem.DataItem as DataRowView;
        Image img = (Image)e.Item.FindControl("Image1");
        img.ImageUrl = GetUrl(drv["Name"].ToString());

        LinkButton  lblName = (LinkButton )e.Item.FindControl("LblName");
        lblName.Text = drv["Name"].ToString();
        lblName.CommandArgument = drv["EmailId"].ToString();


        Label lblAddress = (Label)e.Item.FindControl("LblAddress");
        lblAddress.Text = drv["City"].ToString();

        Button btnReq = (Button)e.Item.FindControl("BtnRequest");
        btnReq.CommandArgument = drv["EmailId"].ToString();
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (e.CommandName == "LblName")
        {
            Session["email"] = e.CommandArgument;
            Response.Redirect("~/Profile1.aspx");
        
        }
        try
        {
            string nm="";
            con.Open();
            SqlCommand cmd = new SqlCommand("select Name from All_User where EmailId like '" + e.CommandArgument + "' ", con);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                nm = dr["Name"].ToString();
            }
            dr.Close();
            SqlCommand cmd1 = new SqlCommand("insert into Friend_Requests values(@tofriendname,@tofriendemailid,@fromemailid,@requestmessage)", con);
            cmd1.Parameters.AddWithValue("@tofriendname", nm);
            cmd1.Parameters.AddWithValue("@tofriendemailid", e.CommandArgument);
            cmd1.Parameters.AddWithValue("@fromemailid",Session["email"].ToString() );
            cmd1.Parameters.AddWithValue("@requestmessage",Session["username"].ToString()  + " wants to add you as a friend");
            cmd1.ExecuteNonQuery();
            con.Close();
            ((Button)e.CommandSource).Text = "Friend Request Sent !!";
            ((Button)e.CommandSource).Enabled = false;
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
