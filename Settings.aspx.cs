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
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null)
        {
            Response.Redirect("Login1.aspx");
        }
    }

    protected void ChangePasswordPushButton_Click(object sender, EventArgs e)
    {
         try
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select Email,FName from REGS where Email=@a and Password=@p", con);
            cmd.Parameters.AddWithValue("@a", Session["email"].ToString());
            cmd.Parameters.AddWithValue("@p", CurrentPassword.Text );
            SqlDataReader dr = cmd.ExecuteReader();
            ViewState["chpass"] = "0";
            if (dr.Read())
            {
                ViewState["chpass"] = "1";
            }  
            else
            {
                ViewState["chpass"] = "0";
               FailureText.Text="Password is incorrect";
            }
             dr.Close();
             if(ViewState["chpass"].ToString() == "1")
             {
                 SqlCommand cmd1 = new SqlCommand("update Regs Set password=@np where password=@p and Email=@em", con);
                  cmd1.Parameters.AddWithValue("@p", CurrentPassword.Text );
                  cmd1.Parameters.AddWithValue("@np",ConfirmNewPassword.Text);
                  cmd1.Parameters.AddWithValue("@em", Session["email"].ToString());
                  cmd1.ExecuteNonQuery();
             }
             con.Close();
        }
         catch (SqlException se)
         {
             Response.Write(se.Message);
         }



    }
}
