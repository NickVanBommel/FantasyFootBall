<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/User.Master" CodeBehind="UserRoster.aspx.vb" Inherits="SE3309.UserRoster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left:50px; margin-top:50px;">
        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
        <br />
        <label>Current Stats:</label>
        <br />
        <asp:GridView runat="server" ID="gvStats" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Number of Players in Roster" DataField="NumberOfPlayers" />
                <asp:BoundField HeaderText="Minimum Score" DataField="MinScore" />
                <asp:BoundField HeaderText="Maximum Score" DataField="MaxScore" />
                <asp:BoundField HeaderText="Total Roster Score" DataField="TotalTeamPoints" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <label>Your Roster:</label>
        <br />
        <br />
        <asp:GridView runat="server" ID="gvRoster" AutoGenerateColumns="false">
            <EmptyDataTemplate>
                <label>Your roster is currently empty</label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField HeaderText="PlayerID" DataField="PlayerID" />
                <asp:BoundField HeaderText="Team Name" DataField="TeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                <asp:BoundField HeaderText="Position" DataField="Position" />
                <asp:BoundField HeaderText="Fantasy Points" DataField="PlayerPoints" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnDrop" Text="Drop Player" CommandArgument='<%#Eval("PlayerID")%>' OnClick="lbtnDrop_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <table>
            <tr>
                <td>
                    <asp:Button runat="server" ID="btnAddPlayer" Text="Add New Player to Roster" OnClick="btnAddPlayer_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
