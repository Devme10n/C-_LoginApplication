-- 변수 선언
DECLARE @user_id VARCHAR(32);
DECLARE @join_dtm DATETIME;
DECLARE @wdrl_dtm DATETIME;
DECLARE @w9_dtm DATETIME;

-- Test1: 유효한 user_id
SET @user_id = 'max.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;

-- Test2: 유효한 user_id
SET @user_id = 'john.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;

-- Test3: 유효하지 않은 user_id (숫자로 시작)
SET @user_id = '123invalid@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- 저장 프로시저 호출
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;
