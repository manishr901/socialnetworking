<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FriendRequests.aspx.cs" Inherits="FriendRequests" Title="Friend Requests" %>

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
    <div>
        <asp:ListView ID="ListView1" runat="server" 
            onitemdatabound="ListView1_ItemDataBound" DataSourceID="SqlDataSource1" 
            GroupItemCount="3" onitemcommand="ListView1_ItemCommand" 
            onselectedindexchanged="ListView1_SelectedIndexChanged">
             <ItemTemplate>
                <table>
                <tr>
                        <td>
                            <asp:Image ID="Image1" Height="50px" Width="50px" BorderWidth="3px" BorderStyle="Solid" BorderColor="#709638" ImageUrl='<%# "DisplayImage.aspx?em=" + Eval("FromEmailId") %>' runat="server" />    
                        </td>
                        <td>
                            <asp:Label ID="LblName" runat="server" Text='<%# Eval("RequestMessage") %>'></asp:Label>
                        </td>
                        <td>
                            <asp:Button ID="BtnAccept" CssClass="textstyle" Width="100px" runat="server" CommandArgument='<%# Eval("FromEmailId") %>' Text="Accept" />
                        </td>
                        <td>
                            <asp:Button ID="BtnIgnore" CssClass="textstyle" runat="server" Width="100px" Text="Ignore" />
                        </td>
                    </tr>
                 </table>
            </ItemTemplate>
                  <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" 
                                style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                 <GroupTemplate>
                    <tr ID="itemPlaceholderContainer" runat="server">
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>
               </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [FromEmailId], [RequestMessage],[ToFriendName] FROM [Friend_Requests] WHERE ([ToFriendEmailId] = @ToFriendEmailId)">
                <SelectParameters>
                    <asp:SessionParameter Name="ToFriendEmailId" SessionField="email" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
        <br />
            <br />
            <uc1:footer ID="footer1" runat="server" />
            <br />
     </div>
    </center>
    
</asp:Content>

