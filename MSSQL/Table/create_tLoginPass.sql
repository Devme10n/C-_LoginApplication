USE [Login_System]
GO

/****** Object:  Table [dbo].[tLoginPass]    Script Date: 2023-05-30 오후 3:37:25 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tLoginPass]') AND type in (N'U'))
DROP TABLE [dbo].[tLoginPass]
GO

/****** Object:  Table [dbo].[tLoginPass]    Script Date: 2023-05-30 오후 3:37:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- tLoginPass 테이블 생성
CREATE TABLE [dbo].[tLoginPass] (
    login_id VARCHAR(32) NOT NULL,
    nickname VARCHAR(32),
    pass VARCHAR(64) NOT NULL,
    user_id VARCHAR(32) NOT NULL,
    w1_dtm DATETIME NOT NULL,
    w9_dtm DATETIME NOT NULL,

    CONSTRAINT PK_tLoginPass PRIMARY KEY(login_id),
    CONSTRAINT FK_tLoginPass_tUser FOREIGN KEY(user_id) REFERENCES dbo.tUser(user_id),
    CONSTRAINT UK_tLoginPass_nickname UNIQUE(nickname)
);
GO