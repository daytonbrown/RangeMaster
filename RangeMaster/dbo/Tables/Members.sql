CREATE TABLE [dbo].[Members] (
    [ID]            INT            IDENTITY (1, 1) NOT NULL,
    [FirstName]     NVARCHAR (255) NOT NULL,
    [LastName]      NVARCHAR (255) NOT NULL,
    [Address]       NVARCHAR (255) NULL,
    [City]          NVARCHAR (255) NULL,
    [State]         NVARCHAR (255) NULL,
    [zip]           NVARCHAR (255) NULL,
    [HomePhone]     CHAR (10)      NULL,
    [MobilePhone]   CHAR (10)      NULL,
    [MemberTypeID]  INT            NOT NULL,
    [IsSchedulable] CHAR (1)       NULL,
    CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED ([ID] ASC)
);

