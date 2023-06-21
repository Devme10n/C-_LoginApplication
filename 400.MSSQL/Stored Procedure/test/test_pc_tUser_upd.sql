-- ���� ����
DECLARE @user_id VARCHAR(32);
DECLARE @join_dtm DATETIME;
DECLARE @wdrl_dtm DATETIME;
DECLARE @w9_dtm DATETIME;

-- Test1: ��ȿ�� user_id
SET @user_id = 'max.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;

-- Test2: ��ȿ�� user_id
SET @user_id = 'john.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;

-- Test3: ��ȿ���� ���� user_id (���ڷ� ����)
SET @user_id = '123invalid@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tUser_upd @user_id, @join_dtm, @wdrl_dtm, @w9_dtm;
