-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_ins')
    DROP PROCEDURE pc_tUser_ins
GO

-- ����ڰ� �Է��� user_id�� ������ �����ϴ� ���� ���ν���
CREATE PROCEDURE pc_tUser_ins 
@user_id VARCHAR(32), -- ���� ���̵�. ������ + "@.", ��ҹ��� ���� ����, ������ ������
@join_dtm DATETIME, -- �����Ͻ�
@wdrl_dtm DATETIME, -- Ż���Ͻ�
@w1_dtm DATETIME, -- ���� ����Ͻ�
@w9_dtm DATETIME -- ���� ����Ͻ�
AS
BEGIN
    -- user_id�� ���� ��ȿ�� �˻�. ������, "@", "."�� �����ϰ� �����ڷ� �����ؾ� ��.
    -- PATINDEX �Լ��� ����� user_id�� �־��� ���ϰ� ��ġ�ϴ��� Ȯ��
    -- PATINDEX('%[^a-zA-Z0-9@.]%', @user_id)�� @user_id�� ������, "@", "." �̿��� ���ڸ� �����ϸ� 0�� �ƴ� ��ġ ���� ��ȯ
    -- PATINDEX('[a-zA-Z]%', @user_id)�� @user_id�� �����ڷ� �����ϸ� ���� ��ġ ���� ��ȯ
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @user_id) = 0 AND PATINDEX('[a-zA-Z]%', @user_id) > 0)
    BEGIN
        -- user_id�� ��ȿ�� �˻縦 ����ϸ� ���ο� ����ڸ� tUser ���̺� �߰�
        INSERT INTO tUser(user_id, join_dtm, wdrl_dtm, w1_dtm, w9_dtm) 
        VALUES (@user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm)
    END
    ELSE
    BEGIN
        -- user_id�� ��ȿ�� �˻縦 ������� ���ϸ� ���� �޽����� ��ȯ
        THROW 51000, 'User ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1
    END
END