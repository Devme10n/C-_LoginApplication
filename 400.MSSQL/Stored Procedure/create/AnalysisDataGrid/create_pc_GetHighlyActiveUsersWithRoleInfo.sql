-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetHighlyActiveUsersWithRoleInfo')
    DROP PROCEDURE pc_GetHighlyActiveUsersWithRoleInfo
GO

-- Ȱ�� ���� ��� �̻��� ����ڵ��� �г��Ӱ� ���� ������ �������� ���� ���ν���
CREATE PROCEDURE pc_GetHighlyActiveUsersWithRoleInfo
AS
BEGIN
    -- �� ������� Ȱ�� ���� ��� -> Ȱ�� ���� ��ü ������� ��� Ȱ�� �� �̻��� ����ڵ��� ���
    WITH UserActivityCount AS (
        SELECT login_id, COUNT(*) AS activity_count
        FROM tUserActivity
        GROUP BY login_id
        HAVING COUNT(*) >= (
            SELECT AVG(count)
            FROM (
                SELECT COUNT(*) AS count
                FROM tUserActivity
                GROUP BY login_id
            ) subquery
        )
    )
    -- Ȱ�� ���� ��� �̻��� ������� �г��Ӱ� ���� ������ ������
    SELECT tLoginPass.nickname, tUserRole.user_role_type
    FROM UserActivityCount
    INNER JOIN tLoginPass ON UserActivityCount.login_id = tLoginPass.login_id
    LEFT JOIN tUserRole ON UserActivityCount.login_id = tUserRole.login_id
END
GO
