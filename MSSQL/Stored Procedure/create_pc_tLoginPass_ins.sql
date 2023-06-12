-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_ins')
    DROP PROCEDURE pc_tLoginPass_ins
GO

-- ����ڰ� �Է��� login_id�� pass�� ������ �����ϴ� ���� ���ν���
CREATE PROCEDURE pc_tLoginPass_ins 
@login_id VARCHAR(32), -- �α��� ���̵�. ������ + "@.", ��ҹ��� ���� ����, ������ ������
@nickname VARCHAR(32), -- �г���
@pass VARCHAR(64), -- ��й�ȣ. ASCII 0x21 ~ 0x7E, ��ҹ��� ������
@user_id VARCHAR(32), -- ����� ���̵�
@w1_dtm DATETIME, -- ���� ����Ͻ�
@w9_dtm DATETIME -- ���� ����Ͻ�
AS
BEGIN
    -- login_id�� ���� ��ȿ�� �˻�
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @login_id) = 0 AND PATINDEX('[a-zA-Z]%', @login_id) > 0)
        PRINT 'Login ID validation passed.'
    ELSE
        -- login_id�� ��ȿ�� �˻縦 ������� ���ϸ� ���� �޽����� ��ȯ
        THROW 51000, 'Login ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1

    -- pass�� ���� ��ȿ�� �˻�. ASCII ���� 0x21 ~ 0x7E �������� Ȯ��
    DECLARE @i INT = 1;
    WHILE @i <= LEN(@pass)
    BEGIN
        IF ASCII(SUBSTRING(@pass, @i, 1)) NOT BETWEEN 33 AND 126
        BEGIN
            -- pass�� ��ȿ�� �˻縦 ������� ���ϸ� ���� �޽����� ��ȯ
            THROW 51000, 'Password must only contain ASCII characters between 0x21 and 0x7E.', 1
        END
        SET @i = @i + 1;
    END
    PRINT 'Password validation passed.'

    -- login_id�� pass�� ��� ��ȿ�� �˻縦 ����ϸ� ���ο� ����ڸ� tLoginPass ���̺� �߰�
    INSERT INTO tLoginPass(login_id, nickname, pass, user_id, w1_dtm, w9_dtm) 
    VALUES (@login_id, @nickname, @pass, @user_id, @w1_dtm, @w9_dtm)
END
