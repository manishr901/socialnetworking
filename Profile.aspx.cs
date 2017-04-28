using System;
using System.IO;
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

public partial class Default3 : System.Web.UI.Page
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
            if (ViewState["flag"] == null)
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select * from User_Profile where EmailId like '" + Session["email"].ToString() + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        TextBox2.Text = dr[0].ToString();
                        TextBox3.Text = dr[1].ToString();
                        DropDownList2.Text = dr[2].ToString();
                        DropDownList3.Text = dr[3].ToString();
                        DropDownList1.Text = dr[4].ToString();
                        if (dr[5].ToString() == "Male")
                        {
                            RadioButton1.Checked = true;
                        }
                        else
                        {
                            RadioButton2.Checked = true;
                        }
                        TextBox4.Text = dr[6].ToString();
                        TextBox5.Text = dr[7].ToString();
                        TextBox13.Text = dr[8].ToString();
                        TextBox6.Text = dr[9].ToString();
                        TextBox7.Text = dr[10].ToString();
                        TextBox8.Text = dr[11].ToString();
                        TextBox9.Text = dr[12].ToString();
                        TextBox10.Text = dr[13].ToString();
                        TextBox11.Text = dr[14].ToString();
                        TextBox12.Text = dr[15].ToString();
                    }
                    con.Close();
                    ViewState["flag"] = 1;
                }
                catch (SqlException se)
                {
                    Response.Write(se.Message);
                }

            }
        }
               
    }
    protected void Button11_Click(object sender, EventArgs e)
    {
       try
       {
           string mf;
        if (RadioButton1.Checked )
            mf="Male";
        else
             mf="Female";
                
           con.Open();
            SqlCommand cmd = new SqlCommand("update User_Profile set Name=@name,Age=@age,Religion=@religion,Nationality=@nationality,Gender=@gender,DateOfBirth=@dob,Address=@address,City=@city,MobileNo=@mob,School=@school,College=@college,Hobbies=@hobbies,Activities=@activities,Movies=@movies,Music=@music where EmailId like '" +  Session["email"].ToString() + "' ",con);
            cmd.Parameters.AddWithValue("@name",TextBox2.Text);
            cmd.Parameters.AddWithValue("@age",DropDownList2.Text);
            cmd.Parameters.AddWithValue("@religion",DropDownList3.Text);
            cmd.Parameters.AddWithValue("@nationality",DropDownList1.Text);
            cmd.Parameters.AddWithValue("@gender", mf);
            cmd.Parameters.AddWithValue("@dob",TextBox4.Text);
            cmd.Parameters.AddWithValue("@address",TextBox5.Text);
            cmd.Parameters.AddWithValue("@city", TextBox13.Text);
            cmd.Parameters.AddWithValue("@mob",TextBox6.Text);
            cmd.Parameters.AddWithValue("@school",TextBox7.Text);
            cmd.Parameters.AddWithValue("@college",TextBox8.Text);
            cmd.Parameters.AddWithValue("@hobbies",TextBox9.Text);
            cmd.Parameters.AddWithValue("@activities",TextBox10.Text);
            cmd.Parameters.AddWithValue("@movies",TextBox11.Text);
            cmd.Parameters.AddWithValue("@music",TextBox12.Text);
            cmd.ExecuteNonQuery();
            SqlCommand cmd1 = new SqlCommand("insert into All_Notifications values(@username,@userphoto,@message,@updatetime)", con);
           cmd1.Parameters.AddWithValue("@username",Session["username"].ToString());
           cmd1.Parameters.AddWithValue("@userphoto", "DisplayImage.aspx?em=" + Session["email"].ToString());
           cmd1.Parameters.AddWithValue("@message",Session["username"].ToString()+ " has updated profile information at ");
           cmd1.Parameters.AddWithValue("@updatetime",DateTime.Now.ToString());
           cmd1.ExecuteNonQuery();
       }
        catch(SqlException se)
        {
            Response.Write(se.Message);
        }
    }
    protected void RadioButton1_CheckedChanged(object sender, EventArgs e)
    {
    }
    
    protected void Button12_Click1(object sender, EventArgs e)
    {
      
        con.Open();
        byte[] imgbyte = null;
        if (FileUpload1.HasFile && FileUpload1.PostedFile != null)
        {
            HttpPostedFile file = FileUpload1.PostedFile;
            imgbyte = new byte[file.ContentLength];
            file.InputStream.Read(imgbyte, 0, file.ContentLength);
            SqlCommand cmd = new SqlCommand("update Profile_Image set Photo=@Photo where EmailId like @EmailId", con);
            cmd.Parameters.AddWithValue("@Photo", imgbyte);
            cmd.Parameters.AddWithValue("@EmailId", Session["email"].ToString());
            cmd.ExecuteNonQuery();
            ((Image)Master.FindControl("Image1")).ImageUrl = "DisplayImage.aspx?em=" + Session["email"].ToString();
            SqlCommand cmd1 = new SqlCommand("insert into All_Notifications values(@username,@userphoto,@message,@updatetime)", con);
            cmd1.Parameters.AddWithValue("@username", Session["username"].ToString());
            cmd1.Parameters.AddWithValue("@userphoto", "DisplayImage.aspx?em=" + Session["email"].ToString());
            cmd1.Parameters.AddWithValue("@message", Session["username"].ToString() + " has updated profile picture at ");
            cmd1.Parameters.AddWithValue("@updatetime", DateTime.Now.ToString());
            cmd1.ExecuteNonQuery();

            con.Close();
        }
    }
    
}

