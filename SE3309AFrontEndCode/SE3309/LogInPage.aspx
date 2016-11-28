<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="LogInPage.aspx.vb" Inherits="SE3309.LogInPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="#">M&N Sports</a>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
            <div style="margin-left: 30%; margin-top: 50px;">
                <asp:Label runat="server" ID="lblError" Visible="false" Text="Login Failed!" ForeColor="Red"></asp:Label>
                <table>
                    <tr>
                        <td>
                            <label>Username:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtUserName"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPassword"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <a href="CreateAccount.aspx">Create New Account</a>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
