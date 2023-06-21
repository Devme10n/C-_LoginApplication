-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByDay')
    DROP PROCEDURE pc_GetLoginByDay
GO

-- 일별 로그인 기록 조회 
CREATE PROCEDURE pc_GetLoginByDay
AS
BEGIN
    SELECT CAST(w1_dtm AS DATE) AS date, COUNT(*) AS login_count
    FROM tUserActivity
    WHERE user_act_type = 'login'
    GROUP BY CAST(w1_dtm AS DATE)
    ORDER BY date;
END
GO
