-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_upd')
    DROP PROCEDURE pc_tUser_upd
GO

-- 사용자가 입력한 user_id의 형식을 검증하는 저장 프로시저
CREATE PROCEDURE pc_tUser_upd
@user_id VARCHAR(32), -- 사용자 아이디. 영숫자 + "@.", 대소문자 구별 없음, 시작은 영문자
@join_dtm DATETIME, -- 사용자 가입일시
@wdrl_dtm DATETIME, -- 사용자 탈퇴일시
@w9_dtm DATETIME -- 최종 기록일시
AS
BEGIN
    -- user_id에 대한 유효성 검사
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @user_id) = 0 AND PATINDEX('[a-zA-Z]%', @user_id) > 0)
    BEGIN
        -- user_id 검사 통과

        -- user_id가 유효성 검사를 통과하면 tUser 테이블의 해당 레코드를 수정
        UPDATE tUser
        SET join_dtm = @join_dtm,
            wdrl_dtm = @wdrl_dtm,
            w9_dtm = @w9_dtm
        WHERE user_id = @user_id
    END
    ELSE
    BEGIN
        -- user_id가 유효성 검사를 통과하지 못하면 에러 메시지를 반환
        THROW 51000, 'User ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1
    END
END