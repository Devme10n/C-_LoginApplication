-- Drop procedure if it already exists
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_checkLogin')
    DROP PROCEDURE pc_tLoginPass_checkLogin
GO

CREATE PROCEDURE pc_tLoginPass_checkLogin
@login_id VARCHAR(32),
@pass VARCHAR(64),
@result INT OUTPUT,
@nickname VARCHAR(32) OUTPUT,
@user_id VARCHAR(32) OUTPUT
AS
BEGIN
    IF EXISTS (SELECT * FROM tLoginPass WHERE login_id = @login_id AND pass = @pass)
    BEGIN
        SET @result = 1;
        SELECT @nickname = nickname, @user_id = user_id FROM tLoginPass WHERE login_id = @login_id AND pass = @pass;
    END
    ELSE
        SET @result = 0;
END
GO
