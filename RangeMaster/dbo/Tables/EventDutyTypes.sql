CREATE TABLE [dbo].[EventDutyTypes] (
    [ID]          INT IDENTITY (1, 1) NOT NULL,
    [EventTypeID] INT NOT NULL,
    [DutyTypeID]  INT NOT NULL,
    [NeededCount] INT NOT NULL,
    CONSTRAINT [PK_EventDutyTypeID] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_EventDutyTypes_DutyTypes] FOREIGN KEY ([DutyTypeID]) REFERENCES [dbo].[DutyTypes] ([ID]),
    CONSTRAINT [FK_EventDutyTypes_EventTypes] FOREIGN KEY ([EventTypeID]) REFERENCES [dbo].[EventTypes] ([ID])
);

