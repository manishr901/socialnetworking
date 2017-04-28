<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FindFriends.aspx.cs" Inherits="_Default" Title="Search Friends" %>

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
    <asp:Panel ID="Panel2" runat="server" Height="1453px" CssClass="style2">
    <center>
    <br />
    <asp:Label ID="Label2" runat="server" Text="Search Friends"></asp:Label>
    &nbsp;
    <asp:TextBox ID="TextBox2" runat="server" Height="25px" Width="457px" 
            CssClass="textstyle"></asp:TextBox>
    &nbsp;&nbsp;
    <asp:Button ID="Button11" runat="server" Text="Search" onclick="Button11_Click" 
            CssClass="textstyle" Width="100px" />
    <br /><br />
        <asp:ListView ID="ListView1" runat="server" 
            ondatabinding="ListView1_DataBinding" 
            onitemdatabound="ListView1_ItemDataBound" 
            onitemcommand="ListView1_ItemCommand" 
            onselectedindexchanged="ListView1_SelectedIndexChanged">
            <ItemTemplate>
               <table>
                <tr>
                    <td>
                        <asp:Image Height="40" Width="40" BorderColor="#709638" BorderWidth="2" ID="Image1" runat="server" />
                    </td>
                    <td>
                        <asp:LinkButton ID="LblName" CssClass="textstyle" CommandName="LblName" runat="server" Text="Label"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:Label ID="LblAddress" runat="server" Text="Label"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="BtnRequest" CssClass="textstyle" Width="100" runat="server" Text="Add As Friend" />
                    </td>
                </tr>
                </table>
            </ItemTemplate>
            <LayoutTemplate>
                <table  runat="server">
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
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
        <uc1:footer ID="footer1" runat="server" />
        <br />
        
   </center>
</asp:Panel>
</asp:Content>

