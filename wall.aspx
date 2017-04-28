<%@ Page Language="C#" Title="User Wall" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="wall.aspx.cs" Inherits="wall"%>

<%--<%@ OutputCache VaryByParam="id" Duration="3600" SqlDependency="ASPNETDB:Post" %>--%>

<%@ Register src="footer.ascx" tagname="footer" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   <script type="text/javascript">
    
   </script>
    <style type="text/css">
        .style8
        {
            width: 567px;
            height: 100%;
         
        }
        .style9
        {
            width: 100%;
        }
        .style10
        {
            height: 92px;
        }
        .style11
        {
            height: 91px;
        }
        
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
    <div class="style8">
      
        <table class="style9">
            <tr>
                <td>
                    <br />
                    <asp:Button ID="Button15" runat="server" onclick="Button15_Click" 
                        Text="Add Text" Font-Bold="True" CssClass="textstyle" Width="100px" />
                </td>
                <td>
                    <br />
                    <asp:Button ID="Button16" runat="server" onclick="Button16_Click" 
                        Text="Add Photo" Font-Bold="True" CssClass="textstyle" Width="100px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:MultiView ID="MultiView1" runat="server">
                        <asp:View ID="View1" runat="server">
                            
                                     <div class="style11" style="border-style: solid; border-width: 2px">
                                         <br />
                                        <asp:TextBox ID="txtmessage" runat="server" Height="52px" Width="417px" 
                                             CssClass="textstyle"></asp:TextBox>
                                        <asp:Button ID="btnshare" runat="server" Height="27px" Text="share" 
                                            Width="58px" onclick="btnshare_Click" Font-Bold="True" 
                                             CssClass="textstyle" />
                                    </div>
                                
                          
                           

                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <div class="style10" style="border-style: solid; border-width: 2px">
                             <table>
                                <tr>
                                <td align="left">Choose Photo</td><td align="left"><asp:FileUpload ID="FileUpload1" runat="server" CssClass="textstyle" />
                                </td>
                                </tr>
                                <tr>
                                <td align="left">Say something about this image</td><td align="left">
                                    <asp:TextBox ID="txtsay" runat="server" 
                                    Width="261px" CssClass="textstyle"></asp:TextBox>
                               </td>
                                </tr>
                                <tr>
                                <td colspan="2">
                                 <asp:Button ID="btnupload" runat="server" Text="upload" 
                                    onclick="btnupload_Click" Font-Bold="True" CssClass="textstyle" 
                                        Width="100px" />
                                </td>
                                </tr>
                             </table>
                               
                                
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
        <asp:ListView ID="ListView1" runat="server" 
            onitemdatabound="ListView1_ItemDataBound" 
            onitemcommand="ListView1_ItemCommand">
            <ItemTemplate>
            <table width="100%" style="border-style: solid; border-width: 1px">
                <tr>
                    <td>
                        <asp:Image ID="Image1" Width="50px" Height="50px" runat="server" />
                    </td>
                    <td align="left" style="background-color:#4C7613">
                        <asp:Label ID="postedByLabel" runat="server"  />
                        shared  : <br />
                        <asp:Label ID="MessageLabel" runat="server" />
                       
                         
                    </td>
                    <td align="right">   <asp:ImageButton ID="Btndelpost" CommandName="DelButton" 
                     runat="server" width="25px" Height="25" ImageUrl="~/images/delimg.bmp" /></td>
                    
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2">
                    <asp:Image ID="Image2" Width="400" Height="300" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td align="left" style="color:Black">at :
                     <asp:Label ID="TimeLabel" runat="server"  Width="80" /></td>
                </tr>
                <tr>
                <td></td>
                <td>
                    <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>--%>
                            <asp:ListView ID="ListView2" runat="server"
                              >
                              <ItemTemplate>
                                <table style="width:80%; background-color: #4C7613;">
                                    <tr>
                                        <td align="left">
                                            <asp:Image Width="40" Height="40" ID="Image3" runat="server" />
                                        </td>
                                        <td align="left">
                                            <asp:Label ID="CommentLabel" runat="server" Text='<%# Eval("Comment") %>'  /><br />
                                            At :  <asp:Label ID="TimeLabel" runat="server" Text='<%# Eval("Time") %>' />
                                        </td>
                                        <td>
                                        <asp:ImageButton ID="Btndelcomm" 
                            runat="server" width="25px" Height="25"  />
                                        </td>
                                    </tr>
                                </table>
                        </ItemTemplate>
                               <LayoutTemplate>
                                <ul ID="itemPlaceholderContainer" runat="server" style="">
                                    <li ID="itemPlaceholder" runat="server" />
                                    </ul>
                                    <div style="">
                                    </div>
                                </LayoutTemplate>
                              <ItemSeparatorTemplate>
                                <br />
                               </ItemSeparatorTemplate>
                 </asp:ListView>  
                   <%-- </ContentTemplate>
                    <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ListView1" EventName="ItemCommand" />
                    <asp:AsyncPostBackTrigger ControlID="ListView2" EventName="ItemCommand" />
                    </Triggers>
                    </asp:UpdatePanel>--%>
                    
              
                </td>
                </tr>
                <tr>
                    <td>
                       
                    </td>
                    <td>
                        <table style="width:80%; background-color: #CCCCCC;">
                            <tr>
                                <td align="left">
                                 <asp:Image ID="Image4" Height="40" Width="40"  runat="server" />
                                </td>
                                <td align="left">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="textstyle"></asp:TextBox>
                                        <asp:Button ID="Button1" CssClass="textstyle" runat="server" Text="comment" Width="65" />
                                  </td>
                            </tr>
                        </table>
                           </td>
                </tr>
            </table>
           </ItemTemplate>
              <LayoutTemplate>
                <ul ID="itemPlaceholderContainer" runat="server" style="">
                    <li ID="itemPlaceholder" runat="server" />
                    </ul>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
                </asp:ListView>
                
                <br />
                <br />
                <br />
                <br />
    <uc1:footer ID="footer1" runat="server" />
    <br />
             
    </div>
    </center>
    
</asp:Content>

