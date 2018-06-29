<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication4.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body id="body_login">
    <form id="form_login" runat="server">
        <p style="text-align:center; font-size: 28px; font-weight:bold; color:#fff; margin:20px;">FORM LOGIN</p>
        <div id="logo"><img src="Assets/img/logo.png" width="100%"></div>
        <div style="width:100%">
            <p><asp:Textbox id="user" runat="server" name="user" placeholder="Insert your user name"></asp:TextBox></p>
            <p><asp:RequiredFieldValidator runat="server" id="reqName" controltovalidate="user" errormessage="Please insert your user name" ForeColor="#FF9900" style="text-align: left" /></p>
            <p><asp:Textbox id="password" runat="server" name="password" placeholder="Insert your password" TextMode="Password"></asp:TextBox></p>
            <p><asp:RequiredFieldValidator runat="server" id="RequiredFieldValidator1" controltovalidate="password" errormessage="Please insert your password" ForeColor="#FF9900" /></p>
            <p><asp:Label id="lblCheck" runat="server" style="display:block;color: #FF9900"></asp:Label></p>
            
        </div>
        <asp:Button id="btn_login" runat="server" OnClick="btn_Click" type="submit" Text="Login"/>
    
    </form>
</body>
</html>
