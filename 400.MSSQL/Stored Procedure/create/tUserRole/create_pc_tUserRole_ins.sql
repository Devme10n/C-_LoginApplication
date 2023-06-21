-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUserRole_ins')
    DROP PROCEDURE pc_tUserRole_ins
GO

-- tUserRole ���� ���� ���ν���
CREATE PROCEDURE pc_tUserRole_ins 
	@login_id VARCHAR(32), -- �α��� ���̵�
	@user_role_type CHAR(16), -- ����� ���� ����
    @user_role_id UNIQUEIDENTIFIER OUTPUT -- ����� ���� ���̵�
AS
BEGIN
    -- ����� ���� ���� Ȯ��
    IF @user_role_type NOT IN ('admin', 'user')
    BEGIN
        THROW 50000, 'Invalid user role type', 1;
    END

	SET @user_role_id = NEWID() -- ����ũ�� �� ����

    INSERT INTO tUserRole(user_role_id, login_id, user_role_type, w1_dtm, w9_dtm) 
    VALUES (@user_role_id, @login_id, @user_role_type, GETDATE(), GETDATE())
END
GO
