-- ���� ����
DECLARE @login_id VARCHAR(32);
DECLARE @pass VARCHAR(64);
DECLARE @result INT;
DECLARE @nickname VARCHAR(32);
DECLARE @user_id VARCHAR(32);

-- Test 1: �����ϴ� �α��� ID�� ��й�ȣ ��ȸ
SET @login_id = 'johndoe@example.com';
SET @pass = 'Passw0rd!';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_checkLogin @login_id, @pass, @result OUTPUT, @nickname OUTPUT, @user_id OUTPUT;

-- ��� ���
SELECT @result AS Result, @nickname AS Nickname, @user_id AS user_id; -- 1�� ��µǰ�, Nickname�� ��µǸ�, �α��� ����

-- Test 2: �߸��� �α��� ID�� ��ȸ
SET @login_id = 'john.doe@example.com';
SET @pass = 'wrongPassword';

-- ���� ���ν��� ȣ��
EXEC pc_tLoginPass_checkLogin @login_id, @pass, @result OUTPUT, @nickname OUTPUT, @user_id OUTPUT;

-- ��� ���
-- Test 2���� �����ϸ� Nickname�� user_id�� null�� ǥ��
SELECT @result AS Result, @nickname AS Nickname, @user_id AS user_id; -- 0�� ��µǰ�, Nickname�� NULL�� ��µǸ�, �α��� ����
