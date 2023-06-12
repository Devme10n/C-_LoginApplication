-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_sel')
    DROP PROCEDURE pc_tUser_sel
GO

CREATE PROCEDURE pc_tUser_sel
@user_id CHAR(32)
AS
BEGIN
    SELECT * FROM tUser
    WHERE user_id = @user_id
END