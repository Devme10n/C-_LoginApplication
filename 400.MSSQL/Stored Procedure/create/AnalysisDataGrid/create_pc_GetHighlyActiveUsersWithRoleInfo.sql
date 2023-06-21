-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetHighlyActiveUsersWithRoleInfo')
    DROP PROCEDURE pc_GetHighlyActiveUsersWithRoleInfo
GO

-- 활동 수가 평균 이상인 사용자들의 닉네임과 역할 정보를 가져오는 저장 프로시저
CREATE PROCEDURE pc_GetHighlyActiveUsersWithRoleInfo
AS
BEGIN
    -- 각 사용자의 활동 수를 계산 -> 활동 수가 전체 사용자의 평균 활동 수 이상인 사용자들의 목록
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
    -- 활동 수가 평균 이상인 사용자의 닉네임과 역할 정보를 가져옴
    SELECT tLoginPass.nickname, tUserRole.user_role_type
    FROM UserActivityCount
    INNER JOIN tLoginPass ON UserActivityCount.login_id = tLoginPass.login_id
    LEFT JOIN tUserRole ON UserActivityCount.login_id = tUserRole.login_id
END
GO
