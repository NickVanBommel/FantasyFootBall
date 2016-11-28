Imports MySql.Data
Public Class UserViewUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim dtUsers As DataTable
        Dim userParams As New List(Of MySqlClient.MySqlParameter)
        userParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
        dtUsers = NickLibrary.GetDataTable("GetUsersByLeague", userParams)
        gvUsers.DataSource = dtUsers
        gvUsers.DataBind()

    End Sub

End Class