-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tLoginPass_upd')
    DROP PROCEDURE pc_tLoginPass_upd
GO

-- 사용자가 입력한 login_id와 pass의 형식을 검증하는 저장 프로시저
CREATE PROCEDURE pc_tLoginPass_upd
@login_id VARCHAR(32), -- 로그인 아이디. 영숫자 + "@.", 대소문자 구별 없음, 시작은 영문자
@nickname VARCHAR(32), -- 닉네임
@pass VARCHAR(64), -- 비밀번호. ASCII 0x21 ~ 0x7E, 대소문자 구별함
@user_id VARCHAR(32), -- 사용자 아이디
@w9_dtm DATETIME -- 최종 기록일시
AS
BEGIN
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

    -- login_id와 pass가 모두 유효성 검사를 통과하면 tLoginPass 테이블의 해당 레코드를 수정
    UPDATE tLoginPass
    SET nickname = @nickname, 
		pass = @pass, 
		user_id = @user_id, 
		w9_dtm = @w9_dtm
    WHERE login_id = @login_id
END