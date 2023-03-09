CREATE TABLE [dbo].[MemberTypes] (
    [ID]                  INT           IDENTITY (1, 1) NOT NULL,
    [ShortName]           VARCHAR (20)  NOT NULL,
    [LongName]            VARCHAR (255) NOT NULL,
    [IsWorkingMembership] CHAR (1)      NOT NULL,
    CONSTRAINT [PK_MemberTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);

