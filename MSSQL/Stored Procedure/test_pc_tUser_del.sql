-- 변수 선언
DECLARE @user_id VARCHAR(32);

-- 변수에 테스트 값 할당
SET @user_id = 'john.doe@example.com';

-- 저장 프로시저 호출
EXEC pc_tUser_del @user_id;

-- 결과 출력
SELECT * FROM tUser;
