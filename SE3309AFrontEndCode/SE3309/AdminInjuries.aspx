<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/MasterPages/Admin.Master" CodeBehind="AdminInjuries.aspx.vb" Inherits="SE3309.AdminInjuries" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div style="margin:50px 0px 0px 50px;">
        <asp:Label runat="server" ID="lblError" ForeColor="Red" Visible="false"></asp:Label>
        <br />
        <table>
            <tr>
                <td>
                    <label runat="server" id="lblPlayerName">Player: FirstName LastName</label>
                </td>
                <td style="width:10px;"></td>
                <td>
                    <label runat="server" id="lblPosition">Position:</label>
                </td>
            </tr>
        </table>
        <br />
        <asp:GridView runat="server" ID="gvInjuries" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField HeaderText="Injury Description" DataField="InjuryDescription" />
                <asp:BoundField HeaderText="Date Injury Occured" DataField="DateOfInjury" />
                <asp:BoundField HeaderText="Date of Player Return" DataField="DateOfReturn" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
