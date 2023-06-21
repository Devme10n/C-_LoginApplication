-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_ins')
    DROP PROCEDURE pc_tLoginPass_ins
GO

-- 사용자가 입력한 login_id와 pass의 형식을 검증하고 새로운 사용자를 등록하는 저장 프로시저
CREATE PROCEDURE pc_tLoginPass_ins 
@login_id VARCHAR(32), -- 로그인 아이디. 영숫자 + "@.", 대소문자 구별 없음, 시작은 영문자
@nickname VARCHAR(32), -- 닉네임
@pass VARCHAR(64), -- 비밀번호. ASCII 0x21 ~ 0x7E, 대소문자 구별함
@user_id VARCHAR(32) -- 사용자 아이디
AS
BEGIN
    -- tUser 테이블에 user_id가 존재하지 않으면, pc_tUser_ins 프로시저 호출
    IF NOT EXISTS (SELECT 1 FROM tUser WHERE user_id = @user_id)
    BEGIN
        EXEC pc_tUser_ins @user_id
    END

    -- login_id에 대한 유효성 검사
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @login_id) = 0 AND PATINDEX('[a-zA-Z]%', @login_id) > 0)
        PRINT 'Login ID validation passed.'
    ELSE
        -- login_id가 유효성 검사를 통과하지 못하면 에러 메시지를 반환
        THROW 51000, 'Login ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1

    -- pass에 대한 유효성 검사. ASCII 값이 0x21 ~ 0x7E 사이인지 확인
    DECLARE @i INT = 1;
    WHILE @i <= LEN(@pass)
    BEGIN
        IF ASCII(SUBSTRING(@pass, @i, 1)) NOT BETWEEN 33 AND 126
        BEGIN
            -- pass가 유효성 검사를 통과하지 못하면 에러 메시지를 반환
            THROW 51000, 'Password must only contain ASCII characters between 0x21 and 0x7E.', 1
        END
        SET @i = @i + 1;
    END
    PRINT 'Password validation passed.'

    -- 트랜잭션 시작
    BEGIN TRANSACTION
    BEGIN TRY
        -- tLoginPass 테이블에 행 추가
        INSERT INTO tLoginPass(login_id, nickname, pass, user_id, w1_dtm, w9_dtm) 
        VALUES (@login_id, @nickname, @pass, @user_id, GETDATE(), GETDATE())

        -- 트랜잭션 커밋
        COMMIT
    END TRY
    BEGIN CATCH
        -- 오류가 발생하면 트랜잭션 롤백
        ROLLBACK

        -- 오류 메시지 반환
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        -- THROW로 오류 메시지 반환
        THROW 51000, @ErrorMessage, @ErrorState;
    END CATCH
END
GO
