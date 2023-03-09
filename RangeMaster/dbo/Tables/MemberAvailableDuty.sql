CREATE TABLE [dbo].[MemberAvailableDuty] (
    [MemberID]    INT NOT NULL,
    [EventTypeID] INT NOT NULL,
    [DutyTypeID]  INT NOT NULL,
    CONSTRAINT [PK_MemberAvailableDuty] PRIMARY KEY CLUSTERED ([MemberID] ASC, [EventTypeID] ASC, [DutyTypeID] ASC),
    CONSTRAINT [FK_MemberAvailableDuty_DutyTypes] FOREIGN KEY ([DutyTypeID]) REFERENCES [dbo].[DutyTypes] ([ID]),
    CONSTRAINT [FK_MemberAvailableDuty_EventTypes] FOREIGN KEY ([EventTypeID]) REFERENCES [dbo].[EventTypes] ([ID]),
    CONSTRAINT [FK_MemberAvailableDuty_Members] FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Members] ([ID])
);

