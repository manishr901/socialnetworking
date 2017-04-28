<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.master" CodeFile="Login1.aspx.cs" Inherits="index" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
<%--<%@ OutputCache Duration="3600" VaryByParam="none" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    

    <link href="css/faary.css" rel="stylesheet" type="text/css" />
    <link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
<!--
    
-->
</script>

    <title>Social Book</title>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div id="main-wapper">
  <div id="header">
    <div class="logo" 
          
          style="color:White;font-size:xx-large; font-family: 'Californian FB'; font-weight: normal;">Friends' Corner</div>
    <div class="top-form">

   
    <table width="379" border="0" cellspacing="2" cellpadding="3">
  <tr>
    <td align="left" valign="middle"><asp:Label ID="Lblemail" runat="server" Text="Email:     " 
            meta:resourcekey="LblemailResource1"></asp:Label></td>
    <td align="left" valign="middle"><asp:Label ID="Lblpwd" runat="server" Text="Password:      " 
            meta:resourcekey="LblpwdResource1"></asp:Label></td>
    <td align="left" valign="middle">&nbsp;</td>
  </tr>
  <tr>
    <td align="left" valign="middle"><asp:TextBox ID="TextBoxUserName" 
            class="html7magic" runat="server" EnableViewState="False" 
            meta:resourcekey="TextBoxUserNameResource1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBoxUserName" ErrorMessage="*" 
            ValidationGroup="login" meta:resourcekey="RequiredFieldValidator5Resource1"></asp:RequiredFieldValidator>
      </td>
    <td align="left" valign="middle"><asp:TextBox ID="TextBoxPassword" 
            TextMode="Password"  class="html7magic" runat="server" 
            EnableViewState="False" meta:resourcekey="TextBoxPasswordResource1"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="TextBoxPassword" ErrorMessage="*" 
            ValidationGroup="login" meta:resourcekey="RequiredFieldValidator6Resource1"></asp:RequiredFieldValidator>
      </td>
    <td align="left" valign="middle"><a href="#"><asp:ImageButton ID="BtnLogin"  
            onclick="BtnLogin_Click" ImageUrl="images/log-in-button.jpg" runat="server" 
            width="49px" height="22px" ValidationGroup="login" 
            meta:resourcekey="BtnLoginResource1" /> </a></td>
    <asp:Label ID="LabelInvalidusermsg" runat="server" ForeColor="Red" 
                Text="Invalid User Name or Password" Visible="False" 
          meta:resourcekey="LabelInvalidusermsgResource1"></asp:Label>
  </tr>
  
<tr>
    <td align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="13%"><input type="checkbox" name="checkbox" id="checkbox" /></td>
    <td width="87%" align="left" valign="middle"><asp:Label ID="Lblkeep" runat="server" Text="Keep me logged in:      " 
            meta:resourcekey="LblkeepResource1"></asp:Label></td>
  </tr>
</table>
</td>
    <td align="left" valign="middle">
        <asp:LinkButton ID="LinkButton1" runat="server" ForeColor="White" 
            PostBackUrl="~/ForgotPassword.aspx" 
            meta:resourcekey="LinkButton1Resource1">Forgot your password ?</asp:LinkButton>
    </td>
    <td align="left" valign="middle">&nbsp;</td>
  </tr>
</table>



    </div>
  </div>


  

  <div id="body-panal">
  <div id="right-panal">
  <h2>Expanding Your Empire of Friends Through 
Social Networking Sites</h2>
<img src="images/social-imag.jpg" width="309" height="307" /></div>
<div id="left-panal">

                    <h2><asp:Label ID="Lblsignup" runat="server" Text="Sign Up      " 
            meta:resourcekey="LblsignupResource1"></asp:Label></h2>
                    <p><asp:Label ID="Lblfree" runat="server" Text="It's free and always will be.     " 
            meta:resourcekey="LblfreeResource1"></asp:Label></p>
