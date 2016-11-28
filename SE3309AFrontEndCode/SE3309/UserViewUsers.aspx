<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/User.Master" CodeBehind="UserViewUsers.aspx.vb" Inherits="SE3309.UserViewUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin: 50px 0px 0px 50px;">
        <label>User in League: </label>
        <br />
        <asp:GridView runat="server" ID="gvUsers" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Username" DataField="Username" />
                <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                <asp:BoundField HeaderText="Total League Score" DataField="TotalScore" />
            </Columns>
        </asp:GridView>

    </div>
</asp:Content>
