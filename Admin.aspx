<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.master" CodeFile="Admin.aspx.cs" Inherits="index" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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

    <style type="text/css">
        .style1
        {
            width: 81px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div id="main-wapper">
  <div id="header">
    <div class="logo" 
          
          style="color:White;font-size:xx-large; font-family: 'Californian FB'; font-weight: normal;">Friends' Corner</div>
  </div>


  

  <div id="body-panal">
  <div id="right-panal">
  <h2>Expanding Your Empire of Friends Through 
Social Networking Sites</h2>
<img src="images/administrator.gif" width="309" height="307" /></div>
<div id="left-panal">

                    <h2>ADMIN LOGIN</h2>
                    <p>&nbsp;</p>
<div class="iform">
<br /><br /><br /><br />
  <table width="100%"  border="1" cellspacing="2" cellpadding="3" style="margin-top:-55px">
  
      
      <tr>
     <td class="style1"> <asp:Label ID="Lbladminid" runat="server" Text="Admin Id :      " 
            meta:resourcekey="LbladminidResource1"></asp:Label></td>
    <td> 
        <asp:TextBox ID="adminidtxt" CssClass="itext" runat="server" 
            meta:resourcekey="adminidtxtResource1" Height="35px" ></asp:TextBox> 
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="adminidtxt" ErrorMessage="*" ValidationGroup="logadmin"></asp:RequiredFieldValidator>
          </td>
        
      </tr>
    
     
    <tr>
    <td class="style1">  <asp:Label ID="Lblpassword" runat="server" Text="Password:      " 
            meta:resourcekey="LblpasswordResource1"></asp:Label></td>
    <td>  
        <asp:TextBox ID="passwordtxt" CssClass="itext" TextMode="Password"  
            runat="server" meta:resourcekey="passwordtxtResource1" Height="33px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="passwordtxt" ErrorMessage="*" ValidationGroup="logadmin"></asp:RequiredFieldValidator>
        </td>
        
      </tr>   
   <tr>
   <td align="center" class="style1"> 
       <asp:ImageButton ID="BtnLogin"  
             ImageUrl="images/log-in-button.jpg" runat="server" 
            width="55px" height="22px" ValidationGroup="logadmin" 
            meta:resourcekey="BtnLoginResource1" onclick="BtnLogin_Click" /></td>
     </tr>

  </table>
</div>
<div align="center">
            </div>

</div>
  </div>
  <div id="footer">
  <div id="top-footer">
  <ul><li><asp:LinkButton ID="LnkEnglish" runat="server"  
          meta:resourcekey="LnkEnglishResource1">English 
      (US)</asp:LinkButton></li>
  <li><a href="#">Español</a></li>
  <li><a href="#">Português (Brasil)</a></li>
  <li><a href="#">Français (France)</a></li>
  <li><a href="#">Deutsch</a></li>
  <li><a href="#">Italiano</a></li>
  <li><a href="#">العربية</a></li>
  <li><asp:LinkButton ID="LnkHindi" runat="server"  
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