<div class="iform">

  <table width="100%"  border="1" cellspacing="2" cellpadding="3" style="margin-top:-55px">
  
      <%--<label for="firstnametxt">Your Name:</label>--%>
      <tr>
     <td> <asp:Label ID="Lblfirstname" runat="server" Text="Your Name :      " 
            meta:resourcekey="LblfirstnameResource1"></asp:Label></td>
    <td> <asp:TextBox ID="firstnametxt" CssClass="itext" runat="server" 
            meta:resourcekey="firstnametxtResource1" ></asp:TextBox> </td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="firstnametxt" ErrorMessage="*" ValidationGroup="regs" 
            meta:resourcekey="RequiredFieldValidator1Resource1"></asp:RequiredFieldValidator>
      </tr>
    
     <%-- <label for="lastNametxtlbl" runat="server">Last Name:</label>--%>
    <tr>
     <td><asp:Label ID="Lbllastname" runat="server" Text="Last Name :      " 
            meta:resourcekey="LbllastnameResource1"></asp:Label></td>
     <td> <asp:TextBox ID="lastNametxt" CssClass="itext" runat="server" 
            meta:resourcekey="lastNametxtResource1" ></asp:TextBox></td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="lastNametxt" ErrorMessage="*" ValidationGroup="regs" 
            meta:resourcekey="RequiredFieldValidator2Resource1"></asp:RequiredFieldValidator>
     </tr>
    
      <%--<label for="YourEmail">Your Email:</label>--%>
      <tr>
     <td> <asp:Label ID="Lblyouremail" runat="server" Text="Your Email :      " 
            meta:resourcekey="LblyouremailResource1"></asp:Label></td>
      <td><asp:TextBox ID="emailtxt" CssClass="itext"   runat="server" 
            meta:resourcekey="emailtxtResource1" ></asp:TextBox></td>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ControlToValidate="emailtxt" ErrorMessage="*" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ValidationGroup="regs" 
            meta:resourcekey="RegularExpressionValidator1Resource1"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="emailtxt" ErrorMessage="*" ValidationGroup="regs" 
            meta:resourcekey="RequiredFieldValidator3Resource1"></asp:RequiredFieldValidator>
      </tr>

      <%--<label for="Re-enterEmail">Re-enter Email:</label>--%>
      <tr>
    <td> <asp:Label ID="Lblreenteremail" runat="server" Text="Re-enter Email :      " 
            meta:resourcekey="LblreenteremailResource1"></asp:Label></td> 
    <td>  <asp:TextBox ID="emailreentertxt" CssClass="itext"  runat="server" 
            meta:resourcekey="emailreentertxtResource1" ></asp:TextBox></td> 
        <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ControlToCompare="emailtxt" ControlToValidate="emailreentertxt" 
            ErrorMessage="*" ValidationGroup="regs" 
            meta:resourcekey="CompareValidator1Resource1"></asp:CompareValidator>
      </tr>
   
    <tr>
      <%--<label for="NewPassword">New Password:</label>--%>
    <td>  <asp:Label ID="Lblpassword" runat="server" Text="Password:      " 
            meta:resourcekey="LblpasswordResource1"></asp:Label></td>
    <td>  <asp:TextBox ID="passwordtxt" CssClass="itext" TextMode="Password"  
            runat="server" meta:resourcekey="passwordtxtResource1" ></asp:TextBox></td>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
            ControlToValidate="passwordtxt" ErrorMessage="*" ValidationGroup="regs" 
            meta:resourcekey="RequiredFieldValidator4Resource1"></asp:RequiredFieldValidator>
      </tr>      
            
    
      <%--<label for="Iam">I am:</label>--%>
      <tr>
     <td> <asp:Label ID="Lbliam" runat="server" Text="I am:     " 
            meta:resourcekey="LbliamResource1"></asp:Label></td>
     <td> <asp:DropDownList ID="ddlgender" CssClass="iselect"  
            style="width:102px; height:20px; height: 30px;"  runat="server" 
            meta:resourcekey="ddlgenderResource1">
        <asp:ListItem Value=" " meta:resourcekey="ListItemResource1">Select Sex:</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource2">Female</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource3">Male</asp:ListItem>
        </asp:DropDownList></td> 
      </tr>
      
      <tr>
         <td><asp:Label ID="Lblsecques" runat="server" Text="Security Question:     " 
            meta:resourcekey="LblsecquesResource1"></asp:Label></td>
        <td> 
            <asp:DropDownList ID="ddlsecquest" CssClass="iselect"  
            style="width:200px; height:20px; height: 30px;"  runat="server" 
            meta:resourcekey="ddlsecquestResource1" Width="200px">
        <asp:ListItem Value=" " meta:resourcekey="ListItemResource19">Select Question:</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource20">What is yours first pet name</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource21">Whats your childhood name</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource22">Whats your mother tongue</asp:ListItem>
        <asp:ListItem meta:resourcekey="ListItemResource23">Whats your best friend name</asp:ListItem>
        </asp:DropDownList></td>  
      </tr>
      
      <tr>
      <td> <asp:Label ID="Lblsecans" runat="server" Text="Security Answer:      " 
            meta:resourcekey="LblsecansResource1"></asp:Label>
      </td>
      <td><asp:TextBox ID="securityanstxt" CssClass="itext" runat="server" 
            meta:resourcekey="securityanstxtResource1" ></asp:TextBox>
      </td>
      </tr>
    
      <%--<label for="Birthday">Birthday:</label>--%>
      <tr>
     <td> <asp:Label ID="Lblbirthday" runat="server" Text="Birthday:     " 
            meta:resourcekey="LblbirthdayResource1"></asp:Label></td>
     <td>  <asp:DropDownList ID="ddlMonth" runat="server" CssClass="iselect" 
            style="width:81px; height: 30px;" meta:resourcekey="ddlMonthResource1">
        <asp:ListItem Selected="True" meta:resourcekey="ListItemResource4">Month:</asp:ListItem>
        <asp:ListItem Value="1" meta:resourcekey="ListItemResource5">Jan</asp:ListItem>
        <asp:ListItem Value="2" meta:resourcekey="ListItemResource6">Feb</asp:ListItem>
        <asp:ListItem Value="3" meta:resourcekey="ListItemResource7">Mar</asp:ListItem>
        <asp:ListItem Value="4" meta:resourcekey="ListItemResource8">Apr</asp:ListItem>
        <asp:ListItem Value="5" meta:resourcekey="ListItemResource9">May</asp:ListItem>
        <asp:ListItem Value="6" meta:resourcekey="ListItemResource10">Jun</asp:ListItem>
        <asp:ListItem Value="7" meta:resourcekey="ListItemResource11">Jul</asp:ListItem>
        <asp:ListItem Value="8" meta:resourcekey="ListItemResource12">Aug</asp:ListItem>
        <asp:ListItem Value="9" meta:resourcekey="ListItemResource13">Sep</asp:ListItem>
        <asp:ListItem Value="10" meta:resourcekey="ListItemResource14">Oct</asp:ListItem>
        <asp:ListItem Value="11" meta:resourcekey="ListItemResource15">Nov</asp:ListItem>
        <asp:ListItem Value="12" meta:resourcekey="ListItemResource16">Dec</asp:ListItem>
        </asp:DropDownList>
     
        <asp:DropDownList ID="ddlday" runat="server"  CssClass="iselect" 
            autocomplete="off"  style="width:81px; height: 30px;" 
            meta:resourcekey="ddldayResource1">
            <asp:ListItem meta:resourcekey="ListItemResource17">Day:</asp:ListItem>
            
            </asp:DropDownList>
     
      
     <asp:DropDownList ID="ddlyear" runat="server"  autocomplete="off" 
            CssClass="iselect" style="width:81px; height: 30px;" 
            meta:resourcekey="ddlyearResource1">
            <asp:ListItem Selected="True" meta:resourcekey="ListItemResource18">Year:</asp:ListItem>
          
            </asp:DropDownList>
            </td>
    </tr>
    
    <tr>
   <td> <asp:Button ID="btnsignup1"   CssClass="ibutton" 
               Text="Signup"   runat="server" 
            onclick="btnsignup_Click" Width="81px" ValidationGroup="regs" 
            meta:resourcekey="btnsignup1Resource1"   /></td>
     </tr>

  </table>
