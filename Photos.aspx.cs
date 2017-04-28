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

public partial class photos : System.Web.UI.Page
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
            byte[] imgbyte = null;
            if(FileUpload1.HasFile && FileUpload1.PostedFile != null)
            {
                HttpPostedFile file = FileUpload1.PostedFile;
                imgbyte = new byte [file.ContentLength];
                file.InputStream.Read(imgbyte, 0, file.ContentLength);

            SqlCommand cmd = new SqlCommand("insert into Photos values(@photo,@name,@emailid)",con);
            cmd.Parameters.AddWithValue("@photo",imgbyte);
            cmd.Parameters.AddWithValue("@name",TextBox2.Text);
            cmd.Parameters.AddWithValue("@emailid",Session["email"].ToString());
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("insert into All_Notifications values(@username,@userphoto,@message,@updatetime)", con);
            cmd1.Parameters.AddWithValue("@username", Session["username"].ToString());
            cmd1.Parameters.AddWithValue("@userphoto", "DisplayImage.aspx?em=" + Session["email"].ToString());
            cmd1.Parameters.AddWithValue("@message", Session["username"].ToString() + " has uploaded photos at ");
            cmd1.Parameters.AddWithValue("@updatetime", DateTime.Now.ToString());
            cmd1.ExecuteNonQuery();
            con.Close();
            }
        }
        catch(SqlException se)
        {
            Response.Write(se.Message);
        }
        Response.Redirect("~/Photos.aspx");
    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        try
        {
            con.Open();
            SqlCommand cd = new SqlCommand("delete from Photos where Id="+e.CommandArgument +"",con );
            cd.ExecuteNonQuery();
            con.Close();
            Response.Redirect(Request.Path);
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
       

    }
}
