Public Class User
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        If Session("Username") Is Nothing Then
            Response.Redirect("LogInPage.aspx")
        End If
        If Session("LeagueID") Is Nothing Then
            Response.Redirect("Leagues.aspx")
        End If
        Session("Username") = Session("Username")
        Session("LeagueID") = Session("LeagueID")

    End Sub

    Protected Sub headMenu_MenuItemDataBound(sender As Object, e As MenuEventArgs)

    End Sub
End Class