Imports MySql.Data
Public Class UserOfferTrade
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Not Page.IsPostBack Then

            Try
                'fills dropdown of all the logged in user
                Dim currentUserPlayers As New List(Of MySqlClient.MySqlParameter)
                currentUserPlayers.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
                currentUserPlayers.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                NickLibrary.GetDropDown(ddlPlayerToOffer, "PlayerID", "PlayerInfo", "GetUserPlayers", currentUserPlayers)
                ddlPlayerToOffer.Items.Insert(0, "Select a Player to offer")

                'gets all the positions available
                NickLibrary.GetDropDown(ddlPositions, "Position", "Position", "GetPositions")
                ddlPositions.Items.Insert(0, "Any Position")

                'fills the dropdown of all the users in the league that isnt the current user
                Dim usersInLeagueParams As New List(Of MySqlClient.MySqlParameter)
                usersInLeagueParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                usersInLeagueParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
                NickLibrary.GetDropDown(ddlUsers, "Username", "Username", "GetTradeUsers", usersInLeagueParams)
                ddlUsers.Items.Insert(0, New ListItem("Select a User To Trade With..."))

                ddlPlayer.Items.Insert(0, "Select a Player to Receive...")

            Catch ex As Exception
                lblError.Text = "Error Occured: " + ex.Message
                lblError.Visible = True
            End Try

        End If
    End Sub

    'checks that the dropdowns both have a selected player then submits trade offer
    Protected Sub btnOfferTrade_Click(sender As Object, e As EventArgs)

        lblError.Visible = False
        Try
            If ddlPlayer.SelectedIndex > 0 And ddlPlayerToOffer.SelectedIndex > 0 Then
                Dim tradeParams As New List(Of MySqlClient.MySqlParameter)
                tradeParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                tradeParams.Add(New MySqlClient.MySqlParameter("FirstPlayerID", Int32.Parse(ddlPlayerToOffer.SelectedValue)))
                tradeParams.Add(New MySqlClient.MySqlParameter("SecondPlayerID", Int32.Parse(ddlPlayer.SelectedValue)))
                tradeParams.Add(New MySqlClient.MySqlParameter("FirstUsername", Session("Username")))
                tradeParams.Add(New MySqlClient.MySqlParameter("SecondUsername", ddlUsers.SelectedValue))
                tradeParams.Add(New MySqlClient.MySqlParameter("TradeStatus", "PendingUserApproval"))
                tradeParams.Add(New MySqlClient.MySqlParameter("TradeSubmitDate", Date.Now))
                NickLibrary.ExecuteNonQuery("SubmitTrade", tradeParams)
                Response.Redirect("UserViewTrades.aspx", True)
            Else
                lblError.Text = "Please select a player to trade away and a player to receive..."
                lblError.Visible = True
            End If
        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try


    End Sub

    'Updates the player info gridview
    Private Sub ddlPlayerToOffer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPlayerToOffer.SelectedIndexChanged
        lblError.Visible = False

        If ddlPlayerToOffer.SelectedIndex > 0 Then
            Dim playerParams As New List(Of MySqlClient.MySqlParameter)
            playerParams.Add(New MySqlClient.MySqlParameter("PlayerID", ddlPlayerToOffer.SelectedValue))
            Dim dtPlayerInfo As DataTable = NickLibrary.GetDataTable("GetPlayerInfo", playerParams)
            gvOfferedPlayerInfo.DataSource = dtPlayerInfo
            gvOfferedPlayerInfo.DataBind()
        Else
            ddlPlayer.Items.Clear()
            ddlPlayer.Items.Insert(0, "Select a Player to Receive...")
            gvOfferedPlayerInfo.DataSource = Nothing
            gvOfferedPlayerInfo.DataBind()
        End If
    End Sub

    'updates the players to receive dropdown with new values
    Private Sub ddlUsers_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlUsers.SelectedIndexChanged

        lblError.Visible = False

        Try
            'if the user selected a trading partner
            If ddlUsers.SelectedIndex > 0 Then
                'if the user has specified a position of the player they want
                If ddlPositions.SelectedIndex > 0 Then
                    Dim playersParams As New List(Of MySqlClient.MySqlParameter)
                    playersParams.Add(New MySqlClient.MySqlParameter("Username", ddlUsers.SelectedValue))
                    playersParams.Add(New MySqlClient.MySqlParameter("Position", ddlPositions.SelectedValue))
                    playersParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                    NickLibrary.GetDropDown(ddlPlayer, "PlayerID", "PlayerInfo", "GetUserPlayersByPosition", playersParams)
                    ddlPlayer.Items.Insert(0, "Select a Player to Receive...")
                Else
                    Dim playersParams As New List(Of MySqlClient.MySqlParameter)
                    playersParams.Add(New MySqlClient.MySqlParameter("Username", ddlUsers.SelectedValue))
                    playersParams.Add(New MySqlClient.MySqlParameter("Position", Nothing))
                    playersParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                    NickLibrary.GetDropDown(ddlPlayer, "PlayerID", "PlayerInfo", "GetUserPlayersByPosition", playersParams)
                    ddlPlayer.Items.Insert(0, "Select a Player to Receive...")
                End If
            End If
        Catch ex As Exception
            lblError.Text = "Error finding players: <br/>" + ex.Message
            lblError.Visible = True
        End Try
    End Sub

    'updates the player to receive info grid
    Private Sub ddlPlayer_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPlayer.SelectedIndexChanged

        lblError.Visible = False
        Try
            If ddlPlayer.SelectedIndex > 0 Then
                Dim playerParams As New List(Of MySqlClient.MySqlParameter)
                playerParams.Add(New MySqlClient.MySqlParameter("PlayerID", Int32.Parse(ddlPlayer.SelectedValue)))
                Dim dtPlayerInfo As DataTable = NickLibrary.GetDataTable("GetPlayerInfo", playerParams)
                gvReceivingPlayerInfo.DataSource = dtPlayerInfo
                gvReceivingPlayerInfo.DataBind()
            End If
        Catch ex As Exception
            lblError.Text = "Error finding Player's information: <br/>" + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Private Sub ddlPositions_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ddlPositions.SelectedIndexChanged

        Try
            If ddlPositions.SelectedIndex > 0 Then
                Dim playersParams As New List(Of MySqlClient.MySqlParameter)
                playersParams.Add(New MySqlClient.MySqlParameter("Username", ddlUsers.SelectedValue))
                playersParams.Add(New MySqlClient.MySqlParameter("Position", ddlPositions.SelectedValue))
                playersParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                NickLibrary.GetDropDown(ddlPlayer, "PlayerID", "PlayerInfo", "GetUserPlayersByPosition", playersParams)
                ddlPlayer.Items.Insert(0, "Select a Player to Receive...")
            Else
                Dim playersParams As New List(Of MySqlClient.MySqlParameter)
                playersParams.Add(New MySqlClient.MySqlParameter("Username", ddlUsers.SelectedValue))
                playersParams.Add(New MySqlClient.MySqlParameter("Position", Nothing))
                playersParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
                NickLibrary.GetDropDown(ddlPlayer, "PlayerID", "PlayerInfo", "GetUserPlayersByPosition", playersParams)
                ddlPlayer.Items.Insert(0, "Select a Player to Receive...")
            End If
        Catch ex As Exception
            lblError.Text = "Error finding Players: <br/>" + ex.Message
            lblError.Visible = True
        End Try
    End Sub
End Class