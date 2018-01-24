<%@ Page Language="C#" AutoEventWireup="true" CodeFile="wall.aspx.cs" Inherits="wall" %>


<!DOCTYPE html>
<html>

<head>
    <title>Wall Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css" type="text/css">
    <script src="lib/jquery-3.2.0.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="lib/bootstrap-switch/css/bootstrap-switch.min.css">
    <script src="lib/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <script src="https://twemoji.maxcdn.com/twemoji.min.js"></script>
    <script src="js/lazy-load.min.js"></script>
    <script src="js/socialyte.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="style.css" type="text/css">
</head>

<body id="wall">

    <!--Header with Nav -->
    <form id="form1" runat="server">

    <header class="text-right">
      <div class="text-left search" >
            <input name="q" type="text" placeholder="Search..">
        </div>
        <div class="menu-icon">
            <div class="dropdown">
               <%-- <span class="dropdown-toggle" role="button" id="dropdownSettings" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                  <span class="hidden-xs hidden-sm">Settings</span> <i class="fa fa-cogs" aria-hidden="true"></i>--%>
               <asp:Button ID="Button1" runat="server" Backcolor="#4F5467" BorderStyle="None" Text="Logout" OnClick="Button1_Click1" />

<%--                </span>
                <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownSettings">
                    <li>
                        <a href="settings.aspx" title="Settings" data-toggle="modal" data-target="#settingsmodal">
                            <div class="col-xs-4">
                                <i class="fa fa-wrench" aria-hidden="true"></i>
                            </div>
                            <div class="col-xs-8 text-left">
                                <span>Settings</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" title="Settings">
                            <div class="col-xs-4">
                                <i class="fa fa-question" aria-hidden="true"></i>
                            </div>
                            <div class="col-xs-8 text-left">
                                <span>FAQ</span>
                            </div>
                        </a>
                    </li>
                    <li>
                        <a href="#" title="Settings">
                            <div class="col-xs-4">
                                <i class="fa fa-sign-out" aria-hidden="true"></i>
                            </div>
                            <div class="col-xs-8 text-left">
                                    <asp:Button ID="Button1" runat="server" Text="Logout" />
                            </div>
                        </a>
                    </li>
                </ul>--%>
            </div>
        </div>
        <div class="second-icon dropdown menu-icon">
            <span class="dropdown-toggle" role="button" id="dropdownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
        <span class="hidden-xs hidden-sm">Notifications</span> <i class="fa fa-bell-o" aria-hidden="true"></i> <span class="badge">2</span>
            </span>
            <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownNotification">
                     <asp:DataList ID="DataList3" style="height:100%;width:100%" runat="server"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                             <ItemTemplate> <li class="new-not">
                                                 <a style="text-decoration: none" href="user-profile.aspx?userID=<%#Eval("userID") %>" title=" <%# Eval("UserName") %>"> <img src="img/<%#Eval("ProfileImage") %>"class="img-circle img-user-mini" />
                                                            User comments your post</a>
                                                           
                                                        </li>
                                              </ItemTemplate>
                                            </asp:DataList>
                    
                    <li role="separator" class="divider"></li>
                    <li><a href="#" title="All notifications">All Notifications</a></li>
                </ul>
        </div>
        <div class="second-icon menu-icon">
            <span><a href="personal-profile.aspx" title="Profile"><span class="hidden-xs hidden-sm">Profile</span> <i class="fa fa-user" aria-hidden="true"></i></a>
            </span>
        </div>
        <div class="second-icon menu-icon">
            <span><a href="wall.aspx" title="Wall"><span class="hidden-xs hidden-sm">Wall</span> <i class="fa fa-database" aria-hidden="true"></i></a>
            </span>
        </div>
    </header>
         

    <!--Left Sidebar with info Profile -->
    <div class="sidebar-nav">
<asp:DataList Id="getPimg" runat="server">                                    <ItemTemplate>
                                          <img src="img/<%#Eval("ProfileImage") %>" class="img-circle img-user" />
                                    </ItemTemplate>
                                </asp:DataList>
                    <asp:Label ID="Label3" runat="server" CssClass="" Text=""></asp:Label>

        <h2 class="text-center hidden-xs"><asp:Label ID="Label2" runat="server" Text="Username"></asp:Label></h2>
        <p class="text-center user-description hidden-xs">
            <i>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</i>
        </p>
    </div>

    <!--Wall with Post -->
    <div class="content-posts active" id="posts">
        <div id="posts-container" class="container-fluid container-posts">

             <asp:Repeater ID="rptrContents" runat="server">
                                        <ItemTemplate>
                                            <div class="card-post">
                            <div class="row">
                                <div class="col-xs-3 col-sm-2">
                                  <%--  <a href="personal-profile.aspx" title="Profile">--%>
<%--                                        <img src="img/user.jpg" alt="My User" class="img-circle img-user">--%>
                            
<%--                                     <img src="img/<%#Eval("ProfileImage") %>" class="img-circle img-user" />--%>

                                    <asp:DataList ID="getPimg" runat="server"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                    <ItemTemplate>
<%--                                          <img src="img/<%#Eval("ProfileImage") %>" class="img-circle img-user" />--%>
                                    </ItemTemplate>
                                </asp:DataList>
                                   
                                </div>
                                <%--<asp:DataList ID="DataList1" runat="server"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                    <ItemTemplate>--%>
                                         <div class="col-xs-9 col-sm-10 info-user">
<%--                                             <h3><b> <%# Eval("UserName") %></b></h3>--%>
                                    <p><i>2h</i></p>
                                </div>
                               <%--     </ItemTemplate>
                                </asp:DataList>--%>
                                
                            </div>
                            <div  class="row" >
                                <h3 style="margin-left:170px; margin-bottom:30px; margin-top:10px;"> <%# Eval("ImageName") %></h3>
                                 <img style="margin-left:170px;" src="img/<%#Eval("Image") %>" width="200" height="200" />
                                   
                                <div class=" col-sm-8 col-sm-offset-2 data-post">
                                    <p>
                                    </p>
                                    <div class="reaction">
                                        &#x2764; 1234 &#x1F603; 54
                                    </div>
                                                                       
                                    <div class="comments">
                                        <div class="more-comments">View more comments</div>

                                      <%--  <asp:Repeater ID="rptrComments" runat="server">
                                        <ItemTemplate>
                                       <b> <%# Eval("userID") %></b>  <%# Eval("Expression") %>
                                            </ItemTemplate>
                                            </asp:Repeater>--%>
                                    </div>
                                                                                
                                    <asp:TextBox ID="TextBox2" runat="server"  type="text" class="form-control" placeholder="Add a comment"></asp:TextBox>
                                            <asp:Button ID="Button2" runat="server" Text="Share" OnClick="Button2_Click" />
                                </div>
                            </div>
                        </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
               </form>

           

       
        <!--Close #posts-container-->
        <div id="loading">
            <img src="img/load.gif" alt="loader">
        </div>
    </div>
    <!-- Close #posts -->
    <!-- Modal container for settings--->
    <div id="settingsmodal" class="modal fade text-center">
        <div class="modal-dialog">
            <div class="modal-content">
            </div>
        </div>
    </div>
</body>

</html>
