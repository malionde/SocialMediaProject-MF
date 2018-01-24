using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Drawing;

public partial class settings : System.Web.UI.Page
{
    SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
    SqlCommand komut;

    protected void Page_Load(object sender, EventArgs e)
    {
        string UserCookie = Request.Cookies["UnameCookie"].Value;

    }

    protected void Unnamed1_Click(object sender, EventArgs e)
    {
        SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
        baglan.Open();

        SqlCommand komut = new SqlCommand("UPDATE [User] SET [Mail]=@mail, [Age]=@age, [Hobbies]=@hobbies, [Studies]=@studies, [Job]=@job, [Description]=@desk, [Password]=@pw  WHERE UserName=@UserCookie ", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        komut.Parameters.AddWithValue("@UserCookie", UserCookie);
        komut.Parameters.AddWithValue("@mail", TextBox1.Text);
        komut.Parameters.AddWithValue("@age", TextBox2.Text);
        komut.Parameters.AddWithValue("@hobbies", TextBox3.Text);
        komut.Parameters.AddWithValue("@studies", TextBox4.Text);
        komut.Parameters.AddWithValue("@job", TextBox5.Text);
        komut.Parameters.AddWithValue("@desk", TextBox6.Text);
        komut.Parameters.AddWithValue("@pw", TextBox7.Text);

        komut.ExecuteNonQuery();
        baglan.Close();
       

        Response.AddHeader("REFRESH", "1;URL=personal-profile.aspx");
    }
}
      