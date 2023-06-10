# LoginApplication
## Documentation
1. [요구사항정의서](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/110.%20Request.pdf)

2. [Data Dictionary](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/210.%20Data%20Dictionary.xlsx)

3. [Data Define Diagram](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/230.%20Data%20Define%20Diagram.pdf)

4. [Process Define Diagram](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/250.%20Process%20Define%20Diagram.pdf)

5. [Bubble Chart](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/290.%20Bubble%20Chart.pdf)

6. [ERD](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/290.%20Entity-Relationship%20Diagram.pdf)

7. [테이블 명세서](https://github.com/max990624/C-_LoginApplication/blob/master/LoginSystem%20Document/310.%20Table%20Specification.xlsx)

---

## MSSQL

[저장 프로시저](https://github.com/max990624/C-_LoginApplication/tree/master/MSSQL/Stored%20Procedure)

: 테이블당 필요한 CRUD 저장 프로시저

---

## 아키텍처

![320  Architecture](https://github.com/max990624/C-_LoginApplication/assets/39523433/cac16104-5d9d-4bf3-b69f-74c4039ed61c)

사용자 -> 클라이언트 애플리케이션(C# Windowform) -> 데이터베이스 서버(MSSQL) -> 저장 프로시저 -> 데이터베이스 테이블