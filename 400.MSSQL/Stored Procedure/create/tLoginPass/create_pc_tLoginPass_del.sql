-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_del')
    DROP PROCEDURE pc_tLoginPass_del
GO

CREATE PROCEDURE pc_tLoginPass_del
@login_id VARCHAR(32)
AS
BEGIN
    DELETE FROM tLoginPass
    WHERE login_id = @login_id
END