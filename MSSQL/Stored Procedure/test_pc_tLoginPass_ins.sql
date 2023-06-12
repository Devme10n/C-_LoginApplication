-- 변수 선언
DECLARE @login_id VARCHAR(32);
DECLARE @nickname VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @user_id VARCHAR(32);
DECLARE @w1_dtm DATETIME;
DECLARE @w9_dtm DATETIME;

-- Test1: 유효한 login_id와 pass
SET @login_id = 'johndoe@example.com';
SET @nickname = 'John Doe';
SET @pass = 'Passw0rd!';
SET @user_id = 'john.doe@example.com';
SET @w1_dtm = GETDATE();
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tLoginPass_ins @login_id, @nickname, @pass, @user_id, @w1_dtm, @w9_dtm;