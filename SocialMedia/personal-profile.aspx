<%@ Page Language="C#" AutoEventWireup="true" CodeFile="personal-profile.aspx.cs" Inherits="personal_profile" %>

<!DOCTYPE html>
<html>

<head>
    <title>Personal Profile Template</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css" type="text/css">
    <script src="lib/jquery-3.2.0.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="lib/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="lib/bootstrap-switch/css/bootstrap-switch.min.css">
    <script src="lib/bootstrap-switch/js/bootstrap-switch.min.js"></script>
    <script src="https://twemoji.maxcdn.com/twemoji.min.js"></script>
    <script src="js/lazy-load.min.js"></script>
    <script src="js/socialyte.min.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="style.css" type="text/css">
</head>

<body id="personal" runat="server">

    <!--Header with Nav -->
    <form id="form1" runat="server">

        <header class="text-right">

     <div class="text-left search" >
            <input name="q" type="text" placeholder="Search..">
        </div>
            <div class="menu-icon">
                <div class="dropdown">

                          <asp:Button ID="Button1" runat="server" Backcolor="#4F5467" BorderStyle="None" Text="Logout" OnClick="Button1_Click1" />

                </div>
            </div>
            <div class="second-icon dropdown menu-icon">
                <span class="dropdown-toggle" role="button" id="dropdownNotification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    <span class="hidden-xs hidden-sm">Notifications</span> <i class="fa fa-bell-o" aria-hidden="true"></i><span class="badge">2</span>
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
<%--            <a href="personal-profile.aspx" title="Profile">--%>
                                <asp:DataList ID="getPimg" runat="server"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                    <ItemTemplate>
                                          <img src="img/<%#Eval("ProfileImage") %>" class="img-circle img-user" />
                                    </ItemTemplate>
                                </asp:DataList>
            
                       

                <br />
                <p class="text-center user-description hidden-xs"><asp:TextBox ID="TextBox3" placeholder="Update profile photo" runat="server"></asp:TextBox> </p>
                <p class="text-center user-description hidden-xs"><asp:FileUpload ID="FileUpload2" runat="server"/></p>
                <p class="text-center user-description hidden-xs"><asp:Button ID="Button3" runat="server" Text="Update" OnClick="Button3_Click" /></p>
                <p  class="text-center user-description hidden-xs"><asp:Label ID="lblMessage2" runat="server" Text=""></asp:Label></p>
            <p  class="text-center user-description hidden-xs">
            
            <asp:Label ID="Label1" runat="server" CssClass="" Text=""></asp:Label>

                       

                </p> 
                
               
              <asp:DataList ID="DataList4" runat="server"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                    <ItemTemplate>
                                        <div class="text-center user-description hidden-xs">
                                         <h2 class="text-center hidden-xs">
                                            <i> <h2><%# Eval("UserName") %></h2> </i>
                                         </h2>
                                     
                                         <p class="text-center user-description hidden-xs">
                                            <i> <%# Eval("Description") %></i>
                                        </p>
                                            </div>
                                        </ItemTemplate>
                  </asp:DataList>
           
           
        </div>

        <div class="content-posts profile-content">
            <div class="banner-profile">
            </div>
            <!-- Tab Panel -->
            <ul class="nav nav-tabs" role="tablist">
                <li class="active"><a href="#posts" role="tab" id="postsTab" data-toggle="tab" aria-controls="posts" aria-expanded="true">Last posts</a></li>
                <li><a href="#profile" role="tab" id="profileTab" data-toggle="tab" aria-controls="profile" aria-expanded="true">Profile</a></li>
                <li><a href="#chat" role="tab" id="chatTab" data-toggle="tab" aria-controls="chat" aria-expanded="true">Chat</a></li>
            </ul>

            <!--Start Tab Content-->
            <div class="tab-content">

                <!-- Tab Posts -->
                <div class="tab-pane fade active in" role="tabpanel" id="posts" aria-labelledby="postsTab">
                    <div id="posts-container" class="container-fluid container-posts">

                        <div class="card-post">
                            <div class="leftpart" style="float:left;">
                                <p>Gönderi Paylaş:</p>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="What's on your mind?" style=" margin-bottom:20px;" OnTextChanged="TextBox1_TextChanged" Height="80px" Width="500px"></asp:TextBox>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                                <br />
                                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />
