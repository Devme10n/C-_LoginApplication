-- 변수 선언
DECLARE @login_id VARCHAR(32);
DECLARE @nickname VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @user_id VARCHAR(32);

-- Test1: 유효한 login_id와 pass
SET @login_id = 'johndoe@example.com';
SET @nickname = 'John Doe';
SET @pass = 'Passw0rd!';
SET @user_id = 'max990624';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_ins @login_id, @nickname, @pass, @user_id;