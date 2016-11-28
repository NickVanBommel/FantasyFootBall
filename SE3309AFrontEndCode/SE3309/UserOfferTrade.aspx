<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/User.Master" CodeBehind="UserOfferTrade.aspx.vb" Inherits="SE3309.UserOfferTrade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 50px 0px 0px 50px;">
        <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="Red"></asp:Label>
        <table>
            <tr>
                <td>
                    <label>Player To Offer: </label>
                </td>
                <td style="width: 10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlPlayerToOffer" AutoPostBack="true"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" ID="gvOfferedPlayerInfo" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="PlayerID" DataField="PlayerID" />
                <asp:BoundField HeaderText="Team Name" DataField="TeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                <asp:BoundField HeaderText="Position" DataField="Position" />
                <asp:BoundField HeaderText="Average Score Per Game" DataField="AverageScore" />
                <asp:BoundField HeaderText="Total Score" DataField="TotalScore" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <table>
            <tr>
                <td>
                    <label>User to trade with: </label>
                </td>
                <td style="width: 10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlUsers" AutoPostBack="true"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Player Position: </label>
                </td>
                <td style="width: 10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlPositions" AutoPostBack="true"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Player: </label>
                </td>
                <td style="width: 10px;"></td>
                <td>
                    <asp:DropDownList runat="server" ID="ddlPlayer" AutoPostBack="true"></asp:DropDownList>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" ID="gvReceivingPlayerInfo" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="PlayerID" DataField="PlayerID" />
                <asp:BoundField HeaderText="Team Name" DataField="TeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                <asp:BoundField HeaderText="Position" DataField="Position" />
                <asp:BoundField HeaderText="Average Score Per Game" DataField="AverageScore" />
                <asp:BoundField HeaderText="Total Score" DataField="TotalScore" />
            </Columns>
        </asp:GridView>
        <br />
        <asp:Button runat="server" ID="btnOfferTrade" Text="Offer Trade" OnClick="btnOfferTrade_Click" />
    </div>
</asp:Content>
