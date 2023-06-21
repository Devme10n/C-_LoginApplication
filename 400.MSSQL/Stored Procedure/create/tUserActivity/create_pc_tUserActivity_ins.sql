-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUserActivity_ins')
    DROP PROCEDURE pc_tUserActivity_ins
GO

-- user activity ���� ���� ���ν���
CREATE PROCEDURE pc_tUserActivity_ins 
    @login_id VARCHAR(32), -- �α��� ���̵�
    @user_act_type CHAR(16), -- ����� Ȱ�� ����
    @user_act_id UNIQUEIDENTIFIER OUTPUT -- ����� Ȱ�� ���̵�
AS
BEGIN
    SET @user_act_id = NEWID() -- ����ũ�� �� ����

    INSERT INTO tUserActivity(user_act_id, login_id, user_act_type, w1_dtm, w9_dtm) 
    VALUES (@user_act_id, @login_id, @user_act_type, GETDATE(), GETDATE())
END
GO
