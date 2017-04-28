using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

public partial class index : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ViewState["flag"] == null)
        {
            for (int day = 1; day < 32; day++)
                ddlday.Items.Add(day.ToString());
            for (int year = 1950; year < 1998; year++)
                ddlyear.Items.Add(year.ToString());
            ViewState["flag"] = "somevalue";
        }
    }
    void Registration()
    {
        SqlCommand regcmd = new SqlCommand("insert into Regs values(@fn,@ln,@em,@pass,@sx,@db,@sq,@sa)", con);
        regcmd.Parameters.AddWithValue("@fn", firstnametxt.Text);
        regcmd.Parameters.AddWithValue("@ln", lastNametxt.Text);
        regcmd.Parameters.AddWithValue("@em", emailtxt.Text);
        regcmd.Parameters.AddWithValue("@pass", passwordtxt.Text);
        regcmd.Parameters.AddWithValue("@sx", ddlgender.SelectedValue);
        regcmd.Parameters.AddWithValue("@db", ddlday.Text + "-" + ddlMonth.Text + "-" + ddlyear.Text);
        regcmd.Parameters.AddWithValue("@sq",ddlsecquest.SelectedValue);
        regcmd.Parameters.AddWithValue("@sa",securityanstxt.Text);
        
        regcmd.ExecuteNonQuery();
    }
    void EmptyEntryIntoProfile()
    {
        SqlCommand cmd = new SqlCommand("insert into User_Profile values(@name,@emailid,@age,@religion,@nationality,@gender,@dob,@address,@city,@mob,@school,@college,@hobbies,@activities,@movies,@music)", con);
        cmd.Parameters.AddWithValue("@name", "");
        cmd.Parameters.AddWithValue("@emailid", emailtxt.Text );
        Session["email"] = emailtxt.Text;
        Session["username"] = firstnametxt.Text;
        Session["original"] = emailtxt.Text;
        cmd.Parameters.AddWithValue("@age", "");
        cmd.Parameters.AddWithValue("@religion", "");
        cmd.Parameters.AddWithValue("@nationality", "");
        cmd.Parameters.AddWithValue("@gender", "");
        cmd.Parameters.AddWithValue("@dob", "");
        cmd.Parameters.AddWithValue("@address", "");
        cmd.Parameters.AddWithValue("@city", "");
        cmd.Parameters.AddWithValue("@mob", "");
        cmd.Parameters.AddWithValue("@school", "");
        cmd.Parameters.AddWithValue("@college", "");
        cmd.Parameters.AddWithValue("@hobbies", "");
        cmd.Parameters.AddWithValue("@activities", "");
        cmd.Parameters.AddWithValue("@movies", "");
        cmd.Parameters.AddWithValue("@music", "");
        cmd.ExecuteNonQuery();

    }
    void AllUserEntry()
    {

        SqlCommand cmd1 = new SqlCommand("insert into All_User values(@name,@emailid)", con);
        cmd1.Parameters.AddWithValue("@name", firstnametxt.Text );
        cmd1.Parameters.AddWithValue("@emailid", emailtxt.Text );
        cmd1.ExecuteNonQuery();

    }
    void ProfileImageManage()
    {
        SqlCommand cmd2 = new SqlCommand("insert into Profile_Image values(@photo,@emailid)", con);
        FileStream stream = new FileStream(MapPath("question_mark.jpg"), FileMode.Open);
        FileInfo info = new FileInfo(MapPath("question_mark.jpg"));
        int length = int.Parse(info.Length.ToString());
        byte[] pic = new byte[length];
        stream.Read(pic, 0, length);
        cmd2.Parameters.AddWithValue("@photo", pic);
        cmd2.Parameters.AddWithValue("@emailid", Session["email"].ToString());
        cmd2.ExecuteNonQuery();

    }
    void OnLineUsersEntry()
    {
        SqlCommand cmd3 = new SqlCommand("insert into Online_Users values(@username,@emailid,@photo)", con);
        cmd3.Parameters.AddWithValue("@username", firstnametxt.Text );
        cmd3.Parameters.AddWithValue("@emailid", emailtxt.Text );
        cmd3.Parameters.AddWithValue("@photo", "DisplayImage.aspx?em=" + emailtxt.Text );
        cmd3.ExecuteNonQuery();

    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            con.Open();

            // Insert into Registration
            Registration();

            // Insert into Profile
             EmptyEntryIntoProfile();
            
            // Insert into AllUser

            AllUserEntry();
            // Insert into Profile_Image

            ProfileImageManage();
            // Insert into Online_Users

            OnLineUsersEntry();

            con.Close();
            Response.Redirect("~/Profile.aspx");
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    void updateWall()
    {
        SqlCommand cmd = new SqlCommand("insert into Post(postedbyemail,postedbyname,time,URL,Flag) values(@a,@b,@c,@d,@e)", con);
        cmd.Parameters.AddWithValue("@a", Session["email"].ToString());
        cmd.Parameters.AddWithValue("@b", Session["username"].ToString());
        cmd.Parameters.AddWithValue("@c", DateTime.Now.ToShortTimeString());
        cmd.Parameters.AddWithValue("@d", Request.QueryString["path"]);
        cmd.Parameters.AddWithValue("@e", 1);
        cmd.ExecuteNonQuery();
        con.Close();
        Response.Redirect("~/Wall.aspx?id=" + Session["username"].ToString());
        
      
    }
    protected void BtnLogin_Click(object sender, ImageClickEventArgs e)
    {
        if (Request.QueryString["path"] != null)
        {
            login(0);
            
        }
        else
        {
            login(1);
        }
           
    }

    void login(int status)
    {
        try
            {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Email,FName from REGS where Email=@a and Password=@p", con);
            cmd.Parameters.AddWithValue("@a", TextBoxUserName.Text );
            cmd.Parameters.AddWithValue("@p", TextBoxPassword.Text );
            SqlDataReader dr = cmd.ExecuteReader();
            ViewState["login"] = "0";
            if (dr.Read())
            {
                Session["email"] = dr[0].ToString();
                Session["original"] = dr[0].ToString();
                Session["username"] = dr[1].ToString();
                ViewState["login"] = "1";
            }  
            else
            {
                TextBoxUserName.BorderStyle = BorderStyle.Solid;
                TextBoxPassword.BorderStyle = BorderStyle.Solid;
                TextBoxUserName.BorderWidth = 1;
                TextBoxPassword.BorderWidth = 1;
                TextBoxUserName.BorderColor = System.Drawing.Color.Red;
                TextBoxPassword.BorderColor = System.Drawing.Color.Red;
            }
            dr.Close();
            if (ViewState["login"].ToString() == "1")
            { 
                SqlCommand cmd1 = new SqlCommand("insert into Online_Users values(@username,@emailid,@photo)", con);
                cmd1.Parameters.AddWithValue("@username", Session["username"].ToString());
                cmd1.Parameters.AddWithValue("@emailid", Session["email"].ToString());
                cmd1.Parameters.AddWithValue("@photo", "DisplayImage.aspx?em=" + Session["email"].ToString());
                cmd1.ExecuteNonQuery();
               
                ASPNETChatControl.ChatControl.StopSession();
                ASPNETChatControl.ChatControl.StartSession(Session["username"].ToString(),Session["email"].ToString());
                if(status==1)
                    Response.Redirect("~/Wall.aspx?id="+Session["username"].ToString());
                else
                    updateWall();
            }
          
           
            con.Close();
        }
        catch (SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void LnkHindi_Click(object sender, EventArgs e)
    {
        Session ["cul"] = "hi";
        Response.Redirect(Request.Path);
    }
    protected override void InitializeCulture()
    {
        if (Session["cul"] != null)
        {
            UICulture = Session ["cul"].ToString();
            base.InitializeCulture();
        }

    }
    protected void LnkEnglish_Click(object sender, EventArgs e)
    {
        Session ["cul"] = "en";
        Response.Redirect(Request.Path);
    }
}