<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Leagues.aspx.vb" Inherits="SE3309.Leagues" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <title>Leagues</title>
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
                    <div class="navbar-right">
                        <a class="navbar-brand" href="LogInPage.aspx">Logout</a>
                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.container-fluid -->
            </nav>
            <div style="margin-left: 50px; margin-top: 50px;">
                <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
                <br />
                <label>Your Leagues:</label>
                <br />
                <asp:GridView runat="server" ID="gvUserLeagues" AutoGenerateColumns="false">
                    <EmptyDataTemplate>
                        <label>You are not currently in any leagues!! Join a league and let the fun begin!!</label>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField HeaderText="League ID" DataField="LeagueID" />
                        <asp:BoundField HeaderText="League Name" DataField="LeagueName" />
                        <asp:BoundField HeaderText="Number Of Members" DataField="NumberOfUsers" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnEnterLeague" Text="Enter League" CommandArgument='<%#Eval("LeagueID") %>' OnClick="lbtnEnterLeague_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <label>All Leagues:</label>
                <asp:GridView runat="server" ID="gvAllLeagues" AutoGenerateColumns="false">
                    <EmptyDataTemplate>
                        <label>There are currently no existing leagues. Please check back again soon!</label>
                    </EmptyDataTemplate>
                    <Columns>
                        <asp:BoundField HeaderText="League ID" DataField="LeagueID" />
                        <asp:BoundField HeaderText="League Name" DataField="LeagueName" />
                        <asp:BoundField HeaderText="Number of Members" DataField="NumberOfUsers" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnJoinLeague" Text="Join League" CommandArgument='<%#Eval("LeagueID")%>' OnClick="lbtnJoinLeague_Click"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
