-- 변수 선언
DECLARE @login_id VARCHAR(32);
DECLARE @nickname VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @user_id VARCHAR(32);
DECLARE @w9_dtm DATETIME;

-- 정상적인 경우 테스트
SET @login_id = 'johndoe@example.com';
SET @nickname = '존 도우'; -- 닉네임 변경
SET @pass = 'Passw0rd!';
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;

-- login_id 유효성 검사 실패 테스트
SET @login_id = '1_invalid_user'; -- 로그인 아이디가 숫자로 시작
SET @nickname = 'John Doe';
SET @pass = 'Passw0rd!';
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;

-- pass 유효성 검사 실패 테스트
SET @login_id = 'johndoe@example.com';
SET @nickname = 'John Doe';
SET @pass = '비밀번호'; -- ASCII 범위 밖의 문자가 포함된 비밀번호
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;
