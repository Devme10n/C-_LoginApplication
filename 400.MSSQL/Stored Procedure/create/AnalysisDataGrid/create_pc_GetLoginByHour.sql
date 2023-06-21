-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetLoginByHour')
    DROP PROCEDURE pc_GetLoginByHour
GO

-- �ð��뺰 �α��� ��� ��ȸ
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
