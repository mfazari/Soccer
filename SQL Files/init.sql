USE master;
GO

-- Create Table
CREATE DATABASE SoccerDB;
GO

USE SoccerDB;
GO

CREATE TABLE Players (
    PlayerId INT PRIMARY KEY IDENTITY(1,1),
    PlayerName NVARCHAR(100),
    Position NVARCHAR(50),
    JerseyNumber INT,
    GoalsScored INT
);
GO

-- Add Player
CREATE PROCEDURE AddPlayer
    @PlayerName NVARCHAR(100),
    @Position NVARCHAR(50),
    @JerseyNumber INT,
    @GoalsScored INT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Players WHERE JerseyNumber = @JerseyNumber)
    BEGIN
        RAISERROR ('Player with the provided Jersey Number already exists.', 16, 1);
        RETURN;
    END

    INSERT INTO Players (PlayerName, Position, JerseyNumber, GoalsScored)
    VALUES (@PlayerName, @Position, @JerseyNumber, @GoalsScored);

    SELECT 'Player added successfully.' AS Result;
END
GO

-- Remove Player
CREATE PROCEDURE RemovePlayer
    @PlayerId INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Players WHERE PlayerId = @PlayerId)
    BEGIN
        RAISERROR ('Player with the provided PlayerId does not exist.', 16, 1);
        RETURN;
    END

    DELETE FROM Players WHERE PlayerId = @PlayerId;

    SELECT 'Player removed successfully.' AS Result;
END


-- Get all Players
CREATE PROCEDURE GetAllPlayers
AS
BEGIN
    SET NOCOUNT ON;

    -- Retrieve all players from the Players table
    SELECT 
        PlayerId,
        PlayerName,
        Position,
        JerseyNumber,
        GoalsScored
    FROM 
        Players;
END

-- Update Player

CREATE PROCEDURE UpdatePlayerStoredProcedure
    @PlayerId INT,
    @PlayerName NVARCHAR(100),
    @Position NVARCHAR(50),
    @JerseyNumber INT,
    @GoalsScored INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Check if the player exists based on PlayerId
    IF NOT EXISTS (SELECT 1 FROM Players WHERE PlayerId = @PlayerId)
    BEGIN
        RAISERROR ('Player with the provided PlayerId does not exist.', 16, 1);
        RETURN;
    END

    -- Update the player's details in the Players table
    UPDATE Players 
    SET 
        PlayerName = @PlayerName,
        Position = @Position,
        JerseyNumber = @JerseyNumber,
        GoalsScored = @GoalsScored
    WHERE 
        PlayerId = @PlayerId;

    -- Return success
    SELECT 'Player updated successfully.' AS Result;
END

