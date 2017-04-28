<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Notifications.aspx.cs" Inherits="_Default" Title="Notifications" %>

<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
      
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Panel4" runat="server" Height="1603px">
        <center>
        <br />
        <br />
        <br />
        <br />
            <asp:ListView ID="ListView3" runat="server" 
                onitemdatabound="ListView3_ItemDataBound">
                <ItemTemplate>
                  <table width="489">
                   <tr>
                        <td rowspan="3">
                         <asp:Image ID="Image1" runat="server" BorderColor="#CC33FF" BorderWidth="2" Height="50" BorderStyle="Solid"/>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="MessageLabel" runat="server" ForeColor="BlueViolet"  />
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="UpdateTimeLabel" runat="server"  ForeColor="BlueViolet"/>
                        </td>
                    </tr>
                  </table>
                </ItemTemplate>
                     <LayoutTemplate>
                         <table id="Table1"  runat="server">
                <tr>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                        <td>
                            
                        </td>
                    </tr>
                    <tr id="itemplaceholder" runat="server">
                       
                    </tr>
                    </table>
                     </LayoutTemplate>
        </asp:ListView>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT [UserName], [UserPhoto], [Message], [UpdateTime] FROM [All_Notifications]">
            
        </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <uc1:footer ID="footer1" runat="server" />
            <br />
        </center>
    </asp:Panel>
</asp:Content>

