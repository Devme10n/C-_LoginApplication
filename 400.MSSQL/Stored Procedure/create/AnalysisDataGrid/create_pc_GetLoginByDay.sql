-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByDay')
    DROP PROCEDURE pc_GetLoginByDay
GO

-- �Ϻ� �α��� ��� ��ȸ 
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