</div>


<div runat="server">



</div>







<div align="center">
            </div>

<p class="bottom-b"><a href="#">Create a Page</a> for a celebrity, band or business.</p>
</div>
  </div>
  <div id="footer">
  <div id="top-footer">
  <ul><li><asp:LinkButton ID="LnkEnglish" runat="server" onclick="LnkEnglish_Click" 
          meta:resourcekey="LnkEnglishResource1">English 
      (US)</asp:LinkButton></li>
  <li><a href="#">Español</a></li>
  <li><a href="#">Português (Brasil)</a></li>
  <li><a href="#">Français (France)</a></li>
  <li><a href="#">Deutsch</a></li>
  <li><a href="#">Italiano</a></li>
  <li><a href="#">العربية</a></li>
  <li><asp:LinkButton ID="LnkHindi" runat="server" onclick="LnkHindi_Click" 
          meta:resourcekey="LnkHindiResource1">हिन्दी</asp:LinkButton></li>
  <li><a href="#">»</a></li>
  
  </ul>
  </div>
  
 <div id="copy-right-footer">
  <ul><li style="color:gray">Friends Corner © 2013</li>
  <li><a href="#">English (US)</a></li>
  
  </ul>
  </div> 
 <div id="bottom-footer">
  <ul><li><a href="#">Mobile</a>.</li>
  <li><a href="#">Find Friends</a>.</li>
  <li><a href="#">Badges</a>.</li>
  <li><a href="#">People</a>.</li>
  <li><a href="#">Pages</a>.</li>
  <li><a href="#">About</a>.</li>
  <li><a href="#">Advertising</a>.</li>
  <li><a href="#">Create a Page</a>.</li>
  <li><a href="#">Developers</a>.</li>
  
    <li><a href="#">Careers</a>.</li>
  <li><a href="#">Terms</a>.</li>
  <li><a href="#">Privacy</a>.</li>
  <li><a href="#">Help</a>.</li>
  
  </ul>
  </div> 
  </div>
  
</div>


</asp:Content>
