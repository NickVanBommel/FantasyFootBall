<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/Admin.Master" CodeBehind="AdminViewUsers.aspx.vb" Inherits="SE3309.AdminViewUsers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin:50px 0px 0px 50px;">
        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
        <label>All Users: </label>
        <br />
        <br />
        <asp:GridView runat="server" ID="gvAllUsers" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Username" DataField="Username" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                <asp:BoundField HeaderText="Number of Joined Leagues" DataField="NumberOfJoinedLeagues" />
                <asp:BoundField HeaderText="Total Score Across all Leagues" DataField="TotalScoreAllLeagues" />
                <asp:BoundField HeaderText="Average Score Across all Leagues" DataField="AverageScorePerLeague" />
                <asp:TemplateField>
                    <HeaderTemplate>
                        <label>Remove User</label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" ID="lbtnRemove" Text="Remove User" CommandArgument='<%#Eval("Username")%>' OnClick="lbtnRemove_Click"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
