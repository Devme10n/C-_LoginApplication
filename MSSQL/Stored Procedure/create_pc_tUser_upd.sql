CREATE PROCEDURE pc_tUser_upd
@user_id CHAR(32), -- ����� ���̵�. ������ + "@.", ��ҹ��� ���� ����, ������ ������
@join_dtm DATETIME, -- ����� �����Ͻ�
@wdrl_dtm DATETIME, -- ����� Ż���Ͻ�
@w1_dtm DATETIME, -- ���� ����Ͻ�
@w9_dtm DATETIME -- ���� ����Ͻ�
AS
BEGIN
    BEGIN TRY
        -- user_id�� ���� ��ȿ�� �˻�
        DECLARE @pattern VARCHAR(100) = '^[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z0-9]+\.[a-zA-Z]+$';
        IF (@user_id LIKE @pattern)
        BEGIN
            -- user_id �˻� ���
            
            -- user_id�� ��ȿ�� �˻縦 ����ϸ� tUser ���̺��� �ش� ���ڵ带 ����
            UPDATE tUser
            SET join_dtm = @join_dtm,
                wdrl_dtm = @wdrl_dtm,
                w1_dtm = @w1_dtm,
                w9_dtm = @w9_dtm
            WHERE user_id = @user_id
            
            -- ������Ʈ ���� �޽��� ���
            PRINT 'Update successful';
        END
        ELSE
        BEGIN
            -- user_id�� ��ȿ�� �˻縦 ������� ���ϸ� ������ �߻���Ŵ
            THROW 51000, 'User ID is not in a valid email format.', 1
        END
    END TRY
    BEGIN CATCH
        -- ���� ó�� ������ �ۼ��մϴ�.
        -- ���� ���, ���� ������ �α׿� ����ϰų� �ٸ� ��ġ�� ���� �� �ֽ��ϴ�.
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        
        -- ���� ó�� ������ �߰��մϴ�.
        -- ���� ���, ���� ������ �α׿� ����ϰų� �ٸ� ��ġ�� ���� �� �ֽ��ϴ�.
        
        -- ���� ������ ��ȯ�մϴ�.
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
