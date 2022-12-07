USE [master]
GO
/****** Object:  Database [QuizDB]    Script Date: 06/12/2022 23:18:40 ******/
CREATE DATABASE [QuizDB]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QuizDB] SET  MULTI_USER 
GO
ALTER DATABASE [QuizDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuizDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuizDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [QuizDB] SET QUERY_STORE = OFF
GO
USE [QuizDB]
GO
/****** Object:  Table [dbo].[Options]    Script Date: 06/12/2022 23:18:40 ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 06/12/2022 23:18:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] NOT NULL,
	[QuestionText] [nvarchar](max) NULL,
 CONSTRAINT [PK_QuestionsQuiz] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
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
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (37, N'Chef', 2, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (38, N'Golfer', 4, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (39, N'Carpenter', 8, 10)
GO
INSERT [dbo].[Options] ([OptionId], [Text], [Score], [QuestionId]) VALUES (40, N'Librarian', 10, 10)
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (1, N'Where is Mario supposedly from?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (2, N'Excluding thumbs, how many fingers does Mario have?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (3, N'What was Princess Peach’s original name?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (4, N'In the original Super Mario Bros. for NES, what colour are Mario’s dungarees?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (5, N'When is Mario Day celebrated?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (6, N'According to his creator, how old is Mario supposed to be?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (7, N'Which of the following titles is NOT an official Mario game?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (8, N'How many physical retail Nintendo Switch games (including games that require a physical purchase) contain the word ''Mario'' in the title?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (9, N'What is the best-selling Mario game of all time?')
GO
INSERT [dbo].[Questions] ([Id], [QuestionText]) VALUES (10, N'Which of these roles has Mario NOT appeared as in a game?')
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
/****** Object:  StoredProcedure [dbo].[GetQuestions]    Script Date: 06/12/2022 23:18:40 ******/
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

     SELECT Id, QuestionText, Text, Score  
    FROM Options join Questions ON Id = QuestionId
END
GO
USE [master]
GO
ALTER DATABASE [QuizDB] SET  READ_WRITE 
GO
