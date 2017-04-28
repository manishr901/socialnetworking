<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.master" CodeFile="ForgotPassword.aspx.cs" Inherits="index" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%--<%@ OutputCache Duration="3600" VaryByParam="none" %>--%>
<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

    <link href="css/faary.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">

</script>
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

        
        </style>

    <title>Social Book</title>

    </asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div id="main-wapper">
  <div id="header">
    <div class="logo" 
          
          style="color:White;font-size:xx-large; font-family: 'Californian FB'; font-weight: normal;">Friends' Corner</div>
  </div>
  
  <div id="body-panal">
  
      <div style="width: 740px; height: 200px; color: #6D9334;">
      <table border="0" cellpadding="1" cellspacing="0" align ="center">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2" style="font-size: medium">
                                                    Forgot Password</td>
                                            </tr>
              <tr>
              <td>
                  <asp:Label ID="Lblemailid" runat="server" Text=" Your Email "></asp:Label></td>
              <td>
                                    <asp:TextBox ID="emailidtxt" runat="server" CssClass="textstyle"></asp:TextBox> 
                                    <asp:Button ID="Btngo" runat="server"  CssClass="textstyle" Text="Go" 
                                        Width="74px" onclick="Btngo_Click"  />
             </td>
           </tr>
           <tr>
           <td colspan="2">
               <asp:Panel ID="Panel1" runat="server" Visible="False" >
               
           <table border="0" cellpadding="0">
           <tr>
                                <td>
                                    <asp:Label ID="Lblsecques" runat="server" Text="Answer question:"></asp:Label></td>
                                <td>
                                    <asp:Label ID="Label2" runat="server" Font-Bold="False" Font-Names="Georgia" 
                                        Font-Size="Large"></asp:Label></td>
            </tr>
            <tr>
                                <td>
                                    <asp:Label ID="Lblansw" runat="server" Text="Your Answer:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="secanstxt" runat="server" CssClass="textstyle"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td colspan="2" align="center">
                                    <asp:Button ID="Btnxt" runat="server" CssClass="textstyle" Text="Next" 
                                        Width="138px" onclick="Btnxt_Click"/></td>
                            </tr>
             </table> 
             </asp:Panel> 
               <asp:Panel ID="Panel2" runat="server" BorderColor="#CC0000" BorderStyle="Solid" 
                   BorderWidth="1px" Font-Bold="True" Font-Size="Larger" ForeColor="#CC0000" 
                   Height="50px" Visible="False">
               Email Id is not available !!
               </asp:Panel>             
             </td>               
            </tr>    
            <tr><td colspan="2">    
                <asp:Panel ID="Panel3" runat="server" Visible="False">
                    
                          <table>
                            <tr>
                                <td>
                                    <asp:Label ID="Lblpwd" runat="server" Text="New Password:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="newpwdtxt"  runat="server"  CssClass="textstyle" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server"
                                    ControlToValidate="newpwdtxt" ErrorMessage="New Password is required." ValidationGroup="ChangePassword1"
                                                        ToolTip="New Password is required.">*</asp:RequiredFieldValidator> 
                    
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Lblreenterpwd" runat="server" Text="RE-Enter Password:"></asp:Label></td>
                                <td>
                                    <asp:TextBox ID="reenterpwdtxt" runat="server"  CssClass= "textstyle" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="reEnterPasswordRequired" runat="server" 
                                         ControlToValidate="reenterpwdtxt" 
                                                        ErrorMessage="Confirm Re-EnterPassword is required." ValidationGroup="ChangePassword1"
                                                        ToolTip="Confirm Re-EnterPassword is required.">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                        ControlToCompare="newpwdtxt" ControlToValidate="reenterpwdtxt" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The New Password must match with the Re-Enter Password entry." 
                                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                            <tr>
                                <td colspan="2" align="center" >
                                    <asp:Button ID="Btnsavechg" runat="server" CssClass ="textstyle" 
                                        Text="Save Changes" Width="138px" onclick="Btnsavechg_Click" 
                                        ValidationGroup="ChangePassword1" />
                                    <br />
                                   
                                </td>
                                
                            </tr>
                            </table>
                            </asp:Panel>
                <asp:Panel ID="Panel4" runat="server" HorizontalAlign="Center" Visible="False" 
                    Height="65px">
                 <asp:Label ID="Label3" runat="server" EnableViewState="False" Font-Bold="True" 
                                        Font-Size="Medium">Password Reset !</asp:Label>
                    <br />
                    <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="textstyle" 
                        onclick="BtnLogin_Click" Width="50px" />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </asp:Panel>
                            <br />
                            </td>
            </tr>    
      </table>
       </td>
       </tr>
       
       </table>
      
  
  </div>
  </div>
  
</div>



</asp:Content>
