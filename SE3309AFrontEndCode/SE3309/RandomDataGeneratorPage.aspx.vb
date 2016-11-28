Imports System.Data.OleDb
Imports MySql.Data

Public Class RandomDataGeneratorPage
    Inherits System.Web.UI.Page
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Private Sub btnGenerateData_Click(sender As Object, e As EventArgs) Handles btnGenerateData.Click


        ImportTeams()
        ImportPlayers()
        CreateAllUser()
        GenerateInjuries()
        GeneratePlayerPoints()
        GenerateRoster()
        GenerateTrades()


    End Sub

    Public Sub GenerateRoster()



        Dim allUsers As New List(Of String)
        Dim dtAllUsers As DataTable = NickLibrary.GetDataTable("GetAllUsers")
        For Each row As DataRow In dtAllUsers.Rows
            allUsers.Add(row("Username"))
        Next

        Dim Generator As System.Random = New System.Random()

        'for each of the 10 leagues
        For leagueId = 1 To 30
            'get a random number of users in the league
            Dim numberOfUserInLeague As Int32 = Generator.Next(7, 11)

            'list of all the users currently in the league. Used to prevent duplicates
            Dim usersInLeague As New List(Of String)
            Dim playersInRoster As New List(Of Int32)
            'for each user in the league
            For userIndex = 1 To numberOfUserInLeague
                'gets a random user to add to the league
                Dim userToAdd As String = allUsers(Generator.Next(allUsers.Count))

                'if the user is already in the league get a new user until we find one not in the league
                While usersInLeague.Contains(userToAdd)
                    userToAdd = allUsers(Generator.Next(allUsers.Count))
                End While
                usersInLeague.Add(userToAdd)

                'Adds the user to the league
                Dim addUserParams As New List(Of MySqlClient.MySqlParameter)
                addUserParams.Add(New MySqlClient.MySqlParameter("NewLeagueID", leagueId))
                addUserParams.Add(New MySqlClient.MySqlParameter("Username", userToAdd))
                NickLibrary.ExecuteNonQuery("AddUserToLeague", addUserParams)

                'gets the number of players to add to the player's roster
                Dim NumOfPlayersInRoster As Int32 = Generator.Next(9, 16)

                'List of all players in the roster to prevent duplicates

                'Add Players to the user's roster
                For playerIndex = 0 To NumOfPlayersInRoster
                    'gets the playerID of the player to add to the user's roster
                    Dim playerToAdd As Int32 = Generator.Next(2, 869)
                    While playersInRoster.Contains(playerToAdd)
                        playerToAdd = Generator.Next(2, 869)
                    End While
                    playersInRoster.Add(playerToAdd)

                    Dim addPlayerParams As New List(Of MySqlClient.MySqlParameter)
                    addPlayerParams.Add(New MySqlClient.MySqlParameter("LeagueID", leagueId))
                    addPlayerParams.Add(New MySqlClient.MySqlParameter("Username", userToAdd))
                    addPlayerParams.Add(New MySqlClient.MySqlParameter("PlayerID", playerToAdd))

                    NickLibrary.ExecuteNonQuery("AddPlayerToRoster", addPlayerParams)
                Next

            Next
            usersInLeague.Clear()
            playersInRoster.Clear()
        Next
    End Sub

    Public Sub GenerateInjuries()
        Dim firstPartOfInjury As New List(Of String)
        Dim secondPartOfInjury As New List(Of String)
        Dim injuryDates As New List(Of Date)
        Dim returnDates As New List(Of Date)

        firstPartOfInjury.Add("Broken ")
        firstPartOfInjury.Add("Fractured ")
        firstPartOfInjury.Add("Sprained ")
        firstPartOfInjury.Add("Dislocated ")
        firstPartOfInjury.Add("Bruised ")
        firstPartOfInjury.Add("Blood gushing from player's ")

        secondPartOfInjury.Add("arm")
        secondPartOfInjury.Add("knee")
        secondPartOfInjury.Add("neck")
        secondPartOfInjury.Add("elbow")
        secondPartOfInjury.Add("back")
        secondPartOfInjury.Add("femur")
        secondPartOfInjury.Add("finger")
        secondPartOfInjury.Add("toe")
        secondPartOfInjury.Add("shoulder")

        injuryDates.Add(New Date(2016, 10, 4))
        injuryDates.Add(New Date(2016, 10, 5))
        injuryDates.Add(New Date(2016, 10, 6))
        injuryDates.Add(New Date(2016, 10, 7))
        injuryDates.Add(New Date(2016, 10, 8))
        injuryDates.Add(New Date(2016, 10, 9))
        injuryDates.Add(New Date(2016, 10, 10))

        returnDates.Add(New Date(2016, 11, 4))
        returnDates.Add(New Date(2016, 11, 5))
        returnDates.Add(New Date(2016, 11, 6))
        returnDates.Add(New Date(2016, 11, 7))
        returnDates.Add(New Date(2016, 11, 8))
        returnDates.Add(New Date(2016, 11, 9))
        returnDates.Add(New Date(2016, 10, 20))

        Dim Generator As System.Random = New System.Random()

        For playerID = 2 To 868

            Dim injuryDescription As String = firstPartOfInjury(Generator.Next(firstPartOfInjury.Count)) + secondPartOfInjury(Generator.Next(secondPartOfInjury.Count))
            Dim dateOfInjury = injuryDates(Generator.Next(injuryDates.Count))
            Dim dateOfReturn = returnDates(Generator.Next(returnDates.Count))

            Dim injuryParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("PlayerID", playerID))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("InjuryDescription", injuryDescription))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("DateOfInjury", dateOfInjury))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("DateOfReturn", dateOfReturn))

            NickLibrary.ExecuteNonQuery("CreateNewInjury", injuryParams)

        Next

        injuryDates.Clear()
        returnDates.Clear()

        injuryDates.Add(New Date(2016, 11, 4))
        injuryDates.Add(New Date(2016, 11, 5))
        injuryDates.Add(New Date(2016, 11, 6))
        injuryDates.Add(New Date(2016, 11, 7))
        injuryDates.Add(New Date(2016, 11, 8))
        injuryDates.Add(New Date(2016, 11, 9))
        injuryDates.Add(New Date(2016, 11, 10))

        returnDates.Add(New Date(2016, 12, 4))
        returnDates.Add(New Date(2016, 12, 5))
        returnDates.Add(New Date(2016, 12, 6))
        returnDates.Add(New Date(2016, 12, 7))
        returnDates.Add(New Date(2016, 12, 8))
        returnDates.Add(New Date(2016, 12, 9))
        returnDates.Add(New Date(2017, 1, 20))

        For playerID = 2 To 868

            Dim injuryDescription As String = firstPartOfInjury(Generator.Next(firstPartOfInjury.Count)) + secondPartOfInjury(Generator.Next(secondPartOfInjury.Count))
            Dim dateOfInjury = injuryDates(Generator.Next(injuryDates.Count))
            Dim dateOfReturn = returnDates(Generator.Next(returnDates.Count))

            Dim injuryParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("PlayerID", playerID))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("InjuryDescription", injuryDescription))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("DateOfInjury", dateOfInjury))
            injuryParams.Add(New MySql.Data.MySqlClient.MySqlParameter("DateOfReturn", dateOfReturn))

            NickLibrary.ExecuteNonQuery("CreateNewInjury", injuryParams)

        Next





    End Sub

    Public Sub GenerateTrades()


        Dim allPlayers As New List(Of Int32)
        Dim allUsers As New List(Of String)
        Dim allAdmins As New List(Of String)
        Dim submitDates As New List(Of Date)
        Dim approvedDate As New List(Of Date)

        allAdmins.Add("Admin")

        Dim dtAllUsers As DataTable = NickLibrary.GetDataTable("GetAllUsers")
        Dim dtAllPlayers As DataTable = NickLibrary.GetDataTable("GetAllPlayerIDs")

        For Each row As DataRow In dtAllUsers.Rows
            allUsers.Add(row("Username"))
        Next
        For Each row As DataRow In dtAllPlayers.Rows
            allPlayers.Add(row("PlayerID"))
        Next

        submitDates.Add(New Date(2016, 11, 1))
        submitDates.Add(New Date(2016, 11, 2))
        submitDates.Add(New Date(2016, 11, 3))
        submitDates.Add(New Date(2016, 11, 4))
        submitDates.Add(New Date(2016, 11, 5))

        approvedDate.Add(New Date(2016, 11, 6))
        approvedDate.Add(New Date(2016, 11, 7))
        approvedDate.Add(New Date(2016, 11, 8))
        approvedDate.Add(New Date(2016, 11, 9))
        approvedDate.Add(New Date(2016, 11, 10))

        Dim Generator As System.Random = New System.Random()

        For tradeID = 1 To 3000

            Dim firstPlayer = allPlayers(Generator.Next(allPlayers.Count))
            Dim secondPlayer = allPlayers(Generator.Next(allPlayers.Count))
            If (firstPlayer = secondPlayer) Then
                Continue For
            End If
            Dim firstuser = allUsers(Generator.Next(allUsers.Count))
            Dim seconduser = allUsers(Generator.Next(allUsers.Count))
            If (firstuser = seconduser) Then
                Continue For
            End If
            Dim dateSubmitted = submitDates(Generator.Next(submitDates.Count))
            Dim dateApproved = approvedDate(Generator.Next(approvedDate.Count))
            Dim tradeStatus As String = "Approved"
            Dim adminApprovalID = allAdmins(Generator.Next(allAdmins.Count))

            Dim newTradeParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("firstPlayerID", firstPlayer))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("secondPlayerID", secondPlayer))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("firstUsername", firstuser))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("secondUsername", seconduser))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("LeagueID", Generator.Next(1, 11)))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("TradeSubmitDate", dateSubmitted))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("TradeStatus", tradeStatus))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("TradeApprovalDate", dateApproved))
            newTradeParams.Add(New MySql.Data.MySqlClient.MySqlParameter("AdminApprovalID", adminApprovalID))

            NickLibrary.ExecuteNonQuery("AddCompletedTrade", newTradeParams)


        Next


    End Sub

    Public Sub GeneratePlayerPoints()

        Dim dateList As New List(Of Date)
        dateList.Add(New Date(2016, 9, 11))
        dateList.Add(New Date(2016, 9, 18))
        dateList.Add(New Date(2016, 9, 25))
        dateList.Add(New Date(2016, 10, 2))
        dateList.Add(New Date(2016, 10, 9))
        dateList.Add(New Date(2016, 10, 16))

        Dim Generator As System.Random = New System.Random()
        'for each player in the league
        For playerID = 2 To 868

            For Each gameDay As Date In dateList
                Dim newScore As New List(Of MySql.Data.MySqlClient.MySqlParameter)
                Dim weekScore = Generator.Next(5, 35)

                newScore.Add(New MySql.Data.MySqlClient.MySqlParameter("PlayerID", playerID))
                newScore.Add(New MySql.Data.MySqlClient.MySqlParameter("Points", weekScore))
                newScore.Add(New MySql.Data.MySqlClient.MySqlParameter("DateAccumulated", gameDay))

                NickLibrary.ExecuteNonQuery("AddPlayerPoint", newScore)
            Next
        Next

    End Sub

    Public Sub ImportTeams()
        Dim teamNames As New List(Of String)
        teamNames.Add("Baltimore Ravens")
        teamNames.Add("Buffalo Bills")
        teamNames.Add("Cincinnati Bengals")
        teamNames.Add("Cleveland Browns")
        teamNames.Add("Denver Broncos")
        teamNames.Add("Houston Texans")
        teamNames.Add("Indianapolis Colts")
        teamNames.Add("Jacksonville Jaguars")
        teamNames.Add("Kansas City Chiefs")
        teamNames.Add("Miami Dolphins")
        teamNames.Add("New England Patriots")
        teamNames.Add("New York Jets")
        teamNames.Add("Oakland Raiders")
        teamNames.Add("Pittsburgh Steelers")
        teamNames.Add("San Diego Chargers")
        teamNames.Add("Tennessee Titans")
        teamNames.Add("Arizona Cardinals")
        teamNames.Add("Atlanta Falcons")
        teamNames.Add("Carolina Panthers")
        teamNames.Add("Chicago Bears")
        teamNames.Add("Dallas Cowboys")
        teamNames.Add("Detroit Lions")
        teamNames.Add("Green Bay Packers")
        teamNames.Add("Los Angeles Rams")
        teamNames.Add("Minnesota Vikings")
        teamNames.Add("New Orleans Saints")
        teamNames.Add("New York Giants")
        teamNames.Add("Philadelphia Eagles")
        teamNames.Add("San Fransisco 49ers")
        teamNames.Add("Seattle Seahawks")
        teamNames.Add("Tampa Bay Buccaneers")
        teamNames.Add("Washington Redskins")
        For Each teamName As String In teamNames
            Dim newTeamParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            newTeamParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newTeamName", teamName))
            NickLibrary.ExecuteNonQuery("CreateNewTeam", newTeamParams)
        Next
    End Sub

    Public Sub ImportPlayers()

        Dim dtQuarterbacks, dtRunningBacks, dtWideReceivers, dtTightEnds, dtDefensiveLinemen, dtLinebackers, dtDefensiveBacks, dtKickers, dtPunters As DataTable
        Dim MyConnection As System.Data.OleDb.OleDbConnection
        Dim DtSet As System.Data.DataSet
        Dim MyCommand As System.Data.OleDb.OleDbDataAdapter
        MyConnection = New System.Data.OleDb.OleDbConnection("Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\Users\nicho\Desktop\Year 3\Databases\Players.xlsx;Extended Properties=""Excel 12.0;HDR=No;IMEX=1""")


        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Quarterbacks$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtQuarterbacks = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Running Backs$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtRunningBacks = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Wide Receivers$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtWideReceivers = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Tight Ends$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtTightEnds = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Defensive Linemen$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtDefensiveLinemen = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Linebackers$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtLinebackers = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Defensive Backs$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtDefensiveBacks = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Kickers$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtKickers = DtSet.Tables(0)

        MyCommand = New System.Data.OleDb.OleDbDataAdapter("select * from [Punters$]", MyConnection)
        MyCommand.TableMappings.Add("Table", "Net-informations.com")
        DtSet = New System.Data.DataSet
        MyCommand.Fill(DtSet)
        dtPunters = DtSet.Tables(0)

        MyConnection.Close()

        ExportPlayer(dtQuarterbacks, "Quarterback")
        ExportPlayer(dtRunningBacks, "Running Back")
        ExportPlayer(dtWideReceivers, "Wide Receiver")
        ExportPlayer(dtTightEnds, "Tight End")
        ExportPlayer(dtDefensiveBacks, "Defensive Back")
        ExportPlayer(dtLinebackers, "Linebacker")
        ExportPlayer(dtDefensiveLinemen, "Defensive Linemen")
        ExportPlayer(dtKickers, "Kicker")
        ExportPlayer(dtPunters, "Punter")

    End Sub

    Public Sub ExportPlayer(ByVal dtPlayers As DataTable, ByVal position As String)

        Dim Generator As System.Random = New System.Random()
        For Each row As DataRow In dtPlayers.Rows
            Dim firstName, lastName As String
            Dim TeamID As Int32
            TeamID = Generator.Next(1, 33)
            firstName = row(0)
            lastName = row(1).ToString().Substring(0, row(1).ToString.Length - 1)
            Dim playerParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            playerParams.Add(New MySql.Data.MySqlClient.MySqlParameter("teamID", TeamID))
            playerParams.Add(New MySql.Data.MySqlClient.MySqlParameter("firstName", firstName))
            playerParams.Add(New MySql.Data.MySqlClient.MySqlParameter("lastName", lastName))
            playerParams.Add(New MySql.Data.MySqlClient.MySqlParameter("position", position))
            NickLibrary.ExecuteNonQuery("AddNewPlayer", playerParams)
        Next



    End Sub

    Public Sub CreateAllUser()
        Dim FirstNames As New List(Of String)
        Dim LastNames As New List(Of String)
        Dim Usernames As New List(Of String)
        Dim PasswordChars As New List(Of Char)

        FirstNames.Add("James")
        FirstNames.Add("John")
        FirstNames.Add("Robert")
        FirstNames.Add("Michael")
        FirstNames.Add("William")
        FirstNames.Add("David")
        FirstNames.Add("Richard")
        FirstNames.Add("Charles")
        FirstNames.Add("Joseph")
        FirstNames.Add("Thomas")
        FirstNames.Add("Chris")
        FirstNames.Add("Daniel")
        FirstNames.Add("Paul")
        FirstNames.Add("Mark")
        FirstNames.Add("Donald")
        FirstNames.Add("George")
        FirstNames.Add("Kenneth")
        FirstNames.Add("Steven")
        FirstNames.Add("Edward")
        FirstNames.Add("Brian")
        FirstNames.Add("Ronald")
        FirstNames.Add("Anthony")
        FirstNames.Add("Kevin")
        FirstNames.Add("Jason")
        FirstNames.Add("Matthew")
        FirstNames.Add("Gary")
        FirstNames.Add("Timothy")
        FirstNames.Add("Jose")
        FirstNames.Add("Larry")
        FirstNames.Add("Jeffrey")

        LastNames.Add("Smith")
        LastNames.Add("Jones")
        LastNames.Add("Brown")
        LastNames.Add("Johnson")
        LastNames.Add("Williams")
        LastNames.Add("Miller")
        LastNames.Add("Davis")
        LastNames.Add("Taylor")
        LastNames.Add("Wilson")
        LastNames.Add("White")
        LastNames.Add("Clark")
        LastNames.Add("Hally")
        LastNames.Add("Thomas")
        LastNames.Add("Thompson")
        LastNames.Add("Moore")
        LastNames.Add("Hiller")
        LastNames.Add("Tryniski")
        LastNames.Add("Allen")
        LastNames.Add("Martin")
        LastNames.Add("Walker")
        LastNames.Add("Wright")
        LastNames.Add("Woods")
        LastNames.Add("Robinson")
        LastNames.Add("Lewis")
        LastNames.Add("Adams")
        LastNames.Add("Anderson")
        LastNames.Add("Jackson")
        LastNames.Add("Green")
        LastNames.Add("Baker")
        LastNames.Add("Evans")
        LastNames.Add("Kingly")
        LastNames.Add("Johnn")
        LastNames.Add("Harris")
        LastNames.Add("Young")
        LastNames.Add("Scott")

        PasswordChars.Add("!")
        PasswordChars.Add("@")
        PasswordChars.Add("#")
        PasswordChars.Add("$")
        PasswordChars.Add("%")
        PasswordChars.Add("^")
        PasswordChars.Add("1")
        PasswordChars.Add("2")
        PasswordChars.Add("3")
        PasswordChars.Add("4")
        PasswordChars.Add("5")
        PasswordChars.Add("6")
        PasswordChars.Add("7")
        PasswordChars.Add("8")
        PasswordChars.Add("9")
        PasswordChars.Add("A")
        PasswordChars.Add("B")
        PasswordChars.Add("Q")
        PasswordChars.Add("E")
        PasswordChars.Add("W")
        PasswordChars.Add("T")
        PasswordChars.Add("G")
        PasswordChars.Add("K")
        PasswordChars.Add("L")
        PasswordChars.Add("_")
        PasswordChars.Add("H")
        PasswordChars.Add("N")
        PasswordChars.Add("I")
        PasswordChars.Add("V")
        PasswordChars.Add("I")
        PasswordChars.Add("&")
        PasswordChars.Add("Z")
        PasswordChars.Add("a")
        PasswordChars.Add("s")
        PasswordChars.Add("g")
        PasswordChars.Add("m")
        PasswordChars.Add("v")
        PasswordChars.Add("i")
        PasswordChars.Add("p")
        PasswordChars.Add("o")
        PasswordChars.Add("I")
        PasswordChars.Add("U")
        PasswordChars.Add("Y")
        PasswordChars.Add("T")
        PasswordChars.Add("G")
        PasswordChars.Add("B")
        PasswordChars.Add("N")
        PasswordChars.Add("M")
        PasswordChars.Add("!")
        PasswordChars.Add("S")
        PasswordChars.Add("F")
        PasswordChars.Add("G")
        PasswordChars.Add("R")
        PasswordChars.Add("T")
        PasswordChars.Add("Y")
        PasswordChars.Add("U")

        Dim Generator As System.Random = New System.Random()

        Dim x As Int32 = PasswordChars.Count

        For i As Int32 = 0 To 100
            Dim password As String = ""
            For j As Int32 = 0 To 8
                password = password + PasswordChars(Generator.Next(PasswordChars.Count - 1)).ToString()
            Next
            Dim firstName As String = FirstNames(Generator.Next(FirstNames.Count - 1))
            Dim lastName As String = LastNames(Generator.Next(LastNames.Count - 1))
            Dim username As String = firstName(0) + lastName.Substring(0, 5)
            If Usernames.Contains(username) Then
                Continue For
            End If
            Usernames.Add(username)
            Dim procedureParams As New List(Of MySql.Data.MySqlClient.MySqlParameter)
            procedureParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newUsername", username))
            procedureParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newPassword", password))
            procedureParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newFirstName", firstName))
            procedureParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newLastname", lastName))
            procedureParams.Add(New MySql.Data.MySqlClient.MySqlParameter("newRole", 0))
            NickLibrary.ExecuteNonQuery("CreateNewUser", procedureParams)
        Next

    End Sub
End Class