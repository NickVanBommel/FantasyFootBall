Imports MySql.Data
Public Class CreateAccount
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("Username") = Nothing
    End Sub

    Protected Sub btnCreate_Click(sender As Object, e As EventArgs)

        Try
            If Not txtPass1.Text = txtPass2.Text Then
                lblError.Text = "Your passwords must match!"
                lblError.Visible = True
                Return
            End If
            If txtFirstName.Text = Nothing Or txtLastName.Text = Nothing Or txtPass1.Text = Nothing Or txtPass2.Text = Nothing Or txtUserName.Text = Nothing Then
                lblError.Text = "Please fill in all fields!"
                lblError.Visible = True
                Return
            End If
            Dim authenticateUsernameParams As New List(Of MySqlClient.MySqlParameter)
            authenticateUsernameParams.Add(New MySqlClient.MySqlParameter("enteredUsername", txtUserName.Text))
            authenticateUsernameParams.Add(New MySqlClient.MySqlParameter("enteredPassword", Nothing))
            Dim dtAuthenticate As New DataTable
            dtAuthenticate = NickLibrary.GetDataTable("AuthenticateLogin", authenticateUsernameParams)

            If dtAuthenticate.Rows.Count = 0 Then
                Dim newUserParams As New List(Of MySqlClient.MySqlParameter)
                newUserParams.Add(New MySqlClient.MySqlParameter("newusername", txtUserName.Text))
                newUserParams.Add(New MySqlClient.MySqlParameter("newFirstName", txtFirstName.Text))
                newUserParams.Add(New MySqlClient.MySqlParameter("newLastName", txtLastName.Text))
                newUserParams.Add(New MySqlClient.MySqlParameter("newPassword", txtPass1.Text))
                newUserParams.Add(New MySqlClient.MySqlParameter("newRole", 0))
                NickLibrary.ExecuteNonQuery("CreateNewUser", newUserParams)
                Session("Username") = txtUserName.Text
                Response.Redirect("Leagues.aspx")
            Else
                lblError.Text = "Username is already taken."
                lblError.Visible = True
            End If

        Catch ex As Exception
            lblError.Text = "There was an unhandled error: " + ex.Message
            lblError.Visible = True
        End Try


    End Sub
End Class