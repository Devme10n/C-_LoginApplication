-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetUsersWithoutActivity')
    DROP PROCEDURE pc_GetUsersWithoutActivity
GO

-- Ȱ���� ���� ������� ������ �������� ���� ���ν���
CREATE PROCEDURE pc_GetUsersWithoutActivity
AS
BEGIN
    -- tLoginPass�� tUserActivity�� OUTER JOIN
    SELECT tLoginPass.login_id, tLoginPass.nickname
    FROM tLoginPass
    LEFT OUTER JOIN tUserActivity ON tLoginPass.login_id = tUserActivity.login_id
    -- Ȱ���� ���� ����� ������ ������
    WHERE tUserActivity.login_id IS NULL
END
GO
