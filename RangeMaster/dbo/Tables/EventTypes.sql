CREATE TABLE [dbo].[EventTypes] (
    [ID]          INT           IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (255) NOT NULL,
    [StartTime]   TIME (0)      NOT NULL,
    [EndTime]     TIME (0)      NOT NULL,
    [HoursCredit] TINYINT       NOT NULL,
    CONSTRAINT [PK_EventTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

