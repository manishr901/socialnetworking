<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Photos1.aspx.cs" Inherits="Photos1" Title="Friend Photos" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>
<%--<%@ OutputCache VaryByParam="id" Duration="3600" SqlDependency="ASPNETDB:Photos" %>--%>
<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        text-align: left;
    }
</style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
    <div style="width: 660px; height: 100%; color: #6D9334;">
        
        <br />
            <br />
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" 
                GroupItemCount="4" DataKeyNames="ID">
                    <ItemTemplate>
                        <td id="Td1" runat="server" style="background-color:#DCDCDC;color: #000000;">
                          <a href='<%# "ShowPhoto.aspx?em=" + Eval("EmailId") + "&id=" + Eval("ID") %>' target="_blank">
                            <asp:Image  ToolTip='<%# Eval("Name") %>' ID="Image1" ImageUrl='<%# "ShowPhoto.aspx?em=" + Eval("EmailId") + "&id=" + Eval("ID") %>'  runat="server" Width="100" Height="100" BorderStyle="Solid" BorderWidth="2" BorderColor="#9966FF" />
                          </a>
                        </td>
                    </ItemTemplate>
                    <LayoutTemplate>
                        <table id="Table1" runat="server">
                            <tr id="Tr1" runat="server">
                                <td id="Td2" runat="server">
                                    <table ID="groupPlaceholderContainer" runat="server" border="1" 
                                        style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                        <tr ID="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr id="Tr2" runat="server">
                                <td id="Td3" runat="server" 
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
        <uc1:footer ID="footer1" runat="server" />
            <br />
            <br />
            </div>
        </center>
   
</asp:Content>
