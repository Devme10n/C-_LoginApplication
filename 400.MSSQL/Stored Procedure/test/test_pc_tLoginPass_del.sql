-- ���� ����
DECLARE @login_id VARCHAR(32);

-- ������ �׽�Ʈ �� �Ҵ�
SET @login_id = 'johndoe@example.com';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_del @login_id;

-- ��� ���
SELECT * FROM tLoginPass;
