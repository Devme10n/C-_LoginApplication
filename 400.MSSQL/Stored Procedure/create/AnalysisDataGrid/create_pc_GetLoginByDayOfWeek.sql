-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByDayOfWeek')
    DROP PROCEDURE pc_GetLoginByDayOfWeek
GO

-- ���Ϻ� �α��� ��� ��ȸ 
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
