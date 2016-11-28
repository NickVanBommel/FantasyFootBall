Imports MySql.Data
Public Class AdminViewUsers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Try
            Dim dtUsers As DataTable = NickLibrary.GetDataTable("AdminGetUsers")
            gvAllUsers.DataSource = dtUsers
            gvAllUsers.DataBind()
        Catch ex As Exception
            lblError.Text = "Error Occred: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub

    Protected Sub lbtnRemove_Click(sender As Object, e As EventArgs)

        Try

            Dim myLinkButton As LinkButton = DirectCast(sender, LinkButton)
            Dim Username As String = myLinkButton.CommandArgument

            Dim removeParams As New List(Of MySqlClient.MySqlParameter)
            removeParams.Add(New MySqlClient.MySqlParameter("Username", Username))
            NickLibrary.ExecuteNonQuery("AdminRemoveUser", removeParams)


        Catch ex As Exception
            lblError.Text = "Error Occred: " + ex.Message
            lblError.Visible = True
        End Try

    End Sub
End Class