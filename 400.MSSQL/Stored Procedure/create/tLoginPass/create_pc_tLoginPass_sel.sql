-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_sel')
    DROP PROCEDURE pc_tLoginPass_sel
GO

CREATE PROCEDURE pc_tLoginPass_sel
@login_id VARCHAR(32)
AS
BEGIN
    SELECT * FROM tLoginPass
    WHERE login_id = @login_id
END