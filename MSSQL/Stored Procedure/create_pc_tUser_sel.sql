CREATE PROCEDURE pc_tUser_sel
@user_id CHAR(32)
AS
BEGIN
    SELECT * FROM tUser
    WHERE user_id = @user_id
END