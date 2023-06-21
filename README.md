# Login Service   

SQL JOIN과 저장 프로시저를 이용한 데이터베이스 관리 학습

## Documentation
1. 요구사항정의서

    001.사용자는 하나의 로그인ID를 가질 수 있다

    002.로그인정보가 삭제되어도 사용자 정보는 남아있어야 한다

    003.사용자정보가 삭제되면 로그인정보도 함께 삭제되어야 한다
    
    004.로그인닉네임을 사용하지 않을 수 있다.
<details>
<summary>2. Data Dictionary</summary>
<div>

### 공통
| Name-KR | Name-EN | Abbreviation | DataType | Length | Domain | Comments |
|---------|---------|--------------|----------|--------|--------|----------|
| 최초기록일시 | first_writing_datetime | w1_dtm | datetime | | | row가 처음 insert될때 사용됨 |
| 최종기록일시 | last_writing_datetime | w9_dtm | datetime | | | row의 내용이 update될때 사용됨 |

### 로그인
| Name-KR | Name-EN | Abbreviation | DataType | Length | Domain | Comments |
|---------|---------|--------------|----------|--------|--------|----------|
| 로그인ID | login_id | login_id | char | 32 | | 영숫자 + "@.", 대소문자 구별없음, 시작은 영문자 |
| 로그인닉네임 | login_nickname | login_nickname | char | 32 | | |
| 로그인비밀번호 | login_password | login_pass | char | 64 | | ascii 0x21 ~ 0x7E, 대소문자 구별함 |

### 사용자
| Name-KR | Name-EN | Abbreviation | DataType | Length | Domain | Comments |
|---------|---------|--------------|----------|--------|--------|----------|
| 사용자ID | user_id | user_id | char | 32 | | |
| 사용자가입일시 | user_joined_datetime | user_join_dtm | datetime | | | |
| 사용자탈퇴일시 | user_withdrawal_datetime | user_wdrl_dtm | datetime | | | |

### 사용자 활동
| Name-KR | Name-EN | Abbreviation | DataType | Length | Domain | Comments |
|---------|---------|--------------|----------|--------|--------|----------|
| 활동ID | user_activity_id | user_act_id | UNIQUEIDENTIFIER | | | |
| 활동유형 | user_activity_type | user_act_type | char | 16 | login, signup | |

### 사용자 역할
| Name-KR | Name-EN | Abbreviation | DataType | Length | Domain | Comments |
|---------|---------|--------------|----------|--------|--------|----------|
| 역할ID | user_role_id | user_role_id | char | 32 | | |
| 역할유형 | user_role_type | user_role_type | char | 16 | admin, user | |
</div>
</details>

