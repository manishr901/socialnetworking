<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Messages.aspx.cs" Inherits="Default3" Title="Messages" %>

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
        <table>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#FF0066" 
                        Text="To :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="584px" 
                        CssClass="textstyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="#FF0066" 
                        Text="Subject :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Height="29px" Width="584px" 
                        CssClass="textstyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label5" runat="server" CssClass="style12" Font-Bold="True" 
                        ForeColor="#FF0066" Text="Body :"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Height="193px" Width="584px" 
                        TextMode="MultiLine" CssClass="textstyle"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td align="right">
                    
                    
                    <asp:Button ID="Button11" runat="server" Font-Bold="True" 
                        Height="33px" onclick="Button11_Click" Text="Send" Width="66px" 
                        CssClass="textstyle" />
                </td>
            </tr>
        </table>
        </div>
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
            <br />
        <br />
        
        
        </center>
        
</asp:Content>

