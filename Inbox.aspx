﻿<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Inbox.aspx.cs" Inherits="_Default" Title="Inbox" %>

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
      <div style="width: 740px; height: 100%; color: #6D9334;">
      <table>
      <tr>
      <td>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" AutoGenerateDeleteButton="True" 
            DataKeyNames="SerialNo" DataSourceID="SqlDataSource1" Height="201px" 
            Width="700px" CellPadding="4" ForeColor="#333333" GridLines="None" 
              onselectedindexchanged="GridView1_SelectedIndexChanged" 
              onselectedindexchanging="GridView1_SelectedIndexChanging" 
              CssClass="textstyle">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="SerialNo" HeaderText="SerialNo" 
                    InsertVisible="False" ReadOnly="True" SortExpression="SerialNo" />
                <asp:BoundField DataField="PostedFrom" HeaderText="From" 
                    SortExpression="PostedFrom" />
                <asp:BoundField DataField="Subject" HeaderText="Subject" 
                    SortExpression="Subject" />
                <asp:BoundField DataField="Body" HeaderText="Message" SortExpression="Body" />
                <asp:BoundField DataField="PostedTime" HeaderText="Time" 
                    SortExpression="PostedTime" />
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        </td>
        </tr>
        <tr>
        <td>
        
        <br />
        <asp:TextBox ID="TextBox2" runat="server" Height="294px" TextMode="MultiLine" 
            Width="694px" CssClass="textstyle" ReadOnly="True"></asp:TextBox>
        <br />
        </td>
        </tr>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            DeleteCommand="DELETE FROM All_Messages WHERE (SerialNo = @SerialNo)" 
            
              SelectCommand="SELECT [PostedFrom], [Subject], [Body], [PostedTime], [SerialNo] FROM [All_Messages] WHERE ([PostedTo] = @PostedTo)" 
              onselecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:SessionParameter Name="PostedTo" SessionField="email" Type="String" />
            </SelectParameters>
            <DeleteParameters>
                <asp:ControlParameter ControlID="GridView1" Name="SerialNo" 
                    PropertyName="SelectedValue" />
            </DeleteParameters>
        </asp:SqlDataSource></table> 
        <br />
        </div><br />
        
          <br />
          <br />
          <br />
          <br />
        
          <uc1:footer ID="footer1" runat="server" />
          <br />
        <br />
        </center>
    
</asp:Content>

