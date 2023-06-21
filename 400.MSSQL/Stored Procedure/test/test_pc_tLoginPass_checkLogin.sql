-- 변수 선언
DECLARE @login_id VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @result INT;
DECLARE @nickname VARCHAR(32);
DECLARE @user_id VARCHAR(32);

-- Test 1: 존재하는 로그인 ID와 비밀번호 조회
SET @login_id = 'johndoe@example.com';
SET @pass = 'Passw0rd!';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_checkLogin @login_id, @pass, @result OUTPUT, @nickname OUTPUT, @user_id OUTPUT;

-- 결과 출력
SELECT @result AS Result, @nickname AS Nickname, @user_id AS user_id; -- 1이 출력되고, Nickname도 출력되면, 로그인 성공

-- Test 2: 잘못된 로그인 ID로 조회
SET @login_id = 'john.doe@example.com';
SET @pass = 'wrongPassword';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_checkLogin @login_id, @pass, @result OUTPUT, @nickname OUTPUT, @user_id OUTPUT;

-- 결과 출력
-- Test 2만을 실행하면 Nickname과 user_id는 null로 표시
SELECT @result AS Result, @nickname AS Nickname, @user_id AS user_id; -- 0이 출력되고, Nickname은 NULL이 출력되면, 로그인 실패
