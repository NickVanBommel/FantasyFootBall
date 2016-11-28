<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/Admin.Master" CodeBehind="AdminViewPlayers.aspx.vb" Inherits="SE3309.AdminViewPlayers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:50px; margin-top:50px;">
        <%-- This table will contain all the hard restrictions the user can specify EG Team, position, score --%>
        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
        <table>
            <tr>
                <td>
                    <label>Team</label>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <label>Position</label>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList runat="server" ID="ddlTeam" AutoPostBack="true">
                        <asp:ListItem Text="Any Team" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlPosition" AutoPostBack="true">
                        <asp:ListItem Text="Any Position" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr style="height:15px;"></tr>
            <tr>
                <td>
                    <label>Minimum Average Score Per Game</label>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <label>Maximum Average Score Per Game</label>
                </td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList runat="server" ID="ddlMinScore" AutoPostBack="true"></asp:DropDownList>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlMaxScore" AutoPostBack="true"></asp:DropDownList>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <asp:Button runat="server" ID="btnSearch" Text="Search Players" OnClick="btnSearch_Click" />
                </td>
            </tr>
        </table>

        <br />
        <br />
        <label>Players:</label>
        <br />
        <asp:GridView runat="server" ID="gvPlayers" AutoGenerateColumns="false">
            <EmptyDataTemplate>
                <asp:Label runat="server" ID="lblNoData" Text="There are no Players"></asp:Label>
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnPlayerID" Text="PlayerID" CommandArgument="4" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPlayerID" Text='<%#Eval("PlayerID")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnTeamName" Text="Team Name" CommandArgument="12" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblTeamName" Text='<%#Eval("TeamName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnFirstName" Text="First Name" CommandArgument="6" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblFirstName" Text='<%#Eval("FirstName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnLastName" Text="Last Name" CommandArgument="8" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblLastName" Text='<%#Eval("LastName")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnPosition" Text="Position" CommandArgument="10" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblPosition" Text='<%#Eval("Position")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnInjuries" Text="Number Of Injuries" CommandArgument="14" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnInjuries" Text='<%#Eval("NumberOfInjuries")%>' CommandArgument='<%#Eval("PlayerID")%>' OnClick="lbtnInjuries_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>                
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnAvgScore" Text="Average Score Per Game" CommandArgument="2" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblAvgScore" Text='<%#Eval("AverageScore")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:LinkButton runat="server" ID="lbtnScore" Text="Total Player Score" CommandArgument="0" OnClick="lbtnSort_Click"></asp:LinkButton>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lblScore" Text='<%#Eval("TotalPoints")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>
