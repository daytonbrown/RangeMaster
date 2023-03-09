CREATE TABLE [dbo].[DutyStatus] (
    [ID]          INT          IDENTITY (1, 1) NOT NULL,
    [Description] VARCHAR (20) NOT NULL,
    CONSTRAINT [PK_DutyStatus] PRIMARY KEY CLUSTERED ([ID] ASC)
);

