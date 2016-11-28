Imports MySql.Data
Public Class UserViewTrades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            'display all pending trades
            Dim pendingTradesParams As New List(Of MySqlClient.MySqlParameter)
            pendingTradesParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            pendingTradesParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            Dim dtPendingTrades As DataTable = NickLibrary.GetDataTable("GetPendingTrades", pendingTradesParams)

            gvPendingTrades.DataSource = dtPendingTrades
            gvPendingTrades.DataBind()

            'display all offered 
            Dim offeredTradesParams As New List(Of MySqlClient.MySqlParameter)
            offeredTradesParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            offeredTradesParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            Dim dtOfferedTrades As DataTable = NickLibrary.GetDataTable("GetOfferedTrades", offeredTradesParams)

            gvOfferedTrades.DataSource = dtOfferedTrades
            gvOfferedTrades.DataBind()

            'display all completed trades
            Dim completedTradesParams As New List(Of MySqlClient.MySqlParameter)
            completedTradesParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            completedTradesParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            Dim dtCompletedTrades As DataTable = NickLibrary.GetDataTable("GetCompletedTrades", completedTradesParams)

            gvCompletedTrades.DataSource = dtCompletedTrades
            gvCompletedTrades.DataBind()

            'display all rejected trades
            Dim rejectedTradesParams As New List(Of MySqlClient.MySqlParameter)
            rejectedTradesParams.Add(New MySqlClient.MySqlParameter("Username", Session("Username")))
            rejectedTradesParams.Add(New MySqlClient.MySqlParameter("LeagueID", Session("LeagueID")))
            Dim dtRejectedTrades As DataTable = NickLibrary.GetDataTable("GetRejectedTrades", rejectedTradesParams)

            gvRejectedTrades.DataSource = dtRejectedTrades
            gvRejectedTrades.DataBind()

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub

    Protected Sub lbtnReject_Click(sender As Object, e As EventArgs)

        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim TradeID As Int32 = Int32.Parse(myLinkButton.CommandArgument)

            Dim rejectParams As New List(Of MySqlClient.MySqlParameter)
            rejectParams.Add(New MySqlClient.MySqlParameter("TradeID", TradeID))
            NickLibrary.ExecuteNonQuery("UserRejectTrade", rejectParams)

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub

    Protected Sub lbtnAccept_Click(sender As Object, e As EventArgs)

        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim TradeID As Int32 = Int32.Parse(myLinkButton.CommandArgument)

            Dim acceptParams As New List(Of MySqlClient.MySqlParameter)
            acceptParams.Add(New MySqlClient.MySqlParameter("TradeID", TradeID))
            NickLibrary.ExecuteNonQuery("UserAcceptTrade", acceptParams)

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub
End Class