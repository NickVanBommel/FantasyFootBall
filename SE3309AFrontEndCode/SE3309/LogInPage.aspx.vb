Imports MySql.Data
Public Class LogInPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Username") = Nothing
    End Sub

    Protected Sub btnLogin_Click(sender As Object, e As EventArgs)
        Try
            Dim username, password As String
            username = txtUserName.Text
            password = txtPassword.Text

            Dim loginParams As New List(Of MySqlClient.MySqlParameter)
            loginParams.Add(New MySqlClient.MySqlParameter("enteredUsername", username))
            loginParams.Add(New MySqlClient.MySqlParameter("enteredPassword", password))
            Dim dtUser As DataTable = NickLibrary.GetDataTable("AuthenticateLogin", loginParams)

            If dtUser.Rows.Count > 1 Then
                lblError.Text = "Error! Database corrupted."
                lblError.Visible = True
            ElseIf dtUser.Rows.Count = 1 Then
                Session("Username") = username
                If dtUser.Rows(0)("Role") = 0 Then
                    Response.Redirect("Leagues.aspx")
                Else
                    Response.Redirect("AdminViewUsers.aspx")
                End If
            Else
                lblError.Visible = True
                lblError.Text = "User does not exist or password is incorrect..."
            End If

        Catch ex As Exception
            lblError.Text = "Error in execution!!"
            lblError.Visible = True

        End Try
    End Sub
End Class