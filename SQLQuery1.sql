USE [QuizDB]
GO
/****** Object:  UserDefinedTableType [dbo].[UserCommentsType]    Script Date: 10/12/2022 16:59:42 ******/
CREATE TYPE [dbo].[UserCommentsType] AS TABLE(
	[QuestionId] [int] NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[UserId] [nvarchar](max) NOT NULL
)
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NULL,
	[Comment] [varchar](max) NULL,
	[UserId] [varchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Options](
	[OptionId] [int] NOT NULL,
	[Text] [nvarchar](max) NULL,
	[Score] [int] NULL,
	[QuestionId] [int] NOT NULL,
 CONSTRAINT [PK_Options] PRIMARY KEY CLUSTERED 
(
	[OptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_QuestionsQuiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Scores]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Scores](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](max) NULL,
	[Score] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (1, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (2, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (3, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (4, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (5, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (6, 10, N'fdfd', N'11111')
GO
INSERT [dbo].[Comments] ([Id], [QuestionId], [Comment], [UserId]) VALUES (7, 10, N'fdfd', N'11111')
GO
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (1, N'France', 2, 1)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (2, N'Italy', 10, 1)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (3, N'Switzerland', 8, 1)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (4, N'Germany', 4, 1)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (5, N'8', 10, 2)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (6, N'6', 8, 2)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (7, N'7(he lost one in a plumbing mishap)', 2, 2)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (8, N'He doesn''t possess individual digits', 4, 2)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (9, N'Princess Plum', 10, 3)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (10, N'Princess Rainbow Princess', 8, 3)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (11, N'Princess Toadstool', 4, 3)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (12, N'Princess Apple', 2, 3)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (13, N'Blue', 2, 4)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (14, N'Brown', 4, 4)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (15, N'Red', 10, 4)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (16, N'Yellow', 8, 4)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (17, N'10th March', 10, 5)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (18, N'13th September', 4, 5)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (19, N'23rd September', 8, 5)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (20, N'16th November', 6, 5)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (21, N'mid-20s', 10, 6)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (22, N'36', 8, 6)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (23, N'37', 4, 6)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (24, N'mid-40s', 2, 6)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (25, N'Mario Clash', 10, 7)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (26, N'Mario vs. Luigi', 8, 7)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (27, N'Mario Teaches Typing', 2, 7)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (28, N'Mario Superstar Baseball', 4, 7)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (29, N'12', 10, 8)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (30, N'13', 8, 8)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (31, N'11', 6, 8)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (32, N'10', 2, 8)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (33, N'New Super Mario Bros.', 8, 9)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (34, N'Super Mario Bros. 3', 6, 9)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (35, N'Super Mario World', 2, 9)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (36, N'Super Mario Bros.', 10, 9)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (37, N'Chef', 0, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (38, N'Golfer', 0, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (39, N'Carpenter', 5, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (40, N'Librarian', 5, 10)
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (1, N'Where is Mario supposedly from?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (2, N'Excluding thumbs, how many fingers does Mario have?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (3, N'What was Princess Peach’s original name?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (4, N'In the original Super Mario Bros. for NES, what colour are Mario’s dungarees?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (5, N'When is Mario Day celebrated?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (6, N'According to his creator, how old is Mario supposed to be?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (7, N'Which of the following titles is NOT an official Mario game?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (8, N'How many physical retail Nintendo Switch games (including games that require a physical purchase) contain the word ''Mario'' in the title?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (9, N'What is the best-selling Mario game of all time?', N'Single    ')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText], [Type]) VALUES (10, N'Which of these roles has Mario appeared as in a game?', N'Multiple  ')
GO
SET IDENTITY_INSERT [dbo].[Scores] ON 
GO
INSERT [dbo].[Scores] ([Id], [UserId], [Score]) VALUES (1, N'11111', CAST(5.80 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[Scores] OFF
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK_Options_Options] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Options] ([OptionId])
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK_Options_Options]
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK_Options_Options1] FOREIGN KEY([OptionId])
REFERENCES [dbo].[Options] ([OptionId])
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK_Options_Options1]
GO
ALTER TABLE [dbo].[Options]  WITH CHECK ADD  CONSTRAINT [FK_Options_Questions] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Options] CHECK CONSTRAINT [FK_Options_Questions]
GO
/****** Object:  StoredProcedure [dbo].[GetQuestions]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetQuestions]

AS
BEGIN

	SET NOCOUNT ON;

     SELECT Id, QuestionText, Text, Score, Type
    FROM Options join Questions ON Id = QuestionId
END
GO
/****** Object:  StoredProcedure [dbo].[SaveCommentsForUser]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[SaveCommentsForUser] 

    @UserCommentsType UserCommentsType  READONLY

AS
BEGIN
    INSERT INTO Comments(QuestionId, Comment, UserId)
        SELECT QuestionId,Comment,UserId FROM @UserCommentsType
END
GO
/****** Object:  StoredProcedure [dbo].[SaveScoreForUser]    Script Date: 10/12/2022 16:59:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SaveScoreForUser]
	-- Add the parameters for the stored procedure here
	@UserId varchar(max), 
	@Score Decimal(18,2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Scores(
    [UserId],
    [Score])
VALUES (@UserId, @Score)
END
GO
