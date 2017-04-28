<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/login.master" CodeFile="View.aspx.cs" Inherits="index" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
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

   
    <table width="292" border="0" cellspacing="2" cellpadding="3" align="right" >
  
  
<tr>
    <td align="right" valign="middle">
        <asp:Button ID="BtnLogout" runat="server" Text="Log Out"  CssClass="ibutton" 
            BackColor="#6E9E28" BorderStyle="Outset" BorderWidth="3px" 
            ForeColor="White" Width="90px" Height="40px" onclick="BtnLogout_Click" /></td>
    
  </tr>
</table>
 


    </div>
  </div>


  

  <div id="body-panal">
  <div style="width: 99%; height: 200px; color: #6D9334;">
  <table width="99%" cellpadding="3" cellspacing ="2" align="center">
  <tr>
  <td align="center">
      <asp:Label ID="Label1" runat="server" Text="View Details" Font-Size="X-Large" ></asp:Label></td>
  </tr>
  <tr>
  <td>
      <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
          AutoGenerateSelectButton="True" CellPadding="4" Font-Bold="False" 
          Font-Size="Medium" ForeColor="#333333" GridLines="None" Width="100%" 
          ondatabinding="GridView1_DataBinding" onrowcreated="GridView1_RowCreated" 
          onrowdatabound="GridView1_RowDataBound">
          <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
          <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
          <SelectedRowStyle BackColor="#E2DED6" BorderColor="#6E9E28" BorderStyle="Solid" 
              BorderWidth="1px" Font-Bold="True" ForeColor="#333333" />
          <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#999999" />
          <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
      </asp:GridView>
  </td>
  </tr>
  </table>
  
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
