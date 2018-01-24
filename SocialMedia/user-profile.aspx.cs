using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class user_profile : System.Web.UI.Page
{
    SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
    SqlCommand komut;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            ContentsRepeater();
        }

        //if (Request.QueryString["userID"] != null)
        //{
        //    if (!IsPostBack)
        //    {
                
        //        ContentsRepeater();
        //    }
        //}
        //else
        //{
        //    Response.Redirect("~/personal-profile.aspx");
        //}
        string Username = Request.Cookies["UnameCookie"].Value;


        getPimg.DataSource = getUser();
        getPimg.DataBind();
        
        DataList2.DataSource = detail();
        DataList2.DataBind();
       
        DataList4.DataSource = detail();
        DataList4.DataBind();

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
    public DataSet getimages()
    {
        SqlCommand cmd3 = new SqlCommand("Select userID from [User] order by userID ", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd3.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds3 = new DataSet();
        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd3);
        adapter2.Fill(ds3);
        string IDtut = ds3.Tables[0].Rows[0][0].ToString();

        //order by ContentID desc
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Contents WHERE userID=@IDtut ", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        cmd1.Parameters.AddWithValue("@IDtut", IDtut);

        DataSet ds1 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        adapter1.Fill(ds1);
        return ds1;
    }

    public DataSet getUser()
    {
        SqlCommand cmd2 = new SqlCommand("SELECT Top 1 * FROM [User]", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar,
        SqlCommand cmd3 = new SqlCommand("Select top 1 * from [User] ", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd2.Parameters.AddWithValue("@UserCookie", UserCookie);
        cmd3.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds3 = new DataSet();
        DataSet ds2 = new DataSet();
        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd3);
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd2);
        adapter2.Fill(ds3);
        adapter1.Fill(ds2);
        Label1.Text = ds3.Tables[0].Rows[0][0].ToString();
        string UIDCookie = ds3.Tables[0].Rows[0][0].ToString();
        return ds2;
    }
    public DataSet createlink()
    {
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM [User] order by userID desc", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        DataSet ds1 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        adapter1.Fill(ds1);
        return ds1;

    }
    public DataSet detail()
    {
        SqlCommand cmd4 = new SqlCommand("SELECT top 1 * FROM [User]", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd4.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds4 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd4);
        adapter1.Fill(ds4);
        return ds4;
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        if (Request.Cookies["UnameCookie"] != null)
        {
            HttpCookie Username = Request.Cookies["UnameCookie"];
            Username.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(Username);
            Response.Redirect("Login.aspx");

        }
    }
}
//protected void btnSearch_Click(object sender, EventArgs e)
//{

//    SqlConnection connection = new SqlConnection(connectionString);
//    SqlCommand cmd = new SqlCommand("select concat(Title, ' ', FirstName, ' ', LastName) AS [Ad Soyad], DepName AS [Bölüm], Internal AS [Dahili] from tEmployee inner join tDepartment on tEmployee.DepartmentID = tDepartment.DepartmentID where (FirstName like @search + '%' OR LastName like @search + '%')", connection);
//    cmd.Parameters.Add("@search", SqlDbType.NVarChar).Value = txtSearch.Text;

//    connection.Open();
//    cmd.ExecuteNonQuery();
//    SqlDataAdapter adapter = new SqlDataAdapter();
//    adapter.SelectCommand = cmd;
//    DataSet data = new DataSet();
//    adapter.Fill(data, "FirstName");
//    gvResult.DataSource = data;
//    gvResult.DataBind();
//    connection.Close();
//}