USE [Login_System]
GO

/****** Object:  Table [dbo].[tUserActivity] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tUserActivity]') AND type in (N'U'))
DROP TABLE [dbo].[tUserActivity]
GO

-- tUserActivity 테이블 생성
CREATE TABLE [dbo].[tUserActivity] (
    user_act_id UNIQUEIDENTIFIER NOT NULL,
    login_id VARCHAR(32) NOT NULL,
    user_act_type CHAR(16) CHECK (user_act_type IN ('login', 'logout', 'signup')),
    w1_dtm DATETIME NOT NULL,
    w9_dtm DATETIME NOT NULL

    CONSTRAINT [PK_tUserActivity] PRIMARY KEY(user_act_id)
);
GO