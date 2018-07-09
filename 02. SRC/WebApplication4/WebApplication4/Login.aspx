<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body id="body_login">
    <form id="form_login" runat="server">
        <p style="text-align:center; font-size: 28px; font-weight:bold; color:#fff; margin:20px;display:block">FORM LOGIN</p>
        <div id="logo"><img src="Assets/img/logo.png" width="100%"></div>
        <div style="width:100%">
            <p><asp:Textbox id="user" runat="server" name="user" placeholder="Insert your user name"></asp:TextBox></p>
            <p><asp:Label id="Label1" runat="server" style="display:block;color: #FF9900; text-align:center"></asp:Label></p>
            <p><asp:Textbox id="password" runat="server" name="password" placeholder="Insert your password" TextMode="Password"></asp:TextBox></p>
            <p><asp:Label id="Label2" runat="server" style="display:block;color: #FF9900; text-align:center"></asp:Label></p>
            <p><asp:Label id="lblCheck" runat="server" style="display:block;color: #FF9900; text-align:center"></asp:Label></p>
            
        </div>
        <asp:Button id="btn_login" runat="server" OnClick="btn_Click" type="submit" Text="Login"/>
    
    </form>
</body>
</html>
