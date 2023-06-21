-- 변수 선언
DECLARE @user_id VARCHAR(32);

-- Test1
-- 변수에 테스트 값 할당
SET @user_id = 'max';

-- 저장 프로시저 호출
EXEC pc_tUser_ins @user_id;

-- Test2
-- 변수에 테스트 값 할당
SET @user_id = 'john.doe@example.com';

-- 저장 프로시저 호출
EXEC pc_tUser_ins @user_id;

-- Test3
-- @user_id 제약사항 위반 TEST
SET @user_id = '123';

-- 저장 프로시저 호출
EXEC pc_tUser_ins @user_id;
