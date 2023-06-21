-- ���� ���ν��� DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_ins')
    DROP PROCEDURE pc_tUser_ins
GO

-- user_id ���� ���� ���ν���
CREATE PROCEDURE pc_tUser_ins 
@user_id VARCHAR(32) -- ���� ���̵�
AS
BEGIN
    INSERT INTO tUser(user_id, join_dtm, wdrl_dtm, w1_dtm, w9_dtm) 
    VALUES (@user_id, GETDATE(), NULL, GETDATE(), GETDATE())
END
GO
