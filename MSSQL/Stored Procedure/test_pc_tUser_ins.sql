-- ���� ����
DECLARE @user_id VARCHAR(32);
DECLARE @join_dtm DATETIME;
DECLARE @wdrl_dtm DATETIME;
DECLARE @w1_dtm DATETIME;
DECLARE @w9_dtm DATETIME;

-- Test1
-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'max.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w1_dtm = GETDATE();
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tUser_ins @user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm;

-- Test2
-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'john.doe@example.com';
SET @join_dtm = GETDATE();
SET @wdrl_dtm = NULL;
SET @w1_dtm = GETDATE();
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tUser_ins @user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm;
