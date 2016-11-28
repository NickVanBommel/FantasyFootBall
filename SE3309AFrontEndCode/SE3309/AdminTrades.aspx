<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/Admin.Master" CodeBehind="AdminTrades.aspx.vb" Inherits="SE3309.AdminTrades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 50px 0px 0px 50px;">
        <asp:Label runat="server" ID="lblError" Visible="false" ForeColor="Red"></asp:Label>
        <br />
        <label>Trades Pending Admin Approval: </label>
        <br />
        <asp:Button runat="server" ID="btnRejectAll" Text="Reject All Trades" OnClick="btnRejectAll_Click" />
        <br />
        <asp:GridView runat="server" ID="gvAdminTrades" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Submitted By" DataField="FirstUsername" />
                <asp:BoundField HeaderText="Player Offered" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="FirstPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Trade Offered To" DataField="SecondUsername" />
                <asp:BoundField HeaderText="Player Requested" DataField="SecondPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="SecondPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="SecondPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="SecondPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="SecondPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="SecondPlayerScore" />
                <asp:BoundField HeaderText="Trade Submit Date" DataField="TradeSubmitDate" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnReject" Text="Reject Trade" OnClick="lbtnReject_Click" CommandArgument='<%# Eval("TradeID")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnAccept" Text="Accept Trade" OnClick="lbtnAccept_Click" CommandArgument='<%# Eval("TradeID")%>'></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <label>Trades Pending User Approval: </label>
        <asp:GridView runat="server" ID="gvPendingTrades" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Submitted By" DataField="FirstUsername" />
                <asp:BoundField HeaderText="Player Offered" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="FirstPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Trade Offered To" DataField="SecondUsername" />
                <asp:BoundField HeaderText="Player Requested" DataField="SecondPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="SecondPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="SecondPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="SecondPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="SecondPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="SecondPlayerScore" />
                <asp:BoundField HeaderText="Trade Submit Date" DataField="TradeSubmitDate" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <label>Completed Trades:</label>
        <asp:GridView runat="server" ID="gvCompletedTrades" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Submitted By" DataField="FirstUsername" />
                <asp:BoundField HeaderText="Player Offered" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="FirstPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Trade Offered To" DataField="SecondUsername" />
                <asp:BoundField HeaderText="Player Requested" DataField="SecondPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="SecondPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="SecondPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="SecondPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="SecondPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="SecondPlayerScore" />
                <asp:BoundField HeaderText="Trade Submit Date" DataField="TradeSubmitDate" />
                <asp:BoundField HeaderText="Trade Completed On" DataField="TradeApprovalDate" />
                <asp:BoundField HeaderText="Admin ID" DataField="AdminApprovalID" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <label>Rejected Trades:</label>
        <asp:GridView runat="server" ID="gvRejectedTrades" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Submitted By" DataField="FirstUsername" />
                <asp:BoundField HeaderText="Player Offered" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="FirstPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Trade Offered To" DataField="SecondUsername" />
                <asp:BoundField HeaderText="Player Requested" DataField="SecondPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="SecondPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="SecondPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="SecondPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="SecondPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="SecondPlayerScore" />
                <asp:BoundField HeaderText="Trade Submit Date" DataField="TradeSubmitDate" />
                <asp:BoundField HeaderText="Trade Rejected On" DataField="TradeApprovalDate" />
                <asp:BoundField HeaderText="Trade Rejected By" DataField="Rejector" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
