<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_Main.aspx.cs" Inherits="WebApplication4.Form_Main" EnableEventValidation="false"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name=ProgId content=Excel.Sheet/>
    <meta name=Generator content="Microsoft Excel 11"/>
    <link rel="stylesheet" href="Assets/jquery/jquery-ui.css" />
    <link rel="stylesheet" href="Assets/jquery/jquery-ui.min.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script src="Assets/jquery/jquery-ui.js"></script>
    <script src="Assets/jquery/jquery-ui.min.js"></script>
    <link href="Assets/css/style.css" rel="stylesheet" type="text/css"/>
    <script>
        $(document).ready(function () {
            //Loop through each checkbox in gridview
            //Change the GridView id here
            $("#<%=GridView1.ClientID %> input:checkbox").each(function () {
                this.onclick = function () {
                    //Check if the checkbox is selected or not
                    if (this.checked)
                        //If checked then change the backgroundcolor
                        this.parentNode.parentNode.parentNode.style.backgroundColor = '#2255FF';
                    else
                        //If not then change it back to none color
                        this.parentNode.parentNode.parentNode.style.backgroundColor = 'transparent';
                }
            })
        });
    </script>
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnFind">
        <div style="height: 50px; padding:5px; background-color: #23516f; border-bottom:1px solid #eee;">
            <asp:Button ID="btnOut" runat="server" class="button" Text="Log out" OnClick="btnOut_Click"/>
            <marquee style="margin: 14px;">Welcome to the form information of customer</marquee>
        </div>
        <div id="wrapper">
        <p class="titlehd">Form information of customer</p>
        
            
        <div id="header">
             <asp:Panel ID="Panel1" runat="server">
                <div class="row">
                    <label class="label_kh">ID</label>
                    <asp:TextBox runat="server" ID="txt_ID" autocomplete="off"></asp:TextBox>
                </div>
            
                <div class="row">
                    <label class="label_kh" >Name</label>
                    <asp:TextBox runat="server" ID="txt_Name" autocomplete="off"></asp:TextBox>
                </div>

                <asp:Button ID="btnFind" runat="server" class="button" Text="Find" OnClick="btnFind_Click"/>
                             
             </asp:Panel>
           </div>  
                
                <div id="btn">
                    
                    <asp:Button ID="btnOpenInsert" runat="server" class="button" Text="Insert" OnClick="btnOpenInsert_Click"/>
         
                    <asp:Button ID="btnDelete" runat="server" class="button" Text="Delete" OnClick="btnDelete_Click" />
                    <asp:Button ID="btnReset" runat="server" class="button" Text="Reset" OnClick="btnReset_Click" />
                    <asp:Button ID="btnExport" runat="server" class="button" Text="Export" OnClick="btnExport_Click" />             
                </div>
                 
                <center>
                    <asp:Panel ID="Panel_Mess" runat="server">
                        <asp:Label class="titlehd" id="Label1" runat="server" Text=""></asp:Label>
                        <div class="row" style="padding-left:105px">
                            <asp:Button ID="btnReturn" runat="server" class="button" Text="Return" OnClick="btnReturn_Click" CausesValidation="false"/>
                        </div>            
                    </asp:Panel>
                 </center>

                <div style="padding:15px;">
                <label style="float: right; padding: 10px;">Count Row</label>
                <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" >
                    <asp:ListItem Text="20"></asp:ListItem>
                    <asp:ListItem Text="40"></asp:ListItem>
                    <asp:ListItem Text="60"></asp:ListItem>
    
                </asp:DropDownList>
                </div>
                <div id="bottom">
                    
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PageSize="20" OnRowCreated="GridView1_RowCreated">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="id">
                            <ControlStyle Width="100px" />
                            <HeaderStyle Width="100px" />
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Name" DataField="name">
                            <ControlStyle Width="300px" />
                            <FooterStyle Width="300px" />
                            <HeaderStyle Width="300px" />
                            <ItemStyle Width="300px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Date of birth" DataField="birth">
                            <ControlStyle Width="200px" />
                            <FooterStyle Width="200px" />
                            <HeaderStyle Width="200px" />
                            <ItemStyle Width="200px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Gender" DataField="gender">
                            <ControlStyle Width="100px" />
                            <FooterStyle Width="100px" />
                            <HeaderStyle Width="100px" />
                            <ItemStyle Width="100px" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Phone" DataField="phone">
                            <ControlStyle Width="220px" />
                            <FooterStyle Width="220px" />
                            <HeaderStyle Width="220px" />
                            <ItemStyle Width="220px" HorizontalAlign="Left"/>
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Email" DataField="email">
                            <ControlStyle Width="300px" />
                            <FooterStyle Width="300px" />
                            <HeaderStyle Width="300px" />
                            <ItemStyle Width="300px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Address" DataField="address">
                            <ControlStyle Width="300px" />
                            <FooterStyle Width="300px" />
                            <HeaderStyle Width="300px" />
                            <ItemStyle Width="300px" HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:CommandField ShowSelectButton="True" SelectText="Edit">
                            <ControlStyle Width="66px" />
                            <FooterStyle Width="66px" />
                            <HeaderStyle Width="66px" />
                            <ItemStyle Width="66px" />
                            </asp:CommandField>
                            <asp:TemplateField>                          
                                <ItemTemplate>                            
                                    <asp:CheckBox ID="CheckBox1" runat="server" AutoPostBack="false" Checked="false"/>                                   
                                </ItemTemplate>
                                <ControlStyle Width="50px" />
                                <FooterStyle Width="50px" />
                                <HeaderStyle Width="50px" />
                                <ItemStyle Width="50px" />
                                
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="End" NextPageText="Next" PageButtonCount="3" PreviousPageText="Previous" />
                        <PagerStyle BorderWidth="0px" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#6699FF" />
                    </asp:GridView>
                    
                    
                </div>
        </div>
    </form>
</body>
</html>