<%--                                <asp:Label ID="Label3" runat="server" ></asp:Label>--%>
                                <asp:Label ID="lblMessage" runat="server"></asp:Label>

                                <br />

                            </div>
                            <div class="rightpart" style="float:right; width: 48px;">
                                                        
                            </div>
                           
                        </div>

                        
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
                        

                       <%-- <div class="card-post">
                            <div class="row">
                                <div class="col-xs-3 col-sm-2">
                                    <a href="personal-profile.aspx" title="Profile">
                                        <img src="img/user.jpg" alt="User name" class="img-circle img-user">
                                    </a>
                                </div>
                                <div class="col-xs-9 col-sm-10 info-user">
                                    <h3><a href="personal-profile.aspx" title="Profile">My User</a></h3>
                                    <p><i>2h</i></p>
                                </div>
                            </div>
                             <div class="row">
                            <div class="col-sm-8 col-sm-offset-2 data-post">
                                <p>Lorem Ipsum Dolor si amet</p>
                                <video controls>
                                  <source src="img/post-video.mp4" type="video/mp4">
                                  Your browser does not support the video tag.
                                </video>
                                <div class="reaction">
                                    &#x2764; 1234 &#x1F603; 54
                                    </div>
                                    <div class="comments">
                                        <div class="more-comments">View more comments</div>
                                        <ul>
                                            <li><b>User1</b> Lorem Ipsum Dolor si amet</li>
                                            <li><b>User2</b> Lorem Ipsum Dolor si amet &#x1F602;</li>
                                        </ul>
                                        <form>
                                            <input type="text" class="form-control" placeholder="Add a comment">
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>--%>
                    </div>
                    <div id="loading">
                        <img src="img/load.gif" alt="loader">
                    </div>
                </div>
                <!-- end Tab Posts -->
             

                <!--Start Tab Profile-->
                <div class="tab-pane fade" role="tabpanel" id="profile" aria-labelledby="profileTab">
                    <div class="container-fluid container-posts">
                        <div class="card-post">
                           
                                <asp:DataList ID="DataList2" runat="server"  class="row row-user-list"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                <ItemTemplate>
                                     <ul class="profile-data">
                                        <li><b>Username:</b> <%# Eval("UserName") %></li>
                                        <li><b>Age:</b>  <%# Eval("Age") %></li>
                                        <li><b>Hobbies:</b>  <%# Eval("Hobbies") %></li>
                                        <li><b>Studies:</b>  <%# Eval("Studies") %></li>
                                        <li><b>Job:</b>  <%# Eval("Job") %></li>
                                        <li><b>Description:</b>  <%# Eval("Description") %></li>
                                     </ul>
                                </ItemTemplate>
                                </asp:DataList>
                               
                            <p><a href="settings.aspx" title="edit profile" data-toggle="modal" data-target="#settingsmodal" ><i class="fa fa-pencil" aria-hidden="true"></i>Edit profile</a></p>
                        </div>
                    </div>
                </div>
                <!-- end tab Profile -->

                <!-- Start Tab chat-->
                <div class="tab-pane fade" role="tabpanel" id="chat" aria-labelledby="chatTab">
                    <div class="container-fluid container-posts">
                        <div class="card-post">
                            <div class="scrollbar-container">
                                
                                    
                                        <asp:DataList ID="DataList1" style="height:100%;width:100%" runat="server"  class="row row-user-list"  ShowFooter="False" ShowHeader="False" OnSelectedIndexChanged="itemlist_SelectedIndexChanged" RepeatColumns="1" RepeatDirection="Horizontal"> 
                                             <ItemTemplate>
                                                 
                                                         <div class="col-sm-2 col-xs-3">
                                                            
                                                            <a style="text-decoration: none" href="user-profile.aspx?userID=<%#Eval("userID") %>"><img src="img/<%#Eval("ProfileImage") %>" class="img-circle img-user" /></a>
                                                          </div>
                                                      <div class="col-sm-7 col-xs-9">
                                                            <p><b>   <%# Eval("UserName") %></b> </p>
                                                            <p class="chat-time">An hour ago</p>
                                                            <p> <%# Eval("Description") %></p>
                                                      </div>
                                                    <div class="col-sm-3 hidden-xs">
                                                        <p><a style="text-decoration: none" href="user-profile.aspx?PID=<%#Eval("userID") %>"title="Start chat"> <span class="badge badge-message">Start chat ></span></a></p>
                                                    </div>
                                               
                                              </ItemTemplate>
                                            </asp:DataList>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Tab chat-->
                    <!--Start Tab Sharing-->
                <div class="tab-pane fade" role="tabpanel" id="Share" aria-labelledby="ShareTab">
                    <div class="container-fluid container-posts">
                        <div class="card-post">
                           
                        </div>
                    </div>
                </div>
                <!-- end tab Sharing -->

            </div>
            <!-- Close Tab Content-->

        </div>
        <!--Close content posts-->

        <!-- Modal container for settings--->
        <div id="settingsmodal" class="modal fade text-center">
            <div class="modal-dialog">
                <div class="modal-content">
                </div>
            </div>
        </div>
    </form>
</body>
    </html>