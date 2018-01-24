using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class Login : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();

    string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = "server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True";
        con.Open();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd.CommandText = "select* from [User] where Username='" + TextBox1.Text + "'and Password='" + TextBox2.Text + "'";
        //cmd.CommandText="select* from [User] where "
        //          Response.Cookies["UIDCookie"].Value = TextBox1.Text;
        //Response.Cookies["UIDCookie"].Expires = DateTime.Now.AddDays(1);
        cmd.Connection = con;
        sda.SelectCommand = cmd;
        sda.Fill(ds, "User");
        Response.Cookies["UnameCookie"].Value = TextBox1.Text;
        Response.Cookies["UnameCookie"].Expires = DateTime.Now.AddDays(1);
  
        if (ds.Tables[0].Rows.Count > 0)
        {
            Response.Redirect("wall.aspx");
        }
        else
        {
            Label1.Text = "Failed!";
        }

    }
}