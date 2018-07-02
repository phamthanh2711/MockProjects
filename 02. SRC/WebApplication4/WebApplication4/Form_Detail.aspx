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
                    yearRange: '1950:2020'
                });
        });
    </script>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrapper">
        <marquee>ここにお客様の情報を挿入してください</marquee>
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
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please insert" ControlToValidate="txt_Name" ForeColor="#FF9900" style="text-align: left"></asp:RequiredFieldValidator>
                            </p>
                        </div>
                        <div class="row">
                            <p>
                                <label class="label_kh">Birth (*)</label>
                                <asp:TextBox runat="server" ID="txt_Birth" ReadOnly="False" ></asp:TextBox>
                            </p>
                            <p>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please insert" ControlToValidate="txt_Birth" ForeColor="#FF9900" style="text-align: left"></asp:RequiredFieldValidator>
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
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Error format of phone" ControlToValidate="txt_Phone"
                                Display="Dynamic" ForeColor="#FF9900" SetFocusOnError="True"
                                ValidationExpression="^[\d\s\+\(\)\.\,]+$"></asp:RegularExpressionValidator>
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
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </p>
                        </div>
                        <div class="row">
                        <label class="label_kh" >Address</label>
                            <asp:TextBox runat="server" ID="txt_Address" ></asp:TextBox>
                        </div> 
                        <div class="row" style="padding-left:200px">
                            <asp:Button ID="btnInsert" runat="server" class="button" Text="Insert" OnClick="btnInsert_Click"/>
                            <asp:Button ID="btnCancel" runat="server" class="button" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false"/>
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
