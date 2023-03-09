CREATE TABLE [dbo].[EventSchedule] (
    [EventDate]   DATE NOT NULL,
    [EventTypeID] INT  NOT NULL,
    CONSTRAINT [PK_EventSchedule] PRIMARY KEY CLUSTERED ([EventDate] ASC, [EventTypeID] ASC),
    CONSTRAINT [FK_EventSchedule_EventTypes] FOREIGN KEY ([EventTypeID]) REFERENCES [dbo].[EventTypes] ([ID])
);

