-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetActiveUsersRoleInfoLast1Hour')
    DROP PROCEDURE pc_GetActiveUsersRoleInfoLast1Hour
GO

-- 최근 1시간 동안 활동한 사용자들의 로그인 아이디와 역할 유형을 가져오는 프로시저
CREATE PROCEDURE pc_GetActiveUsersRoleInfoLast1Hour
AS
BEGIN
    SELECT tLoginPass.login_id, tUserRole.user_role_type
	-- tLoginPass, tUserActivity, tUserRole 테이블을 inner join
    FROM tLoginPass
    INNER JOIN tUserActivity ON tLoginPass.login_id = tUserActivity.login_id
    INNER JOIN tUserRole ON tLoginPass.login_id = tUserRole.login_id
	-- 최근 1시간 이내의 활동
    WHERE tUserActivity.w1_dtm >= DATEADD(hour, -1, GETDATE())
END
GO
