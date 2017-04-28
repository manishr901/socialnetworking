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
using System.Web.Caching;
public partial class wall : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
      
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }

        if (!Page.IsPostBack)
        {
            MultiView1.SetActiveView(View1);
           
        }
        if(ViewState["flag"]==null)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Post", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ViewState["flag"] = "some value";
            ListView1.DataSource = dt;
            ListView1.DataBind();
            con.Close();
            
        }
    }
    protected void Button15_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        //ViewState["flag"] = null;
       // Response.Redirect(Request.Path);

    }
    protected void Button16_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
       // ViewState["flag"] = null;
      //  Response.Redirect(Request.Path);

    }
    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewDataItem dataitem = (ListViewDataItem)e.Item;
        DataRowView drv = dataitem.DataItem as DataRowView;

        Image img1 = (Image)e.Item.FindControl("Image1");
        img1.ImageUrl = "DisplayImage.aspx?em=" + drv["postedbyemail"].ToString();

        Label lblpostedby=(Label)e.Item.FindControl("postedByLabel");
        lblpostedby.Text=drv["postedbyname"].ToString();
        
        Label lblmessage=(Label)e.Item.FindControl("MessageLabel");
        lblmessage.Text = drv["message"].ToString();

        ImageButton ib = (ImageButton)e.Item.FindControl("Btndelpost");
        ib.CommandArgument = drv["PostId"].ToString(); 

        Image img2 = (Image)e.Item.FindControl("Image2");

        string check = drv["postedbyemail"].ToString();
        string check1 = drv["postid"].ToString();

        int tf = int.Parse(drv["Flag"].ToString());
        if (tf == 0)
        {
            if (drv["Photo"] != DBNull.Value)
            {
                img2.ImageUrl = "getphoto.aspx?em=" + drv["postedbyemail"].ToString() + "&Id=" + drv["postid"].ToString();
            }
            else
            {
                img2.Visible = false;
            }
        }
        else {
            img2.ImageUrl = drv["URL"].ToString();
        }
        Image myimage = (Image)e.Item.FindControl("Image4");
        myimage.ImageUrl = "DisplayImage.aspx?em="+Session["email"].ToString();

        Button btncomm = (Button)e.Item.FindControl("Button1");
        btncomm.CommandArgument=drv["PostId"].ToString();

        Label lbltime=(Label)e.Item.FindControl("TimeLabel");
        lbltime.Text=drv["Time"].ToString();

        
        ListView commlist = (ListView)e.Item.FindControl("ListView2");
        getcomments(int.Parse(drv["PostId"].ToString()),commlist );
    }
    void getcomments(int pid,ListView lv)
    {
      
        lv.ItemDataBound += new EventHandler<ListViewItemEventArgs>(lv_ItemDataBound);
        lv.ItemCommand += new EventHandler<ListViewCommandEventArgs>(lv_ItemCommand);
        SqlCommand cmd = new SqlCommand("select * from Comment where PostId=@a",con );
        cmd.Parameters.AddWithValue("@a",pid);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        lv.DataSource = dt;
        lv.DataBind();
    }

    protected  void lv_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        con.Open();
        SqlCommand cmd1 = new SqlCommand("delete from Comment where CommentId=" + e.CommandArgument + "", con);
        cmd1.ExecuteNonQuery();
        con.Close();
    }
    void lv_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        ListViewDataItem dataitem = (ListViewDataItem)e.Item;
        DataRowView drv = dataitem.DataItem as DataRowView;

        Label commlabel = (Label)e.Item.FindControl("CommentLabel");
        commlabel.Text=drv["Comment"].ToString();

        Label timelabel = (Label)e.Item.FindControl("TimeLabel");
        timelabel.Text=drv["Time"].ToString();

        Image img = (Image)e.Item.FindControl("Image3");
        img.ImageUrl=drv["CommentedByphoto"].ToString();


        ImageButton btncomm = (ImageButton)e.Item.FindControl("Btndelcomm");
        btncomm.CommandArgument = drv["CommentId"].ToString();

        img.ToolTip = drv["CommentedBy"].ToString();
        
            
    }
    protected void btnshare_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into Post(postedbyemail,postedbyname,time,message,Flag) values(@a,@b,@c,@d,@e)",con );
        cmd.Parameters.AddWithValue("@a",Session["email"].ToString());
        cmd.Parameters.AddWithValue("@b",Session["username"].ToString());
        cmd.Parameters.AddWithValue("@c",DateTime.Now.ToShortTimeString());
        cmd.Parameters.AddWithValue("@d",txtmessage.Text);
        cmd.Parameters.AddWithValue("@e", 0);
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Post(postedbyemail,postedbyname,time,Message,photo,Flag) values(@a,@b,@c,@d,@e,@f)", con);
            cmd.Parameters.AddWithValue("@a", Session["email"].ToString());
            cmd.Parameters.AddWithValue("@b", Session["username"].ToString());
            cmd.Parameters.AddWithValue("@c", DateTime.Now.ToShortTimeString());
            cmd.Parameters.AddWithValue("@d", txtsay.Text);
            cmd.Parameters.AddWithValue("@e", FileUpload1.FileBytes);
            cmd.Parameters.AddWithValue("@f", 0);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        con.Open();

        if (e.CommandName == "DelButton")
        {
            SqlCommand cmd1 = new SqlCommand("delete from Post where PostId=" + e.CommandArgument + "", con);
            cmd1.ExecuteNonQuery();
            SqlCommand cmd2 = new SqlCommand("delete from Comment where PostId=" + e.CommandArgument + "", con);
            cmd2.ExecuteNonQuery();


        }
        else
        {
            SqlCommand cmd = new SqlCommand("insert into Comment values(@a,@b,@c,@d,@e)", con);
            cmd.Parameters.AddWithValue("@a", e.CommandArgument.ToString());  // PostId
            cmd.Parameters.AddWithValue("@b", Session["username"].ToString());  // Commented By Name
            cmd.Parameters.AddWithValue("@c", "DisplayImage.aspx?em=" + Session["email"].ToString()); // Commented By Photo
            cmd.Parameters.AddWithValue("@d", DateTime.Now.ToShortTimeString()); // Time
            cmd.Parameters.AddWithValue("@e", ((TextBox)e.Item.FindControl("TextBox1")).Text); // Comment
            cmd.ExecuteNonQuery();
        }
        con.Close();

        ViewState["flag"] = null;
        Response.Redirect(Request.Path);


    }
}
