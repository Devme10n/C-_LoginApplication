-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_upd')
    DROP PROCEDURE pc_tUser_upd
GO

-- ����ڰ� �Է��� user_id�� ������ �����ϴ� ���� ���ν���
CREATE PROCEDURE pc_tUser_upd
@user_id VARCHAR(32), -- ����� ���̵�. ������ + "@.", ��ҹ��� ���� ����, ������ ������
@join_dtm DATETIME, -- ����� �����Ͻ�
@wdrl_dtm DATETIME, -- ����� Ż���Ͻ�
@w9_dtm DATETIME -- ���� ����Ͻ�
AS
BEGIN
    -- user_id�� ���� ��ȿ�� �˻�
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @user_id) = 0 AND PATINDEX('[a-zA-Z]%', @user_id) > 0)
    BEGIN
        -- user_id �˻� ���

        -- user_id�� ��ȿ�� �˻縦 ����ϸ� tUser ���̺��� �ش� ���ڵ带 ����
        UPDATE tUser
        SET join_dtm = @join_dtm,
            wdrl_dtm = @wdrl_dtm,
            w9_dtm = @w9_dtm
        WHERE user_id = @user_id
    END
    ELSE
    BEGIN
        -- user_id�� ��ȿ�� �˻縦 ������� ���ϸ� ���� �޽����� ��ȯ
        THROW 51000, 'User ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1
    END
END