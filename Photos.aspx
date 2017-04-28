<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Photos.aspx.cs" Inherits="photos" Title="Photos" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<%--<%@ OutputCache VaryByParam="id" Duration="3600" SqlDependency="ASPNETDB:Photos" %>--%>

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
  <div style="width: 660px; height: 100%; color: #6D9334;">
        <br />
        <br />
        <br />
            <table>
            <tr><td>
                <asp:Label ID="Label2" runat="server" Text="Upload Photos"></asp:Label></td><td>
                <asp:FileUpload ID="FileUpload1" runat="server" CssClass="textstyle" /></td> <td>
                    &nbsp;</td></tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Write something about this photo"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="textstyle" 
                            TextMode="MultiLine" Height="38px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="Button11" runat="server" onclick="Button11_Click" 
                            Text="Upload" CssClass="textstyle" Width="100px" />
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
                GroupItemCount="4" DataKeyNames="ID" 
            onitemcommand="ListView1_ItemCommand">
                    <ItemTemplate>
                        <td runat="server" style="background-color:#DCDCDC;color: #000000;">
                          <a href='<%# "ShowPhoto.aspx?em=" + Eval("EmailId") + "&id=" + Eval("ID") %>' target="_blank">
                            <asp:Image  ToolTip='<%# Eval("Name") %>' ID="Image1" 
                            ImageUrl='<%# "ShowPhoto.aspx?em=" + Eval("EmailId") + "&id=" + Eval("ID") %>' 
                             runat="server" Width="100" Height="100" BorderStyle="Solid" 
                             BorderWidth="2" BorderColor="#9966FF" />
                          </a><br />
                            <cc1:HoverMenuExtender ID="HoverMenuExtender1" TargetControlID="Image1" PopupControlID="Btndelphoto"
                             PopupPosition="Bottom"
                             runat="server">
                            </cc1:HoverMenuExtender>
                            <asp:Button ID="Btndelphoto" CommandArgument='<%# Eval("ID") %>' 
                            runat="server" width="100px" CssClass="textstyle" Text="Delete " />
                        </td>
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
                    
                    SelectCommand="SELECT [Photo], [Name], [EmailId], [ID] FROM [Photos] WHERE (([EmailId] = @EmailId))">
                    <SelectParameters>
                        <asp:SessionParameter Name="EmailId" SessionField="email" Type="String" />
                       </SelectParameters>
                </asp:SqlDataSource>
            <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <uc1:footer ID="footer1" runat="server" />
        <br />
            <br />
            <br />
            </div>
        </center>
   
</asp:Content>

