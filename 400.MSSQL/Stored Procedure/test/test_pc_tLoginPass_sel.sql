-- 변수 선언
DECLARE @login_id VARCHAR(32);

-- Test: 특정 login_id 조회
SET @login_id = 'johndoe@example.com';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_sel @login_id;

-- Test: 특정 login_id 조회 실패
SET @login_id = 'john.doe@example.com';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_sel @login_id;

-- 결과 출력
SELECT * FROM tLoginPass;

SELECT * FROM tUser;