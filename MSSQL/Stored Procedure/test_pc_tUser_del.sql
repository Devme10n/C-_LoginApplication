-- ���� ����
DECLARE @user_id VARCHAR(32);

-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'john.doe@example.com';

-- ���� ���ν��� ȣ��
EXEC pc_tUser_del @user_id;

-- ��� ���
SELECT * FROM tUser;
