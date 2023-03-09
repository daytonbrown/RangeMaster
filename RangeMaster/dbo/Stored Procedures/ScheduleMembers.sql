
CREATE PROCEDURE dbo.ScheduleMembers
    @StartDate AS DATE
   ,@EndDate AS DATE
AS
BEGIN
    WHILE EXISTS
               (
                   SELECT NULL
                   FROM EventSchedule                AS es
                       JOIN EventTypes               AS et ON es.EventTypeID = et.ID
                       JOIN EventDutyTypes           AS edt ON edt.EventTypeID = et.ID
                       JOIN DutyTypes                AS dt ON dt.ID = edt.DutyTypeID
                       LEFT JOIN MemberEventSchedule AS mes ON mes.EventDate = es.EventDate
                                                               AND et.ID = mes.EventTypeID
                                                               AND edt.DutyTypeID = mes.DutyTypeID
                   WHERE es.EventDate BETWEEN @StartDate AND @EndDate
                   GROUP BY es.EventDate
                           ,et.Description
                           ,et.StartTime
                           ,et.EndTime
                           ,et.HoursCredit
                           ,dt.ShortDescription
                           ,edt.NeededCount
                   HAVING COUNT(mes.MemberID) < edt.NeededCount
               )
    BEGIN
        WITH DutyNeeded
        AS (SELECT TOP 1
                   es.EventDate
                  ,es.EventTypeID
                  ,dt.ID AS DutyTypeID
            FROM EventSchedule                AS es
                JOIN EventTypes               AS et ON es.EventTypeID = et.ID
                JOIN EventDutyTypes           AS edt ON edt.EventTypeID = et.ID
                JOIN DutyTypes                AS dt ON dt.ID = edt.DutyTypeID
                LEFT JOIN MemberEventSchedule AS mes ON mes.EventDate = es.EventDate
                                                        AND et.ID = mes.EventTypeID
                                                        AND edt.DutyTypeID = mes.DutyTypeID
            WHERE es.EventDate BETWEEN @StartDate AND @EndDate
            GROUP BY es.EventDate
                    ,es.EventTypeID
                    ,dt.ID
                    ,edt.NeededCount
            HAVING COUNT(mes.MemberID) < edt.NeededCount)
            ,MemberHours
        AS (SELECT mes.MemberID
                  ,SUM(et.HoursCredit) AS TotalHours
            FROM MemberEventSchedule AS mes
                JOIN EventTypes      AS et ON mes.EventTypeID = et.ID
            WHERE mes.DutyStatusID IN (1, 2)
            GROUP BY mes.MemberID)
            ,MembersCTE
        AS (SELECT ID, NEWID() AS NewIDForSort FROM Members WHERE IsSchedulable = 'Y')
        INSERT INTO MemberEventSchedule (EventDate, MemberID, EventTypeID, DutyTypeID, DutyStatusID)
        SELECT TOP 1
               dn.EventDate
              ,mad.MemberID
              ,dn.EventTypeID
              ,dn.DutyTypeID
              ,1 AS DutyStatusID
        FROM DutyNeeded                  AS dn
            JOIN MemberAvailableDuty     AS mad ON dn.DutyTypeID = mad.DutyTypeID
                                                   AND dn.EventTypeID = mad.EventTypeID
            LEFT JOIN MemberBlackoutDate AS mbd ON mad.MemberID = mbd.MemberID
                                                   AND mbd.StartDate >= dn.EventDate
                                                   AND mbd.EndDate <= dn.EventDate
            LEFT JOIN MemberHours        AS mh ON mh.MemberID = mad.MemberID
            JOIN MembersCTE              AS m ON mad.MemberID = m.ID
        WHERE mbd.MemberID IS NULL
        ORDER BY ISNULL(mh.TotalHours, 0)
                ,m.NewIDForSort;
    END;
END;