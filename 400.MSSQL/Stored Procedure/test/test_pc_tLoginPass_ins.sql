-- ���� ����
DECLARE @login_id VARCHAR(32);
DECLARE @nickname VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @user_id VARCHAR(32);

-- Test1: ��ȿ�� login_id�� pass
SET @login_id = 'johndoe@example.com';
SET @nickname = 'John Doe';
SET @pass = 'Passw0rd!';
SET @user_id = 'max990624';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_ins @login_id, @nickname, @pass, @user_id;