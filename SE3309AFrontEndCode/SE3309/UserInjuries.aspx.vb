Imports MySql.Data
Public Class UserInjuries
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try

            If Session("PlayerID") Is Nothing Then
                Response.Redirect("UserRoster.aspx")
            End If

            Dim PlayerID As Int32 = Session("PlayerID")
            Dim dtInjuries As DataTable
            Dim injuryParams As New List(Of MySqlClient.MySqlParameter)
            injuryParams.Add(New MySqlClient.MySqlParameter("PlayerID", PlayerID))
            dtInjuries = NickLibrary.GetDataTable("GetInjuries", injuryParams)

            gvInjuries.DataSource = dtInjuries
            gvInjuries.DataBind()


            Dim dtPlayerInfo As DataTable
            Dim playerParams As New List(Of MySqlClient.MySqlParameter)
            playerParams.Add(New MySqlClient.MySqlParameter("PlayerID", PlayerID))
            dtPlayerInfo = NickLibrary.GetDataTable("GetPlayerInfo", playerParams)

            If dtPlayerInfo.Rows.Count > 0 Then
                lblPlayerName.InnerText = "Player: " + dtPlayerInfo.Rows(0)("FirstName") + " " + dtPlayerInfo.Rows(0)("LastName")
                lblPosition.InnerText = "Position: " + dtPlayerInfo.Rows(0)("Position")
            End If

        Catch ex As Exception
            lblError.Text = "Error occured: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

End Class