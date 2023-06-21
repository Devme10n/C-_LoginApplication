USE [Login_System]
GO

/****** Object:  Table [dbo].[tUser] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tUser]') AND type in (N'U'))
DROP TABLE [dbo].[tUser]
GO

-- tUser 테이블 생성
CREATE TABLE [dbo].[tUser] (
    user_id VARCHAR(32) NOT NULL,
    join_dtm DATETIME NOT NULL,
    wdrl_dtm DATETIME,
    w1_dtm DATETIME NOT NULL,
    w9_dtm DATETIME NOT NULL,

    CONSTRAINT [PK_tUser] PRIMARY KEY(user_id)
);
GO