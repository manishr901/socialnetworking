<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="deletefriends.aspx.cs" Inherits="_Default" Title="Manage Friends" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


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
</style>   
        
   </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      
      <center>
      <div style="width: 740px; height: 290px; color: #6D9334;">
      <br />
      <br />
      <br />
      <br />
      <table>
      <tr>
      <td>
      <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
                                     onitemcommand="ListView1_ItemCommand">
                                     <ItemTemplate>
                                         <table>
                                             <tr>
                                                 <td>
                                                     <asp:Image ID="Image2" runat="server" BorderColor="Pink" BorderWidth="2" 
                                                         Height="40" ImageUrl='<%# Eval("FromFriendPhoto") %>' Width="40" />
                                                 </td>
                                                 <td>
                                                     <asp:LinkButton ID="LinkButton1" runat="server"  CommandName="1"
                                                         CommandArgument='<%# Eval(" FromFriendEmailId") %>'>
                                                     <%# Eval("FromFriendName") %>
                                                     </asp:LinkButton>
                                                 </td>
                                                 <td>
                                                     <asp:Button ID="Btnunfriend" runat="server"  Width="100"  CommandName="2"
                                                     CommandArgument='<%# Eval(" FromFriendEmailId") %>'
                                                      CssClass="textstyle" Text="Unfriend" />
                                                      <cc1:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="Btnunfriend" ConfirmText="Are you sure ??">
                                                       </cc1:ConfirmButtonExtender>
                                                 </td>
                                             </tr>
                                         </table>
                                     </ItemTemplate>
                                     <LayoutTemplate>
                                         <table>
                                             <tr ID="itemplaceholder" runat="server">
                                             </tr>
                                         </table>
                                     </LayoutTemplate>
          
                                 </asp:ListView>
    </td>
    </tr>
        </table> 
       <br />
       <br /><br />
          <br />
        <br />
          <uc1:footer ID="footer1" runat="server" />
          <br />
        <br />
        </div>
        </center>
    
</asp:Content>

