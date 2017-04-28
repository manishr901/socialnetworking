<%@ Page Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Profile1.aspx.cs" Inherits="Profile1" Title="Friend Profile" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

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

        
        .style2
        {
            width: 216px;
            font-size:medium;
            text-align:left;
        }
     
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <center>
    <br />
    <div style="width: 740px; height: 290px; color: #6D9334;">
    <center>
            <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Overline="False" 
                Font-Size="Large" Font-Underline="False" 
                Text="PROFILE INFORMATION"></asp:Label>
       <div>         
    <table>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label20" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Basic Information"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td  align="center" class="style2">
                        <asp:Label ID="Label2" runat="server" Text="Name :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblname" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label3" runat="server" Text="Email Id :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblemail" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label4" runat="server" Text="Age :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblage" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label5" runat="server" Text="Religion :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblrelgn" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label6" runat="server" Text="Nationality :"></asp:Label>
                    </td>
                    <td  align="left">
                        <asp:Label ID="lblnation" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label7" runat="server" Text="Gender :"></asp:Label>
                    </td>
                    <td  align="left">
                        <asp:Label ID="lblgender" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label8" runat="server" Text="Date of birth :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lbldob" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label9" runat="server" Text="Address :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lbladdress" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label19" runat="server" Text="City :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblcity" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2" >
                        <asp:Label ID="Label10" runat="server" Text="Mobile no :"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblmobile" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label21" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Education and Work"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label13" runat="server" Text="School :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:Label ID="lblschool" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label14" runat="server" Text="College :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                       <asp:Label ID="lblcollege" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Activities and Interests"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label15" runat="server" Text="Hobbies :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:Label ID="lblhobbies" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label16" runat="server" Text="Activities :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:Label ID="lblactivity" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label23" runat="server" Font-Bold="True" Font-Size="Large" 
                            Text="Arts and Entertainment"></asp:Label>
                    </td>
                    <td class="style6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label17" runat="server" Text="Movies :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:Label ID="lblmovies" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <asp:Label ID="Label18" runat="server" Text="Music :"></asp:Label>
                    </td>
                    <td class="style6" align="left">
                        <asp:Label ID="lblmusic" runat="server" ></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style2">
                        <br />
                        
                    </td>
                    <td class="style6">
                        <br />
                    </td>
                </tr>
            </table>
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
           
           </div> 
    </center>
    </div>
    
    </center>
    </asp:Content>

