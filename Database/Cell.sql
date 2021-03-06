USE [Cell]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[EmailID] [varchar](100) NULL,
	[UserName] [varchar](100) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[CommentID] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioID] [int] NOT NULL,
	[ContentID] [int] NULL,
	[StudentID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[CommentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Content]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Content](
	[ContentID] [int] IDENTITY(1,1) NOT NULL,
	[HeadingID] [varchar](100) NOT NULL,
	[HeadingText] [varchar](100) NOT NULL,
	[Contents] [varchar](max) NOT NULL,
	[Image] [varchar](200) NULL,
	[HasCommentBox] [bit] NOT NULL,
	[HasButtons] [bit] NOT NULL,
	[IsCreatedByStudent] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Content] PRIMARY KEY CLUSTERED 
(
	[ContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Scenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Scenario](
	[ScenarioID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Details] [varchar](max) NOT NULL,
	[Image] [varchar](200) NULL,
	[IsCreatedByStudent] [bit] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Scenario] PRIMARY KEY CLUSTERED 
(
	[ScenarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ScenarioContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ScenarioContent](
	[ScenarioContentID] [int] IDENTITY(1,1) NOT NULL,
	[ScenarioID] [int] NOT NULL,
	[ContentID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_ScenarioContent] PRIMARY KEY CLUSTERED 
(
	[ScenarioContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubContent](
	[SubContentID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NOT NULL,
	[ChildID] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_SubContent] PRIMARY KEY CLUSTERED 
(
	[SubContentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Admin] ON 

INSERT [dbo].[Admin] ([AdminID], [Name], [EmailID], [UserName], [Password], [IsActive]) VALUES (1, N'Admin', N'admin@cellproject.com', N'admin', N'admin', 1)
SET IDENTITY_INSERT [dbo].[Admin] OFF
SET IDENTITY_INSERT [dbo].[Comment] ON 

INSERT [dbo].[Comment] ([CommentID], [ScenarioID], [ContentID], [StudentID], [CreatedOn], [IsActive]) VALUES (2, 2, 14, 1, CAST(N'2016-11-28 11:29:27.570' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Comment] OFF
SET IDENTITY_INSERT [dbo].[Content] ON 

INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (11, N'Content A', N'Content A Heading Text', N'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:06:30.213' AS DateTime), 1)
INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (12, N'Content B', N'Content B Heading Text', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', N'20161128111141659.jpg', 1, 1, 0, 1, CAST(N'2016-11-28 11:11:41.663' AS DateTime), 1)
INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (13, N'Content C', N'Content C Heading Text', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:12:43.073' AS DateTime), 1)
INSERT [dbo].[Content] ([ContentID], [HeadingID], [HeadingText], [Contents], [Image], [HasCommentBox], [HasButtons], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (14, N'Content D', N'Content D Heading Text', N'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.', NULL, 0, 0, 0, 1, CAST(N'2016-11-28 11:27:42.470' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Content] OFF
SET IDENTITY_INSERT [dbo].[Scenario] ON 

INSERT [dbo].[Scenario] ([ScenarioID], [Name], [Details], [Image], [IsCreatedByStudent], [CreatedBy], [CreatedOn], [IsActive]) VALUES (2, N'Scenario 1', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', N'20161128111509582.jpg', 0, 1, CAST(N'2016-11-28 11:15:09.597' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Scenario] OFF
SET IDENTITY_INSERT [dbo].[ScenarioContent] ON 

INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (2, 1, 8, 1)
INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (3, 1, 9, 1)
INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (4, 1, 10, 1)
INSERT [dbo].[ScenarioContent] ([ScenarioContentID], [ScenarioID], [ContentID], [IsActive]) VALUES (5, 2, 11, 1)
SET IDENTITY_INSERT [dbo].[ScenarioContent] OFF
SET IDENTITY_INSERT [dbo].[SubContent] ON 

INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (8, 11, 12, 1)
INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (9, 11, 13, 1)
INSERT [dbo].[SubContent] ([SubContentID], [ParentID], [ChildID], [IsActive]) VALUES (10, 13, 14, 1)
SET IDENTITY_INSERT [dbo].[SubContent] OFF
/****** Object:  StoredProcedure [dbo].[AdminLogin]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[AdminLogin]
	@UserName			VARCHAR(100),
	@Password			VARCHAR(100),
	@AdminID			INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM [Admin] WHERE UserName = @UserName AND [Password] = @Password AND IsActive = 1)
	BEGIN
		SELECT 
			@AdminID = AdminID 
		FROM 
			[Admin] 
		WHERE 
			UserName = @UserName 
		AND 
			[Password] = @Password
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SaveComment]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveComment]
	@ScenarioID					INT,
	@ContentID					INT = NULL,
	@StudentID					INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO
		Comment(ScenarioID, ContentID, StudentID, CreatedOn, IsActive)
	VALUES
		(@ScenarioID, @ContentID, @StudentID, GETDATE(), 1)
END

GO
/****** Object:  StoredProcedure [dbo].[SaveContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveContent]
	@ContentID					INT,
	@HeadingID					VARCHAR(100),
	@HeadingText				VARCHAR(100),
	@Contents					VARCHAR(MAX),
	@Image						VARCHAR(200) = NULL,
	@HasCommentBox				BIT,
	@HasButtons					BIT,
	@IsCreatedByStudent			BIT,
	@CreatedBy					INT,
	@NewContentID				INT OUT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM Content WHERE ContentID = @ContentID AND @ContentID != -1)
	BEGIN
		UPDATE
			Content
		SET
			HeadingID = @HeadingID, HeadingText = @HeadingText, Contents = @Contents,
			[Image] = @Image, HasCommentBox = @HasCommentBox, HasButtons = @HasButtons
		WHERE
			ContentID = @ContentID;

		SET
			@NewContentID = @ContentID;
	END

	ELSE
	BEGIN
		INSERT INTO
			Content(HeadingID, HeadingText, Contents, [Image], HasCommentBox, HasButtons, IsCreatedByStudent,
			CreatedBy, CreatedOn, IsActive)
		VALUES
			(@HeadingID, @HeadingText, @Contents, @Image, @HasCommentBox, @HasButtons, @IsCreatedByStudent,
			@CreatedBy, GETDATE(), 1);

		SET
			@NewContentID = SCOPE_IDENTITY();
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SaveScenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveScenario]
	@ScenarioID					INT,
	@Name						VARCHAR(50),
	@Details					VARCHAR(MAX),
	@Image						VARCHAR(200) = NULL,
	@IsCreatedByStudent			BIT,
	@CreatedBy					INT,
	@NewScenarioID				INT OUT
AS
BEGIN
	SET NOCOUNT ON;

	IF EXISTS (SELECT 1 FROM Scenario WHERE ScenarioID = @ScenarioID AND @ScenarioID != -1)
	BEGIN
		UPDATE
			Scenario
		SET
			Name = @Name, Details = @Details, [Image] = @Image, 
			IsCreatedByStudent = @IsCreatedByStudent, IsActive = 1

		SET
			@NewScenarioID = @ScenarioID
	END

	ELSE
	BEGIN
		INSERT INTO
			Scenario(Name, Details, [Image], IsCreatedByStudent, CreatedBy, CreatedOn, IsActive)
		VALUES
			(@Name, @Details, @Image, @IsCreatedByStudent, @CreatedBy, GETDATE(), 1)

		SET
			@NewScenarioID = SCOPE_IDENTITY();
	END
END

GO
/****** Object:  StoredProcedure [dbo].[SaveScenarioContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveScenarioContent]
	@ScenarioID				INT,
	@ContentID				INT,
	@IsDeleted				INT
AS
BEGIN
	SET NOCOUNT ON;

	IF(@IsDeleted = 1)
	BEGIN
		DELETE FROM 
			ScenarioContent 
		WHERE 
			ScenarioID = @ScenarioID 
		AND 
			ContentID = @ContentID
	END

	ELSE
	BEGIN
		INSERT INTO
			ScenarioContent(ScenarioID, ContentID, IsActive)
		VALUES
			(@ScenarioID, @ContentID, 1)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SaveSubContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SaveSubContent]
	@ParentID				INT,
	@ChildID				INT,
	@IsDeleted				INT
AS
BEGIN
	SET NOCOUNT ON;

	IF(@IsDeleted = 1)
	BEGIN
		DELETE FROM 
			SubContent 
		WHERE 
			ParentID = @ParentID 
		AND 
			ChildID = @ChildID
	END

	ELSE
	BEGIN
		IF (@ParentID != @ChildID)
		BEGIN
			INSERT INTO
				SubContent(ParentID, ChildID, IsActive)
			VALUES
				(@ParentID, @ChildID, 1)
		END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[ShowContent]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowContent]
	@UserID						INT,
	@ContentID					INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText,
		CONT.[Image]			AS [Image],
		CONT.Contents			AS Contents
	FROM
		Content					AS CONT
	WHERE
		CONT.IsActive = 1
	AND
		(CONT.ContentID = @ContentID OR @ContentID IS NULL)
END

GO
/****** Object:  StoredProcedure [dbo].[ShowContentByScenarioID]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowContentByScenarioID]
	@UserID						INT,
	@ScenarioID					INT 
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText
	FROM
		Content					AS CONT
	INNER JOIN
		ScenarioContent			AS SC
	ON
		CONT.ContentID = SC.ContentID
	WHERE
		CONT.IsActive = 1
	AND
		(SC.ScenarioID = @ScenarioID)
END

GO
/****** Object:  StoredProcedure [dbo].[ShowScenario]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowScenario]
	@UserID						INT = NULL,
	@ScenarioID					INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		'Scenario ' + 
		CONVERT(VARCHAR, ROW_NUMBER() 
		OVER(PARTITION BY ScenarioID ORDER BY ScenarioID ASC)) AS ScenarioNumber,
		SCN.ScenarioID			AS ScenarioID,
		SCN.Name				AS Name,
		SCN.Details				AS Details,
		SCN.[Image]				AS [Image]
	FROM 
		Scenario				AS SCN
	WHERE
		SCN.IsActive = 1
	AND
		(SCN.ScenarioID = @ScenarioID OR @ScenarioID IS NULL)
END

GO
/****** Object:  StoredProcedure [dbo].[ShowSubContentByContentID]    Script Date: 28/11/2016 12:21:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ShowSubContentByContentID] 
	@UserID						INT = NULL,
	@ContentID					INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		CONT.ContentID			AS ContentID,
		CONT.HeadingID			AS HeadingID,
		CONT.HeadingText		AS HeadingText
	FROM
		SubContent				AS SC
	INNER JOIN
		Content					AS CONT
	ON
		SC.ChildID = CONT.ContentID
	WHERE
		SC.ParentID = @ContentID
END

GO
