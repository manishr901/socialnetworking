<%@ Page Language="VB" %>
<%@ Import Namespace="System.IO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        
        Dim fs As New FileStream("http://upload.wikimedia.org/wikipedia/en/thumb/4/41/Flag_of_India.svg/225px-Flag_of_India.svg.png", FileMode.Open)
        
        Response.Write(fs.Length)
      
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
        ' Response.Redirect("Wall.aspx?id=ankita")
    End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" 
            style="height: 26px" />
    </div>
    </form>
</body>
</html>
