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



public partial class personal_profile : System.Web.UI.Page
{
    SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
    SqlCommand komut;
   


    string connectionString = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ContentsRepeater();
            //CommentsRepeater();
        }

        //comments.DataSource = getComments();
        //comments.DataBind();
        
        getPimg.DataSource = getUser();
        getPimg.DataBind();
        DataList1.DataSource = createlink();
        DataList1.DataBind();
        DataList2.DataSource = detail();
        DataList2.DataBind();
        DataList3.DataSource = createlink();
        DataList3.DataBind();
        DataList4.DataSource = detail();
        DataList4.DataBind();

        string UserCookie = Request.Cookies["UnameCookie"].Value;

        //Label1.Text = UserCookie;
       
        

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
    //private void CommentsRepeater()
    //{
    //    String CS2 = ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
    //    using (SqlConnection con2 = new SqlConnection(CS2))
    //    {
    //        using (SqlCommand cmd2 = new SqlCommand("marge3", con2))
    //        {
    //            cmd2.CommandType = CommandType.StoredProcedure;

    //            using (SqlDataAdapter sda2 = new SqlDataAdapter(cmd2))
    //            {
    //                DataTable dtConTable2 = new DataTable();
    //                sda2.Fill(dtConTable2);

    //                rptrContents.DataSource = getComments();
    //                rptrContents.DataBind();
    //            }
    //        }
    //    }
    //}


    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {

    }

    public DataSet getComments() // yorum kısmında bulunan date ve comment kısımlarını database üzerinden çekme işlemi
    {
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Comment order by CommentID desc", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        DataSet ds1 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
        adapter1.Fill(ds1);
        return ds1;
    }
    //public DataSet getimages()
    //{
    //    //Select t1.alanAdi, t2.alanAdi from tablo1 AS t1 Inner Join tablo2 AS t2 ON t1.iliskiliAlan = t2.iliskiliAlan
    //    //Select t1.alanAdi, t2.alanAdi,t3.alanAdi from tablo1 AS t1 Inner Join tablo2 AS t2 ON t1.iliskiliAlan = t2.iliskiliAlan Inner Join tablo3 AS t3 ON t1.iliskilAlan = t3.iliskiliAlan
    //    SqlCommand cmd1 = new SqlCommand("SELECT t1.Image, t2.Expression, t2.UserName, t3.ProfileImage FROM[dbo].[Contents] as t1 inner join [dbo].[Comment] as t2 on t1.Id = t2.CommentID Inner Join [dbo].[User] AS t3 ON t1.Id = t3.UserID order by t1.Id desc ", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
    //    DataSet ds1 = new DataSet();
    //    SqlDataAdapter adapter1 = new SqlDataAdapter(cmd1);
    //    adapter1.Fill(ds1);
    //    return ds1;
    //}

    public DataSet getimages()
    {
        SqlCommand cmd3 = new SqlCommand("Select userID from [User] where UserName=@UserCookie", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd3.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds3 = new DataSet();
        SqlDataAdapter adapter2 = new SqlDataAdapter(cmd3);
        adapter2.Fill(ds3);
        string IDtut= ds3.Tables[0].Rows[0][0].ToString();

        //order by ContentID desc
        SqlCommand cmd1 = new SqlCommand("SELECT * FROM Contents WHERE userID=@IDtut ", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        cmd1.Parameters.AddWithValue("@IDtut", IDtut);

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
    public DataSet detail()
    {
        SqlCommand cmd4 = new SqlCommand("SELECT * FROM [User] where UserName=@UserCookie ", baglan); //TOP 3 en üstteki 3 elemanı almayı sağlar
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        cmd4.Parameters.AddWithValue("@UserCookie", UserCookie);
        DataSet ds4 = new DataSet();
        SqlDataAdapter adapter1 = new SqlDataAdapter(cmd4);
        adapter1.Fill(ds4);
        return ds4;
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
        Label1.Text = ds3.Tables[0].Rows[0][0].ToString();
        string UIDCookie = ds3.Tables[0].Rows[0][0].ToString();
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
    int id ;
    string uzanti = "";
    string resimadi = "";
    string profilresimadi = "";
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            uzanti = Path.GetExtension(FileUpload1.PostedFile.FileName);
            resimadi = (TextBox1.Text) + "_image_" + DateTime.Now.Day + uzanti;
            FileUpload1.SaveAs(Server.MapPath("img/sahte" + uzanti));

            int Donusturme = 640;

            Bitmap bmp = new Bitmap(Server.MapPath("img/sahte" + uzanti));
            using (Bitmap OrjinalResim = bmp)
            {
                double ResYukseklik = OrjinalResim.Height;
                double ResGenislik = OrjinalResim.Width;
                double oran = 0;

                if (ResGenislik >= Donusturme)
                {
                    oran = ResGenislik / ResYukseklik;
                    ResGenislik = Donusturme;
                    ResYukseklik = Donusturme / oran;

                    Size yenidegerler = new Size(Convert.ToInt32(ResGenislik), Convert.ToInt32(ResYukseklik));
                    Bitmap yeniresim = new Bitmap(OrjinalResim, yenidegerler);
                    yeniresim.Save(Server.MapPath("img/" + resimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();


                }
                else
                {
                    FileUpload1.SaveAs(Server.MapPath("img/" + resimadi));
                }
            }
            FileInfo figecici = new FileInfo(Server.MapPath("~/img/sahte" + uzanti));
            figecici.Delete();
        }


        SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
        baglan.Open();
        SqlCommand komut = new SqlCommand("insert into Contents (ImageName,Image,userID) values (@UrunAdi,@UrunResmi,@id) ", baglan);
        komut.Parameters.AddWithValue("@UrunAdi", TextBox1.Text.ToString());
        komut.Parameters.AddWithValue("@UrunResmi", resimadi);
        komut.Parameters.AddWithValue("@id", Label1.Text);
        komut.ExecuteNonQuery();
        baglan.Close();
        lblMessage.Text = "successful";
        TextBox1.Text = "";

        Response.AddHeader("REFRESH", "2;URL=personal-profile.aspx");

    }
    protected void Image1_Click(object sender, ImageClickEventArgs e)
    {


    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }


    protected void itemlist_SelectedIndexChanged(object sender, EventArgs e)
    {

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

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (FileUpload2.HasFile)
        {
            uzanti = Path.GetExtension(FileUpload2.PostedFile.FileName);
            profilresimadi = (TextBox3.Text) + "_profileimage_" + DateTime.Now.Day + uzanti;
            FileUpload2.SaveAs(Server.MapPath("img/sahte" + uzanti));

            int Donusturme = 640;

            Bitmap bmp = new Bitmap(Server.MapPath("img/sahte" + uzanti));
            using (Bitmap OrjinalResim = bmp)
            {
                double ResYukseklik = OrjinalResim.Height;
                double ResGenislik = OrjinalResim.Width;
                double oran = 0;

                if (ResGenislik >= Donusturme)
                {
                    oran = ResGenislik / ResYukseklik;
                    ResGenislik = Donusturme;
                    ResYukseklik = Donusturme / oran;

                    Size yenidegerler = new Size(Convert.ToInt32(ResGenislik), Convert.ToInt32(ResYukseklik));
                    Bitmap yeniresim = new Bitmap(OrjinalResim, yenidegerler);
                    yeniresim.Save(Server.MapPath("img/" + profilresimadi));

                    yeniresim.Dispose();
                    OrjinalResim.Dispose();
                    bmp.Dispose();


                }
                else
                {
                    FileUpload2.SaveAs(Server.MapPath("img/" + profilresimadi));
                }
            }
            FileInfo figecici = new FileInfo(Server.MapPath("~/img/sahte" + uzanti));
            figecici.Delete();
        }


        

        SqlConnection baglan = new SqlConnection("server=DESKTOP-2RAK4I8;database=Social;Trusted_connection=True");
        baglan.Open();
        
        SqlCommand komut = new SqlCommand("UPDATE [User] SET [ProfileImage]=@Parameter1 WHERE UserName=@UserCookie ", baglan);
        string UserCookie = Request.Cookies["UnameCookie"].Value;
        komut.Parameters.AddWithValue("@UserCookie", UserCookie);
        komut.Parameters.AddWithValue("@Parameter1", profilresimadi);
        komut.ExecuteNonQuery();
        baglan.Close();
        lblMessage2.Text = "Successful";
        TextBox3.Text = "";

        Response.AddHeader("REFRESH", "2;URL=personal-profile.aspx");

    }

    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}


