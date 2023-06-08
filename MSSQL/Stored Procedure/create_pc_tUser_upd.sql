CREATE PROCEDURE pc_tUser_upd
@user_id CHAR(32), -- 사용자 아이디. 영숫자 + "@.", 대소문자 구별 없음, 시작은 영문자
@join_dtm DATETIME, -- 사용자 가입일시
@wdrl_dtm DATETIME, -- 사용자 탈퇴일시
@w1_dtm DATETIME, -- 최초 기록일시
@w9_dtm DATETIME -- 최종 기록일시
AS
BEGIN
    BEGIN TRY
        -- user_id에 대한 유효성 검사
        DECLARE @pattern VARCHAR(100) = '^[a-zA-Z][a-zA-Z0-9._]*@[a-zA-Z0-9]+\.[a-zA-Z]+$';
        IF (@user_id LIKE @pattern)
        BEGIN
            -- user_id 검사 통과
            
            -- user_id가 유효성 검사를 통과하면 tUser 테이블의 해당 레코드를 수정
            UPDATE tUser
            SET join_dtm = @join_dtm,
                wdrl_dtm = @wdrl_dtm,
                w1_dtm = @w1_dtm,
                w9_dtm = @w9_dtm
            WHERE user_id = @user_id
            
            -- 업데이트 성공 메시지 출력
            PRINT 'Update successful';
        END
        ELSE
        BEGIN
            -- user_id가 유효성 검사를 통과하지 못하면 에러를 발생시킴
            THROW 51000, 'User ID is not in a valid email format.', 1
        END
    END TRY
    BEGIN CATCH
        -- 에러 처리 로직을 작성합니다.
        -- 예를 들어, 에러 정보를 로그에 기록하거나 다른 조치를 취할 수 있습니다.
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;
        
        SELECT
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();
        
        -- 에러 처리 로직을 추가합니다.
        -- 예를 들어, 에러 정보를 로그에 기록하거나 다른 조치를 취할 수 있습니다.
        
        -- 에러 정보를 반환합니다.
        RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END
