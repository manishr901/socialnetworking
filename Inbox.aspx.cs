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

            if (ViewState["val"] == null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("alter table All_Messages drop column SerialNo", con);
                cmd.ExecuteNonQuery();
                SqlCommand cmd2 = new SqlCommand("alter table All_Messages add SerialNo int identity(1,1)", con);
                cmd2.ExecuteNonQuery();
                ViewState["val"] = 0;
            }
        }

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        TextBox2.Text=GridView1.Rows[e.NewSelectedIndex].Cells[2].Text + "    ";
        TextBox2.Text += GridView1.Rows[e.NewSelectedIndex].Cells[6].Text + "             ";
        TextBox2.Text += GridView1.Rows[e.NewSelectedIndex].Cells[4].Text + "          " + Environment.NewLine +"                    ";
        TextBox2.Text += GridView1.Rows[e.NewSelectedIndex].Cells[5].Text;

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}
