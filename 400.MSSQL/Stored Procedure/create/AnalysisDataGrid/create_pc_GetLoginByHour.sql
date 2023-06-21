-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByHour')
    DROP PROCEDURE pc_GetLoginByHour
GO

-- 시간대별 로그인 기록 조회
CREATE PROCEDURE pc_GetLoginByHour
AS
BEGIN
    SELECT DATEPART(hour, w1_dtm) AS hour, COUNT(*) AS login_count
    FROM tUserActivity
    WHERE user_act_type = 'login'
    GROUP BY DATEPART(hour, w1_dtm)
    ORDER BY hour;
END
GO
