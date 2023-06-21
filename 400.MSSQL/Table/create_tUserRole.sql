USE [Login_System]
GO

/****** Object:  Table [dbo].[tUserRole] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tUserRole]') AND type in (N'U'))
DROP TABLE [dbo].[tUserRole]
GO

-- tUserRole 테이블 생성
CREATE TABLE [dbo].[tUserRole] (
    user_role_id UNIQUEIDENTIFIER NOT NULL,
    login_id VARCHAR(32) NOT NULL,
    user_role_type CHAR(16) CHECK (user_role_type IN ('admin', 'user')),
	w1_dtm DATETIME NOT NULL,
    w9_dtm DATETIME NOT NULL,

	CONSTRAINT [PK_tUserRole] PRIMARY KEY(user_role_id)
);
GO