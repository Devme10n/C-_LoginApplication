-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_del')
    DROP PROCEDURE pc_tUser_del
GO

CREATE PROCEDURE pc_tUser_del
@user_id VARCHAR(32)
AS
BEGIN
    DELETE FROM tUser
    WHERE user_id = @user_id
END