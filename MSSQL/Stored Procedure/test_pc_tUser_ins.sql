-- 변수 선언
DECLARE @user_id VARCHAR(32);
DECLARE @join_dtm DATETIME;
DECLARE @wdrl_dtm DATETIME;
DECLARE @w1_dtm DATETIME;
DECLARE @w9_dtm DATETIME;

-- Test1
-- 변수에 테스트 값 할당
SET @user_id = 'max.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w1_dtm = GETDATE();
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tUser_ins @user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm;

-- Test2
-- 변수에 테스트 값 할당
SET @user_id = 'john.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w1_dtm = GETDATE();
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tUser_ins @user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm;
