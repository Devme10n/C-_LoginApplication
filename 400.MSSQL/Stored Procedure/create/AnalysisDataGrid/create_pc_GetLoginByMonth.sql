-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByMonth')
    DROP PROCEDURE pc_GetLoginByMonth
GO

-- 월별 로그인 기록 조회 
CREATE PROCEDURE pc_GetLoginByMonth
AS
BEGIN
    SELECT DATEPART(month, w1_dtm) AS month, COUNT(*) AS login_count
    FROM tUserActivity
    WHERE user_act_type = 'login'
    GROUP BY DATEPART(month, w1_dtm)
    ORDER BY month;
END
GO
