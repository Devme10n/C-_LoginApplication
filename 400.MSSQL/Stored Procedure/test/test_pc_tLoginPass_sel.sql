-- ���� ����
DECLARE @login_id VARCHAR(32);

-- Test: Ư�� login_id ��ȸ
SET @login_id = 'johndoe@example.com';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_sel @login_id;

-- Test: Ư�� login_id ��ȸ ����
SET @login_id = 'john.doe@example.com';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_sel @login_id;

-- ��� ���
SELECT * FROM tLoginPass;

SELECT * FROM tUser;