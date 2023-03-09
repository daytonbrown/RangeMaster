CREATE TABLE [dbo].[DutyTypes] (
    [ID]               INT           IDENTITY (1, 1) NOT NULL,
    [ShortDescription] VARCHAR (3)   NOT NULL,
    [LongDescription]  VARCHAR (255) NOT NULL,
    CONSTRAINT [PK_DutyTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

