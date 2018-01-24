<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signin.aspx.cs" Inherits="signin" %>

<!DOCTYPE html>
<html>

<head>
    <title>Signin Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="lib/bootstrap/css/bootstrap.min.css" type="text/css">
    <script src="lib/jquery-3.2.0.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,600,700" rel="stylesheet">
    <link rel="stylesheet" href="style.css" type="text/css">
</head>

<body id="login-page">

    <div class="form-box" style="height:450px; top:40%;">
        <div class="form-logo">
            <p class="text-center">
                <img src="img/logo.png" alt="logo">
            </p>
        </div>
        <form id="form1" runat="server">
            <asp:TextBox ID="TextBox1" Class="form-control" runat="server" placeholder="Username" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
            <asp:TextBox ID="TextBox2" Class="form-control" runat="server" TextMode="Email" placeholder="Email" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
            <asp:TextBox ID="TextBox3" Class="form-control" runat="server" placeholder="Password" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            <asp:CheckBox runat="server"></asp:CheckBox>
            &nbsp Save Password
            <asp:Button ID="Button1" class="btn btn-social" runat="server" Text="SIGNIN" OnClick="Button1_Click" />
        </form>
        <a href="login.aspx" class="login-action" title="Signi in">
         <p> Have an account? &nbsp &nbsp &nbsp<asp:Label ID="Label1" runat="server"></asp:Label></p>
        </a>
    </div>
    <!--close form-box-->

    <footer class="login-footer text-center">
        <div class="col-xs-3">
            <a class="login-action" href="#" title="language">LANGUAGE</a>
        </div>
        <div class="col-xs-3">
            <a class="login-action" href="#" title="terms">TERMS</a>
        </div>
        <div class="col-xs-3">
            <a class="login-action" href="#" title="privacy">PRIVACY</a>
        </div>
        <div class="col-xs-3">
            <a class="login-action" href="#" title="careers">CAREERS</a>
        </div>
    </footer>

</body>

</html>
