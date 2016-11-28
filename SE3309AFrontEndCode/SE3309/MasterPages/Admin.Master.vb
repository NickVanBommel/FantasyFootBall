Public Class Admin
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("Username") Is Nothing Then
            Response.Redirect("LogInPage.aspx")
        End If
    End Sub

End Class