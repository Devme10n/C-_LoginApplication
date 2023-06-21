-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByDayOfWeek')
    DROP PROCEDURE pc_GetLoginByDayOfWeek
GO

-- 요일별 로그인 기록 조회 
CREATE PROCEDURE pc_GetLoginByDayOfWeek
AS
BEGIN
    SELECT DATEPART(weekday, w1_dtm) AS day_of_week, COUNT(*) AS login_count
    FROM tUserActivity
    WHERE user_act_type = 'login'
    GROUP BY DATEPART(weekday, w1_dtm)
    ORDER BY day_of_week;
END
GO