3. Bubble Chart

    ![290.Bubble Chart](https://github.com/max990624/C-_LoginApplication/blob/master/999.draw.io/290.%20Bubble%20Chart-Bubble%20Chart.png)

4. ERD

    ![290.ERD](https://github.com/max990624/C-_LoginApplication/blob/master/999.draw.io/290.%20Entity-Relationship%20Diagram-Entity-Relationship%20Diagram.drawio.png)

5. [테이블 명세서](https://github.com/max990624/C-_LoginApplication/blob/master/100.%20LoginSystem%20Document/310.%20Table%20Specification.xlsx)


---
## 기능

사용자 등록(Sign Up)
: 사용자가 입력한 정보의 유효성을 검사

사용자 로그인(Sign In): 사용자가 입력한 ID와 비밀번호를 데이터베이스와 비교
- 일치 로그인 성공
- 불일치 에러 메시지를 표시

사용자 정보 수정(Update): 로그인한 사용자가 자신의 정보를 수정

사용자 삭제(Delete): 로그인한 사용자가 자신의 계정을 삭제
- 탈퇴: pc_tLoginPass_del를 사용해 tUser 테이블과 tLoginPass 테이블 간의 관계를 끊는 것
- 탈회: pc_tLoginPass_del 및 pc_tUser_del를 모두 사용해 완전히 사용자 정보를 삭제하는 것

통계 조회
- 활동 수가 평균 이상인 사용자들의 정보 조회
    - 로그인 ID, 로그인한 횟수, 사용자의 역할 정보
- 최근 1시간 동안 활동한 사용자들의 정보 조회
    - 로그인 ID, 사용자의 역할 정보
- 활동이 없는 사용자의 정보 조회
    - 로그인 ID
- 시간대별 로그인 통계
    - 시간대, 로그인 횟수
- 일별 로그인 통계
    - 날짜, 로그인 횟수
- 요일별 로그인 통계
    - 요일, 로그인 횟수
- 월별 로그인 통계
    - 달, 로그인 횟수


---

## MSSQL

[주요 저장 프로시저]

<a name="PROCEDURE:[dbo].[pc_GetHighlyActiveUsersWithRoleInfo]"></a><b>PROCEDURE:[dbo].[pc_GetHighlyActiveUsersWithRoleInfo]</b>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="750px"><tr><td><b>Procedure Prameters</b></td></tr></table>
<table border="0" cellspacing="1" cellpadding="0" width="750px"><tr><th>Sr.</th><th>Name</th><th>Datatype</th></tr>
</table><br />
<table border="0" cellspacing="0" cellpadding="0" width="750px"><tr><td><b>Description</b></td></tr><tr><td style="word-break:break-all;"><pre>
-- 활동 수가 평균 이상인 사용자들의 닉네임과 역할 정보를 가져오는 저장 프로시저
CREATE PROCEDURE pc_GetHighlyActiveUsersWithRoleInfo
AS
BEGIN
    -- 각 사용자의 활동 수를 계산 -> 활동 수가 전체 사용자의 평균 활동 수 이상인 사용자들의 목록
    WITH UserActivityCount AS (
        SELECT login_id, COUNT(*) AS activity_count
        FROM tUserActivity
        GROUP BY login_id
        HAVING COUNT(*) >= (
            SELECT AVG(count)
            FROM (
                SELECT COUNT(*) AS count
                FROM tUserActivity
                GROUP BY login_id
            ) subquery
        )
    )
    -- 활동 수가 평균 이상인 사용자의 닉네임과 역할 정보를 가져옴
    SELECT tLoginPass.nickname, tUserRole.user_role_type
    FROM UserActivityCount
    INNER JOIN tLoginPass ON UserActivityCount.login_id = tLoginPass.login_id
    LEFT JOIN tUserRole ON UserActivityCount.login_id = tUserRole.login_id
END
</pre></td></tr></table>

<a name="PROCEDURE:[dbo].[pc_tLoginPass_ins]"></a><b>PROCEDURE:[dbo].[pc_tLoginPass_ins]</b>
</table>
<table border="0" cellspacing="0" cellpadding="0" width="750px"><tr><td><b>Procedure Prameters</b></td></tr></table>
<table border="0" cellspacing="1" cellpadding="0" width="750px"><tr><th>Sr.</th><th>Name</th><th>Datatype</th></tr>
<tr><td width="20px" align="center">1</td><td width="150px">@login_id</td><td width="150px">VARCHAR(32)</td></tr>
<tr><td width="20px" align="center">2</td><td width="150px">@nickname</td><td width="150px">VARCHAR(32)</td></tr>
<tr><td width="20px" align="center">3</td><td width="150px">@pass</td><td width="150px">VARCHAR(64)</td></tr>
<tr><td width="20px" align="center">4</td><td width="150px">@user_id</td><td width="150px">VARCHAR(32)</td></tr>
</table><br />
<table border="0" cellspacing="0" cellpadding="0" width="750px"><tr><td><b>Description</b></td></tr><tr><td style="word-break:break-all;"><pre>
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
</pre></td></tr></table>

---

## 아키텍처

![320  Architecture](https://github.com/max990624/C-_LoginApplication/assets/39523433/cac16104-5d9d-4bf3-b69f-74c4039ed61c)

---

### 깃 커밋 규칙

- feat : 새로운 기능 추가
- fix : 버그 수정
- docs : 문서 수정
- style : 코드 formatting, 세미콜론(;) 누락, 코드 변경이 없는 경우
- refactor : 코드 리팩터링
- test : 테스트 코드, 리팩터링 테스트 코드 추가(프로덕션 코드 변경 X)
- chore : 빌드 업무 수정, 패키지 매니저 수정(프로덕션 코드 변경 X)
- design : CSS 등 사용자 UI 디자인 변경
- comment : 필요한 주석 추가 및 변경
- rename : 파일 혹은 폴더명을 수정하거나 옮기는 작업만인 경우
- remove : 파일을 삭제하는 작업만 수행한 경우
- !BREAKING CHANGE : 커다란 API 변경의 경우
- !HOTFIX : 급하게 치명적인 버그를 고쳐야 하는 경우