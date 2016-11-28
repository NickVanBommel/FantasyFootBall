Imports System.Data.SqlClient
Imports MySql.Data


Public Class NickLibrary

    Public Shared Function GetSQLConnection() As String
        'Return "Server=localhost;Database=m_and_n_fantasy_sports;User=nvanbomm;Password=SE3309Passport=330"
        Return "server=localhost;database=m_and_n_fantasy_sports; user=nvanbomm;Password=SE3309Pass"
    End Function

    'no transaction
    Public Shared Function GetDataTable(ByVal StoredProcedure As String, Optional ByVal parameters As List(Of MySqlClient.MySqlParameter) = Nothing) As DataTable
        Dim dt As New DataTable()
        Using cmd As New MySqlClient.MySqlCommand(StoredProcedure)
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                If Not parameters Is Nothing Then
                    For Each Parameter As MySqlClient.MySqlParameter In parameters
                        cmd.Parameters.Add(Parameter)
                    Next
                End If
                Dim sqlAdapter As New MySqlClient.MySqlDataAdapter(cmd)
                sqlAdapter.Fill(dt)
            End Using
        End Using
        Return dt
    End Function

    'in transaction
    Public Shared Function GetDataTable(ByVal StoredProcedure As String, ByVal parameters As List(Of MySqlClient.MySqlParameter), ByRef trans As MySqlClient.MySqlTransaction) As DataTable
        Dim dt As New DataTable()
        Using cmd As New MySqlClient.MySqlCommand(GetSQLConnection())
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Transaction = trans
                For Each Parameter As MySqlClient.MySqlParameter In parameters
                    cmd.Parameters.Add(Parameter)
                Next
                Dim sqlAdapter As New MySqlClient.MySqlDataAdapter(cmd)
                sqlAdapter.Fill(dt)
            End Using
        End Using
        Return dt
    End Function

    Public Shared Sub GetDropDown(ByRef dropdown As DropDownList, ByVal DataField As String, ByVal TextField As String, ByVal StoredProcedure As String, Optional ByVal parameters As List(Of MySqlClient.MySqlParameter) = Nothing)
        Using cmd As New MySqlClient.MySqlCommand(StoredProcedure)
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                If Not parameters Is Nothing Then
                    For Each Parameter As MySqlClient.MySqlParameter In parameters
                        cmd.Parameters.Add(Parameter)
                    Next
                End If
                cmd.Connection.Open()
                dropdown.DataSource = cmd.ExecuteReader()
                dropdown.DataValueField = DataField
                dropdown.DataTextField = TextField
                dropdown.DataBind()

            End Using
        End Using
    End Sub

    Public Shared Sub GetDropDown(ByRef dropdown As DropDownList, ByVal DataField As String, ByVal TextField As String, ByVal StoredProcedure As String, ByVal parameters As List(Of MySqlClient.MySqlParameter), ByRef trans As MySqlClient.MySqlTransaction)
        Using cmd As New MySqlClient.MySqlCommand(StoredProcedure)
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Transaction = trans
                If Not parameters Is Nothing Then
                    For Each Parameter As MySqlClient.MySqlParameter In parameters
                        cmd.Parameters.Add(Parameter)
                    Next
                End If
                cmd.Connection.Open()
                dropdown.DataSource = cmd.ExecuteReader()
                dropdown.DataValueField = DataField
                dropdown.DataTextField = TextField
                dropdown.DataBind()
            End Using
        End Using
    End Sub

    Public Shared Function ExecuteNonQuery(ByVal StoredProcedure As String, Optional ByVal parameters As List(Of MySqlClient.MySqlParameter) = Nothing) As Integer
        Using cmd As New MySqlClient.MySqlCommand(StoredProcedure)
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection.Open()
                If Not parameters Is Nothing Then
                    For Each Parameter As MySqlClient.MySqlParameter In parameters
                        cmd.Parameters.Add(Parameter)
                    Next
                End If
                Return cmd.ExecuteNonQuery()
            End Using
        End Using
    End Function

    Public Shared Function ExecuteNonQuery(ByVal StoredProcedure As String, ByVal parameters As List(Of MySqlClient.MySqlParameter), ByRef trans As MySqlClient.MySqlTransaction) As Integer
        Using cmd As New MySqlClient.MySqlCommand(StoredProcedure)
            Using conn As New MySqlClient.MySqlConnection(GetSQLConnection())
                cmd.Connection = conn
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Transaction = trans
                For Each Parameter As MySqlClient.MySqlParameter In parameters
                    cmd.Parameters.Add(Parameter)
                Next
                Return cmd.ExecuteNonQuery()
            End Using
        End Using

    End Function

End Class
