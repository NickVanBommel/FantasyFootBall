<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/User.Master" CodeBehind="UserViewTrades.aspx.vb" Inherits="SE3309.UserViewTrades" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 50px 0px 0px 50px;">
        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
        <br />
        <label>Pending Trades: </label>
        <asp:GridView runat="server" ID="gvPendingTrades" AutoGenerateColumns="false">
            <EmptyDataTemplate>
                <label>You do not have any Pending Trades</label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Offer From" DataField="FirstUsername" />
                <asp:BoundField HeaderText="User's Score" DataField="FirstUserScore" />
                <asp:BoundField HeaderText="Player to Receive" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="FirstPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Player's Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Player to Send" DataField="SecondPlayerID" />
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
        <label>Offered Trades:</label>
        <asp:GridView runat="server" ID="gvOfferedTrades" AutoGenerateColumns="false">
            <EmptyDataTemplate>
                <label>You are not waiting on any other user's reply to a Trade Offer</label>
            </EmptyDataTemplate>
            <Columns>
                <asp:BoundField HeaderText="TradeID" DataField="TradeID" />
                <asp:BoundField HeaderText="Trade Offer to" DataField="SecondUsername" />
                <asp:BoundField HeaderText="User's Score" DataField="SecondUserScore" />
                <asp:BoundField HeaderText="Player to Receive" DataField="SecondPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="SecondPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="SecondPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="SecondPlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="SecondPlayerPosition" />
                <asp:BoundField HeaderText="Score" DataField="SecondPlayerScore" />
                <asp:BoundField HeaderText="Player to Send" DataField="FirstPlayerID" />
                <asp:BoundField HeaderText="Team" DataField="FirstPlayerTeamName" />
                <asp:BoundField HeaderText="First Name" DataField="FirstPlayerFirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="PlayerLastName" />
                <asp:BoundField HeaderText="Position" DataField="FirstPlayerPosition" />
                <asp:BoundField HeaderText="Score" DataField="FirstPlayerScore" />
                <asp:BoundField HeaderText="Trade Submit Date" DataField="TradeSubmitDate" />
            </Columns>
        </asp:GridView>
        <br />
        <br />
        <label>Completed Trades:</label>

        <asp:GridView runat="server" ID="gvCompletedTrades" AutoGenerateColumns="false">
            <EmptyDataTemplate>
                <label>You do not have any completed trades</label>
            </EmptyDataTemplate>
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
        <asp:GridView runat="server" ID="gvRejectedTrades" AutoGenerateColumns ="false">
            <EmptyDataTemplate>
                <label>You do not have any rejected Trades</label>
            </EmptyDataTemplate>
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
