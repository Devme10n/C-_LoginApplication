-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUserRole_ins')
    DROP PROCEDURE pc_tUserRole_ins
GO

-- tUserRole 저장 저장 프로시저
CREATE PROCEDURE pc_tUserRole_ins 
	@login_id VARCHAR(32), -- 로그인 아이디
	@user_role_type CHAR(16), -- 사용자 역할 유형
    @user_role_id UNIQUEIDENTIFIER OUTPUT -- 사용자 역할 아이디
AS
BEGIN
    -- 사용자 역할 유형 확인
    IF @user_role_type NOT IN ('admin', 'user')
    BEGIN
        THROW 50000, 'Invalid user role type', 1;
    END

	SET @user_role_id = NEWID() -- 유니크한 값 생성

    INSERT INTO tUserRole(user_role_id, login_id, user_role_type, w1_dtm, w9_dtm) 
    VALUES (@user_role_id, @login_id, @user_role_type, GETDATE(), GETDATE())
END
GO
