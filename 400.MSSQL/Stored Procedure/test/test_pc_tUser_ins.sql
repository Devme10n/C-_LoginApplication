-- ���� ����
DECLARE @user_id VARCHAR(32);

-- Test1
-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'max';

-- ���� ���ν��� ȣ��
EXEC pc_tUser_ins @user_id;

-- Test2
-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'john.doe@example.com';

-- ���� ���ν��� ȣ��
EXEC pc_tUser_ins @user_id;

-- Test3
-- @user_id ������� ���� TEST
SET @user_id = '123';

-- ���� ���ν��� ȣ��
EXEC pc_tUser_ins @user_id;
