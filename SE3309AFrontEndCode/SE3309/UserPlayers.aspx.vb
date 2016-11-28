Imports MySql.Data
Public Class UserPlayers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Try

                'Get dropdowns
                Dim usernamme As String = Session("Username")
                Dim LeagueID As Int32 = Session("LeagueID")

                For scores As Int32 = 0 To 35
                    ddlMinScore.Items.Add(New ListItem(scores, scores))
                    ddlMaxScore.Items.Add(New ListItem(35 - scores, 35 - scores))
                Next

                NickLibrary.GetDropDown(ddlTeam, "TeamID", "TeamName", "GetTeams")
                ddlTeam.Items.Insert(0, New ListItem("Any Team", Nothing))
                NickLibrary.GetDropDown(ddlPosition, "Position", "Position", "GetPositions")
                ddlPosition.Items.Insert(0, New ListItem("Any Position", Nothing))


                'get players
                GetPlayers(Nothing, Nothing, 0, 35)

            Catch ex As Exception
                lblError.Text = "unexpected Error occured: " + ex.Message
                lblError.Visible = True
            End Try
        End If
    End Sub

    Private Sub gvPlayers_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gvPlayers.RowDataBound


    End Sub

    Protected Sub lbtnSort_Click(sender As Object, e As EventArgs)
        lblError.Visible = False

        Try
            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim sortIndex = myLinkButton.CommandArgument
            If ddlTeam.SelectedIndex < 1 And ddlPosition.SelectedIndex < 1 Then
                GetPlayers(Nothing, Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue), sortIndex)
            ElseIf ddlTeam.SelectedIndex < 1 Then
                GetPlayers(Nothing, ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue), sortIndex)
            ElseIf ddlPosition.SelectedIndex < 1 Then
                GetPlayers(Int32.Parse(ddlTeam.SelectedValue), Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue), sortIndex)
            Else
                GetPlayers(Int32.Parse(ddlTeam.SelectedValue), ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue), sortIndex)
            End If
        Catch ex As Exception
            lblError.Text = "Unexpected Error occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnInjuries_Click(sender As Object, e As EventArgs)

        Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
        Dim PlayerID As Int32 = myLinkButton.CommandArgument

        If PlayerID > 0 Then
            Session("PlayerID") = PlayerID
            Response.Redirect("UserInjuries.aspx", True)
        End If
        lblError.Text = "Error identifying player!"
        lblError.Visible = True

    End Sub

    Public Sub GetPlayers(ByVal TeamID As Int32, ByVal Position As String, ByVal MinScore As Int32, ByVal MaxScore As Int32, Optional ByVal SortIndex As Int32 = 0)

        Try

            Dim dtPlayers As DataTable
            Dim playerParams As New List(Of MySqlClient.MySqlParameter)

            If Not TeamID = 0 Then
                playerParams.Add(New MySqlClient.MySqlParameter("TeamID", TeamID))
            Else
                playerParams.Add(New MySqlClient.MySqlParameter("TeamID", Nothing))
            End If
            playerParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            playerParams.Add(New MySqlClient.MySqlParameter("Position", Position))
            playerParams.Add(New MySqlClient.MySqlParameter("MinScore", MinScore))
            playerParams.Add(New MySqlClient.MySqlParameter("MaxScore", MaxScore))
            playerParams.Add(New MySqlClient.MySqlParameter("SortIndex", SortIndex))
            dtPlayers = NickLibrary.GetDataTable("GetPlayers", playerParams)

            gvPlayers.DataSource = dtPlayers
            gvPlayers.DataBind()
        Catch ex As Exception
            lblError.Text = "Unexpected error: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs)
        lblError.Visible = False
        If ddlTeam.SelectedIndex < 1 And ddlPosition.SelectedIndex < 1 Then
            GetPlayers(Nothing, Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
        ElseIf ddlTeam.SelectedIndex < 1 Then
            GetPlayers(Nothing, ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
        ElseIf ddlPosition.SelectedIndex < 1 Then
            GetPlayers(Int32.Parse(ddlTeam.SelectedValue), Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
        Else
            GetPlayers(Int32.Parse(ddlTeam.SelectedValue), ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
        End If
    End Sub

    Protected Sub lbtnAddPlayer_Click(sender As Object, e As EventArgs)

        lblError.Visible = False

        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim PlayerID As Int32 = myLinkButton.CommandArgument

            Dim addPlayerParams As New List(Of MySqlClient.MySqlParameter)
            addPlayerParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            addPlayerParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            addPlayerParams.Add(New MySqlClient.MySqlParameter("PlayerID", PlayerID))
            NickLibrary.ExecuteNonQuery("AddPlayerToRoster", addPlayerParams)

            If ddlTeam.SelectedIndex < 1 And ddlPosition.SelectedIndex < 1 Then
                GetPlayers(Nothing, Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
            ElseIf ddlTeam.SelectedIndex < 1 Then
                GetPlayers(Nothing, ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
            ElseIf ddlPosition.SelectedIndex < 1 Then
                GetPlayers(Int32.Parse(ddlTeam.SelectedValue), Nothing, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
            Else
                GetPlayers(Int32.Parse(ddlTeam.SelectedValue), ddlPosition.SelectedValue, Int32.Parse(ddlMinScore.SelectedValue), Int32.Parse(ddlMaxScore.SelectedValue))
            End If

        Catch ex As Exception
            lblError.Text = "Error occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub
End Class