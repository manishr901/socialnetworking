<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Profile.aspx.cs" Inherits="Default3" Title="User Profile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" src="js/jquery.js"></script>

    <style type="text/css">
     
        .textstyle
        {
        
	    -moz-box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
        background: -moz-linear-gradient(center top , #FFFFFF, #EEEEEE 2px, #FFFFFF 25px) repeat scroll 0 0 transparent;
        border: 1px solid #6E9E28;
        color: #5B851E;
        height: 28px;
        margin: 0;
        padding: 5px;
        width: 264px;
    	}

        
        .style2
        {
            width: 216px;
            font-size:medium;
            text-align:left;
        }
     
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
    <br />
    <div style="width: 740px; height: 290px; color: #6D9334;">
    <table>
       <tr>
        <td>
           Upload Your Profile Photo Here.
        </td>
           <td>
               <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textstyle" 
                   Height="37px" />
           </td>
           <caption>
               <tr>
                   <td colspan="2" align="right">
                       <asp:Button ID="Button12" runat="server" Font-Bold="True" 
                           onclick="Button12_Click1" Text="Upload" CssClass="bt" Height="35px" 
                           Width="100px" />
                   </td>
               </tr>
           </caption>
            </tr>
            </table>
     
        <center>
            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Overline="False" 
                Font-Size="Large" Font-Underline="False" 
                Text="PROFILE INFORMATION"></asp:Label>
               
                <table>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Basic Information"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  align="center" class="style2">
                        <asp:Label ID="Label2" runat="server" Text="Name :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label3" runat="server" Text="Email Id :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label4" runat="server" Text="Age :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DropDownList2" runat="server" CssClass="textstyle">
                            <asp:ListItem>18</asp:ListItem>
                            <asp:ListItem>19</asp:ListItem>
                            <asp:ListItem>20</asp:ListItem>
                            <asp:ListItem>25-30</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label5" runat="server" Text="Religion :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="DropDownList3" runat="server" CssClass="textstyle">
                            <asp:ListItem>Hindu</asp:ListItem>
                            <asp:ListItem>Muslim</asp:ListItem>
                            <asp:ListItem>christian</asp:ListItem>
                            <asp:ListItem>Jain</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Nationality :"></asp:Label>
                    </td>
                    <td  align="left">
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="textstyle">
                            <asp:ListItem>Indian</asp:ListItem>
                            <asp:ListItem>Pakistani</asp:ListItem>
                            <asp:ListItem>American</asp:ListItem>
                            <asp:ListItem>Chinese</asp:ListItem>
                            <asp:ListItem>Italian</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label7" runat="server" Text="Gender :"></asp:Label>
                    </td>
                    <td  align="left">
                        <asp:RadioButton ID="RadioButton1" runat="server" GroupName="g" 
                            oncheckedchanged="RadioButton1_CheckedChanged" Text="Male" 
                            CssClass="textstyle" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RadioButton ID="RadioButton2" runat="server" GroupName="g" Text="Female" 
                            CssClass="textstyle" />
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label8" runat="server" Text="Date of birth :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox4" runat="server" CssClass="textstyle"></asp:TextBox>
                        <cc1:CalendarExtender ID="TextBox4_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="TextBox4">
                        </cc1:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="Address :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label19" runat="server" Text="City :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox13" runat="server" Height="29px" Width="176px" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label10" runat="server" Text="Mobile no :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="TextBox6" runat="server" Height="28px" Width="174px" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Education and Work"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" Text="School :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox7" runat="server" Height="28px" Width="174px" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" Text="College :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox8" runat="server" Height="29px" Width="172px" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Activities and Interests"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" Text="Hobbies :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox9" runat="server" TextMode="MultiLine" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" Text="Activities :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Arts and Entertainment"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label17" runat="server" Text="Movies :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox11" runat="server" Height="41px" TextMode="MultiLine" 
                            CssClass="textstyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label18" runat="server" Text="Music :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:TextBox ID="TextBox12" runat="server" CssClass="textstyle" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        &nbsp;</td>
                    <td class="style6">
                        <asp:Button ID="Button11" runat="server" CssClass="bt" Font-Bold="False" 
                            Font-Size="Medium" onclick="Button11_Click" 
                            Text="Submit" Height="38px" Width="179px" />
                    </td>
                </tr>
            </table>
                
            <br />
                
            <br />
            <br />
            <br />
                
            <br />
            <uc1:footer ID="footer1" runat="server" />
            <br />
            <br />
                
        </center>
     
    </div>
    </center>   
</asp:Content>

