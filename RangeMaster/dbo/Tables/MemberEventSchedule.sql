CREATE TABLE [dbo].[MemberEventSchedule] (
    [EventDate]    DATE NOT NULL,
    [MemberID]     INT  NOT NULL,
    [EventTypeID]  INT  NOT NULL,
    [DutyTypeID]   INT  NOT NULL,
    [DutyStatusID] INT  NOT NULL,
    CONSTRAINT [PK_MemberEventSchedule] PRIMARY KEY CLUSTERED ([EventDate] ASC, [MemberID] ASC, [EventTypeID] ASC, [DutyTypeID] ASC),
    CONSTRAINT [FK_MemberEventSchedule_DutyStatus] FOREIGN KEY ([DutyStatusID]) REFERENCES [dbo].[DutyStatus] ([ID]),
    CONSTRAINT [FK_MemberEventSchedule_DutyTypes] FOREIGN KEY ([DutyTypeID]) REFERENCES [dbo].[DutyTypes] ([ID]),
    CONSTRAINT [FK_MemberEventSchedule_EventTypes] FOREIGN KEY ([EventTypeID]) REFERENCES [dbo].[EventTypes] ([ID]),
    CONSTRAINT [FK_MemberEventSchedule_Members] FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Members] ([ID])
);

