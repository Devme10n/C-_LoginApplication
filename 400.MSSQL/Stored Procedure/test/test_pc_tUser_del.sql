-- ���� ����
DECLARE @user_id VARCHAR(32);

-- ������ �׽�Ʈ �� �Ҵ�
SET @user_id = 'max';

-- ���� ���ν��� ȣ��
EXEC pc_tUser_del @user_id;

-- ��� ���
SELECT * FROM tUser;
