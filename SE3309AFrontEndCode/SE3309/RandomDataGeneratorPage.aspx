<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="RandomDataGeneratorPage.aspx.vb" Inherits="SE3309.RandomDataGeneratorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button runat="server" ID="btnGenerateData" Text="GenerateData" />
    <br />
        <asp:GridView runat="server" ID="gvQuarterbacks">
        </asp:GridView>
        <asp:GridView runat="server" ID="gvRunningBacks">
        </asp:GridView>
    </div>
    </form>
</body>
</html>
