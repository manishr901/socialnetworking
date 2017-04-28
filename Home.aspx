<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Default2" Title="Home" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
       <center>
            <br />
            <table style="height: 103px; width: 500px">
                <tr>
                    <td align="left">
                        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" 
                            Font-Underline="True" Text="Status :"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="66px" TextMode="MultiLine" 
                            Width="503px" CssClass="textstyle"></asp:TextBox>
                        <cc1:TextBoxWatermarkExtender ID="TextBox1_TextBoxWatermarkExtender" 
                            runat="server" Enabled="True" TargetControlID="TextBox1" 
                            WatermarkText="What is in your mind ?">
                        </cc1:TextBoxWatermarkExtender>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style5">
                        <asp:Button ID="Button1" runat="server" Font-Size="Small" Text="Update" 
                            onclick="Button1_Click" Font-Bold="True" CssClass="textstyle" />
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                SelectCommand="SELECT [ShareMessage], [PostedTime], [PostedBy], [Photo] FROM [Share_Table] order by [ID] desc">
            </asp:SqlDataSource>
            <br />
            <asp:ListView ID="ListView3" runat="server" 
                onitemdatabound="ListView3_ItemDataBound" 
                ondatabinding="ListView3_DataBinding">
            <ItemTemplate>
               <table>
                <tr>
                    <td>
                        <asp:Image Height="40" Width="40" BorderColor="Pink" BorderWidth="2" ID="Image1" runat="server" />
                    </td>
                    <td>
                        <asp:Label ID="LblMessage" runat="server" Text="Label"></asp:Label>
                    </td>
                    </tr>
                    <tr>
                    <td>
                    </td>
                    <td>
                        <asp:Label ID="LblTime" runat="server" Text="Label"></asp:Label>
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
            
       </center>     
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

