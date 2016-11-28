-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: m_and_n_fantasy_sports
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `tradeinformation`
--

DROP TABLE IF EXISTS `tradeinformation`;
/*!50001 DROP VIEW IF EXISTS `tradeinformation`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `tradeinformation` AS SELECT 
 1 AS `TradeID`,
 1 AS `LeagueID`,
 1 AS `FirstUsername`,
 1 AS `FirstUserScore`,
 1 AS `FirstPlayerID`,
 1 AS `FirstPlayerTeamName`,
 1 AS `FirstPlayerFirstName`,
 1 AS `FirstPlayerLastName`,
 1 AS `FirstPlayerPosition`,
 1 AS `FirstPlayerPoints`,
 1 AS `SecondUsername`,
 1 AS `SecondUserScore`,
 1 AS `SecondPlayerID`,
 1 AS `SecondPlayerTeamName`,
 1 AS `SecondPlayerFirstName`,
 1 AS `SecondPlayerLastName`,
 1 AS `SecondPlayerPosition`,
 1 AS `SecondPlayerPoints`,
 1 AS `TradeSubmitDate`,
 1 AS `TradeStatus`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `userpoints`
--

DROP TABLE IF EXISTS `userpoints`;
/*!50001 DROP VIEW IF EXISTS `userpoints`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userpoints` AS SELECT 
 1 AS `Username`,
 1 AS `LeagueID`,
 1 AS `UserLeaguePoints`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `tradeinformation`
--

/*!50001 DROP VIEW IF EXISTS `tradeinformation`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tradeinformation` AS select `th`.`TradeID` AS `TradeID`,`th`.`LeagueID` AS `LeagueID`,`th`.`FirstUsername` AS `FirstUsername`,(select `up`.`UserLeaguePoints` from `userpoints` `up` where ((`th`.`FirstUsername` = `up`.`Username`) and (`th`.`LeagueID` = `up`.`LeagueID`))) AS `FirstUserScore`,`th`.`FirstPlayerID` AS `FirstPlayerID`,`t1`.`TeamName` AS `FirstPlayerTeamName`,`p1`.`FirstName` AS `FirstPlayerFirstName`,`p1`.`LastName` AS `FirstPlayerLastName`,`p1`.`Position` AS `FirstPlayerPosition`,(select sum(`subpph`.`Points`) from (`players` `subp` join `playerpointhistory` `subpph` on((`subp`.`PlayerID` = `subpph`.`PlayerID`))) where (`subp`.`PlayerID` = `th`.`FirstPlayerID`)) AS `FirstPlayerPoints`,`th`.`SecondUsername` AS `SecondUsername`,(select `up`.`UserLeaguePoints` from `userpoints` `up` where ((`th`.`SecondUsername` = `up`.`Username`) and (`th`.`LeagueID` = `up`.`LeagueID`))) AS `SecondUserScore`,`th`.`SecondPlayerID` AS `SecondPlayerID`,`t2`.`TeamName` AS `SecondPlayerTeamName`,`p2`.`FirstName` AS `SecondPlayerFirstName`,`p2`.`LastName` AS `SecondPlayerLastName`,`p2`.`Position` AS `SecondPlayerPosition`,(select sum(`subpph`.`Points`) from (`players` `subp` join `playerpointhistory` `subpph` on((`subp`.`PlayerID` = `subpph`.`PlayerID`))) where (`subp`.`PlayerID` = `th`.`SecondPlayerID`)) AS `SecondPlayerPoints`,`th`.`TradeSubmitDate` AS `TradeSubmitDate`,`th`.`TradeStatus` AS `TradeStatus` from ((((`tradehistory` `th` join `players` `p1` on((`th`.`FirstPlayerID` = `p1`.`PlayerID`))) join `players` `p2` on((`th`.`SecondPlayerID` = `p2`.`PlayerID`))) join `team` `t1` on((`p1`.`TeamID` = `t1`.`TeamID`))) join `team` `t2` on((`p2`.`TeamID` = `t2`.`TeamID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userpoints`
--

/*!50001 DROP VIEW IF EXISTS `userpoints`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `userpoints` AS select `ul`.`Username` AS `Username`,`ul`.`LeagueID` AS `LeagueID`,sum(`pph`.`Points`) AS `UserLeaguePoints` from ((`userleagues` `ul` join `roster` `r` on(((`ul`.`Username` = `r`.`Username`) and (`ul`.`LeagueID` = `r`.`LeagueID`)))) join `playerpointhistory` `pph` on((`r`.`PlayerID` = `pph`.`PlayerID`))) group by `ul`.`LeagueID`,`ul`.`Username` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'm_and_n_fantasy_sports'
--

--
-- Dumping routines for database 'm_and_n_fantasy_sports'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddCompletedTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddCompletedTrade`(
	firstPlayerID int,
    secondPlayerID int,
    firstUsername varchar(255),
    secondUsername varchar(255),
    LeagueID int,
    TradeSubmitDate date,
    TradeStatus varchar(255),
    TradeApprovalDate date,
    AdminApprovalID varchar(255)
)
BEGIN

INSERT INTO
	TradeHistory(
		LeagueID,
		FirstPlayerID,
		SecondPlayerID,
		FirstUsername,
		SecondUsername,
		TradeStatus,
        TradeSubmitDate,
		TradeApprovalDate,
		AdminApprovalID)
	VALUES(
		LeagueID,
		firstPlayerID,
		secondPlayerID,
		firstUsername,
		secondUsername,
		TradeStatus,
		TradeSubmitDate,
		TradeApprovalDate,
		AdminApprovalID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddNewPlayer` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddNewPlayer`(
	teamID int, 
    firstName varchar(255),
    lastName varchar(255),
    position varchar(255))
BEGIN

INSERT INTO
	Players(
		TeamID,
        FirstName,
        LastName,
        Position)
	VALUES(
		TeamID,
        FirstName,
        LastName,
        Position);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPlayerPoint` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPlayerPoint`(
	PlayerID int,
    Points int,
    DateAccumulated date)
BEGIN

INSERT INTO
	PlayerPointHistory(
		PlayerID,
        Points,
        DateAccumulated)
VALUES(
	PlayerID,
    Points,
    DateAccumulated);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddPlayerToRoster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddPlayerToRoster`(
	Username varchar(255),
    LeagueID int,
    PlayerID int)
BEGIN

INSERT INTO
	Roster(
		Username,
        LeagueID,
        PlayerID)
VALUES(
	Username,
    LeagueID,
    PlayerID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AddUserToLeague` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AddUserToLeague`(
	NewLeagueID int,
	Username varchar(255))
BEGIN

START TRANSACTION;
INSERT INTO
	userleagues(
		Username,
        LeagueID)
VALUES(
	Username,
    NewLeagueID);
    
SET @CurrentNumberOfUsers = (SELECT NumberOfUsers FROM League WHERE LeagueID = NewLeagueID);

UPDATE
	League
SET
	NumberOFUsers = 1 + @CurrentNumberOfUsers
WHERE
	LeagueID = NewLeagueID;

COMMIT;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminAcceptTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminAcceptTrade`(
	AdminID varchar(255),
    TradeID int
)
BEGIN
UPDATE tradehistory
SET tradestatus="Approved", AdminApprovalID=AdminID, TradeApprovalDate=CURRENT_DATE
WHERE tradeHistory.tradeID=TradeID;
DELETE FROM
roster
WHERE
Username=(
SELECT FirstUserName
FROM TradeHistory th
WHERE th.TradeID=TradeID)
AND LeagueID=(
SELECT LeagueID
FROM TradeHistory th
WHERE th.TradeID=TradeID)
AND PlayerID=(
SELECT FirstPlayerID
FROM TradeHistory th
WHERE th.TradeID=TradeID);
DELETE FROM
roster
WHERE
Username=(
SELECT SecondUserName
FROM TradeHistory th
WHERE th.TradeID=TradeID)
AND LeagueID=(
SELECT LeagueID
FROM TradeHistory th
WHERE th.TradeID=TradeID)
AND PlayerID=(
SELECT SecondPlayerID
FROM TradeHistory th
WHERE th.TradeID=TradeID);
INSERT INTO roster
VALUES((
SELECT SecondUsername
FROM tradehistory th
WHERE th.TradeID=TradeID),
(SELECT LeagueID
FROM tradehistory th
WHERE th.TradeID=TradeID),
(SELECT FirstPlayerID
FROM TradeHistory th
WHERE th.TradeID=TradeID));
INSERT INTO roster
VALUES((
SELECT FirstUsername
FROM tradehistory th
WHERE th.TradeID=TradeID),
(SELECT LeagueID
FROM tradehistory th
WHERE th.TradeID=TradeID),
(SELECT SecondPlayerID
FROM TradeHistory th
WHERE th.TradeID=TradeID));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminGetUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminGetUsers`()
BEGIN
SELECT u.username,u.FirstName, u.LastName, COUNT(DISTINCT r.leagueID)AS NumberOfJoinedLeagues,
TRUNCATE(SUM(p.Points)/COUNT(DISTINCT r.leagueID),2) AS AverageScorePerLeague, SUM(p.points) AS TotalScoreAllLeagues
FROM User u, Roster r, PlayerpointHistory p
WHERE u.username=r.username AND
	  r.playerID=p.playerID
GROUP BY u.username;
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminRejectAllTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminRejectAllTrades`(
	AdminID varchar(255)
)
BEGIN
UPDATE TradeHistory t
SET t.TradeStatus="RejectedByAdmin",t.AdminApprovalID=AdminID , t.TradeApprovalDate=CURRENT_DATE
WHERE t.TradeStatus="PendingAdminApproval";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminRejectTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminRejectTrade`(
	AdminID varchar(255),
    TradeID int
)
BEGIN
UPDATE tradehistory
SET tradestatus="RejectedByAdmin", AdminApprovalID=AdminID, TradeApprovalDate=CURRENT_DATE
WHERE tradeHistory.tradeID=TradeID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AdminRemoveUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AdminRemoveUser`(
	Username varchar(255)
)
BEGIN
UPDATE League
SET NumberOfUsers=NumberOfUsers-1
WHERE LeagueID IN(
SELECT x.LeagueID
FROM User u, userleagues x
WHERE u.username=x.username AND
	  u.username=Username);
DELETE 
FROM Roster
WHERE Roster.username=Username;
DELETE
FROM UserLeagues
WHERE UserLeagues.username=Username;
DELETE
FROM tradehistory
WHERE FirstUsername = Username OR SecondUsername = Username;
DELETE
FROM User
WHERE User.username=Username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `AuthenticateLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AuthenticateLogin`(
	enteredUsername varchar(255), 
    enteredPassword varchar(255))
BEGIN

SELECT
	Username,
    Role
FROM
	User
WHERE
	Username = enteredUsername 
    AND (Password = enteredPassword OR enteredPassword is null);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ChangePassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ChangePassword`(
	userAccountToChange varchar(255),
    newPassword varchar(255))
BEGIN

UPDATE
	User
SET
	Password = newPassword
WHERE
	Username = UserAccountToChange;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewInjury` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewInjury`(
	playerID int,
    InjuryDescription varchar(255),
    DateOfInjury date,
    DateOfReturn date
)
BEGIN

INSERT INTO
	Injuries(
    PlayerID,
    InjuryDescription,
    DateOfInjury,
    DateOfReturn
    )
    
    VALUES(
    playerID,
    InjuryDescription,
    DateOfInjury,
    DateOfReturn
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewTeam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`nvanbomm`@`%` PROCEDURE `CreateNewTeam`(
	newTeamName varchar(255))
BEGIN

INSERT INTO
	Team(
		TeamName)
VALUES(
	newTeamName);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CreateNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateNewUser`(
	newUsername varchar(255),
    newPassword varchar(255),
    newFirstName varchar(255),
    newLastName varchar(255),
    newRole int)
BEGIN

INSERT INTO
	User(
		Username,
		Password,
		FirstName,
		LastName,
		Role)
    
    Values(
		newUserName,
        newPassword,
        newFirstName,
        newLastName,
        newRole);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DropPlayerFromRoster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DropPlayerFromRoster`(
	Username VarChar(255),
    LeagueID int,
    PlayerID int)
BEGIN
DELETE FROM roster
WHERE roster.PlayerID=PlayerID AND
      roster.LeagueID=LeagueID AND
      roster.Username=Username;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminCompletedTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminCompletedTrades`()
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername, l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore,l.SecondUsername AS SecondUsername, 
l.SecondPlayerID AS SecondPlayerID, l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate,
t.TradeApprovalDate AS TradeApprovalDate, t.AdminApprovalID as AdminApprovalID 
FROM m_and_n_fantasy_sports.tradeinformation l, tradehistory t
WHERE l.TradeID=t.TradeID AND
      l.TradeStatus="Approved";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminPendingTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminPendingTrades`()
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername,l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore,l.SecondUsername AS SecondUsername, l.SecondPlayerID AS SecondPlayerID,
l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate
FROM m_and_n_fantasy_sports.tradeinformation l
WHERE l.TradeStatus="PendingAdminApproval";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminRejectedTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminRejectedTrades`(
)
BEGIN
SELECT DISTINCT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername,l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore,l.SecondUsername AS SecondUsername,
 l.SecondPlayerID AS SecondPlayerID, l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate,
t.TradeApprovalDate AS TradeApprovalDate, IF(t.tradeStatus="RejectedByUser","User","Admin") AS Rejector
FROM m_and_n_fantasy_sports.tradeinformation l, tradehistory t
WHERE l.TradeID=t.TradeID AND 
      (t.tradeStatus="RejectedByUser" OR t.tradeStatus="RejectedByAdmin");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAdminUserPendingTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAdminUserPendingTrades`()
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername,l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore,l.SecondUsername AS SecondUsername, l.SecondPlayerID AS SecondPlayerID,
l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate
FROM m_and_n_fantasy_sports.tradeinformation l
WHERE l.TradeStatus="PendingUserApproval";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllPlayerIDs` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllPlayerIDs`()
BEGIN

SELECT
	PlayerID
FROM
	Players;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetAllUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetAllUsers`()
BEGIN

SELECT
	Username
FROM
	User
WHERE
	role = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCompletedTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCompletedTrades`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername, l.FirstUserScore AS FirstUserScore, l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore, l.SecondPlayerID AS SecondPlayerID,
l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate,
t.TradeApprovalDate AS TradeApprovalDate, t.AdminApprovalID as AdminApprovalID, l.SecondUsername as SecondUsername
FROM m_and_n_fantasy_sports.tradeinformation l, tradehistory t
WHERE l.TradeID=t.TradeID AND l.LeagueID=LeagueID AND
	  (l.FirstUsername=Username OR l.SecondUsername=Username) AND
      l.TradeStatus="Approved";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetInjuries` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetInjuries`(
playerID int)
BEGIN
SELECT *
FROM injuries
WHERE injuries.playerID=playerID;
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetLeagues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetLeagues`()
BEGIN

IF NumberOfusers < 10 then
	Select
		LeagueID,
		LeagueName,
		NumberOfUsers,
		10,
        false
	FROM
		League;
ELSE
	Select
		LeagueID,
		LeagueName,
		NumberOfUsers,
		10,
        true
	FROM
		League;    
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetNonUserLeagues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetNonUserLeagues`(
	Username varchar(255))
BEGIN

SELECT DISTINCT
    l.leagueID, l.leagueName, l.NumberofUsers
FROM
	League l
WHERE username NOT IN(SELECT r.username
						FROM userleagues r
						WHERE r.username=username 
                        AND r.leagueID=l.leagueID)
ORDER BY l.LeagueID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetOfferedTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetOfferedTrades`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT l.TradeID AS TradeID, l.SecondUsername AS SecondUsername, l.SecondUserScore AS SecondUserScore, l.SecondPlayerID AS SecondPlayerID, 
l.SecondPlayerTeamName AS SecondPlayerTeamName, l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.FirstPlayerID AS FirstPlayerID,
l.FirstPlayerTeamName AS FirstPlayerTeamName,l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS PlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore, l.TradeSubmitDate AS TradeSubmitDate
FROM m_and_n_fantasy_sports.tradeinformation l
WHERE l.LeagueID=LeagueID AND
	  l.FirstUsername=Username AND
      l.TradeStatus="PendingUserApproval";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPendingTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPendingTrades`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername, l.FirstUserScore AS FirstUserScore, l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore, l.SecondPlayerID AS SecondPlayerID,
l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate
FROM m_and_n_fantasy_sports.tradeinformation l
WHERE l.LeagueID=LeagueID AND
	  l.SecondUsername=Username AND
      l.TradeStatus="PendingUserApproval";
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPlayerInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPlayerInfo`(
	playerID int
)
BEGIN
SELECT pp.playerID AS PlayerID, pp.FirstName, pp.LastName, t.TeamName, pp.position AS Position, 
Truncate(AVG(p.points),2) AS AverageScore, SUM(p.points) AS TotalScore
FROM playerpointhistory p, team t, players pp
WHERE p.playerID=pp.playerID AND
	  t.teamID=pp.teamID AND
      p.playerID=playerID
GROUP BY pp.playerID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPlayers`(
    TeamID int,
    Position varchar(255),
    MinScore int,
    MaxScore int,
    sortIndex int)
BEGIN
IF sortIndex=0 THEN
	SELECT 
		SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
		TRUNCATE(avg(p.points),2) AS AverageScore,
        pp.playerID AS PlayerID, 
		pp.FirstName,
        pp.LastName,
        pp.Position,
        t.teamName AS TeamName,
        COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
			FROM 
				playerpointhistory p
			JOIN 
				players pp
			ON
				p.PlayerID = pp.PlayerID
			JOIN
                team t
			ON
				t.TeamID = pp.TeamID
			JOIN
                injuries i
			ON
				i.PlayerID = p.PlayerID
			WHERE 
				  (TeamID IS NULL OR t.teamID=TeamID) 
                  AND(Position IS NULL or pp.position=Position)
			GROUP BY  p.playerID
			HAVING 
				TRUNCATE(avg(p.points),2)>=MinScore 
                AND TRUNCATE(avg(p.points),2)<=MaxScore
			ORDER BY TotalPoints;
ELSEIF sortIndex=1 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY TotalPoints DESC;
ELSEIF sortIndex=2 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY AverageScore;
ELSEIF sortIndex=3 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY AverageScore DESC;
ELSEIF sortIndex=4 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY PlayerID;
ELSEIF sortIndex=5 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY PlayerID DESC;
ELSEIF sortIndex=6 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.FirstName;
ELSEIF sortIndex=7 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.FirstName DESC;
ELSEIF sortIndex=8 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
			TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.LastName;
ELSEIF sortIndex=9 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.LastName DESC;
ELSEIF sortIndex=10 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.Position;
ELSEIF sortIndex=11 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY pp.position DESC;
        
ELSEIF sortIndex=12 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY TeamName;
ELSEIF sortIndex=13 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2)>=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY TeamName DESC;
ELSEIF sortIndex=14 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY NumberOfInjuries;
ELSEIF sortIndex=15 THEN
SELECT SUM(p.points)/COUNT(DISTINCT i.DateOfInjury) AS TotalPoints, 
TRUNCATE(avg(p.points),2) AS AverageScore,pp.playerID AS PlayerID, 
pp.FirstName, pp.LastName, pp.Position, t.teamName AS TeamName, COUNT(DISTINCT i.DateOfInjury) AS NumberOfInjuries
		FROM playerpointhistory p, players pp, team t, injuries i
		WHERE p.playerID=pp.playerID AND
              t.teamID=pp.teamID AND
              i.playerID=p.playerID AND
              (TeamID IS NULL OR t.teamID=TeamID) AND
			  (Position IS NULL or pp.position=Position)
		GROUP BY  p.playerID
        HAVING TRUNCATE(avg(p.points),2) >=MinScore AND
              TRUNCATE(avg(p.points),2) <=MaxScore
		ORDER BY NumberOfInjuries DESC;
ELSE
SELECT NULL;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetPositions` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetPositions`()
BEGIN

SELECT DISTINCT Position 
FROM Players;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetRejectedTrades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetRejectedTrades`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT l.TradeID AS TradeID, l.FirstUsername AS FirstUsername, l.FirstUserScore AS FirstUserScore, l.FirstPlayerID AS FirstPlayerID, 
l.FirstPlayerTeamName AS FirstPlayerTeamName, l.FirstPlayerFirstName AS FirstPlayerFirstName, l.FirstPlayerLastName AS FirstPlayerLastName, 
l.FirstPlayerPosition AS FirstPlayerPosition, l.FirstPlayerPoints AS FirstPlayerScore, l.SecondPlayerID AS SecondPlayerID,
l.SecondPlayerTeamName AS SecondPlayerTeamName,l.SecondPlayerFirstName AS SecondPlayerFirstName, l.SecondPlayerLastName AS SecondPlayerLastName, 
l.SecondPlayerPosition AS SecondPlayerPosition, l.SecondPlayerPoints AS SecondPlayerScore, l.TradeSubmitDate AS TradeSubmitDate,
t.TradeApprovalDate AS TradeApprovalDate,IF(t.tradeStatus="RejectedByUser","User","Admin") AS Rejector, l.SecondUsername as SecondUsername
FROM m_and_n_fantasy_sports.tradeinformation l, tradehistory t
WHERE l.TradeID=t.TradeID AND l.LeagueID=LeagueID AND
	  (l.FirstUsername=Username OR l.SecondUsername=Username) AND
      (t.tradeStatus="RejectedByUser" OR t.tradeStatus="RejectedByAdmin");
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTeams` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTeams`()
BEGIN

SELECT * 
FROM Team;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTradeUsers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetTradeUsers`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT userleagues.username as Username
FROM userleagues
WHERE userleagues.LeagueID=LeagueID AND
	  userleagues.username!=Username;
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserLeagueRoster` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserLeagueRoster`(
    Username varchar(255),
    LeagueID int)
BEGIN


SELECT DISTINCT
    Roster.PLayerID,
    Players.TeamID,
    TeamName,
    FirstName,
    LastName,
    Position,
    (SELECT SUM(Points) FROM PlayerPointHistory WHERE PlayerPointHistory.PlayerID = Roster.PlayerID) AS PlayerPoints
FROM
	Roster
LEFT OUTER JOIN
	Players
ON
	Roster.PlayerID = Players.PlayerID
JOIN
	Team
ON
	Players.TeamID = Team.TeamID
WHERE
	Roster.Username = Username
    AND Roster.LeagueID = LeagueID
ORDER BY
	PlayerID;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserLeagues` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserLeagues`(
	Username varchar(255))
BEGIN

SELECT DISTINCT
    l.leagueID, l.leagueName, l.NumberofUsers
FROM
	League l
WHERE username IN(SELECT r.username
						FROM userleagues r
						WHERE r.username=username 
                        AND r.leagueID=l.leagueID)
ORDER BY l.LeagueID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPlayers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserPlayers`(
Username varchar(255),
LeagueID int)
BEGIN
SELECT p.playerID,CONCAT(p.PlayerID, " ",":"," ",p.FirstName," ",p.LastName," ","(", t.TeamName,")") AS PlayerInfo
FROM team t, roster r, players p
WHERE t.teamID=p.teamID AND
	  r.playerID=p.playerID AND
      r.username=Username AND
      r.leagueID=LeagueID;
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserPlayersByPosition` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserPlayersByPosition`(
Username varchar(255),
LeagueID int,
Position varchar(255))
BEGIN
SELECT p.playerID,CONCAT(p.PlayerID, " ",":"," ",p.FirstName," ",p.LastName," ","(", t.TeamName,")") AS PlayerInfo
FROM team t, roster r, players p
WHERE t.teamID=p.teamID AND
	  r.playerID=p.playerID AND
      r.username=Username AND
      r.leagueID=LeagueID AND
      (Position IS NULL OR p.position=position);
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUsersByLeague` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsersByLeague`(
LeagueID int
)
BEGIN
SELECT u.username, u.FirstName, u.LastName,SUM(p.points) AS TotalScore
FROM playerpointhistory p, User u, Roster r
WHERE p.playerID=r.playerID AND
	  u.username=r.username AND 
	  r.leagueID=LeagueID
GROUP BY u.username
ORDER BY TotalScore DESC;
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetUserStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserStats`(
	Username varchar(255),
    LeagueID int)
BEGIN

SELECT (			
		SELECT Max(ScoreTotal)
		FROM(
			SELECT 
				SUM(p.points) AS ScoreTotal
				FROM 
					playerpointhistory p
				JOIN 
					roster r
				ON 
					p.PlayerID = r.PlayerID
				WHERE 
					r.username=Username 
                    AND r.leagueID=LeagueID
				GROUP BY p.playerID) AS max		
        )AS MaxScore,
        

		(
        SELECT Min(ScoreTotal)
		FROM(
			SELECT SUM(p.points) AS ScoreTotal
			FROM 
				playerpointhistory p
			JOIN 
				roster r
            ON 
				r.PlayerID =p.PlayerID
			WHERE
				r.username=Username 
                AND r.leagueID=LeagueID
			GROUP BY p.playerID)AS minScore
        )AS MinScore,
       
		(
		SELECT 
			SUM(p.Points) AS TotalPlayerPoints
			FROM 
				roster r
			JOIN 
				playerpointhistory p
			ON 
				r.PlayerID = p.PlayerID
            JOIN 
				league l
            ON
				r.LeagueID = l.LeagueID
			WHERE 
			  r.username=Username 
              AND l.leagueID=LeagueID
		) AS TotalTeamPoints,
      
		(
		SELECT COUNT(DISTINCT p.playerID) AS TotalPlayers
		FROM 
			roster r
		JOIN 
			playerpointhistory p
		ON
			p.PlayerID = r.PlayerID
		JOIN
			league l
		ON 
			r.LeagueID = l.LeagueID
		WHERE 
	          r.username=Username 
              AND l.leagueID=LeagueID
		) AS NumberOfPlayers;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `InsertUserIntoLeague` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertUserIntoLeague`(
	Username varchar(255),
    LeagueID int)
BEGIN

INSERT INTO UserLeagues
VALUES(username,leagueID);

SET @NumUsers = (SELECT NumberOfUsers from League l WHERE LeagueID=l.LeagueID);
UPDATE League l
SET NumberOfUsers= @NumUsers+1
WHERE LeagueID=l.LeagueID;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SubmitTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SubmitTrade`(
LeagueID int,
FirstPlayerID int,
SecondPlayerID int,
FirstUsername varchar(255),
SecondUsername varchar(255),
TradeStatus varchar(255),
TradeSubmitDate date)
BEGIN
INSERT INTO TradeHistory(LeagueID,FirstPlayerID,SecondPlayerID,FirstUsername,SecondUsername,TradeStatus,TradeSubmitDate,TradeApprovalDate,AdminApprovalID)
VALUES(LeagueID,FirstPlayerID,SecondPlayerID,FirstUsername,SecondUsername,TradeStatus, TradeSubmitDate, NULL, NULL);
	  
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserAcceptTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserAcceptTrade`(
TradeID int)
BEGIN
UPDATE TradeHistory
SET tradeStatus="PendingAdminApproval", TradeApprovalDate=NULL
WHERE TradeHistory.TradeID=TradeID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UserRejectTrade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `UserRejectTrade`(
TradeID int)
BEGIN
UPDATE TradeHistory
SET tradeStatus="RejectedByUser", TradeApprovalDate=CURRENT_DATE
WHERE TradeHistory.TradeID=TradeID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-25 12:07:21
