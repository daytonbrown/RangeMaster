CREATE TABLE [dbo].[MemberBlackoutDate] (
    [MemberID]  INT  NOT NULL,
    [StartDate] DATE NOT NULL,
    [EndDate]   DATE NOT NULL,
    CONSTRAINT [PK_MemberBlackoutDate] PRIMARY KEY CLUSTERED ([MemberID] ASC, [StartDate] ASC, [EndDate] ASC),
    CONSTRAINT [FK_MemberBlackoutDate_Members] FOREIGN KEY ([MemberID]) REFERENCES [dbo].[Members] ([ID])
);

