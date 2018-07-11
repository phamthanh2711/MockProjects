<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="Assets/css/animate.css" rel="stylesheet" type="text/css"/>
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="Assets/jquery/wow.min.js"></script>
    <script>
        new WOW().init();
    </script>
</head>
<body id="body_login">
    <form id="form_login" runat="server">
        <p class="wow bounceInDown" style="text-align:center; font-size: 28px; font-weight:bold; color:#fff; margin:20px;display:block">FORM LOGIN</p>
        <div id="logo" class="wow rotateIn"><img src="Assets/img/logo.png" width="100%"></div>
        <div style="width:100%">
            <p class="row wow bounceInLeft"><asp:Textbox id="user" runat="server" name="user" placeholder="Insert your user name"  autocomplete="off" data-wow-delay="0.8s"></asp:TextBox>
            <asp:Label id="Label1" runat="server" style="display:block;color: #FF9900; text-align:center;position:absolute;top:90px;left:0px;right:0px"></asp:Label></p>
            <p  class="row wow bounceInRight"><asp:Textbox id="password" runat="server" name="password" placeholder="Insert your password" TextMode="Password" autocomplete="off" data-wow-delay="1.2s"></asp:TextBox>
            <asp:Label id="Label2" runat="server" style="display:block;color: #FF9900; text-align:center; position:absolute;top:90px;left:0px;right:0px"></asp:Label></p>
        </div>
        <asp:Button id="btn_login" class="wow rollIn" runat="server" OnClick="btn_Click" type="submit" Text="Login"/>
    
    </form>
</body>
</html>
