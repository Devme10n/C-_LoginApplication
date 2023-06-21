-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByMonth')
    DROP PROCEDURE pc_GetLoginByMonth
GO

-- ���� �α��� ��� ��ȸ 
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
