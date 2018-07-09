<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Detail.aspx.cs" Inherits="WebApplication4.Form_Detail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <link rel="stylesheet" href="Assets/jquery/jquery-ui.css" />
    <link rel="stylesheet" href="Assets/jquery/jquery-ui.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="Assets/jquery/jquery-ui.js"></script>
    <script src="Assets/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#txt_Birth').datepicker(
                {
                    dateFormat:'dd/mm/yy',
                    changeMonth: true,
                    changeYear: true,
                    maxDate:'0',
                    yearRange: 'c-100:c'
                });
        });
    </script>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 50px; padding:5px; background-color: #23516f; border-bottom:1px solid #eee;">
            <asp:Button ID="btnOut" runat="server" class="button" Text="Log out" OnClick="btnOut_Click"/>
            <marquee style="margin: 14px;">Welcome to the form information of customer</marquee>
        </div>
        <div id="wrapper">
        <p class="titlehd">Form information of customer</p>
        <asp:Panel ID="Panel2" class="form_panel" runat="server">
                        <asp:Label class="titlehd" id="title_Popup" runat="server"></asp:Label>
                        <div class="row">
                            <p><label class="label_kh" >ID</label>
                            <asp:TextBox runat="server" ID="txt_ID" ReadOnly="true"></asp:TextBox></p>
    
                        </div>
                        <div class="row">
                            <p><label class="label_kh" >Name (*)</label>
                            <asp:TextBox runat="server" ID="txt_Name"></asp:TextBox></p>
                            <p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert name of customer" ControlToValidate="txt_Name" ForeColor="#FF9900" style="text-align: left; position:absolute; top: 50px;left: 210px;"></asp:RequiredFieldValidator>
                            </p>
                            <p>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Name field cannot fill number or special symbol" ControlToValidate="txt_Name"
                                Display="Dynamic" ForeColor="#FF9900" SetFocusOnError="True"
                                ValidationExpression="^[a-zA-Z\s]+$" style="text-align: left; position:absolute; top: 50px;left: 210px;"></asp:RegularExpressionValidator>
                            </p>
                        </div>
                        <div class="row">
                            <p>
                                <label class="label_kh">Birth (*)</label>
                                <asp:TextBox runat="server" ID="txt_Birth"></asp:TextBox>
                            </p>
                            <p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert date of birth" ControlToValidate="txt_Birth" ForeColor="#FF9900" style="text-align: left; position:absolute; top: 50px;left: 210px;"></asp:RequiredFieldValidator>
                            </p>
                        </div>

                        <div class="row">
                            <label class="label_kh">Gender</label>
                            <p class="rdb"><asp:RadioButton ID="rdb_Male" runat="server" GroupName="gender" Text="Male" checked=true ></asp:RadioButton></p>
                            <p class="rdb"><asp:RadioButton ID="rdb_Female" runat="server" GroupName="gender" Text="Female"></asp:RadioButton></p>
                        </div>
                        <div class="row">
                            <p>
                                <label class="label_kh" >Phone</label>
                                <asp:TextBox runat="server" ID="txt_Phone"></asp:TextBox> 
                            </p> 
                            <p>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number cannot fill text, white space or specical symbol" ControlToValidate="txt_Phone"
                                Display="Dynamic" ForeColor="#FF9900" SetFocusOnError="True"
                                ValidationExpression="^[\d\+\(\)\.\,]+$" style="text-align: left; position:absolute; top: 50px;left: 210px;"></asp:RegularExpressionValidator>
                            </p>
                        </div>
                        <div class="row">
                            <p>
                                <label class="label_kh" >Email</label>
                                <asp:TextBox runat="server" ID="txt_Email"></asp:TextBox>
                            </p>
                            <p>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Error format of email" ControlToValidate="txt_Email"
                                Display="Dynamic" ForeColor="#FF9900" SetFocusOnError="True"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" style="text-align: left; position:absolute; top: 50px;left: 210px;"></asp:RegularExpressionValidator>
                            </p>
                        </div>
                        <div class="row">
                        <label class="label_kh" >Address</label>
                            <asp:TextBox runat="server" ID="txt_Address" ></asp:TextBox>
                        </div> 
                        <div class="row" style="padding-left:200px">
                            <asp:Button ID="btnInsert" runat="server" class="button" Text="Insert" OnClick="btnInsert_Click"/>
                            <asp:Button ID="btnCancel" runat="server" class="button" Text="Return" OnClick="btnCancel_Click" CausesValidation="false"/>
                        </div>                   
                        
                  
                        <center>
                        <asp:Panel ID="Panel_Mess" runat="server">
                                <asp:Label class="titlehd" id="Label1" runat="server" Text="Chen thanh cong"></asp:Label>
                                <div class="row" style="padding-left:105px">
                                    <asp:Button ID="btnReturn" runat="server" class="button" Text="Return" OnClick="btnReturn_Click" CausesValidation="false"/>
                                </div>
                                
                        </asp:Panel>
                        </center>
            
                        </asp:Panel>
            </div>
    </form>
</body>
</html>
