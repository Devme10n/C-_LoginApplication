-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetActiveUsersRoleInfoLast1Hour')
    DROP PROCEDURE pc_GetActiveUsersRoleInfoLast1Hour
GO

-- �ֱ� 1�ð� ���� Ȱ���� ����ڵ��� �α��� ���̵�� ���� ������ �������� ���ν���
CREATE PROCEDURE pc_GetActiveUsersRoleInfoLast1Hour
AS
BEGIN
    SELECT tLoginPass.login_id, tUserRole.user_role_type
	-- tLoginPass, tUserActivity, tUserRole ���̺��� inner join
    FROM tLoginPass
    INNER JOIN tUserActivity ON tLoginPass.login_id = tUserActivity.login_id
    INNER JOIN tUserRole ON tLoginPass.login_id = tUserRole.login_id
	-- �ֱ� 1�ð� �̳��� Ȱ��
    WHERE tUserActivity.w1_dtm >= DATEADD(hour, -1, GETDATE())
END
GO
