Imports MySql.Data
Public Class AdminTrades
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            'Populate the 4 tables
            Dim dtPendingTrades, dtUserPendingTrades, dtCompletedTrades, dtRejectedTrades As DataTable

            dtPendingTrades = NickLibrary.GetDataTable("GetAdminPendingTrades")
            dtUserPendingTrades = NickLibrary.GetDataTable("GetAdminUserPendingTrades")
            dtCompletedTrades = NickLibrary.GetDataTable("GetAdminCompletedTrades")
            dtRejectedTrades = NickLibrary.GetDataTable("GetAdminRejectedTrades")

            gvAdminTrades.DataSource = dtPendingTrades
            gvAdminTrades.DataBind()

            gvPendingTrades.DataSource = dtUserPendingTrades
            gvPendingTrades.DataBind()

            gvCompletedTrades.DataSource = dtCompletedTrades
            gvCompletedTrades.DataBind()

            gvRejectedTrades.DataSource = dtRejectedTrades
            gvRejectedTrades.DataBind()

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnReject_Click(sender As Object, e As EventArgs)
        lblError.Visible = False
        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim TradeId As Int32 = myLinkButton.CommandArgument

            Dim rejectParams As New List(Of MySqlClient.MySqlParameter)
            rejectParams.Add(New MySqlClient.MySqlParameter("TradeID", TradeId))
            rejectParams.Add(New MySqlClient.MySqlParameter("AdminID", Session("Username")))
            NickLibrary.ExecuteNonQuery("AdminRejectTrade", rejectParams)

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnAccept_Click(sender As Object, e As EventArgs)

        lblError.Visible = False
        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim TradeId As Int32 = myLinkButton.CommandArgument

            Dim AcceptParams As New List(Of MySqlClient.MySqlParameter)
            AcceptParams.Add(New MySqlClient.MySqlParameter("TradeID", TradeId))
            AcceptParams.Add(New MySqlClient.MySqlParameter("AdminID", Session("Username")))
            NickLibrary.ExecuteNonQuery("AdminAcceptTrade", AcceptParams)

        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub

    Protected Sub btnRejectAll_Click(sender As Object, e As EventArgs)

        lblError.Visible = False

        Try
            Dim rejectParams As New List(Of MySqlClient.MySqlParameter)
            rejectParams.Add(New MySqlClient.MySqlParameter("AdminID", Session("Username")))
            NickLibrary.ExecuteNonQuery("AdminRejectAllTrades", rejectParams)
        Catch ex As Exception
            lblError.Text = "Error Occured: " + ex.Message
            lblError.Visible = True
        End Try
    End Sub
End Class