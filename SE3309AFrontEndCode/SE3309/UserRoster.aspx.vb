Imports MySql.Data
Public Class UserRoster
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try

            Dim username = Session("Username")
            Dim LeagueID = Session("LeagueID")

            Session("Username") = username
            Session("LeagueID") = LeagueID

            PopulateTables()

        Catch ex As Exception
            lblError.Text = "Unexpected error occured: " + ex.Message
            lblError.Visible = True
        End Try




    End Sub

    Protected Sub btnAddPlayer_Click(sender As Object, e As EventArgs)
        Try
            Response.Redirect("UserPlayers.aspx", True)

        Catch ex As Exception
            lblError.Text = "Error leaving the page: " + ex.Message
        End Try
    End Sub

    Protected Sub lbtnDrop_Click(sender As Object, e As EventArgs)

        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim PlayerID As Int32 = myLinkButton.CommandArgument

            Dim dropParams As New List(Of MySqlClient.MySqlParameter)
            dropParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            dropParams.Add(New MySqlClient.MySqlParameter("PlayerID", PlayerID))
            dropParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            NickLibrary.ExecuteNonQuery("DropPlayerFromRoster", dropParams)
            PopulateTables()
        Catch ex As Exception
            lblError.Text = "Error occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub

    Protected Sub PopulateTables()


        Dim username = Session("Username")
        Dim LeagueID = Session("LeagueID")

        Dim dtPlayerStats, dtRoster As DataTable
        Dim statParams, rosterParams As New List(Of MySqlClient.MySqlParameter)

        rosterParams.Add(New MySqlClient.MySqlParameter("Username", username))
        rosterParams.Add(New MySqlClient.MySqlParameter("LeagueID", LeagueID))
        dtRoster = NickLibrary.GetDataTable("GetUserLeagueRoster", rosterParams)

        gvRoster.DataSource = dtRoster
        gvRoster.DataBind()

        statParams.Add(New MySqlClient.MySqlParameter("Username", username))
        statParams.Add(New MySqlClient.MySqlParameter("LeagueID", LeagueID))
        dtPlayerStats = NickLibrary.GetDataTable("GetUserStats", statParams)


        gvStats.DataSource = dtPlayerStats
        gvStats.DataBind()

    End Sub
End Class