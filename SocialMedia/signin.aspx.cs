using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.Adapters;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
public partial class signin : System.Web.UI.Page
{
    SqlCommand cmd = new SqlCommand();
    SqlConnection con = new SqlConnection();
    SqlDataAdapter sda = new SqlDataAdapter();
    DataSet ds = new DataSet();

    string connection = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        con.ConnectionString = ("server = DESKTOP-2RAK4I8; database = Social; Trusted_connection = True");
        con.Open();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into [user]" + "(Username,mail,Password)values(@uname,@mail,@pw)", con);
        cmd.Parameters.AddWithValue("@uname", TextBox1.Text);
        cmd.Parameters.AddWithValue("@mail", TextBox2.Text);
        cmd.Parameters.AddWithValue("@pw", TextBox3.Text);
        cmd.ExecuteNonQuery();
        Response.Redirect("login.aspx");
        //try
        //{
        //    cmd.ExecuteNonQuery();
        //}
        //catch(System.Data.SqlClient.SqlException)
        //{
        //    Label1.Text = "Username or Email Exist";
        //}

    }
}
