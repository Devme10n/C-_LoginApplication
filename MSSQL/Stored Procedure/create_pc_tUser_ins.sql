-- 저장 프로시저 DROP
IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'pc_tUser_ins')
    DROP PROCEDURE pc_tUser_ins
GO

-- 사용자가 입력한 user_id의 형식을 검증하는 저장 프로시저
CREATE PROCEDURE pc_tUser_ins 
@user_id VARCHAR(32), -- 유저 아이디. 영숫자 + "@.", 대소문자 구별 없음, 시작은 영문자
@join_dtm DATETIME, -- 가입일시
@wdrl_dtm DATETIME, -- 탈퇴일시
@w1_dtm DATETIME, -- 최초 기록일시
@w9_dtm DATETIME -- 최종 기록일시
AS
BEGIN
    -- user_id에 대한 유효성 검사. 영숫자, "@", "."만 포함하고 영문자로 시작해야 함.
    -- PATINDEX 함수를 사용해 user_id가 주어진 패턴과 일치하는지 확인
    -- PATINDEX('%[^a-zA-Z0-9@.]%', @user_id)는 @user_id가 영숫자, "@", "." 이외의 문자를 포함하면 0이 아닌 위치 값을 반환
    -- PATINDEX('[a-zA-Z]%', @user_id)는 @user_id가 영문자로 시작하면 시작 위치 값을 반환
    IF (PATINDEX('%[^a-zA-Z0-9@.]%', @user_id) = 0 AND PATINDEX('[a-zA-Z]%', @user_id) > 0)
    BEGIN
        -- user_id가 유효성 검사를 통과하면 새로운 사용자를 tUser 테이블에 추가
        INSERT INTO tUser(user_id, join_dtm, wdrl_dtm, w1_dtm, w9_dtm) 
        VALUES (@user_id, @join_dtm, @wdrl_dtm, @w1_dtm, @w9_dtm)
    END
    ELSE
    BEGIN
        -- user_id가 유효성 검사를 통과하지 못하면 에러 메시지를 반환
        THROW 51000, 'User ID must start with a letter and contain only alphanumeric characters, "@", and ".".', 1
    END
END