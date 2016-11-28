Imports MySql.Data
Public Class Leagues
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            If Session("Username") Is Nothing Then
                Response.Redirect("LogInPage.aspx")
                Return
            End If
            Dim username As String = Session("Username")
            Session("Username") = username
            Dim dtUserLeague As DataTable
            Dim dtNonUserLeague As DataTable
            Dim userLeaguesParams As New List(Of MySqlClient.MySqlParameter)
            userLeaguesParams.Add(New MySqlClient.MySqlParameter("username", username))
            userLeaguesParams.Add(New MySqlClient.MySqlParameter("LeagueID", Nothing))
            dtUserLeague = NickLibrary.GetDataTable("GetUserLeagues", userLeaguesParams)
            Dim nonUserLeaguesParams As New List(Of MySqlClient.MySqlParameter)
            nonUserLeaguesParams.Add(New MySqlClient.MySqlParameter("username", username))
            dtNonUserLeague = NickLibrary.GetDataTable("GetNonUserLeagues", nonUserLeaguesParams)

            gvUserLeagues.DataSource = dtUserLeague
            gvUserLeagues.DataBind()

            gvAllLeagues.DataSource = dtNonUserLeague
            gvAllLeagues.DataBind()

        Catch ex As Exception
            lblError.Text = "Unexcpected error occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnEnterLeague_Click(sender As Object, e As EventArgs)
        Try

            Dim sendingLbtn As LinkButton = DirectCast(sender, LinkButton)
            Dim LeagueID As Int32 = sendingLbtn.CommandArgument
            Session("LeagueID") = LeagueID

            Response.Redirect("UserRoster.aspx", True)


        Catch ex As Exception
            lblError.Text = "Error in the linkButton " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnJoinLeague_Click(sender As Object, e As EventArgs)
        Try

            Dim sendingLbtn As LinkButton = DirectCast(sender, LinkButton)
            Dim LeagueID As Int32 = sendingLbtn.CommandArgument
            Session("LeagueID") = LeagueID

            Dim addLeagueParams As New List(Of MySqlClient.MySqlParameter)
            addLeagueParams.Add(New MySqlClient.MySqlParameter("username", Session("Username")))
            addLeagueParams.Add(New MySqlClient.MySqlParameter("LeagueID", LeagueID))
            NickLibrary.ExecuteNonQuery("InsertUserIntoLeague", addLeagueParams)
            Response.Redirect("UserRoster.aspx", True)

        Catch ex As Exception
            lblError.Text = "Error occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub
End Class