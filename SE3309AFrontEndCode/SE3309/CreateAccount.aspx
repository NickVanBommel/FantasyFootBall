<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="CreateAccount.aspx.vb" Inherits="SE3309.CreateAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />

    <title>Create Account</title>
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
                <table>
                    <tr>
                        <td colspan="3">
                            <a style="margin-left:48%;" href="LogInPage.aspx">Login</a>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label style="margin-left:50%;">Or....</label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <label>Enter information below to create new account</label>
                        </td>
                    </tr>
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
                            <label>First Name:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtFirstName"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Last Name:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtLastName"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Password:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPass1" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <label>Re-Enter Password:</label>
                        </td>
                        <td style="width: 5px;"></td>
                        <td>
                            <asp:TextBox runat="server" ID="txtPass2" TextMode="Password"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <asp:Button runat="server" ID="btnCreate" Text="Create Account"  OnClick="btnCreate_Click"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </form>
</body>
</html>
