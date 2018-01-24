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



public partial class wall : System.Web.UI.Page
{
    SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
    SqlCommand komut;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ContentsRepeater();
            //CommentsRepeater();
        }
        
        string Username = Request.Cookies["UnameCookie"].Value;
        Label3.Text = Username;
        Label2.Text = Username;


        getPimg.DataSource = getUser();
        getPimg.DataBind();
        DataList3.DataSource = createlink();
        DataList3.DataBind();
    }
    private void ContentsRepeater()
    {
        String CS = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(CS))
        {

            using (SqlCommand cmd = new SqlCommand("marge4", con))
            {
                cmd.CommandType = CommandType.StoredProcedure;

                using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                {
                    DataTable dtConTable = new DataTable();
                    sda.Fill(dtConTable);
                    rptrContents.DataSource = getimages();
                    rptrContents.DataBind();
                }
            }

        }
    }
    protected void itemlist_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    public DataSet getimages()
    {
        SqlCommand cmd3 = new SqlCommand("Select userID from [User] where UserName=@UserCookie", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd3.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds3 = new DataSet();
        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd3);
        adapter2.Fill(ds3);
        //string IDtut = ds3.Tables[0].Rows[0][0].ToString();

        //order by ContentID desc
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Contents order by ContentID desc ", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        //cmd1.Parameters.AddWithValue("@IDtut", IDtut);

        DataSet ds1 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        adapter1.Fill(ds1);
        return ds1;
    }
    public DataSet createlink()
    {
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM [User] order by userID desc", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        DataSet ds1 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        adapter1.Fill(ds1);
        return ds1;

    }
    public DataSet getUser()
    {
        SqlCommand cmd2 = new SqlCommand("SELECT * FROM [User] WHERE UserName=@UserCookie", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar,
        SqlCommand cmd3 = new SqlCommand("Select userID from [User] where UserName=@UserCookie", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd2.Parameters.AddWithValue("@UserCookie", UserCookie);
        cmd3.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds3 = new DataSet();
        DataSet ds2 = new DataSet();
        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd3);
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd2);
        adapter2.Fill(ds3);
        adapter1.Fill(ds2);
        Label3.Text = ds3.Tables[0].Rows[0][0].ToString();
        Response.Cookies["UIDCookie"].Value= ds3.Tables[0].Rows[0][0].ToString();
        Response.Cookies["UIDCookie"].Expires = DateTime.Now.AddDays(1);
        return ds2;
    }
    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Request.Cookies["UnameCookie"] != null)
        {
            HttpCookie UnameCookie = Request.Cookies["UnameCookie"];
            UnameCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(UnameCookie);
            Response.Redirect("login.aspx");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int userID = 0;

        string constr = "server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True";
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO Comment (UserName, Expression) VALUES(@username,@comment); Select @@Identity"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    //cmd.Parameters.AddWithValue("@username ", Label2.Text.Trim());
                    //cmd.Parameters.AddWithValue("@comment ", TextBox2.Text.Trim());
                    cmd.Connection = con;
                    con.Open();
                    int result = cmd.ExecuteNonQuery(); //Returns the count of rows effected by the Query
                    userID = Convert.ToInt32(cmd.ExecuteScalar()); //Returns the first column of the first row
                    con.Close();
                }
            }
        }
    }
}