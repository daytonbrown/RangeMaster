
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE dbo.GetSchedule
    -- Add the parameters for the stored procedure here
    @StartDate DATE
   ,@EndDate DATE
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    SELECT EventDate
          ,et.Description
          ,dt.ShortDescription
          ,m.FirstName
          ,m.LastName
    FROM MemberEventSchedule AS mes
        JOIN Members         AS m ON mes.MemberID = m.ID
        JOIN EventTypes      AS et ON mes.EventTypeID = et.ID
        JOIN DutyTypes       AS dt ON mes.DutyTypeID = dt.ID
    WHERE EventDate BETWEEN @StartDate AND @EndDate
    ORDER BY EventDate
            ,et.Description
            ,dt.ShortDescription;
END;
