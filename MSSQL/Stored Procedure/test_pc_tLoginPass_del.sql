-- 변수 선언
DECLARE @login_id VARCHAR(32);

-- 변수에 테스트 값 할당
SET @login_id = 'johndoe@example.com';

-- 저장 프로시저 호출
EXEC pc_tLoginPass_del @login_id;

-- 결과 출력
SELECT * FROM tLoginPass;
