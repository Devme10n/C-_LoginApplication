-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUserActivity_ins')
    DROP PROCEDURE pc_tUserActivity_ins
GO

-- user activity 저장 저장 프로시저
CREATE PROCEDURE pc_tUserActivity_ins 
    @login_id VARCHAR(32), -- 로그인 아이디
    @user_act_type CHAR(16), -- 사용자 활동 유형
    @user_act_id UNIQUEIDENTIFIER OUTPUT -- 사용자 활동 아이디
AS
BEGIN
    SET @user_act_id = NEWID() -- 유니크한 값 생성

    INSERT INTO tUserActivity(user_act_id, login_id, user_act_type, w1_dtm, w9_dtm) 
    VALUES (@user_act_id, @login_id, @user_act_type, GETDATE(), GETDATE())
END
GO
