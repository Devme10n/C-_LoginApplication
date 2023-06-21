-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_GetUsersWithoutActivity')
    DROP PROCEDURE pc_GetUsersWithoutActivity
GO

-- 활동이 없는 사용자의 정보를 가져오는 저장 프로시저
CREATE PROCEDURE pc_GetUsersWithoutActivity
AS
BEGIN
    -- tLoginPass와 tUserActivity을 OUTER JOIN
    SELECT tLoginPass.login_id, tLoginPass.nickname
    FROM tLoginPass
    LEFT OUTER JOIN tUserActivity ON tLoginPass.login_id = tUserActivity.login_id
    -- 활동이 없는 사용자 정보를 가져옴
    WHERE tUserActivity.login_id IS NULL
END
GO
