-- ���� ����
DECLARE @login_id VARCHAR(32);
DECLARE @nickname VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @user_id VARCHAR(32);
DECLARE @w9_dtm DATETIME;

-- �������� ��� �׽�Ʈ
SET @login_id = 'johndoe@example.com';
SET @nickname = '�� ����'; -- �г��� ����
SET @pass = 'Passw0rd!';
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;

-- login_id ��ȿ�� �˻� ���� �׽�Ʈ
SET @login_id = '1_invalid_user'; -- �α��� ���̵� ���ڷ� ����
SET @nickname = 'John Doe';
SET @pass = 'Passw0rd!';
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;

-- pass ��ȿ�� �˻� ���� �׽�Ʈ
SET @login_id = 'johndoe@example.com';
SET @nickname = 'John Doe';
SET @pass = '��й�ȣ'; -- ASCII ���� ���� ���ڰ� ���Ե� ��й�ȣ
SET @user_id = 'john.doe@example.com';
SET @w9_dtm = GETDATE();

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_upd @login_id, @nickname, @pass, @user_id, @w9_dtm;
