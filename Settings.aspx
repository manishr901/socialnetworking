<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Settings.aspx.cs" Inherits="Default2" Title="Settings" %>

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
        <br />
        <br />
        <br />
        <br />
        <br />
    <br />
    <br />
    <div style="width: 740px; height: 200px; color: #6D9334;">
       
                            <table border="0" cellpadding="1" cellspacing="0">
                                <tr>
                                    <td>
                                        <table border="0" cellpadding="0">
                                            <tr>
                                                <td align="center" colspan="2">
                                                    Change Your Password</td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="CurrentPasswordLabel" runat="server">Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="CurrentPassword" runat="server" CssClass="textstyle" 
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" 
                                                        ControlToValidate="CurrentPassword" ErrorMessage="Password is required." 
                                                        ToolTip="Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="NewPasswordLabel" runat="server">New Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="NewPassword" runat="server" CssClass="textstyle" 
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" 
                                                        ControlToValidate="NewPassword" ErrorMessage="New Password is required." 
                                                        ToolTip="New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="ConfirmNewPasswordLabel" runat="server" >Confirm New Password:</asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="textstyle" 
                                                        TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" 
                                                        ControlToValidate="ConfirmNewPassword" 
                                                        ErrorMessage="Confirm New Password is required." 
                                                        ToolTip="Confirm New Password is required." ValidationGroup="ChangePassword1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2">
                                                    <asp:CompareValidator ID="NewPasswordCompare" runat="server" 
                                                        ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword" 
                                                        Display="Dynamic" 
                                                        ErrorMessage="The Confirm New Password must match the New Password entry." 
                                                        ValidationGroup="ChangePassword1"></asp:CompareValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color:Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">
                                                    <asp:Button ID="ChangePasswordPushButton" runat="server" 
                                                        CommandName="ChangePassword" CssClass="textstyle" Text="Change Password" 
                                                        ValidationGroup="ChangePassword1" 
                                                        onclick="ChangePasswordPushButton_Click" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" 
                                                        CommandName="Cancel" CssClass="textstyle" Text="Cancel" />
                                                </td>
                                            </tr>
                                        </table>
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
    </div>
    </center>
</asp:Content>

