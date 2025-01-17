USE [master]
GO
/****** Object:  Database [GameMaster]    Script Date: 1/10/2021 12:30:30 AM ******/
CREATE DATABASE [GameMaster]
 CONTAINMENT = NONE
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [GameMaster] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GameMaster].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GameMaster] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GameMaster] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GameMaster] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GameMaster] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GameMaster] SET ARITHABORT OFF 
GO
ALTER DATABASE [GameMaster] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GameMaster] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GameMaster] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GameMaster] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GameMaster] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GameMaster] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GameMaster] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GameMaster] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GameMaster] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GameMaster] SET  ENABLE_BROKER 
GO
ALTER DATABASE [GameMaster] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GameMaster] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GameMaster] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GameMaster] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GameMaster] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GameMaster] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GameMaster] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GameMaster] SET RECOVERY FULL 
GO
ALTER DATABASE [GameMaster] SET  MULTI_USER 
GO
ALTER DATABASE [GameMaster] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GameMaster] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GameMaster] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GameMaster] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GameMaster] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GameMaster] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'GameMaster', N'ON'
GO
ALTER DATABASE [GameMaster] SET QUERY_STORE = OFF
GO
USE [GameMaster]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Health] [int] NOT NULL,
	[Mana] [int] NOT NULL,
	[Mobility] [int] NOT NULL,
	[Strength] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacterDetails]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CharacterDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[GamesPlayed] [int] NULL,
	[GamesWon] [int] NULL,
	[SeasonId] [int] NOT NULL,
 CONSTRAINT [PK_CharacterDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SeasonId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GamePlayer]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GamePlayer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GameId] [int] NOT NULL,
	[PlayerId] [int] NOT NULL,
	[CharacterId] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[IsWinner] [bit] NOT NULL,
 CONSTRAINT [PK_GamePlayer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](500) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[TimeCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Birthday] [date] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Activity] [int] NOT NULL,
	[Skill] [int] NOT NULL,
	[Temper] [int] NOT NULL,
	[Score] [int] NULL,
	[RankId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rank](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Score] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Region](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Synergy]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Synergy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[Constant] [int] NOT NULL,
	[Multiplier] [int] NOT NULL,
 CONSTRAINT [PK_Synergy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[RoleId] [int] NOT NULL,
	[PersonId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weapon]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Block] [int] NOT NULL,
	[Magic] [int] NOT NULL,
	[Power] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeaponDetails]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WeaponDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeaponId] [int] NOT NULL,
	[GamesPlayed] [int] NULL,
	[GamesWon] [int] NULL,
	[SeasonId] [int] NOT NULL,
 CONSTRAINT [PK_WeaponDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Character] ON 

INSERT [dbo].[Character] ([Id], [Name], [Health], [Mana], [Mobility], [Strength], [IsActive]) VALUES (1, N'Archer', 3, 4, 4, 10, 1)
INSERT [dbo].[Character] ([Id], [Name], [Health], [Mana], [Mobility], [Strength], [IsActive]) VALUES (2, N'Assassin', 3, 6, 9, 5, 1)
INSERT [dbo].[Character] ([Id], [Name], [Health], [Mana], [Mobility], [Strength], [IsActive]) VALUES (3, N'Knight', 10, 3, 1, 8, 1)
INSERT [dbo].[Character] ([Id], [Name], [Health], [Mana], [Mobility], [Strength], [IsActive]) VALUES (4, N'Wizard', 4, 10, 5, 3, 1)
SET IDENTITY_INSERT [dbo].[Character] OFF
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (1, N'Admin', N'Admin', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (2, N'GameMaster', N'GameMaster', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (3, N'Business', N'Business', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (4, N'Player', N'Player', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (5, N'fca25166-9e6d-462f-88e7-59f0a119e3fe', N'fca25166-9e6d-462f-88e7-59f0a119e3fe', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (6, N'af4fe783-1149-4271-8cf2-b2f2e9f18d87', N'af4fe783-1149-4271-8cf2-b2f2e9f18d87', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (7, N'2eca966b-2b55-4e49-9b22-0442c579c27f', N'2eca966b-2b55-4e49-9b22-0442c579c27f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (8, N'93fac761-eecc-4408-bef1-bc8b4459a174', N'93fac761-eecc-4408-bef1-bc8b4459a174', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (9, N'c1a3a38a-b166-4acb-b4c2-901e796f54ea', N'c1a3a38a-b166-4acb-b4c2-901e796f54ea', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (10, N'6876ab7b-47c8-4580-a16d-1d20d185422f', N'6876ab7b-47c8-4580-a16d-1d20d185422f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (11, N'6d693587-a80f-48c7-bdda-dc066717aca9', N'6d693587-a80f-48c7-bdda-dc066717aca9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (12, N'17ad69e3-3339-4210-9dd5-8246c84e1d18', N'17ad69e3-3339-4210-9dd5-8246c84e1d18', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (13, N'a9bba7b3-dd86-4d4c-a43e-f99303b47eda', N'a9bba7b3-dd86-4d4c-a43e-f99303b47eda', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (14, N'ce924918-3ffb-47a0-a4a8-77733fb3dcb2', N'ce924918-3ffb-47a0-a4a8-77733fb3dcb2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (15, N'ddbe11ae-25be-42a1-88e5-12c1559d72a0', N'ddbe11ae-25be-42a1-88e5-12c1559d72a0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (16, N'8f7aec53-5bcd-4fe8-b875-a46cd607351d', N'8f7aec53-5bcd-4fe8-b875-a46cd607351d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (17, N'fb85a977-6775-473b-a084-d1f635219606', N'fb85a977-6775-473b-a084-d1f635219606', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (18, N'c26d3de3-93e5-4df4-b4c7-b4638d55289a', N'c26d3de3-93e5-4df4-b4c7-b4638d55289a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (19, N'abbf127e-b6cf-4bf8-9594-3221ef194d31', N'abbf127e-b6cf-4bf8-9594-3221ef194d31', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (20, N'3c62a797-4385-4774-973c-e86ba8264843', N'3c62a797-4385-4774-973c-e86ba8264843', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (21, N'067fc892-9433-4088-b416-7545b81b8c61', N'067fc892-9433-4088-b416-7545b81b8c61', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (22, N'a0128257-89d1-4fcd-a396-abf5cfaf798c', N'a0128257-89d1-4fcd-a396-abf5cfaf798c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (23, N'f6371405-6e8e-46d9-8831-7195e2330f7e', N'f6371405-6e8e-46d9-8831-7195e2330f7e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (24, N'6308ac1d-fc16-430a-be31-0adaafefdea7', N'6308ac1d-fc16-430a-be31-0adaafefdea7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (25, N'7fa7001f-0ac7-4855-944e-dc75605999d5', N'7fa7001f-0ac7-4855-944e-dc75605999d5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (26, N'345af4af-f649-43cc-8ed7-1a508acb1dbc', N'345af4af-f649-43cc-8ed7-1a508acb1dbc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (27, N'abba007a-dac1-4ebe-9e3c-dd005fe659cf', N'abba007a-dac1-4ebe-9e3c-dd005fe659cf', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (28, N'f7295f2e-1361-45e4-8181-bc51de5a20f1', N'f7295f2e-1361-45e4-8181-bc51de5a20f1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (29, N'f3e2bcef-1c11-4326-b422-2b7d9f92e71d', N'f3e2bcef-1c11-4326-b422-2b7d9f92e71d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (30, N'3fa7db29-0322-41dc-b26d-55bd9a87b242', N'3fa7db29-0322-41dc-b26d-55bd9a87b242', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (31, N'6ac2e544-f466-445a-9046-ad97f16cbb8f', N'6ac2e544-f466-445a-9046-ad97f16cbb8f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (32, N'63347d93-ded6-4664-88a2-91c698c6d63b', N'63347d93-ded6-4664-88a2-91c698c6d63b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (33, N'4b0be1c7-1640-4825-9f3d-ce0e06b729a0', N'4b0be1c7-1640-4825-9f3d-ce0e06b729a0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (34, N'bff7f703-2d5d-4ee3-baf6-6e874de4adae', N'bff7f703-2d5d-4ee3-baf6-6e874de4adae', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (35, N'ccd10fe4-8e9c-4e25-88d3-89897cbb2cb5', N'ccd10fe4-8e9c-4e25-88d3-89897cbb2cb5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (36, N'008598a8-12ab-4502-a8d3-0493e6002773', N'008598a8-12ab-4502-a8d3-0493e6002773', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (37, N'2f35c73b-927b-4bfc-9ca7-916697b55991', N'2f35c73b-927b-4bfc-9ca7-916697b55991', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (38, N'ec856eb5-c98d-428b-9313-9260d8d4fa73', N'ec856eb5-c98d-428b-9313-9260d8d4fa73', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (39, N'08a54c0f-c6bb-41df-aaed-e307c54afe63', N'08a54c0f-c6bb-41df-aaed-e307c54afe63', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (40, N'b3458feb-5bf8-4404-9fd7-2d8fa853afac', N'b3458feb-5bf8-4404-9fd7-2d8fa853afac', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (41, N'9fabba2a-3793-41e4-bb19-f52a515a3a46', N'9fabba2a-3793-41e4-bb19-f52a515a3a46', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (42, N'16dec032-ab6b-4b2d-9dff-f9e53858a8f9', N'16dec032-ab6b-4b2d-9dff-f9e53858a8f9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (43, N'bf1627a1-343f-4e7b-a427-485e3c815b3f', N'bf1627a1-343f-4e7b-a427-485e3c815b3f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (44, N'ca3422f2-cbb4-4154-9955-3413b9c5c41d', N'ca3422f2-cbb4-4154-9955-3413b9c5c41d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (45, N'8076970a-7c23-4034-809a-32634a5b61c1', N'8076970a-7c23-4034-809a-32634a5b61c1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (46, N'117d6b32-ba6d-4099-abfe-ddbb526a72e3', N'117d6b32-ba6d-4099-abfe-ddbb526a72e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (47, N'ed1428a4-0bb7-48c3-b4fa-ee56a176a635', N'ed1428a4-0bb7-48c3-b4fa-ee56a176a635', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (48, N'2376ae97-8fd6-4810-90b1-5939df2ef658', N'2376ae97-8fd6-4810-90b1-5939df2ef658', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (49, N'eec4e486-b7e2-4af7-a711-b54d31930449', N'eec4e486-b7e2-4af7-a711-b54d31930449', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (50, N'd633fbfd-06d5-4f22-9755-fea92299621b', N'd633fbfd-06d5-4f22-9755-fea92299621b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (51, N'a017401d-a63b-454f-aec6-cacdbd891744', N'a017401d-a63b-454f-aec6-cacdbd891744', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (52, N'08c0fa91-e9f3-4e2d-87c9-7ed9d0220337', N'08c0fa91-e9f3-4e2d-87c9-7ed9d0220337', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (53, N'2e48a394-b0d2-45e1-82cc-83d8fddd0f74', N'2e48a394-b0d2-45e1-82cc-83d8fddd0f74', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (54, N'4d717f53-9ce8-4abd-a8d8-39e64e8585aa', N'4d717f53-9ce8-4abd-a8d8-39e64e8585aa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (55, N'3bccc560-5981-4a35-9a06-945143e6359f', N'3bccc560-5981-4a35-9a06-945143e6359f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (56, N'6ff22ae0-dd50-4dd2-8894-3bd3c950d19e', N'6ff22ae0-dd50-4dd2-8894-3bd3c950d19e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (57, N'be64dcc3-e00f-40d4-80cd-2e3b9b7ae2ba', N'be64dcc3-e00f-40d4-80cd-2e3b9b7ae2ba', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (58, N'13048b28-60fb-4fc6-954e-3c116881ca2f', N'13048b28-60fb-4fc6-954e-3c116881ca2f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (59, N'e7b4e398-7775-486f-9de5-857a583314c1', N'e7b4e398-7775-486f-9de5-857a583314c1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (60, N'96c30366-42fd-4460-bbb3-6ea1d3106abf', N'96c30366-42fd-4460-bbb3-6ea1d3106abf', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (61, N'95bb0b15-d358-4794-a5d0-f8e42cd92c30', N'95bb0b15-d358-4794-a5d0-f8e42cd92c30', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (62, N'768426d9-6c4c-4dec-b59e-02b930cd400a', N'768426d9-6c4c-4dec-b59e-02b930cd400a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (63, N'50f2c7c2-acfc-4876-b3bc-7e7be273b118', N'50f2c7c2-acfc-4876-b3bc-7e7be273b118', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (64, N'38f62ce1-01d0-4999-8e20-dcf2317928a3', N'38f62ce1-01d0-4999-8e20-dcf2317928a3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (65, N'4b2ffbab-0c85-4fe8-ac6d-57485113eb7a', N'4b2ffbab-0c85-4fe8-ac6d-57485113eb7a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (66, N'5af05bec-f515-4d15-a609-fe616fce6a26', N'5af05bec-f515-4d15-a609-fe616fce6a26', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (67, N'bf95725d-7ea8-4255-8eeb-129f37b45872', N'bf95725d-7ea8-4255-8eeb-129f37b45872', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (68, N'6e8d4e4b-0fb0-4924-8156-d1e59f6c7f50', N'6e8d4e4b-0fb0-4924-8156-d1e59f6c7f50', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (69, N'be7e9c1e-0aaf-4df1-ac9b-bc40c5baf5d3', N'be7e9c1e-0aaf-4df1-ac9b-bc40c5baf5d3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (70, N'5d792685-44dc-4493-b973-4ada50c95afa', N'5d792685-44dc-4493-b973-4ada50c95afa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (71, N'd3e066f3-62d6-4536-bdcc-a2c87925110c', N'd3e066f3-62d6-4536-bdcc-a2c87925110c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (72, N'9d2dd280-32fd-4985-862a-2de569c56f84', N'9d2dd280-32fd-4985-862a-2de569c56f84', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (73, N'f6803b82-da31-48af-8c90-549bc37e4e19', N'f6803b82-da31-48af-8c90-549bc37e4e19', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (74, N'cf88f33a-4a4f-4316-b71a-72cd4f4914b7', N'cf88f33a-4a4f-4316-b71a-72cd4f4914b7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (75, N'6d492896-64bf-4d9c-a4ff-46f420b6f9e9', N'6d492896-64bf-4d9c-a4ff-46f420b6f9e9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (76, N'7accf40f-682b-40e6-8762-42139d75c3ab', N'7accf40f-682b-40e6-8762-42139d75c3ab', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (77, N'91f9bae5-5e81-4c31-b715-c00f79f763c1', N'91f9bae5-5e81-4c31-b715-c00f79f763c1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (78, N'72f3f8c2-e856-4b10-8487-2f455cfa49b0', N'72f3f8c2-e856-4b10-8487-2f455cfa49b0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (79, N'dc7c840e-1dd6-4689-9047-9eefa6dd9d0a', N'dc7c840e-1dd6-4689-9047-9eefa6dd9d0a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (80, N'c1be0184-91bb-424a-8781-c9c0cb51532a', N'c1be0184-91bb-424a-8781-c9c0cb51532a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (81, N'86a24a86-593d-425c-b850-db5a633a2585', N'86a24a86-593d-425c-b850-db5a633a2585', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (82, N'6b53b241-a6d8-4743-b45a-6ee8105b8f83', N'6b53b241-a6d8-4743-b45a-6ee8105b8f83', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (83, N'dcd2c04c-7656-4dc1-8d8a-2ec98a9d2f4e', N'dcd2c04c-7656-4dc1-8d8a-2ec98a9d2f4e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (84, N'fd4b59b2-6965-43c5-a42d-6975c7a4303c', N'fd4b59b2-6965-43c5-a42d-6975c7a4303c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (85, N'18c753ac-3f6f-45df-847a-13db560f2984', N'18c753ac-3f6f-45df-847a-13db560f2984', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (86, N'aead777f-5f6e-42f4-8285-88698a9d5b94', N'aead777f-5f6e-42f4-8285-88698a9d5b94', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (87, N'be7e9cd1-1192-40bc-8df7-0f55b25a0a11', N'be7e9cd1-1192-40bc-8df7-0f55b25a0a11', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (88, N'e20fd90c-7348-4a6d-83f4-09c1a9b79831', N'e20fd90c-7348-4a6d-83f4-09c1a9b79831', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (89, N'92b4be02-8049-4099-bd70-a03f6bd406ad', N'92b4be02-8049-4099-bd70-a03f6bd406ad', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (90, N'15912de8-0146-4879-a148-e9b32e69ad8d', N'15912de8-0146-4879-a148-e9b32e69ad8d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (91, N'48a6421a-230f-4b5e-bc5f-8ec1b7acb5d3', N'48a6421a-230f-4b5e-bc5f-8ec1b7acb5d3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (92, N'd02341ef-ca9d-47f1-b481-0ad226c00b57', N'd02341ef-ca9d-47f1-b481-0ad226c00b57', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (93, N'2e0f936a-70b9-46bf-9de9-a05c9c1cf9c9', N'2e0f936a-70b9-46bf-9de9-a05c9c1cf9c9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (94, N'1479256f-48b3-4cfc-9ab4-62b55c56454e', N'1479256f-48b3-4cfc-9ab4-62b55c56454e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (95, N'62cb3a49-6d4f-4e49-8123-748488df6d75', N'62cb3a49-6d4f-4e49-8123-748488df6d75', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (96, N'3ecece7a-f9c4-4a71-9ce5-81d53f2fd7a0', N'3ecece7a-f9c4-4a71-9ce5-81d53f2fd7a0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (97, N'a72ebdb9-40eb-4e57-9ec3-798f0d82960f', N'a72ebdb9-40eb-4e57-9ec3-798f0d82960f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (98, N'5a9fc6cc-c4a9-471f-adf3-519310b5029e', N'5a9fc6cc-c4a9-471f-adf3-519310b5029e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (99, N'ddf2dd1c-897b-403c-93ec-a76783bd4fd1', N'ddf2dd1c-897b-403c-93ec-a76783bd4fd1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (100, N'fd9bd9a8-8c75-4ed5-98dd-c61dbce18774', N'fd9bd9a8-8c75-4ed5-98dd-c61dbce18774', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (101, N'00d5cff6-669e-4ec4-b17e-81ea3c4996b4', N'00d5cff6-669e-4ec4-b17e-81ea3c4996b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (102, N'7e4e91a7-41bb-4ed6-a07a-a9f37423b988', N'7e4e91a7-41bb-4ed6-a07a-a9f37423b988', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (103, N'1447a896-39e4-4a33-8e5a-c4706e4a647b', N'1447a896-39e4-4a33-8e5a-c4706e4a647b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (104, N'241d1d3d-b7e4-4970-87da-ea0e3932a444', N'241d1d3d-b7e4-4970-87da-ea0e3932a444', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (105, N'c6f7be0d-a975-4fd3-b8dc-a45915aeab87', N'c6f7be0d-a975-4fd3-b8dc-a45915aeab87', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (106, N'74437746-712e-469b-9032-c0faaa13a6f2', N'74437746-712e-469b-9032-c0faaa13a6f2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (107, N'b866d97e-0917-46cb-ad2d-b1e07b3df6a6', N'b866d97e-0917-46cb-ad2d-b1e07b3df6a6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (108, N'2b31db92-647b-4441-9ba1-1d1f0aa90e1c', N'2b31db92-647b-4441-9ba1-1d1f0aa90e1c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (109, N'3913d3fe-8757-43b9-97da-2188ddd8a7f2', N'3913d3fe-8757-43b9-97da-2188ddd8a7f2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (110, N'4f3696d1-1f5c-44be-86dc-81347eaf51d7', N'4f3696d1-1f5c-44be-86dc-81347eaf51d7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (111, N'8749eb37-61cf-4901-b0e5-95ada1ec9401', N'8749eb37-61cf-4901-b0e5-95ada1ec9401', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (112, N'be37ac9f-aab1-416b-9cc8-1ef0dd0b506a', N'be37ac9f-aab1-416b-9cc8-1ef0dd0b506a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (113, N'03f86b97-ecf4-424b-ab86-c2c82ef2c5f9', N'03f86b97-ecf4-424b-ab86-c2c82ef2c5f9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (114, N'd90d5bf5-bb05-431c-a4bc-36862d7bf0d8', N'd90d5bf5-bb05-431c-a4bc-36862d7bf0d8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (115, N'63544e11-8775-4018-8e08-bfefb2030ae0', N'63544e11-8775-4018-8e08-bfefb2030ae0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (116, N'56e96b92-cd5f-41f5-aac0-09a9c8337dcc', N'56e96b92-cd5f-41f5-aac0-09a9c8337dcc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (117, N'6ba53c5b-718b-4fd8-8fa5-38deb4685fb1', N'6ba53c5b-718b-4fd8-8fa5-38deb4685fb1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (118, N'8e89a87e-bc51-4552-bd0f-b2134eef9058', N'8e89a87e-bc51-4552-bd0f-b2134eef9058', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (119, N'90fa266b-665f-4af1-845d-71463fa4b15d', N'90fa266b-665f-4af1-845d-71463fa4b15d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (120, N'4c360aed-7ec0-4e07-8a01-04b60b85023e', N'4c360aed-7ec0-4e07-8a01-04b60b85023e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (121, N'aa6e1d04-16ec-4d4b-a206-6757b5e74fd0', N'aa6e1d04-16ec-4d4b-a206-6757b5e74fd0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (122, N'305b9a02-1551-42da-9844-f4e030d89b46', N'305b9a02-1551-42da-9844-f4e030d89b46', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (123, N'dbe4f3a2-2b1d-4202-9a46-3ff043a22748', N'dbe4f3a2-2b1d-4202-9a46-3ff043a22748', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (124, N'0c0deb61-f99d-43fa-8492-4ae4767d42f4', N'0c0deb61-f99d-43fa-8492-4ae4767d42f4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (125, N'94b2d26a-ec48-4924-9057-9a70accb43cf', N'94b2d26a-ec48-4924-9057-9a70accb43cf', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (126, N'a70a1ffe-eea3-4dac-a368-ed7d1b74c9be', N'a70a1ffe-eea3-4dac-a368-ed7d1b74c9be', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (127, N'a215ed73-2382-45d7-ae52-4110848167ed', N'a215ed73-2382-45d7-ae52-4110848167ed', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (128, N'14805449-2fa6-482b-afda-c993ed741c70', N'14805449-2fa6-482b-afda-c993ed741c70', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (129, N'65da94e8-590d-45e9-a2b9-65fb4d8ae052', N'65da94e8-590d-45e9-a2b9-65fb4d8ae052', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (130, N'87e8c81f-88b8-431f-85b1-e054e74b4ee2', N'87e8c81f-88b8-431f-85b1-e054e74b4ee2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (131, N'e0aaaa09-5eb8-4a48-9916-1c543902993d', N'e0aaaa09-5eb8-4a48-9916-1c543902993d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (132, N'6f710bcd-bd5a-4e1c-8f3c-e6d92de414be', N'6f710bcd-bd5a-4e1c-8f3c-e6d92de414be', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (133, N'78751a51-24bd-4131-8569-c9df47f1de58', N'78751a51-24bd-4131-8569-c9df47f1de58', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (134, N'23490d4e-41aa-49af-8ae3-0cf0c2818187', N'23490d4e-41aa-49af-8ae3-0cf0c2818187', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (135, N'9f6a1b6d-01b3-4a13-a3ff-311ad7c8e916', N'9f6a1b6d-01b3-4a13-a3ff-311ad7c8e916', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (136, N'18c8e51e-0b9d-4459-95df-5593e2be7f0d', N'18c8e51e-0b9d-4459-95df-5593e2be7f0d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (137, N'90335f81-2625-43e4-bf15-366015415bab', N'90335f81-2625-43e4-bf15-366015415bab', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (138, N'f5cc0a1b-4671-4d6d-958a-1e634fbaaa0b', N'f5cc0a1b-4671-4d6d-958a-1e634fbaaa0b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (139, N'1fc5736b-a5a9-421c-8c64-1919a333efc1', N'1fc5736b-a5a9-421c-8c64-1919a333efc1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (140, N'83287ebc-9584-4e34-9e0b-bfba795642a4', N'83287ebc-9584-4e34-9e0b-bfba795642a4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (141, N'2ec71794-35d9-42f2-b270-34b5670dc58a', N'2ec71794-35d9-42f2-b270-34b5670dc58a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (142, N'ced38a38-fc87-4155-b615-93b2a817355a', N'ced38a38-fc87-4155-b615-93b2a817355a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (143, N'4ac78a82-7314-4aaf-90e3-2ad22d670fa0', N'4ac78a82-7314-4aaf-90e3-2ad22d670fa0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (144, N'528f2774-da71-4d19-85e8-11f562e94545', N'528f2774-da71-4d19-85e8-11f562e94545', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (145, N'0111f8fb-2c3a-41d8-8b79-c674f18d03d0', N'0111f8fb-2c3a-41d8-8b79-c674f18d03d0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (146, N'cea4e45c-6bbc-4158-8fbd-59f593fca46a', N'cea4e45c-6bbc-4158-8fbd-59f593fca46a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (147, N'76abc292-81e6-416f-bfff-a016ee851ffb', N'76abc292-81e6-416f-bfff-a016ee851ffb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (148, N'0b1b1c26-bcdd-4194-9a7e-bc6ed1555cdb', N'0b1b1c26-bcdd-4194-9a7e-bc6ed1555cdb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (149, N'177ae9f9-f86a-4f9e-aa49-77c9d7687a3b', N'177ae9f9-f86a-4f9e-aa49-77c9d7687a3b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (150, N'effd5254-762b-48f8-b917-97695d8951c8', N'effd5254-762b-48f8-b917-97695d8951c8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (151, N'becf6b37-252f-454c-a9e7-d4c9bb636dfc', N'becf6b37-252f-454c-a9e7-d4c9bb636dfc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (152, N'70d7e56c-598d-40e0-9bf3-daca1257f8ad', N'70d7e56c-598d-40e0-9bf3-daca1257f8ad', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (153, N'de25aa42-36e4-4fa9-8987-b67ce5a87992', N'de25aa42-36e4-4fa9-8987-b67ce5a87992', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (154, N'55451d79-deeb-4d06-8d34-981289da451f', N'55451d79-deeb-4d06-8d34-981289da451f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (155, N'c2996ee0-3021-412c-93d4-d30a1304eaba', N'c2996ee0-3021-412c-93d4-d30a1304eaba', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (156, N'85689f01-10fb-449b-b8ae-dbf35b32d769', N'85689f01-10fb-449b-b8ae-dbf35b32d769', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (157, N'baceb521-5421-4739-804c-a3065477050a', N'baceb521-5421-4739-804c-a3065477050a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (158, N'5e4f2402-8bdd-4c1f-a23e-1b531b07ee3f', N'5e4f2402-8bdd-4c1f-a23e-1b531b07ee3f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (159, N'4e70cabb-aee7-4ef8-9976-5376fb399afa', N'4e70cabb-aee7-4ef8-9976-5376fb399afa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (160, N'a2b846b2-5cd4-4942-b138-4fcbbec228db', N'a2b846b2-5cd4-4942-b138-4fcbbec228db', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (161, N'13324396-fedc-4287-be1a-1348b6a2122e', N'13324396-fedc-4287-be1a-1348b6a2122e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (162, N'69c2bb93-e522-42b1-a870-3965f5b6d245', N'69c2bb93-e522-42b1-a870-3965f5b6d245', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (163, N'4690c4d1-8295-4917-ad9e-44e8b56a7aef', N'4690c4d1-8295-4917-ad9e-44e8b56a7aef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (164, N'b66b1a62-d73d-48d0-9d52-363963be4b01', N'b66b1a62-d73d-48d0-9d52-363963be4b01', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (165, N'e3731160-3afc-4835-95da-0981f424a9e0', N'e3731160-3afc-4835-95da-0981f424a9e0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (166, N'02405e04-2778-408f-9b00-73ccdf872434', N'02405e04-2778-408f-9b00-73ccdf872434', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (167, N'ab62e084-0d12-4efb-92a1-a621932fcc8d', N'ab62e084-0d12-4efb-92a1-a621932fcc8d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (168, N'1fcbe944-69ce-4012-ad9a-1e48d1b3a549', N'1fcbe944-69ce-4012-ad9a-1e48d1b3a549', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (169, N'42d855c2-9557-47af-a869-d0ed6f2d9c6c', N'42d855c2-9557-47af-a869-d0ed6f2d9c6c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (170, N'ff0341e0-a3a5-4d99-a750-0a80a62b486f', N'ff0341e0-a3a5-4d99-a750-0a80a62b486f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (171, N'1984931f-759b-4431-af33-36a481bf86c7', N'1984931f-759b-4431-af33-36a481bf86c7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (172, N'74ac7d09-988f-4f3e-9583-59f286230527', N'74ac7d09-988f-4f3e-9583-59f286230527', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (173, N'7b86836b-575d-4169-9357-ccce8908bad8', N'7b86836b-575d-4169-9357-ccce8908bad8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (174, N'75d7ad5d-c41d-4225-9d26-f87a05484306', N'75d7ad5d-c41d-4225-9d26-f87a05484306', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (175, N'a29e4355-91fb-445f-92f4-e9343c02fe69', N'a29e4355-91fb-445f-92f4-e9343c02fe69', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (176, N'e59c2e37-7556-4125-a660-25b210433b19', N'e59c2e37-7556-4125-a660-25b210433b19', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (177, N'9272b973-1db7-48a1-8ee3-363df0465939', N'9272b973-1db7-48a1-8ee3-363df0465939', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (178, N'ec8fb363-9801-4761-a08d-b00e149a8166', N'ec8fb363-9801-4761-a08d-b00e149a8166', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (179, N'376a9ce8-47fd-46ca-a0e5-08de52b14389', N'376a9ce8-47fd-46ca-a0e5-08de52b14389', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (180, N'2948d778-0cc1-4cfd-bd9f-78cfbae900e9', N'2948d778-0cc1-4cfd-bd9f-78cfbae900e9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (181, N'8e88e901-eaed-4435-9df3-5705d9723324', N'8e88e901-eaed-4435-9df3-5705d9723324', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (182, N'531cc69f-8da9-4ea4-a43a-4bd02ba9f41f', N'531cc69f-8da9-4ea4-a43a-4bd02ba9f41f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (183, N'cbfc3cba-333e-4f75-a3f9-9e78a993f013', N'cbfc3cba-333e-4f75-a3f9-9e78a993f013', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (184, N'3dfaaa95-0a39-4c66-99f2-7bc3132860a1', N'3dfaaa95-0a39-4c66-99f2-7bc3132860a1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (185, N'dbfd3599-29a0-4a3d-b0e9-a2c2ac3a4869', N'dbfd3599-29a0-4a3d-b0e9-a2c2ac3a4869', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (186, N'69c6335e-cff9-414c-a2af-58d7b93d20c6', N'69c6335e-cff9-414c-a2af-58d7b93d20c6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (187, N'f8c61551-bd18-4d44-9130-6058ba717410', N'f8c61551-bd18-4d44-9130-6058ba717410', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (188, N'7b2ee46c-a821-4d7f-ab3d-4451e239e1c7', N'7b2ee46c-a821-4d7f-ab3d-4451e239e1c7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (189, N'cf82e7f0-1131-4fab-b8b3-01bd0140ceb5', N'cf82e7f0-1131-4fab-b8b3-01bd0140ceb5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (190, N'ea24c8c5-dc2d-4adc-8f56-89d3a4763637', N'ea24c8c5-dc2d-4adc-8f56-89d3a4763637', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (191, N'34ba1601-bb44-4c27-8306-f6676c343747', N'34ba1601-bb44-4c27-8306-f6676c343747', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (192, N'57d3c54e-bccc-4f41-9576-b6cbb9d36cd6', N'57d3c54e-bccc-4f41-9576-b6cbb9d36cd6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (193, N'af649520-d059-498b-a0cb-e009f08f45f3', N'af649520-d059-498b-a0cb-e009f08f45f3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (194, N'a497e0ea-b3ff-465e-9e3a-6fa50808b156', N'a497e0ea-b3ff-465e-9e3a-6fa50808b156', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (195, N'5da65bde-07fe-4cb5-b1df-273dc38db57b', N'5da65bde-07fe-4cb5-b1df-273dc38db57b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (196, N'189e80f3-ccb4-4781-9837-79f2a6c494c4', N'189e80f3-ccb4-4781-9837-79f2a6c494c4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (197, N'6218d503-e111-42e3-9ff8-29cb1e78633f', N'6218d503-e111-42e3-9ff8-29cb1e78633f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (198, N'2c869cd1-61d2-4e31-bd0d-09a47a51a253', N'2c869cd1-61d2-4e31-bd0d-09a47a51a253', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (199, N'dabf8f69-a7ab-4bc5-a443-35091dc4b84f', N'dabf8f69-a7ab-4bc5-a443-35091dc4b84f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (200, N'90d2145d-0bb9-4a18-b2ea-21eb2c5cf9e3', N'90d2145d-0bb9-4a18-b2ea-21eb2c5cf9e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (201, N'943356f4-b4de-4dfa-b956-26dd6f57e140', N'943356f4-b4de-4dfa-b956-26dd6f57e140', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (202, N'9ae88111-d8b7-4989-bc9f-883966307c2a', N'9ae88111-d8b7-4989-bc9f-883966307c2a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (203, N'62da0153-91a2-42f2-a7d4-253db75ed38c', N'62da0153-91a2-42f2-a7d4-253db75ed38c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (204, N'e0abfb07-2e08-47fa-8e67-024b86a00875', N'e0abfb07-2e08-47fa-8e67-024b86a00875', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (205, N'2b071f4e-4f44-4f7b-a5a5-e81e5d2f670e', N'2b071f4e-4f44-4f7b-a5a5-e81e5d2f670e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (206, N'b9d4b2cc-e1b4-4bce-a550-108a99059444', N'b9d4b2cc-e1b4-4bce-a550-108a99059444', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (207, N'5ce78483-590e-40d9-8472-98f83e0d70db', N'5ce78483-590e-40d9-8472-98f83e0d70db', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (208, N'b6e86314-1350-4fb5-b577-41a00ffd4fc7', N'b6e86314-1350-4fb5-b577-41a00ffd4fc7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (209, N'a13d72d7-f85e-4dd3-84b0-f493861df06c', N'a13d72d7-f85e-4dd3-84b0-f493861df06c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (210, N'cdc815db-bde6-426b-a350-4f86b3c5d3f6', N'cdc815db-bde6-426b-a350-4f86b3c5d3f6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (211, N'71a79ee8-3879-4728-ab24-1de79c615471', N'71a79ee8-3879-4728-ab24-1de79c615471', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (212, N'4901cba7-443e-4ca1-ad98-3ea9e8e50dc7', N'4901cba7-443e-4ca1-ad98-3ea9e8e50dc7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (213, N'50d620f3-dae2-4c54-8ae1-6113a06789d6', N'50d620f3-dae2-4c54-8ae1-6113a06789d6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (214, N'a30e2967-95c2-426c-8c32-7071b1b4c549', N'a30e2967-95c2-426c-8c32-7071b1b4c549', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (215, N'40c6ee25-4833-484a-8540-67e2c70b598b', N'40c6ee25-4833-484a-8540-67e2c70b598b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (216, N'96196ab6-a2d3-4aca-a8bb-a9a713015252', N'96196ab6-a2d3-4aca-a8bb-a9a713015252', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (217, N'd9ceed55-15c5-475d-a6b9-d5ca0469f8c6', N'd9ceed55-15c5-475d-a6b9-d5ca0469f8c6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (218, N'77e3ef07-9163-4f30-90af-a0188f7f4358', N'77e3ef07-9163-4f30-90af-a0188f7f4358', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (219, N'e90b62be-aebd-4bb5-a059-3d007a0e2e51', N'e90b62be-aebd-4bb5-a059-3d007a0e2e51', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (220, N'e55a6cfc-f3f0-4617-a700-ad2a54699cbb', N'e55a6cfc-f3f0-4617-a700-ad2a54699cbb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (221, N'd8fc0c80-b129-4b0e-986e-05682914d3b8', N'd8fc0c80-b129-4b0e-986e-05682914d3b8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (222, N'a30d9c79-53dc-4205-a6bf-54f6d2ffbaae', N'a30d9c79-53dc-4205-a6bf-54f6d2ffbaae', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (223, N'f185e1c3-4be0-433f-8b3d-a7e9fa3b8278', N'f185e1c3-4be0-433f-8b3d-a7e9fa3b8278', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (224, N'aa067057-9d5a-40a1-a2ad-04fa3d8b90ee', N'aa067057-9d5a-40a1-a2ad-04fa3d8b90ee', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (225, N'7a01f80a-703c-49fb-8ccc-80795d8cd021', N'7a01f80a-703c-49fb-8ccc-80795d8cd021', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (226, N'a1b8ab61-421e-4663-a6d5-bbf5fc81aede', N'a1b8ab61-421e-4663-a6d5-bbf5fc81aede', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (227, N'9bfc7b47-315d-4914-9b67-af82166d7c38', N'9bfc7b47-315d-4914-9b67-af82166d7c38', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (228, N'9b897307-e406-4ec8-9346-838968ed5822', N'9b897307-e406-4ec8-9346-838968ed5822', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (229, N'90205fc1-4ce9-41bf-9e41-3a3c417cb5a6', N'90205fc1-4ce9-41bf-9e41-3a3c417cb5a6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (230, N'084c613b-1f83-4328-b371-7403cdff6621', N'084c613b-1f83-4328-b371-7403cdff6621', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (231, N'5f97f3b2-40e8-4ca0-98fc-442ab83e43f2', N'5f97f3b2-40e8-4ca0-98fc-442ab83e43f2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (232, N'fc392afe-916d-4120-af42-46f17688c358', N'fc392afe-916d-4120-af42-46f17688c358', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (233, N'a331a6c3-7512-42f3-8954-4a3cb76c2afe', N'a331a6c3-7512-42f3-8954-4a3cb76c2afe', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (234, N'81a742ea-c78f-4f72-b635-a5e398144811', N'81a742ea-c78f-4f72-b635-a5e398144811', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (235, N'2b1c57aa-6ac9-4f7b-b09f-9eec1193df73', N'2b1c57aa-6ac9-4f7b-b09f-9eec1193df73', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (236, N'bea9e7cf-0601-4205-ace2-943c540990ca', N'bea9e7cf-0601-4205-ace2-943c540990ca', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (237, N'34228b75-40dd-4a97-be33-df0d9964e1f7', N'34228b75-40dd-4a97-be33-df0d9964e1f7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (238, N'4d4301b4-277f-4e99-b849-76b06a4aa238', N'4d4301b4-277f-4e99-b849-76b06a4aa238', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (239, N'5175cf7e-e651-4278-abfe-fc23a95399c3', N'5175cf7e-e651-4278-abfe-fc23a95399c3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (240, N'6c569fe8-4fe7-41bd-a487-6752ba36bd09', N'6c569fe8-4fe7-41bd-a487-6752ba36bd09', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (241, N'2aa08a2d-42c5-47ba-b481-8a31ed163840', N'2aa08a2d-42c5-47ba-b481-8a31ed163840', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (242, N'297a1f8c-7c7c-4093-ba1b-fbda28c6fc55', N'297a1f8c-7c7c-4093-ba1b-fbda28c6fc55', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (243, N'83869ed7-f671-4ac6-ae08-9334c4cd4c89', N'83869ed7-f671-4ac6-ae08-9334c4cd4c89', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (244, N'ea32f80e-b746-4b2d-b1d8-b7c40a358716', N'ea32f80e-b746-4b2d-b1d8-b7c40a358716', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (245, N'a61fd804-086d-4faa-9b55-0b1979cb34d0', N'a61fd804-086d-4faa-9b55-0b1979cb34d0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (246, N'7e1b1da2-f6fa-4c19-81ab-011dab7fd196', N'7e1b1da2-f6fa-4c19-81ab-011dab7fd196', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (247, N'02f56568-f925-49d9-92b1-4fcb8bade247', N'02f56568-f925-49d9-92b1-4fcb8bade247', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (248, N'a8d95569-8132-4174-a8a6-c7f51730d567', N'a8d95569-8132-4174-a8a6-c7f51730d567', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (249, N'bf287146-a1b7-4571-a440-66ca0fd3d1ed', N'bf287146-a1b7-4571-a440-66ca0fd3d1ed', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (250, N'd4da048f-a796-460b-a380-3d42941fd987', N'd4da048f-a796-460b-a380-3d42941fd987', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (251, N'565ed0b3-e29a-4f9e-87a0-d3ff6a5bc382', N'565ed0b3-e29a-4f9e-87a0-d3ff6a5bc382', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (252, N'522f49f6-4a7e-4353-bb1b-df6c4ff27d91', N'522f49f6-4a7e-4353-bb1b-df6c4ff27d91', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (253, N'57ddcc14-fdbd-43d8-b402-23f8849b7826', N'57ddcc14-fdbd-43d8-b402-23f8849b7826', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (254, N'f2496694-91d9-47eb-9d0c-ce1ebe63b43b', N'f2496694-91d9-47eb-9d0c-ce1ebe63b43b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (255, N'57e69cde-97ec-4050-ba97-8d5ece18460e', N'57e69cde-97ec-4050-ba97-8d5ece18460e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (256, N'b0e99381-120a-4c9b-bf55-e4c9f8a60557', N'b0e99381-120a-4c9b-bf55-e4c9f8a60557', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (257, N'7fb81fcc-fccd-4165-8ed4-594c84d85c29', N'7fb81fcc-fccd-4165-8ed4-594c84d85c29', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (258, N'bd93f0de-9a3e-43a3-b1bb-123bbce409d2', N'bd93f0de-9a3e-43a3-b1bb-123bbce409d2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (259, N'925d2dd4-bada-4f43-b5cf-c06beeb9d238', N'925d2dd4-bada-4f43-b5cf-c06beeb9d238', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (260, N'b8aae1c1-47c1-479b-a576-f7120a0dafd2', N'b8aae1c1-47c1-479b-a576-f7120a0dafd2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (261, N'e2da640d-40b8-4a72-97dc-3e63d08efb72', N'e2da640d-40b8-4a72-97dc-3e63d08efb72', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (262, N'3e599faa-0008-4aea-a95b-615e67bbc9bd', N'3e599faa-0008-4aea-a95b-615e67bbc9bd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (263, N'0d79a46d-6418-4626-896c-b66985343e81', N'0d79a46d-6418-4626-896c-b66985343e81', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (264, N'1d50324b-5134-4357-9d7e-bfca248a5ef3', N'1d50324b-5134-4357-9d7e-bfca248a5ef3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (265, N'7c4d6318-c31d-439a-8b86-b2b725a9be32', N'7c4d6318-c31d-439a-8b86-b2b725a9be32', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (266, N'da3dccf8-e9c9-4047-9d17-4a4f592e1544', N'da3dccf8-e9c9-4047-9d17-4a4f592e1544', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (267, N'e84512e9-38a7-439c-846b-ae75f586645b', N'e84512e9-38a7-439c-846b-ae75f586645b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (268, N'712c7828-f22e-4676-8843-c3d9835d6d21', N'712c7828-f22e-4676-8843-c3d9835d6d21', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (269, N'b69669f8-ce58-4b3a-9eb2-b746ac014a84', N'b69669f8-ce58-4b3a-9eb2-b746ac014a84', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (270, N'ef57ace0-8f34-411e-a489-6bee28743885', N'ef57ace0-8f34-411e-a489-6bee28743885', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (271, N'de05706f-4add-41c8-b41f-0a207551b1f7', N'de05706f-4add-41c8-b41f-0a207551b1f7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (272, N'3f8ff354-4868-47f7-96b6-49686534afa9', N'3f8ff354-4868-47f7-96b6-49686534afa9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (273, N'53db31d1-eb84-48c0-b60c-ab61d8292a9b', N'53db31d1-eb84-48c0-b60c-ab61d8292a9b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (274, N'442c93cd-ca5b-4327-aa3c-cf2e4f8ad92d', N'442c93cd-ca5b-4327-aa3c-cf2e4f8ad92d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (275, N'967515e5-1cf0-419a-b6be-50b106ffb3ca', N'967515e5-1cf0-419a-b6be-50b106ffb3ca', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (276, N'3f55363a-4054-4aac-a6f7-05d3634f5247', N'3f55363a-4054-4aac-a6f7-05d3634f5247', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (277, N'd27a0d42-e7de-4d84-82a7-db1aa380081a', N'd27a0d42-e7de-4d84-82a7-db1aa380081a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (278, N'3789d1d3-7703-48b1-a0ac-85636a7c33f7', N'3789d1d3-7703-48b1-a0ac-85636a7c33f7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (279, N'ead3149c-8837-4185-95ce-c053b4fead65', N'ead3149c-8837-4185-95ce-c053b4fead65', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (280, N'f5e9ca90-fcac-4b16-8f69-cfeff5f1a870', N'f5e9ca90-fcac-4b16-8f69-cfeff5f1a870', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (281, N'9b4dc2f3-4cdc-48f5-b4df-0123e4115e05', N'9b4dc2f3-4cdc-48f5-b4df-0123e4115e05', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (282, N'b6ac0e94-6cdc-46a3-875a-f9a22f82b690', N'b6ac0e94-6cdc-46a3-875a-f9a22f82b690', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (283, N'f2f2c279-ab81-415b-b4d5-9657397c084b', N'f2f2c279-ab81-415b-b4d5-9657397c084b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (284, N'3c36632d-3768-4474-9c41-5a62e8312e50', N'3c36632d-3768-4474-9c41-5a62e8312e50', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (285, N'85064be3-9309-41b7-adff-aa492976c5b5', N'85064be3-9309-41b7-adff-aa492976c5b5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (286, N'468aa6f6-39a1-4357-9d55-e01880f4a8c1', N'468aa6f6-39a1-4357-9d55-e01880f4a8c1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (287, N'5b5eb88e-c033-434d-8dc4-0fc214402874', N'5b5eb88e-c033-434d-8dc4-0fc214402874', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (288, N'a4f46510-94b6-41dc-915f-376b1888a9c4', N'a4f46510-94b6-41dc-915f-376b1888a9c4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (289, N'40ab959c-c039-49d5-8944-b86316ed624e', N'40ab959c-c039-49d5-8944-b86316ed624e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (290, N'e1183ba3-b46c-4b80-9e5d-cbb54df5b362', N'e1183ba3-b46c-4b80-9e5d-cbb54df5b362', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (291, N'457878db-2aca-41d4-b8ca-35c4cb57d4e5', N'457878db-2aca-41d4-b8ca-35c4cb57d4e5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (292, N'5cacb8ff-5f95-4f06-85ea-b7cc6b86161c', N'5cacb8ff-5f95-4f06-85ea-b7cc6b86161c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (293, N'e225acb6-e248-40af-9257-f490e7928871', N'e225acb6-e248-40af-9257-f490e7928871', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (294, N'5b01fc0e-1625-4992-a614-1228d2127514', N'5b01fc0e-1625-4992-a614-1228d2127514', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (295, N'3afbd087-5dec-4018-8e60-54224cbaa189', N'3afbd087-5dec-4018-8e60-54224cbaa189', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (296, N'bb3c9886-d0a1-46d1-8add-b4cd274fc7c3', N'bb3c9886-d0a1-46d1-8add-b4cd274fc7c3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (297, N'ae36452c-42fc-4175-b448-5df247b7c68a', N'ae36452c-42fc-4175-b448-5df247b7c68a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (298, N'0bfcad4c-f953-40b5-bd72-745c20cf1fff', N'0bfcad4c-f953-40b5-bd72-745c20cf1fff', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (299, N'232ed410-4c82-4fad-8a88-a0061ef71ff9', N'232ed410-4c82-4fad-8a88-a0061ef71ff9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (300, N'b09adaa0-5184-46bb-8c01-4b6f137eef9d', N'b09adaa0-5184-46bb-8c01-4b6f137eef9d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (301, N'440233c5-eabf-4a06-af13-b90f106f85b4', N'440233c5-eabf-4a06-af13-b90f106f85b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (302, N'08cf02c3-0aab-4059-ae36-9aa8b47ba7fd', N'08cf02c3-0aab-4059-ae36-9aa8b47ba7fd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (303, N'c675376d-1cb7-4a38-8df7-2bb170e2f9d1', N'c675376d-1cb7-4a38-8df7-2bb170e2f9d1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (304, N'3e5a9508-2cca-44a2-9fb0-78acb0adef15', N'3e5a9508-2cca-44a2-9fb0-78acb0adef15', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (305, N'6fb5f576-ae13-4e6b-912a-cde9c2694b80', N'6fb5f576-ae13-4e6b-912a-cde9c2694b80', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (306, N'e392adc0-8d5b-4973-9452-a145fa5c2b12', N'e392adc0-8d5b-4973-9452-a145fa5c2b12', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (307, N'63dbc56c-5a21-4842-8d26-a06e19179ae5', N'63dbc56c-5a21-4842-8d26-a06e19179ae5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (308, N'b23fa16d-b261-4a0f-bc91-cd2ba79c9609', N'b23fa16d-b261-4a0f-bc91-cd2ba79c9609', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (309, N'ce424495-ec65-4e63-83ba-34a4b4cacad5', N'ce424495-ec65-4e63-83ba-34a4b4cacad5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (310, N'93016212-d24d-4184-aeac-293e4deaf88e', N'93016212-d24d-4184-aeac-293e4deaf88e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (311, N'ec41bcdb-0f68-43d7-8e42-bdd4fe7f96f1', N'ec41bcdb-0f68-43d7-8e42-bdd4fe7f96f1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (312, N'452005db-544f-48be-a9da-13a1a926e216', N'452005db-544f-48be-a9da-13a1a926e216', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (313, N'de74384d-6084-4e12-bb5c-b243b85aa7fe', N'de74384d-6084-4e12-bb5c-b243b85aa7fe', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (314, N'aa464c07-739a-4a95-9a2b-33cf7fcc0596', N'aa464c07-739a-4a95-9a2b-33cf7fcc0596', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (315, N'3d570a0e-9728-45f4-b389-2d3696ad272a', N'3d570a0e-9728-45f4-b389-2d3696ad272a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (316, N'15814b94-cebf-46b5-a003-bccff5b2e72b', N'15814b94-cebf-46b5-a003-bccff5b2e72b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (317, N'baee1128-29f7-45fd-a693-a86dab417247', N'baee1128-29f7-45fd-a693-a86dab417247', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (318, N'b9165858-9efe-4072-bad2-02f6231442ef', N'b9165858-9efe-4072-bad2-02f6231442ef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (319, N'b9963dd8-6003-4f70-8263-06099b8b5a72', N'b9963dd8-6003-4f70-8263-06099b8b5a72', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (320, N'b840f178-7f5a-4d77-b028-b379d440c3b1', N'b840f178-7f5a-4d77-b028-b379d440c3b1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (321, N'74668c2f-deec-4ffd-91f6-e3d90d8de872', N'74668c2f-deec-4ffd-91f6-e3d90d8de872', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (322, N'707598d0-9229-428f-84e1-6af36dcd7b33', N'707598d0-9229-428f-84e1-6af36dcd7b33', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (323, N'70e676ff-46ed-4c02-870c-e5ee54256f4e', N'70e676ff-46ed-4c02-870c-e5ee54256f4e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (324, N'30fb9544-2e38-494b-ac21-255f99e4beef', N'30fb9544-2e38-494b-ac21-255f99e4beef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (325, N'8e11aeda-9a56-430f-abe6-0a5ceffed109', N'8e11aeda-9a56-430f-abe6-0a5ceffed109', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (326, N'ef789a28-e995-4bde-9656-0681e09b7cef', N'ef789a28-e995-4bde-9656-0681e09b7cef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (327, N'd136a5c8-dfae-49b4-84f0-80ba36e6cf45', N'd136a5c8-dfae-49b4-84f0-80ba36e6cf45', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (328, N'65f3b495-f752-4fff-bc17-037190aeb469', N'65f3b495-f752-4fff-bc17-037190aeb469', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (329, N'40a3161a-4eff-42c3-84d3-ebefa78cf74c', N'40a3161a-4eff-42c3-84d3-ebefa78cf74c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (330, N'2ae28354-77f4-4ffa-8d27-de084db0d874', N'2ae28354-77f4-4ffa-8d27-de084db0d874', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (331, N'5e8cebea-6217-479b-9b51-dc996e727029', N'5e8cebea-6217-479b-9b51-dc996e727029', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (332, N'e29f1141-5761-4e0f-bdab-0910e8c879f7', N'e29f1141-5761-4e0f-bdab-0910e8c879f7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (333, N'78aa0a2f-53f2-4de3-b35d-8b8d07e15583', N'78aa0a2f-53f2-4de3-b35d-8b8d07e15583', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (334, N'85399112-b96e-4070-a989-b26d9c2bca35', N'85399112-b96e-4070-a989-b26d9c2bca35', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (335, N'5f4e42d9-1995-40f3-85fe-baf4c3adddf2', N'5f4e42d9-1995-40f3-85fe-baf4c3adddf2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (336, N'016d6a9f-19fd-489f-9c68-1ffbe3beaeb9', N'016d6a9f-19fd-489f-9c68-1ffbe3beaeb9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (337, N'6d573353-d082-4dee-8e7e-d5547122ecfd', N'6d573353-d082-4dee-8e7e-d5547122ecfd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (338, N'40823083-d0c2-46f5-83a6-1f92198a3b3f', N'40823083-d0c2-46f5-83a6-1f92198a3b3f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (339, N'3c4d9497-fc10-4020-bd99-39d55ae0f2cd', N'3c4d9497-fc10-4020-bd99-39d55ae0f2cd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (340, N'6a7528a1-b8a4-49bb-aa05-541f60edf0a9', N'6a7528a1-b8a4-49bb-aa05-541f60edf0a9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (341, N'32c7d260-71c1-42a5-bbb1-1d3d10315eb3', N'32c7d260-71c1-42a5-bbb1-1d3d10315eb3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (342, N'408efa64-c611-4a1d-83af-11fb897c9fc5', N'408efa64-c611-4a1d-83af-11fb897c9fc5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (343, N'8d6b6c9e-cdf4-4de4-8a6f-cc7c5d0ddee5', N'8d6b6c9e-cdf4-4de4-8a6f-cc7c5d0ddee5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (344, N'3d8c28c6-cb8c-4f78-bde8-aea0d0300295', N'3d8c28c6-cb8c-4f78-bde8-aea0d0300295', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (345, N'5dbc2b2a-977f-4f67-b757-dd51cfe303f2', N'5dbc2b2a-977f-4f67-b757-dd51cfe303f2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (346, N'323387cc-1f39-490d-a92c-0c31b5c8e6a1', N'323387cc-1f39-490d-a92c-0c31b5c8e6a1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (347, N'02a7f6f3-ccb4-43b4-b43d-c39b7dc89a22', N'02a7f6f3-ccb4-43b4-b43d-c39b7dc89a22', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (348, N'4a3628f5-79eb-4585-af44-e1cf4a7cdaf3', N'4a3628f5-79eb-4585-af44-e1cf4a7cdaf3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (349, N'5e9c45e3-2c5b-4bb0-a27f-d0ecca385087', N'5e9c45e3-2c5b-4bb0-a27f-d0ecca385087', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (350, N'7133e7d7-4589-446a-8004-fcf40976f3cd', N'7133e7d7-4589-446a-8004-fcf40976f3cd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (351, N'c05816e8-a98f-45e9-9fef-8833ef1e1d31', N'c05816e8-a98f-45e9-9fef-8833ef1e1d31', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (352, N'5de524f1-cd52-41f5-8a50-3977be6e2225', N'5de524f1-cd52-41f5-8a50-3977be6e2225', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (353, N'30401edc-22b6-428e-8bb3-478a192ab584', N'30401edc-22b6-428e-8bb3-478a192ab584', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (354, N'b7308e6d-3881-4172-b704-1b4c7dc1b1e3', N'b7308e6d-3881-4172-b704-1b4c7dc1b1e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (355, N'aa8bfa4d-e555-4b84-9a5f-4d7e4b6769fe', N'aa8bfa4d-e555-4b84-9a5f-4d7e4b6769fe', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (356, N'71595a35-829c-482d-8bb5-0bb5382d8fa0', N'71595a35-829c-482d-8bb5-0bb5382d8fa0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (357, N'86e4abf0-d8ce-4714-94b3-badb84990d77', N'86e4abf0-d8ce-4714-94b3-badb84990d77', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (358, N'b2018fb5-b815-48a7-af3c-b0be7b4071e6', N'b2018fb5-b815-48a7-af3c-b0be7b4071e6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (359, N'10692aa9-99a9-44c8-907e-d2b9fe734f42', N'10692aa9-99a9-44c8-907e-d2b9fe734f42', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (360, N'b0217d3f-53e3-4066-b576-95e1f686986c', N'b0217d3f-53e3-4066-b576-95e1f686986c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (361, N'c31362c8-7081-4c67-9d1d-e8291d9cb493', N'c31362c8-7081-4c67-9d1d-e8291d9cb493', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (362, N'98d74111-7945-40ce-9e32-06bac7c8af73', N'98d74111-7945-40ce-9e32-06bac7c8af73', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (363, N'5b6f233a-5310-41a8-94a8-debaa2e72c50', N'5b6f233a-5310-41a8-94a8-debaa2e72c50', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (364, N'5467173e-82b2-412f-afad-b0b33717eb93', N'5467173e-82b2-412f-afad-b0b33717eb93', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (365, N'0e7e7c44-3fba-460a-bb19-a781df42dc11', N'0e7e7c44-3fba-460a-bb19-a781df42dc11', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (366, N'e49f1e98-d77b-40ac-aeed-b7073ea77578', N'e49f1e98-d77b-40ac-aeed-b7073ea77578', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (367, N'6752b65d-5f73-46d4-baf2-016d620db9bd', N'6752b65d-5f73-46d4-baf2-016d620db9bd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (368, N'729da056-d8de-4fd6-bfe6-376ddf37c801', N'729da056-d8de-4fd6-bfe6-376ddf37c801', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (369, N'10ceb2be-c9a3-4816-9959-e6bf3cce716e', N'10ceb2be-c9a3-4816-9959-e6bf3cce716e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (370, N'91fbdff7-6281-4586-8ea0-bc79b2f2e8f4', N'91fbdff7-6281-4586-8ea0-bc79b2f2e8f4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (371, N'13947248-0803-4312-ae61-d9bb38954824', N'13947248-0803-4312-ae61-d9bb38954824', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (372, N'6cd3896c-dab7-44d2-a53e-53ffe52ef92c', N'6cd3896c-dab7-44d2-a53e-53ffe52ef92c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (373, N'5310a960-4efe-4d9f-8422-45eb65e3214c', N'5310a960-4efe-4d9f-8422-45eb65e3214c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (374, N'400863f4-47dd-40ff-8a23-0932ea69b1df', N'400863f4-47dd-40ff-8a23-0932ea69b1df', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (375, N'255e6f32-35f1-41e5-8da7-2cfa5f366771', N'255e6f32-35f1-41e5-8da7-2cfa5f366771', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (376, N'8075291f-6096-452b-85ee-8a8d81d637b4', N'8075291f-6096-452b-85ee-8a8d81d637b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (377, N'c12ffd4a-5b4d-4634-bca7-9ad73e32f144', N'c12ffd4a-5b4d-4634-bca7-9ad73e32f144', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (378, N'a8f468b9-0cf0-4abd-ac9b-c78df3c984ab', N'a8f468b9-0cf0-4abd-ac9b-c78df3c984ab', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (379, N'63223837-9ca6-4929-abeb-fada9b18bf06', N'63223837-9ca6-4929-abeb-fada9b18bf06', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (380, N'e1102e56-0ec4-444b-ac50-0a05bfe6dc91', N'e1102e56-0ec4-444b-ac50-0a05bfe6dc91', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (381, N'e4f35ef5-3f06-4c1f-a5ff-152588f4b562', N'e4f35ef5-3f06-4c1f-a5ff-152588f4b562', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (382, N'9dcbc4ed-b5f9-496f-be9c-f209f9d5ffbc', N'9dcbc4ed-b5f9-496f-be9c-f209f9d5ffbc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (383, N'015dc4e6-02ba-4596-bcd0-172665598c17', N'015dc4e6-02ba-4596-bcd0-172665598c17', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (384, N'f74e4ee6-28ca-4778-8475-2c0a1b9369ae', N'f74e4ee6-28ca-4778-8475-2c0a1b9369ae', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (385, N'480d7a09-5890-46c1-86d2-9b78b84130f6', N'480d7a09-5890-46c1-86d2-9b78b84130f6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (386, N'4dc1baed-7458-4851-9f1c-32d80bbeb420', N'4dc1baed-7458-4851-9f1c-32d80bbeb420', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (387, N'997d67a2-1dd8-4518-9fff-f36c1f4ce153', N'997d67a2-1dd8-4518-9fff-f36c1f4ce153', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (388, N'b4f1366c-d8e8-4fdc-944d-42413399f9ef', N'b4f1366c-d8e8-4fdc-944d-42413399f9ef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (389, N'cb379e03-44ca-4e50-8b87-45743fd53fe2', N'cb379e03-44ca-4e50-8b87-45743fd53fe2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (390, N'65fc17fd-35e1-40ac-a384-42735659d44e', N'65fc17fd-35e1-40ac-a384-42735659d44e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (391, N'442417b1-a043-45ca-953d-b48d25a7177f', N'442417b1-a043-45ca-953d-b48d25a7177f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (392, N'89c202ed-9027-4332-b66a-89b5b398ecb1', N'89c202ed-9027-4332-b66a-89b5b398ecb1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (393, N'f03990c0-b455-471c-b17c-e87d8e9f5b88', N'f03990c0-b455-471c-b17c-e87d8e9f5b88', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (394, N'e0d69714-6ab7-4a96-b629-6fe899ae3226', N'e0d69714-6ab7-4a96-b629-6fe899ae3226', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (395, N'245733b2-7642-48ec-a4a1-03e8df03e7e3', N'245733b2-7642-48ec-a4a1-03e8df03e7e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (396, N'ae416214-221f-48d8-8ec1-26b9ef747f8d', N'ae416214-221f-48d8-8ec1-26b9ef747f8d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (397, N'5b919527-882f-4686-a994-4a745e55c60c', N'5b919527-882f-4686-a994-4a745e55c60c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (398, N'346c5a96-ee4f-4c7d-8432-2027408b6dae', N'346c5a96-ee4f-4c7d-8432-2027408b6dae', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (399, N'65d66e45-bd50-4a1f-881f-359f081ab698', N'65d66e45-bd50-4a1f-881f-359f081ab698', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (400, N'3c2aeeef-c85d-4d44-bf8d-9fa22a14fd48', N'3c2aeeef-c85d-4d44-bf8d-9fa22a14fd48', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (401, N'67be1d97-860d-4973-8f2d-f1a2f58e5ef4', N'67be1d97-860d-4973-8f2d-f1a2f58e5ef4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (402, N'1dbcfb21-2328-4b67-ac62-572f25758c28', N'1dbcfb21-2328-4b67-ac62-572f25758c28', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (403, N'83268cdf-8d25-41bc-91d2-055fe1c7bfc1', N'83268cdf-8d25-41bc-91d2-055fe1c7bfc1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (404, N'd373c028-7ac0-4a1a-ae09-5109619d875f', N'd373c028-7ac0-4a1a-ae09-5109619d875f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (405, N'559b2bb5-47c0-4f4f-96f9-d4a2f565010b', N'559b2bb5-47c0-4f4f-96f9-d4a2f565010b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (406, N'363f1965-6cae-412a-bd19-81d0aad58193', N'363f1965-6cae-412a-bd19-81d0aad58193', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (407, N'56d681a2-1173-41c8-b8e3-a0c13f6d0482', N'56d681a2-1173-41c8-b8e3-a0c13f6d0482', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (408, N'5e89f298-f6d8-4912-b1a3-827024d25ea6', N'5e89f298-f6d8-4912-b1a3-827024d25ea6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (409, N'dd3e7f1f-a419-42d8-be2f-945408be56d3', N'dd3e7f1f-a419-42d8-be2f-945408be56d3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (410, N'245155fc-2f69-449f-8656-90f1e98f3a87', N'245155fc-2f69-449f-8656-90f1e98f3a87', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (411, N'2fc8d329-266e-4243-9812-552f5a5d8ff5', N'2fc8d329-266e-4243-9812-552f5a5d8ff5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (412, N'adc1c44c-77f5-4e7b-ad94-2de6feab9e5e', N'adc1c44c-77f5-4e7b-ad94-2de6feab9e5e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (413, N'30540088-44df-46f6-b932-f6ac4f3f11e7', N'30540088-44df-46f6-b932-f6ac4f3f11e7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (414, N'a8bb1878-ddfa-45d1-9726-4832aba844f0', N'a8bb1878-ddfa-45d1-9726-4832aba844f0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (415, N'da35fcdf-241d-4c09-96a8-b574f9f2c257', N'da35fcdf-241d-4c09-96a8-b574f9f2c257', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (416, N'532e90ab-9773-457d-86fe-ec420dc94c82', N'532e90ab-9773-457d-86fe-ec420dc94c82', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (417, N'cbabcb2f-ca28-4312-a815-016a5f50b1f3', N'cbabcb2f-ca28-4312-a815-016a5f50b1f3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (418, N'f04bc918-3a20-4ce9-a5de-81b2d20d637b', N'f04bc918-3a20-4ce9-a5de-81b2d20d637b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (419, N'ef8b904a-aa61-4039-be76-f38438b2b6c2', N'ef8b904a-aa61-4039-be76-f38438b2b6c2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (420, N'2b3240a9-ae43-44b1-9b43-57a2008fd1b1', N'2b3240a9-ae43-44b1-9b43-57a2008fd1b1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (421, N'2abcf65c-a4cd-4d39-bbcf-5c2fb1b1d792', N'2abcf65c-a4cd-4d39-bbcf-5c2fb1b1d792', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (422, N'ea526bac-aef7-4edc-8d70-012d36c13e39', N'ea526bac-aef7-4edc-8d70-012d36c13e39', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (423, N'd643ce64-6372-44c6-a197-fdb00c8d6c01', N'd643ce64-6372-44c6-a197-fdb00c8d6c01', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (424, N'99993a53-ac28-4aea-b110-6710a533e6aa', N'99993a53-ac28-4aea-b110-6710a533e6aa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (425, N'5aa41026-b290-4544-8c70-4d7fc26a3ce5', N'5aa41026-b290-4544-8c70-4d7fc26a3ce5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (426, N'7762e61a-2ffb-4980-a1d6-665401414201', N'7762e61a-2ffb-4980-a1d6-665401414201', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (427, N'9c3ab7a1-2cfd-4ef0-95f8-bc92bd0e4c3e', N'9c3ab7a1-2cfd-4ef0-95f8-bc92bd0e4c3e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (428, N'48c20b8d-e73d-437a-b988-ff4433827d79', N'48c20b8d-e73d-437a-b988-ff4433827d79', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (429, N'b64ba188-97d5-4650-a8e8-1ad7bd98fa79', N'b64ba188-97d5-4650-a8e8-1ad7bd98fa79', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (430, N'd5b74d4a-f628-430e-bffb-d143d2c1e6c8', N'd5b74d4a-f628-430e-bffb-d143d2c1e6c8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (431, N'd8e9e063-278b-48f0-be69-8b7061c6c24d', N'd8e9e063-278b-48f0-be69-8b7061c6c24d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (432, N'27c7e7db-e39f-47db-ab15-768c91db8d77', N'27c7e7db-e39f-47db-ab15-768c91db8d77', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (433, N'c8c87bb1-cf53-49c1-b6e4-3a22473b75c5', N'c8c87bb1-cf53-49c1-b6e4-3a22473b75c5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (434, N'f236e3ba-7b69-498c-8250-36a279fd4e3b', N'f236e3ba-7b69-498c-8250-36a279fd4e3b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (435, N'd19586aa-3d90-45dc-8a78-73aeae5af174', N'd19586aa-3d90-45dc-8a78-73aeae5af174', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (436, N'd29b442d-ac8e-45dd-bb2f-0e073bf5f572', N'd29b442d-ac8e-45dd-bb2f-0e073bf5f572', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (437, N'538c368e-88c2-4632-9fef-21bf9996a5b3', N'538c368e-88c2-4632-9fef-21bf9996a5b3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (438, N'3ec538b4-edb0-4603-a7ee-917a9529f8c5', N'3ec538b4-edb0-4603-a7ee-917a9529f8c5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (439, N'6214c1a6-e9d6-4d7d-8702-33fc99ed452e', N'6214c1a6-e9d6-4d7d-8702-33fc99ed452e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (440, N'83da5261-c018-455c-be45-c3bf7ee527c5', N'83da5261-c018-455c-be45-c3bf7ee527c5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (441, N'7982a7a4-a59e-4cb5-a625-915c454def84', N'7982a7a4-a59e-4cb5-a625-915c454def84', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (442, N'bb9508bb-6ac7-4172-b427-67cd1713a4bd', N'bb9508bb-6ac7-4172-b427-67cd1713a4bd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (443, N'6d39a699-fffe-4f7e-b264-46bce4ba7aa9', N'6d39a699-fffe-4f7e-b264-46bce4ba7aa9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (444, N'dbc8e77c-8709-4ebe-9883-6e890295c593', N'dbc8e77c-8709-4ebe-9883-6e890295c593', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (445, N'afdb3119-d0fa-4e4d-a409-c9295b397ebd', N'afdb3119-d0fa-4e4d-a409-c9295b397ebd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (446, N'd2fa4411-d5c4-40f2-a9f0-9303c684d711', N'd2fa4411-d5c4-40f2-a9f0-9303c684d711', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (447, N'f6b09a31-0809-421b-acaa-60d2f92f9020', N'f6b09a31-0809-421b-acaa-60d2f92f9020', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (448, N'ba3b5f30-f659-450c-8035-a39aefbcb952', N'ba3b5f30-f659-450c-8035-a39aefbcb952', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (449, N'050003d5-dde1-4c17-813e-baf8e79bb680', N'050003d5-dde1-4c17-813e-baf8e79bb680', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (450, N'aa872959-8d06-4d1b-add1-e62b001e2655', N'aa872959-8d06-4d1b-add1-e62b001e2655', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (451, N'daf8a56b-8190-43d9-a624-28f8147a08c9', N'daf8a56b-8190-43d9-a624-28f8147a08c9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (452, N'593c1cb5-c3e1-4e72-b79a-0b22ea89b6a5', N'593c1cb5-c3e1-4e72-b79a-0b22ea89b6a5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (453, N'0a06ac28-df38-416a-b41e-f4047343942e', N'0a06ac28-df38-416a-b41e-f4047343942e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (454, N'69e1dd90-22eb-4cb1-82cb-6991530ad963', N'69e1dd90-22eb-4cb1-82cb-6991530ad963', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (455, N'4ef5f002-77db-4c0b-80ed-d7a7baa56a30', N'4ef5f002-77db-4c0b-80ed-d7a7baa56a30', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (456, N'0322abd6-801d-4048-9766-4a5f2c5411c1', N'0322abd6-801d-4048-9766-4a5f2c5411c1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (457, N'6e9d5370-1292-42f9-9141-f689ecf61267', N'6e9d5370-1292-42f9-9141-f689ecf61267', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (458, N'040a4254-1ede-47c4-82a3-a47039d67ff4', N'040a4254-1ede-47c4-82a3-a47039d67ff4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (459, N'fad615b2-3501-4504-9fba-de0092c3447d', N'fad615b2-3501-4504-9fba-de0092c3447d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (460, N'889576b7-22c4-4323-bc7a-2bd0a683b0f8', N'889576b7-22c4-4323-bc7a-2bd0a683b0f8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (461, N'b749f2a0-c5a7-4114-9be7-886ef8d44c11', N'b749f2a0-c5a7-4114-9be7-886ef8d44c11', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (462, N'756b37a6-a7b6-4318-98a5-e25797281104', N'756b37a6-a7b6-4318-98a5-e25797281104', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (463, N'becb8a30-33fd-4999-9ad0-f257e91e0390', N'becb8a30-33fd-4999-9ad0-f257e91e0390', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (464, N'91f8b684-7c1b-4760-9f22-fbe4a020224b', N'91f8b684-7c1b-4760-9f22-fbe4a020224b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (465, N'077a01c8-d4b1-4ffe-a0fe-7bc3d75cf3ac', N'077a01c8-d4b1-4ffe-a0fe-7bc3d75cf3ac', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (466, N'65b9cceb-4fdd-4773-87aa-8978d66c8a85', N'65b9cceb-4fdd-4773-87aa-8978d66c8a85', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (467, N'bee9d214-a7de-44da-9004-760541166b0e', N'bee9d214-a7de-44da-9004-760541166b0e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (468, N'8bc94b61-06f5-4fd0-ad14-61f6058533fd', N'8bc94b61-06f5-4fd0-ad14-61f6058533fd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (469, N'2cf4e222-a9f0-4100-906c-5a905fdf8126', N'2cf4e222-a9f0-4100-906c-5a905fdf8126', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (470, N'26a2527b-be0c-4658-8811-a56ff80b2dc9', N'26a2527b-be0c-4658-8811-a56ff80b2dc9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (471, N'c696d1b0-f5bd-4b6e-93f1-d61cfe0502ad', N'c696d1b0-f5bd-4b6e-93f1-d61cfe0502ad', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (472, N'dae1322a-6b92-419f-9943-ae65d74ada9d', N'dae1322a-6b92-419f-9943-ae65d74ada9d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (473, N'aff85fb6-407f-4ebb-af74-e5b6edddd165', N'aff85fb6-407f-4ebb-af74-e5b6edddd165', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (474, N'918f9220-fb1e-4c83-91be-2f3057320d62', N'918f9220-fb1e-4c83-91be-2f3057320d62', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (475, N'29d7a6dc-677e-4a12-b7d6-1c1cb7fe7780', N'29d7a6dc-677e-4a12-b7d6-1c1cb7fe7780', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (476, N'8e4f0a67-adbe-4604-bbc8-74ca8eb53224', N'8e4f0a67-adbe-4604-bbc8-74ca8eb53224', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (477, N'68f184ef-aa5d-4c4d-8030-b55205a003e3', N'68f184ef-aa5d-4c4d-8030-b55205a003e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (478, N'c7454363-2707-477e-9638-7555691c99eb', N'c7454363-2707-477e-9638-7555691c99eb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (479, N'eaa916e2-7847-4a86-9c1c-8be2a4862baf', N'eaa916e2-7847-4a86-9c1c-8be2a4862baf', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (480, N'aec17a8a-1366-489f-a07f-c07d60f6d478', N'aec17a8a-1366-489f-a07f-c07d60f6d478', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (481, N'46dfb620-e891-436e-a2e2-87ba9d8add2d', N'46dfb620-e891-436e-a2e2-87ba9d8add2d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (482, N'8db9c398-0c5a-43a4-a97c-e6db38566c67', N'8db9c398-0c5a-43a4-a97c-e6db38566c67', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (483, N'2859c3c7-4245-43f7-bed6-14797544b4bb', N'2859c3c7-4245-43f7-bed6-14797544b4bb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (484, N'5496d543-9f38-42cb-81d4-90fa6df6d1bd', N'5496d543-9f38-42cb-81d4-90fa6df6d1bd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (485, N'91b6ba69-c412-44bb-a015-5a945821df3c', N'91b6ba69-c412-44bb-a015-5a945821df3c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (486, N'c30e3aef-6fef-48ef-a6b1-bd0c979b58dc', N'c30e3aef-6fef-48ef-a6b1-bd0c979b58dc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (487, N'406384d3-5f18-4296-bf55-d09b4d71b755', N'406384d3-5f18-4296-bf55-d09b4d71b755', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (488, N'340044bb-170b-4e5c-af5b-f557544213bc', N'340044bb-170b-4e5c-af5b-f557544213bc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (489, N'29cffd0c-4f17-4fb8-80fb-92f3cd2996ef', N'29cffd0c-4f17-4fb8-80fb-92f3cd2996ef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (490, N'0293ef0b-dbcf-4136-a0fe-1cbaf3c82627', N'0293ef0b-dbcf-4136-a0fe-1cbaf3c82627', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (491, N'5e2f0229-a309-4876-8c41-e71efcbaa0b1', N'5e2f0229-a309-4876-8c41-e71efcbaa0b1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (492, N'2c9330a8-6d3d-48d0-8f75-a19df3c82a5b', N'2c9330a8-6d3d-48d0-8f75-a19df3c82a5b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (493, N'27739703-0bde-4892-8c5c-a39466fbb10d', N'27739703-0bde-4892-8c5c-a39466fbb10d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (494, N'ec7f5c55-9348-42b1-aa80-71d6c6a82e52', N'ec7f5c55-9348-42b1-aa80-71d6c6a82e52', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (495, N'41c6c120-d884-4992-bd0e-ef52a4e52a3a', N'41c6c120-d884-4992-bd0e-ef52a4e52a3a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (496, N'683a2fd7-99e4-435c-ba93-170a838bd922', N'683a2fd7-99e4-435c-ba93-170a838bd922', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (497, N'755f0980-3e1e-4399-b9e2-570c6aa22a76', N'755f0980-3e1e-4399-b9e2-570c6aa22a76', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (498, N'8e951fdf-b5d0-4409-ba7c-dc9e337a47c2', N'8e951fdf-b5d0-4409-ba7c-dc9e337a47c2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (499, N'e5556976-beef-496a-ba7f-c09d4583f172', N'e5556976-beef-496a-ba7f-c09d4583f172', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:23.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (500, N'df4910f0-8130-41f7-a55f-e8dd191c60a7', N'df4910f0-8130-41f7-a55f-e8dd191c60a7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (501, N'c35715f8-3d75-4bb9-8e35-25631f6da565', N'c35715f8-3d75-4bb9-8e35-25631f6da565', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (502, N'f1a0d22b-5c8b-4a3d-b949-0649e05a6ab8', N'f1a0d22b-5c8b-4a3d-b949-0649e05a6ab8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (503, N'19b3189f-8a78-4c54-99b2-e9fb62d0d4a6', N'19b3189f-8a78-4c54-99b2-e9fb62d0d4a6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (504, N'38984599-3bc0-49ed-90c0-4d4ed25def5b', N'38984599-3bc0-49ed-90c0-4d4ed25def5b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (505, N'b5cb15b5-36f4-4b51-bc29-49390f4fcc66', N'b5cb15b5-36f4-4b51-bc29-49390f4fcc66', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (506, N'd6e6fb97-78fa-41a5-a6ac-8408f36759a9', N'd6e6fb97-78fa-41a5-a6ac-8408f36759a9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (507, N'98fcd8e5-5e60-444f-8628-5cddbe956f2d', N'98fcd8e5-5e60-444f-8628-5cddbe956f2d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (508, N'9abc1a52-2b32-45ef-8ac5-33419158ccff', N'9abc1a52-2b32-45ef-8ac5-33419158ccff', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (509, N'9999288b-a9ec-43c4-bfa7-8231420a1f19', N'9999288b-a9ec-43c4-bfa7-8231420a1f19', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (510, N'eb0244d0-f5cb-4381-adec-ae613368d398', N'eb0244d0-f5cb-4381-adec-ae613368d398', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (511, N'ec536ad9-6b5b-4e79-a4b4-2719f104fda1', N'ec536ad9-6b5b-4e79-a4b4-2719f104fda1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (512, N'3286777c-5fbd-4f97-8b4c-e67d8d536ee8', N'3286777c-5fbd-4f97-8b4c-e67d8d536ee8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (513, N'da711410-3fa1-4e6d-9623-b8aae4d55f0b', N'da711410-3fa1-4e6d-9623-b8aae4d55f0b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (514, N'9e6b3a67-f4d1-4834-90ce-310b16227b0c', N'9e6b3a67-f4d1-4834-90ce-310b16227b0c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (515, N'22080fae-ea50-4b83-95df-182465ae6d41', N'22080fae-ea50-4b83-95df-182465ae6d41', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (516, N'88bf49cd-e3f3-4589-b3d1-7c8c1b05d841', N'88bf49cd-e3f3-4589-b3d1-7c8c1b05d841', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (517, N'eeaf17cc-f91a-4a9d-bf5f-dded5b66ee07', N'eeaf17cc-f91a-4a9d-bf5f-dded5b66ee07', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (518, N'93db712e-76d0-4398-8cba-33dc84fc314d', N'93db712e-76d0-4398-8cba-33dc84fc314d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (519, N'1bb3e875-c822-465f-bbb0-8761cc2fa0ad', N'1bb3e875-c822-465f-bbb0-8761cc2fa0ad', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (520, N'5d859750-3d0a-4f34-a66c-0ddca2e43804', N'5d859750-3d0a-4f34-a66c-0ddca2e43804', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (521, N'39bbbfd7-0a88-4340-9cdb-86e4a8efc92a', N'39bbbfd7-0a88-4340-9cdb-86e4a8efc92a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (522, N'b266b73c-e049-40ce-8811-ae3bda2918c5', N'b266b73c-e049-40ce-8811-ae3bda2918c5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (523, N'6c9425e9-2ec3-45c9-a6da-e6f52a5b911f', N'6c9425e9-2ec3-45c9-a6da-e6f52a5b911f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (524, N'fab702e0-6c6e-4fe2-843a-148aaec0a980', N'fab702e0-6c6e-4fe2-843a-148aaec0a980', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (525, N'6d5b5b49-e3ec-4216-9966-51f8b3cb78c6', N'6d5b5b49-e3ec-4216-9966-51f8b3cb78c6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (526, N'1004a72a-2a78-4278-b1ea-716e98310713', N'1004a72a-2a78-4278-b1ea-716e98310713', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (527, N'a43f4233-2f57-4ecf-9468-18392b136093', N'a43f4233-2f57-4ecf-9468-18392b136093', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (528, N'e02af96c-6dcf-489a-8f9c-4bd5948e888d', N'e02af96c-6dcf-489a-8f9c-4bd5948e888d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (529, N'e8c82087-7b14-445a-8e92-4b30c2e600fc', N'e8c82087-7b14-445a-8e92-4b30c2e600fc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (530, N'e4f11715-2d49-4eb0-986a-e2ce3402ea7c', N'e4f11715-2d49-4eb0-986a-e2ce3402ea7c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (531, N'76380281-1232-4017-813b-80ee00bde6e1', N'76380281-1232-4017-813b-80ee00bde6e1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (532, N'10807351-29b4-46c6-b02a-eb1d0b2ec9ff', N'10807351-29b4-46c6-b02a-eb1d0b2ec9ff', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (533, N'78d448ef-908a-45f6-b132-d063f6bf838b', N'78d448ef-908a-45f6-b132-d063f6bf838b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (534, N'855a3e4d-aa61-42aa-abe4-d5999f1abe6f', N'855a3e4d-aa61-42aa-abe4-d5999f1abe6f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (535, N'dc37cdef-65a4-43ff-bda7-5197f069f596', N'dc37cdef-65a4-43ff-bda7-5197f069f596', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (536, N'628fa9c4-b8a6-4610-a3e6-ecd4c500394c', N'628fa9c4-b8a6-4610-a3e6-ecd4c500394c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (537, N'd972dbba-143f-4e82-afae-87c6831f3896', N'd972dbba-143f-4e82-afae-87c6831f3896', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (538, N'696af66b-fa5b-48d9-bfd5-4c2bf6e5a6b6', N'696af66b-fa5b-48d9-bfd5-4c2bf6e5a6b6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (539, N'9b315834-5f3d-4e34-964b-60c39a55e455', N'9b315834-5f3d-4e34-964b-60c39a55e455', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (540, N'95541971-6a86-4e7d-9ca7-6fc13f8818d2', N'95541971-6a86-4e7d-9ca7-6fc13f8818d2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (541, N'e3dccb0c-b14b-492c-9828-ba84aea72c41', N'e3dccb0c-b14b-492c-9828-ba84aea72c41', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (542, N'd484fd23-36e3-422d-99fb-662138cbc896', N'd484fd23-36e3-422d-99fb-662138cbc896', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (543, N'2b51492b-01b8-45fc-be6c-505704fcb785', N'2b51492b-01b8-45fc-be6c-505704fcb785', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (544, N'64a28b48-139c-43f7-89ce-9fedc3d0ac78', N'64a28b48-139c-43f7-89ce-9fedc3d0ac78', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (545, N'5861f5ae-6f62-4675-a4b0-d2da4b48284c', N'5861f5ae-6f62-4675-a4b0-d2da4b48284c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (546, N'345a700a-b8af-4fa0-ace3-a68ba072e1fa', N'345a700a-b8af-4fa0-ace3-a68ba072e1fa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (547, N'9727c4a5-38dc-475c-af8d-a998a3ea57f2', N'9727c4a5-38dc-475c-af8d-a998a3ea57f2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (548, N'7fc578fd-b5c7-4319-83ac-169d0e02238a', N'7fc578fd-b5c7-4319-83ac-169d0e02238a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (549, N'11bbf20d-bfe2-4d70-aae0-1714b9af7fbb', N'11bbf20d-bfe2-4d70-aae0-1714b9af7fbb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (550, N'b37d4445-08f9-4eea-a740-cfdc62f9329d', N'b37d4445-08f9-4eea-a740-cfdc62f9329d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (551, N'595be576-722b-49d7-8681-4a15681aa723', N'595be576-722b-49d7-8681-4a15681aa723', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (552, N'4ccb7630-80b0-4d7c-a0c4-26238ec85bcb', N'4ccb7630-80b0-4d7c-a0c4-26238ec85bcb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (553, N'04252cdc-16bb-406f-8635-554fe263b0d6', N'04252cdc-16bb-406f-8635-554fe263b0d6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (554, N'6e03bcb2-0cf4-4b05-ac5c-2679aa4b1f26', N'6e03bcb2-0cf4-4b05-ac5c-2679aa4b1f26', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (555, N'd78f618e-772f-402b-9cd0-8f8471ce22dd', N'd78f618e-772f-402b-9cd0-8f8471ce22dd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (556, N'965e2709-3f55-4831-94f7-eea9c306c204', N'965e2709-3f55-4831-94f7-eea9c306c204', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (557, N'4cea379d-050f-4b5b-ad01-4944a96d8f59', N'4cea379d-050f-4b5b-ad01-4944a96d8f59', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (558, N'1253cb7e-8a36-4403-b01c-8256107a5c3a', N'1253cb7e-8a36-4403-b01c-8256107a5c3a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (559, N'e740c47c-63b8-4d69-9570-d77a2494e3e2', N'e740c47c-63b8-4d69-9570-d77a2494e3e2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (560, N'e8f5afe0-642b-4a1d-961e-db5142269d6b', N'e8f5afe0-642b-4a1d-961e-db5142269d6b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (561, N'b81f862f-f087-4f70-8dbc-c10c0e7c7a1f', N'b81f862f-f087-4f70-8dbc-c10c0e7c7a1f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (562, N'392635b7-3681-47ff-a5cf-91b093962550', N'392635b7-3681-47ff-a5cf-91b093962550', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (563, N'ece441d7-cd0c-4198-ad8b-6d5d0038d7ca', N'ece441d7-cd0c-4198-ad8b-6d5d0038d7ca', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (564, N'f224abd0-a5e1-481d-869d-8072d9f6f6ef', N'f224abd0-a5e1-481d-869d-8072d9f6f6ef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (565, N'b4ef304c-bb0c-4258-9084-d685f7c00957', N'b4ef304c-bb0c-4258-9084-d685f7c00957', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (566, N'e8ba6c50-0d25-4c64-8cda-ba53e0b95473', N'e8ba6c50-0d25-4c64-8cda-ba53e0b95473', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (567, N'db40f2dd-f954-463d-8076-080e852e046f', N'db40f2dd-f954-463d-8076-080e852e046f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (568, N'daa0b26d-1fc9-4f15-8560-60bbd25b8f09', N'daa0b26d-1fc9-4f15-8560-60bbd25b8f09', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (569, N'8019f2c5-e106-40c2-a782-48ada426f6e9', N'8019f2c5-e106-40c2-a782-48ada426f6e9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (570, N'7deb3575-37d1-4a1f-a8d8-65dd8de7373b', N'7deb3575-37d1-4a1f-a8d8-65dd8de7373b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (571, N'5b98f194-d4f9-4774-8d90-7cb211073722', N'5b98f194-d4f9-4774-8d90-7cb211073722', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (572, N'ba9d8f72-fd2e-426a-ac88-5804bf41b4af', N'ba9d8f72-fd2e-426a-ac88-5804bf41b4af', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (573, N'3610336b-d95a-4a9e-b3bc-7b8a9557cbea', N'3610336b-d95a-4a9e-b3bc-7b8a9557cbea', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (574, N'e2871611-3902-4f36-abdb-63b5402faa3e', N'e2871611-3902-4f36-abdb-63b5402faa3e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (575, N'c8e07923-96f5-45cb-9167-dcfd37557a06', N'c8e07923-96f5-45cb-9167-dcfd37557a06', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (576, N'f3407b8e-13d6-4959-aad1-0bd48726730a', N'f3407b8e-13d6-4959-aad1-0bd48726730a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (577, N'976e08d4-9e12-41e9-b3a8-51ad47aa8da5', N'976e08d4-9e12-41e9-b3a8-51ad47aa8da5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (578, N'5e0f30a4-20b8-434e-bea6-62c7b069e05b', N'5e0f30a4-20b8-434e-bea6-62c7b069e05b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (579, N'68a0e308-ad28-499b-a8f4-1858858ee926', N'68a0e308-ad28-499b-a8f4-1858858ee926', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (580, N'a5dfb21a-5f3a-4dd8-b0ab-6d376b3a5f7f', N'a5dfb21a-5f3a-4dd8-b0ab-6d376b3a5f7f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (581, N'79e5a05f-d696-459b-9ec0-feb7b43e2725', N'79e5a05f-d696-459b-9ec0-feb7b43e2725', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (582, N'f4b6fb76-7e9b-4336-a78e-efe56ce06437', N'f4b6fb76-7e9b-4336-a78e-efe56ce06437', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (583, N'03e09529-a010-45c3-86bb-c6db300f8c1e', N'03e09529-a010-45c3-86bb-c6db300f8c1e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (584, N'ecc15c84-a627-4c70-b4e2-9e835f76eea4', N'ecc15c84-a627-4c70-b4e2-9e835f76eea4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (585, N'c603fd4e-78b1-4e94-bdd9-af2cdc38472b', N'c603fd4e-78b1-4e94-bdd9-af2cdc38472b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (586, N'30238630-8274-44e8-aea9-e70759e8454c', N'30238630-8274-44e8-aea9-e70759e8454c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (587, N'c53c3e33-7944-4fa1-a6ec-a44b0e07f3b2', N'c53c3e33-7944-4fa1-a6ec-a44b0e07f3b2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (588, N'838a87b7-9ae1-4916-a7ed-8c7c430ac456', N'838a87b7-9ae1-4916-a7ed-8c7c430ac456', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (589, N'638283e6-fb73-411a-a0f2-1bb3067845cc', N'638283e6-fb73-411a-a0f2-1bb3067845cc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (590, N'6fe9f0e3-dbcf-4e71-bf4b-5ced92d4efc2', N'6fe9f0e3-dbcf-4e71-bf4b-5ced92d4efc2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (591, N'8f79d3c9-f8cb-43a0-b5ba-0e6ae3292f04', N'8f79d3c9-f8cb-43a0-b5ba-0e6ae3292f04', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (592, N'ab59a44a-9b96-44b6-95ee-064bd84ab523', N'ab59a44a-9b96-44b6-95ee-064bd84ab523', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (593, N'ad112058-9a9f-48c1-974f-cfd7c74657e3', N'ad112058-9a9f-48c1-974f-cfd7c74657e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (594, N'37d89267-0372-4218-a1c8-9f1e97b022b3', N'37d89267-0372-4218-a1c8-9f1e97b022b3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (595, N'086e2fc2-60b1-40c1-9abe-3f272c9d935e', N'086e2fc2-60b1-40c1-9abe-3f272c9d935e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (596, N'f80448b1-68aa-44f8-961c-c3bd5c357439', N'f80448b1-68aa-44f8-961c-c3bd5c357439', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (597, N'842eedc2-a399-4170-a112-b4b1ffbb557a', N'842eedc2-a399-4170-a112-b4b1ffbb557a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (598, N'c16414f3-7b74-4aeb-9bd4-2da9d5e67ad7', N'c16414f3-7b74-4aeb-9bd4-2da9d5e67ad7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (599, N'fd945c86-116c-4717-b94b-62f4719e4498', N'fd945c86-116c-4717-b94b-62f4719e4498', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (600, N'bdf51a05-2429-4260-9bda-af6baec71025', N'bdf51a05-2429-4260-9bda-af6baec71025', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (601, N'271acd58-9d7c-4274-9cf8-1aa7c9deb710', N'271acd58-9d7c-4274-9cf8-1aa7c9deb710', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (602, N'15bd2b49-bc31-4d76-8827-cc95bbbad422', N'15bd2b49-bc31-4d76-8827-cc95bbbad422', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (603, N'39616182-961e-47a0-bada-7a2d2d2d5c76', N'39616182-961e-47a0-bada-7a2d2d2d5c76', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (604, N'4744201a-2b66-4e56-a555-b33269caf5e2', N'4744201a-2b66-4e56-a555-b33269caf5e2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (605, N'7833079f-4b85-440d-91d5-66969d224255', N'7833079f-4b85-440d-91d5-66969d224255', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (606, N'a6cd7895-8c1f-4eee-9a4f-3d8adf1a7044', N'a6cd7895-8c1f-4eee-9a4f-3d8adf1a7044', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (607, N'31f91856-eeef-4329-9f60-db9c351f01a8', N'31f91856-eeef-4329-9f60-db9c351f01a8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (608, N'a3d0e49e-6ef6-4c6f-b7b6-a42169ab85f7', N'a3d0e49e-6ef6-4c6f-b7b6-a42169ab85f7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (609, N'42dfa6dd-1fbb-4b4b-a7ff-67ae747f99ad', N'42dfa6dd-1fbb-4b4b-a7ff-67ae747f99ad', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (610, N'b3fc61c4-8af0-445b-9c75-675cb80eb9e2', N'b3fc61c4-8af0-445b-9c75-675cb80eb9e2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (611, N'bdae2d58-3ed1-4de9-8d2b-95d1db092902', N'bdae2d58-3ed1-4de9-8d2b-95d1db092902', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (612, N'042fff89-07b8-4f04-8899-4404c165a7b0', N'042fff89-07b8-4f04-8899-4404c165a7b0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (613, N'edad8e40-17f9-4611-a13a-2e51b19e6e30', N'edad8e40-17f9-4611-a13a-2e51b19e6e30', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (614, N'2c7f6ab2-fc8c-4612-ba11-7911d156b284', N'2c7f6ab2-fc8c-4612-ba11-7911d156b284', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (615, N'148d3cc3-5c30-441b-80c2-fa8d9cf6446b', N'148d3cc3-5c30-441b-80c2-fa8d9cf6446b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (616, N'3c58ae39-96da-476d-a634-c89a4dd2e7a3', N'3c58ae39-96da-476d-a634-c89a4dd2e7a3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (617, N'689cd1b5-09d5-4497-a8d8-27694583c344', N'689cd1b5-09d5-4497-a8d8-27694583c344', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (618, N'8bc88de9-266f-47ac-8113-1c910d7c235b', N'8bc88de9-266f-47ac-8113-1c910d7c235b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (619, N'73c9c0c9-3fcd-4405-a11c-03a62d65f206', N'73c9c0c9-3fcd-4405-a11c-03a62d65f206', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (620, N'c6b63451-a245-4a43-a9d0-eceeabc1b884', N'c6b63451-a245-4a43-a9d0-eceeabc1b884', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (621, N'4d3aa57b-4e4f-4bb4-8333-bea7eba0f66e', N'4d3aa57b-4e4f-4bb4-8333-bea7eba0f66e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (622, N'1d701f9a-263f-47f1-9bba-4ddca23d87aa', N'1d701f9a-263f-47f1-9bba-4ddca23d87aa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (623, N'e165a7d3-5b40-4fc1-8380-7276dabc519a', N'e165a7d3-5b40-4fc1-8380-7276dabc519a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (624, N'f5350311-bf43-4e0c-a3f5-719db6a97f9b', N'f5350311-bf43-4e0c-a3f5-719db6a97f9b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (625, N'8ce181dd-1371-483a-9b1d-93777d0cfff8', N'8ce181dd-1371-483a-9b1d-93777d0cfff8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (626, N'd7b555f3-d539-4c1a-8596-a36834824b8d', N'd7b555f3-d539-4c1a-8596-a36834824b8d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (627, N'03d2d6eb-0417-41e5-9d48-0008103a36ec', N'03d2d6eb-0417-41e5-9d48-0008103a36ec', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (628, N'18ceda65-8c72-4308-81f2-5b753c12bc23', N'18ceda65-8c72-4308-81f2-5b753c12bc23', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (629, N'fd2909cf-7185-404b-b2fd-c26712d126b8', N'fd2909cf-7185-404b-b2fd-c26712d126b8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (630, N'8e73eeb5-854c-4652-af8f-fd2be7e740ce', N'8e73eeb5-854c-4652-af8f-fd2be7e740ce', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (631, N'e080f610-8297-4291-9f78-e4dfd526e326', N'e080f610-8297-4291-9f78-e4dfd526e326', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (632, N'0a0f434a-c80f-4976-b1b6-0e1d1b13b4e3', N'0a0f434a-c80f-4976-b1b6-0e1d1b13b4e3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (633, N'a5aa9b39-51f5-4b6e-b882-ad28b16f6ab5', N'a5aa9b39-51f5-4b6e-b882-ad28b16f6ab5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (634, N'8d161b99-d505-4d60-9167-ba8d2b27bfe5', N'8d161b99-d505-4d60-9167-ba8d2b27bfe5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (635, N'23d6a16d-afe1-432b-8095-2f11d66bf0b9', N'23d6a16d-afe1-432b-8095-2f11d66bf0b9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (636, N'5d53b437-5645-4e0c-8420-5a8eda45bdbb', N'5d53b437-5645-4e0c-8420-5a8eda45bdbb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (637, N'2d6ae59f-7cfd-46a8-a89b-8fd2cb0e9f58', N'2d6ae59f-7cfd-46a8-a89b-8fd2cb0e9f58', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (638, N'524fddf7-142e-431d-9191-81dab41dedf0', N'524fddf7-142e-431d-9191-81dab41dedf0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (639, N'e831dcd0-1bd5-4754-9477-b034b0639cab', N'e831dcd0-1bd5-4754-9477-b034b0639cab', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (640, N'1eedaa8c-d4ce-49c6-95f8-3ed68b1ab5a3', N'1eedaa8c-d4ce-49c6-95f8-3ed68b1ab5a3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (641, N'd0d57223-ea9c-41c1-adff-29a4856c73df', N'd0d57223-ea9c-41c1-adff-29a4856c73df', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (642, N'2e4bccdc-eb50-4e42-8755-0dd1433f6846', N'2e4bccdc-eb50-4e42-8755-0dd1433f6846', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (643, N'609ef9dc-4aa2-4fe1-a5be-ecbbc68ba5b4', N'609ef9dc-4aa2-4fe1-a5be-ecbbc68ba5b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (644, N'6c710b5a-a537-460e-9e97-8bda293ebccc', N'6c710b5a-a537-460e-9e97-8bda293ebccc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (645, N'f605d1f4-f459-465e-ac8a-b4b787b78c8a', N'f605d1f4-f459-465e-ac8a-b4b787b78c8a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (646, N'99c33795-e4f9-499c-a29f-c1f8fb4cdb95', N'99c33795-e4f9-499c-a29f-c1f8fb4cdb95', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (647, N'd1b7865a-0c68-4075-9dd1-4228c3d304f1', N'd1b7865a-0c68-4075-9dd1-4228c3d304f1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (648, N'2e56a5fb-c04e-46fb-ae9a-392df8ba5d7d', N'2e56a5fb-c04e-46fb-ae9a-392df8ba5d7d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (649, N'10e4b313-08f8-47a9-9a85-d21975cc4e3b', N'10e4b313-08f8-47a9-9a85-d21975cc4e3b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (650, N'f81dbf18-d3d3-4899-b6b8-61b76e53374c', N'f81dbf18-d3d3-4899-b6b8-61b76e53374c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (651, N'c9f4b948-4d0d-4c39-a878-dd4d8310f06d', N'c9f4b948-4d0d-4c39-a878-dd4d8310f06d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (652, N'b2f7a647-6ec6-418b-ba46-7b0386b16cc7', N'b2f7a647-6ec6-418b-ba46-7b0386b16cc7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (653, N'd1987ba8-6c81-46c6-af9b-29c36492beaa', N'd1987ba8-6c81-46c6-af9b-29c36492beaa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (654, N'd5c4169c-44c7-4d70-be54-2dca272074dd', N'd5c4169c-44c7-4d70-be54-2dca272074dd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (655, N'b0a272d7-6ada-4054-aa33-27b8d4da5b79', N'b0a272d7-6ada-4054-aa33-27b8d4da5b79', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (656, N'0cf22a3c-6a32-4fa3-81f9-fc56490cb47f', N'0cf22a3c-6a32-4fa3-81f9-fc56490cb47f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (657, N'ce9da0e3-a11a-4baa-96ea-a62bc48b3a03', N'ce9da0e3-a11a-4baa-96ea-a62bc48b3a03', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (658, N'177eeb84-95e5-48e5-942e-e94e25146344', N'177eeb84-95e5-48e5-942e-e94e25146344', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (659, N'f2b6196f-7199-42b3-b12b-506df045a964', N'f2b6196f-7199-42b3-b12b-506df045a964', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (660, N'ef16c3f6-dddb-49f4-b72f-3b8263d69192', N'ef16c3f6-dddb-49f4-b72f-3b8263d69192', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (661, N'8743c251-3f06-48d6-af14-be6256ca2e25', N'8743c251-3f06-48d6-af14-be6256ca2e25', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (662, N'a9bc83bf-ef21-4a11-8510-f7013550f145', N'a9bc83bf-ef21-4a11-8510-f7013550f145', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (663, N'd3948e46-cf61-4b23-850f-50bde327c466', N'd3948e46-cf61-4b23-850f-50bde327c466', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (664, N'c3cf99b2-b25c-48d0-906c-d2bbc87c5584', N'c3cf99b2-b25c-48d0-906c-d2bbc87c5584', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (665, N'cef7db2b-58dd-469d-b5c1-f187ddc1b6b0', N'cef7db2b-58dd-469d-b5c1-f187ddc1b6b0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (666, N'62296675-0d7f-49cc-9031-e30f1e16dfc7', N'62296675-0d7f-49cc-9031-e30f1e16dfc7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (667, N'c1d43f2f-e2cd-4eee-96ba-5e269fca3cba', N'c1d43f2f-e2cd-4eee-96ba-5e269fca3cba', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (668, N'4f58ad2a-bf7f-47fb-b8eb-d7e27fe58c70', N'4f58ad2a-bf7f-47fb-b8eb-d7e27fe58c70', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (669, N'843ea99e-c2de-4944-a9bd-3cf966a3e8aa', N'843ea99e-c2de-4944-a9bd-3cf966a3e8aa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (670, N'bae941b2-06a8-42d9-bd7a-1f5a979bfb28', N'bae941b2-06a8-42d9-bd7a-1f5a979bfb28', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (671, N'83236918-8acd-469f-beb9-fac645e68065', N'83236918-8acd-469f-beb9-fac645e68065', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (672, N'f6a9704c-ca64-46c4-a56a-821fd7ec9803', N'f6a9704c-ca64-46c4-a56a-821fd7ec9803', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (673, N'3fa2e30f-33db-4ee5-86f3-724efa4ec4de', N'3fa2e30f-33db-4ee5-86f3-724efa4ec4de', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (674, N'115a0809-fb9e-4382-84dd-07307a4259da', N'115a0809-fb9e-4382-84dd-07307a4259da', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (675, N'12f2e15b-9b79-47e6-a17f-b73bf9468e00', N'12f2e15b-9b79-47e6-a17f-b73bf9468e00', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (676, N'a1f19fae-1eb2-43da-a0ad-5e8e716bbed5', N'a1f19fae-1eb2-43da-a0ad-5e8e716bbed5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (677, N'81985732-1ac1-49c4-95d4-096417845794', N'81985732-1ac1-49c4-95d4-096417845794', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (678, N'ff216b28-b721-492c-b255-49b5fe0a85e9', N'ff216b28-b721-492c-b255-49b5fe0a85e9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (679, N'af878ad9-51b1-4562-b613-b6fd22a94519', N'af878ad9-51b1-4562-b613-b6fd22a94519', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (680, N'28890a7c-1546-45c0-b9d9-bfeef5c2c053', N'28890a7c-1546-45c0-b9d9-bfeef5c2c053', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (681, N'676e7a5f-eaad-4402-ab4f-9a9e82a30d48', N'676e7a5f-eaad-4402-ab4f-9a9e82a30d48', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (682, N'dd0044f4-1bf8-43ff-8877-f18f129e1bd2', N'dd0044f4-1bf8-43ff-8877-f18f129e1bd2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (683, N'20adb881-f776-4d3a-ae57-4ca310545958', N'20adb881-f776-4d3a-ae57-4ca310545958', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (684, N'b97946df-6ec4-4cb3-b7f9-246cd4756e60', N'b97946df-6ec4-4cb3-b7f9-246cd4756e60', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (685, N'50cb2fd6-404b-4415-b9f1-cd24ac15ce32', N'50cb2fd6-404b-4415-b9f1-cd24ac15ce32', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (686, N'bb01bcaa-79aa-4a6f-8755-f086b3d1112c', N'bb01bcaa-79aa-4a6f-8755-f086b3d1112c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (687, N'9570284d-3dcb-48b5-811e-7f5225ae41fe', N'9570284d-3dcb-48b5-811e-7f5225ae41fe', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (688, N'57862ef0-6ead-4ee7-b9d7-c64e012249d8', N'57862ef0-6ead-4ee7-b9d7-c64e012249d8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (689, N'987682e6-cad7-4526-bc1a-00b186b80f43', N'987682e6-cad7-4526-bc1a-00b186b80f43', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (690, N'b082939d-be0f-4404-97e9-e3998ce6fdb0', N'b082939d-be0f-4404-97e9-e3998ce6fdb0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (691, N'6f4cff5d-f9a6-4661-a44e-45356d8f102d', N'6f4cff5d-f9a6-4661-a44e-45356d8f102d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (692, N'58f0c2a1-9269-4899-aab6-612e5926f4aa', N'58f0c2a1-9269-4899-aab6-612e5926f4aa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (693, N'545eb514-ec18-49d6-9ad9-2e3916d23756', N'545eb514-ec18-49d6-9ad9-2e3916d23756', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (694, N'6499efd0-9a5f-4a61-895e-c92046801245', N'6499efd0-9a5f-4a61-895e-c92046801245', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (695, N'28d60a8c-8420-43f1-8bd1-e9497aaf1b9c', N'28d60a8c-8420-43f1-8bd1-e9497aaf1b9c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (696, N'5361ecab-b83a-43c7-9330-0180f6dd9a2e', N'5361ecab-b83a-43c7-9330-0180f6dd9a2e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (697, N'3815eba5-4009-4545-a56f-10e13ad4c208', N'3815eba5-4009-4545-a56f-10e13ad4c208', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (698, N'c68d7922-a7b6-4ad6-bc6f-e0ffd8b806da', N'c68d7922-a7b6-4ad6-bc6f-e0ffd8b806da', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (699, N'59b2e438-bad4-4fde-bd6d-cd39d576c4f5', N'59b2e438-bad4-4fde-bd6d-cd39d576c4f5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (700, N'05af803c-d3a1-4413-8003-9b7072d2d0b4', N'05af803c-d3a1-4413-8003-9b7072d2d0b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (701, N'8e19c730-4d43-4716-b275-d9b4794cd308', N'8e19c730-4d43-4716-b275-d9b4794cd308', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (702, N'902f12e2-2652-4047-a749-5e40553885f1', N'902f12e2-2652-4047-a749-5e40553885f1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (703, N'dd5d6740-a85d-4ef0-bde9-cebf7cd511b9', N'dd5d6740-a85d-4ef0-bde9-cebf7cd511b9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (704, N'f332f5c7-3153-4637-bdbd-2594bd7e286f', N'f332f5c7-3153-4637-bdbd-2594bd7e286f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (705, N'f8553b7c-f77a-435e-8fa8-1ff618355daa', N'f8553b7c-f77a-435e-8fa8-1ff618355daa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (706, N'f48a34f0-5e65-474f-a2e9-8199af92d7d4', N'f48a34f0-5e65-474f-a2e9-8199af92d7d4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (707, N'43469173-ce61-413f-b860-1b60fbd40e7c', N'43469173-ce61-413f-b860-1b60fbd40e7c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (708, N'7218dda6-5332-47db-968e-ca287a20d7ef', N'7218dda6-5332-47db-968e-ca287a20d7ef', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (709, N'410fa1ca-82b9-443f-a43c-2a4e9a75767b', N'410fa1ca-82b9-443f-a43c-2a4e9a75767b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (710, N'02876fd4-ab9e-4870-a7ef-479bf5ff9f18', N'02876fd4-ab9e-4870-a7ef-479bf5ff9f18', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (711, N'17efd877-acc8-4080-a575-3bc21e780d0f', N'17efd877-acc8-4080-a575-3bc21e780d0f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (712, N'7b0aa0ef-0b0d-463b-be1e-8309756c34ce', N'7b0aa0ef-0b0d-463b-be1e-8309756c34ce', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (713, N'dd51d2dc-005e-4a70-9383-3be18c4b24c2', N'dd51d2dc-005e-4a70-9383-3be18c4b24c2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (714, N'6b3a12f9-5e64-489f-8909-ea198d484ab0', N'6b3a12f9-5e64-489f-8909-ea198d484ab0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (715, N'393426ed-8ec9-41ec-b59d-a2442174a752', N'393426ed-8ec9-41ec-b59d-a2442174a752', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (716, N'd09ebd72-6ca8-4622-baaa-a4bcdb8aaea1', N'd09ebd72-6ca8-4622-baaa-a4bcdb8aaea1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (717, N'e05cecf2-1fc9-4949-b9d8-2628721e6c32', N'e05cecf2-1fc9-4949-b9d8-2628721e6c32', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (718, N'a49ad050-1ab5-4058-82ae-3739fd235fd5', N'a49ad050-1ab5-4058-82ae-3739fd235fd5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (719, N'4d07a399-2d2e-459d-a01f-2158e84ea18e', N'4d07a399-2d2e-459d-a01f-2158e84ea18e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (720, N'9b55c404-f236-4eaf-beac-6ec65af980ff', N'9b55c404-f236-4eaf-beac-6ec65af980ff', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (721, N'5dca5ed7-e964-4ae7-a107-60afcc2e5d3f', N'5dca5ed7-e964-4ae7-a107-60afcc2e5d3f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (722, N'2cc38784-11ae-4047-84b5-bf0b48d249a5', N'2cc38784-11ae-4047-84b5-bf0b48d249a5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (723, N'45bdf158-1573-4fc5-b6e1-33ea24071856', N'45bdf158-1573-4fc5-b6e1-33ea24071856', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (724, N'65c1fc76-42fc-45ce-9c32-88eca29461b4', N'65c1fc76-42fc-45ce-9c32-88eca29461b4', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (725, N'1e1bc030-f926-49ed-93b8-4c9855fc0199', N'1e1bc030-f926-49ed-93b8-4c9855fc0199', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (726, N'64b821a2-2aa0-4d28-936c-76dc7b18873d', N'64b821a2-2aa0-4d28-936c-76dc7b18873d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (727, N'49bba193-8892-4615-a6a4-526acfdd9297', N'49bba193-8892-4615-a6a4-526acfdd9297', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (728, N'6ce62d31-c678-40e2-a18e-56ef87633cec', N'6ce62d31-c678-40e2-a18e-56ef87633cec', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (729, N'37febfc3-2b72-4bd5-95eb-3585d7258534', N'37febfc3-2b72-4bd5-95eb-3585d7258534', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (730, N'5aec871a-64be-4d90-98f4-bd336f55dfb7', N'5aec871a-64be-4d90-98f4-bd336f55dfb7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (731, N'fdb5330d-4732-4800-94b7-fbff269f834c', N'fdb5330d-4732-4800-94b7-fbff269f834c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (732, N'8bcce2aa-02a6-4290-b5da-4ea079d3dccc', N'8bcce2aa-02a6-4290-b5da-4ea079d3dccc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (733, N'02161c37-13bd-4f68-b60f-16854108d10a', N'02161c37-13bd-4f68-b60f-16854108d10a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (734, N'f9e497b2-d0b4-4ec5-9b1e-7a82d46d8008', N'f9e497b2-d0b4-4ec5-9b1e-7a82d46d8008', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (735, N'4e5b5a4f-03eb-48aa-9ccb-4577ef81a561', N'4e5b5a4f-03eb-48aa-9ccb-4577ef81a561', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (736, N'9f05f60b-682f-42ef-bd76-c28fad9bf694', N'9f05f60b-682f-42ef-bd76-c28fad9bf694', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (737, N'f9ca9fa4-9a33-455a-8f09-c6c95988ba29', N'f9ca9fa4-9a33-455a-8f09-c6c95988ba29', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (738, N'5dd6bb77-506e-4d59-bc8a-6dc3fb45ce88', N'5dd6bb77-506e-4d59-bc8a-6dc3fb45ce88', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (739, N'c2524a60-eccb-485b-b87c-099cfb36994f', N'c2524a60-eccb-485b-b87c-099cfb36994f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (740, N'd3288a13-2764-40ac-b05f-4836cb8caacb', N'd3288a13-2764-40ac-b05f-4836cb8caacb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (741, N'582d79b3-212a-4971-8720-ad652823c677', N'582d79b3-212a-4971-8720-ad652823c677', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (742, N'd46d4a33-5fe4-46c1-b708-1a7e2f2d844c', N'd46d4a33-5fe4-46c1-b708-1a7e2f2d844c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (743, N'd5eff66c-3a1a-4224-8085-a672d59935ea', N'd5eff66c-3a1a-4224-8085-a672d59935ea', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (744, N'a0fd9647-fd46-462a-8c66-d14743afde1f', N'a0fd9647-fd46-462a-8c66-d14743afde1f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (745, N'96e00952-9ea3-4827-a449-07bb36c5985d', N'96e00952-9ea3-4827-a449-07bb36c5985d', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (746, N'248553c9-d1b3-46c7-882c-287a864fcdf1', N'248553c9-d1b3-46c7-882c-287a864fcdf1', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (747, N'1758e774-253b-443d-a17e-f9cc1bdba03a', N'1758e774-253b-443d-a17e-f9cc1bdba03a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (748, N'e497ce0a-1ef7-4701-8f9d-86a769f19544', N'e497ce0a-1ef7-4701-8f9d-86a769f19544', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (749, N'596f5c9e-d21d-4fd8-ac8e-b1c06df99422', N'596f5c9e-d21d-4fd8-ac8e-b1c06df99422', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (750, N'2265cd07-02f4-458c-b456-f46888f38dbc', N'2265cd07-02f4-458c-b456-f46888f38dbc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (751, N'9f4211cf-2825-415a-80fd-76e72b8c793b', N'9f4211cf-2825-415a-80fd-76e72b8c793b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (752, N'1b0ef054-dd0c-4c8c-9c59-cb375e34ed52', N'1b0ef054-dd0c-4c8c-9c59-cb375e34ed52', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (753, N'086d3c76-a1f2-41c4-9607-bd1853f4d5f8', N'086d3c76-a1f2-41c4-9607-bd1853f4d5f8', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (754, N'e4b29e50-97cd-4256-b9ca-fb8f2a20d25a', N'e4b29e50-97cd-4256-b9ca-fb8f2a20d25a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (755, N'248b00e2-ac85-46c4-a256-8dd4304031c6', N'248b00e2-ac85-46c4-a256-8dd4304031c6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (756, N'35cf690a-bb00-4991-b661-575ee90473b2', N'35cf690a-bb00-4991-b661-575ee90473b2', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (757, N'e14770ab-7ce4-4501-a35e-caf3a0345138', N'e14770ab-7ce4-4501-a35e-caf3a0345138', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (758, N'1240cc6d-2865-4bcb-bd41-12eb07c611be', N'1240cc6d-2865-4bcb-bd41-12eb07c611be', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (759, N'45b64186-0a81-44a1-b4d7-1271c5dcacc9', N'45b64186-0a81-44a1-b4d7-1271c5dcacc9', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (760, N'31778ea0-fc4d-4377-9f09-8f7bc0dbeb31', N'31778ea0-fc4d-4377-9f09-8f7bc0dbeb31', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (761, N'562942c5-b9c2-449d-9652-534816c60546', N'562942c5-b9c2-449d-9652-534816c60546', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (762, N'6e9ce62f-5cf8-4c0b-8ae4-e50edffd44bb', N'6e9ce62f-5cf8-4c0b-8ae4-e50edffd44bb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (763, N'08ea845c-ea8f-4df9-b0b2-ced929aa3bfc', N'08ea845c-ea8f-4df9-b0b2-ced929aa3bfc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (764, N'86f28688-7aac-4a9b-9d77-00202c2f3a24', N'86f28688-7aac-4a9b-9d77-00202c2f3a24', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (765, N'00d28482-b120-46b0-a1bf-486eb10ef9fb', N'00d28482-b120-46b0-a1bf-486eb10ef9fb', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (766, N'0e674374-44e6-434e-bfff-48a37d86381b', N'0e674374-44e6-434e-bfff-48a37d86381b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (767, N'c35485f6-69a0-4060-ab62-56d74f246283', N'c35485f6-69a0-4060-ab62-56d74f246283', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (768, N'6a727577-c5e2-4752-8eb4-611857b82398', N'6a727577-c5e2-4752-8eb4-611857b82398', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (769, N'c415fee8-efc6-4c93-b815-a80de428cbd7', N'c415fee8-efc6-4c93-b815-a80de428cbd7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (770, N'686f1352-6fd3-4417-a0b2-8fec6481f229', N'686f1352-6fd3-4417-a0b2-8fec6481f229', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (771, N'b89717fb-55af-4dad-acb4-d34ed0cbb13f', N'b89717fb-55af-4dad-acb4-d34ed0cbb13f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (772, N'b011058f-3fc7-4939-b964-ce2ee667d3c7', N'b011058f-3fc7-4939-b964-ce2ee667d3c7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (773, N'bf4d6ef6-278b-4986-b23f-cd5c7eb69cee', N'bf4d6ef6-278b-4986-b23f-cd5c7eb69cee', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (774, N'96c56b38-4e2a-4e85-aa41-7ea294093b3e', N'96c56b38-4e2a-4e85-aa41-7ea294093b3e', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (775, N'920f45a1-142d-4b88-845c-a0fca3213e0a', N'920f45a1-142d-4b88-845c-a0fca3213e0a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (776, N'15ddd7aa-52de-4fff-8640-7ad652eedb1c', N'15ddd7aa-52de-4fff-8640-7ad652eedb1c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (777, N'e7553a9e-5829-49fb-b2d1-c6a5e3bb1032', N'e7553a9e-5829-49fb-b2d1-c6a5e3bb1032', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (778, N'c13249b3-92b2-49ba-934f-2fa36fa3ee87', N'c13249b3-92b2-49ba-934f-2fa36fa3ee87', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (779, N'569cb5b7-4870-4286-a55a-b50bcd0db62a', N'569cb5b7-4870-4286-a55a-b50bcd0db62a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (780, N'218cf70f-45a9-4ef1-8ba8-3d1574710c06', N'218cf70f-45a9-4ef1-8ba8-3d1574710c06', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (781, N'c6e335ea-3420-4fea-a6ab-29b46ac24589', N'c6e335ea-3420-4fea-a6ab-29b46ac24589', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (782, N'bdb5bc2e-5fcb-4e13-b61a-9a4ccfc2c900', N'bdb5bc2e-5fcb-4e13-b61a-9a4ccfc2c900', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (783, N'fe4bf30a-98b6-4bbe-bb91-d2c72e1610ab', N'fe4bf30a-98b6-4bbe-bb91-d2c72e1610ab', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (784, N'd4fad83a-d535-41b5-8e3b-f3c5f088d74a', N'd4fad83a-d535-41b5-8e3b-f3c5f088d74a', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (785, N'c9fc30ca-ebc2-471c-b3a5-d023a74a26a5', N'c9fc30ca-ebc2-471c-b3a5-d023a74a26a5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (786, N'17de02ae-ffe9-4f77-bea4-4ed1687ce5b3', N'17de02ae-ffe9-4f77-bea4-4ed1687ce5b3', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (787, N'71c11786-1383-47d2-95a4-15c4ff06a2d7', N'71c11786-1383-47d2-95a4-15c4ff06a2d7', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (788, N'0b5d82ea-6722-4624-be50-1a87cc4804ac', N'0b5d82ea-6722-4624-be50-1a87cc4804ac', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (789, N'a050d9c7-7a5c-4596-a775-ef4b062a95cc', N'a050d9c7-7a5c-4596-a775-ef4b062a95cc', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (790, N'9f6934a2-cd16-474c-b01d-6b8c5642b1fa', N'9f6934a2-cd16-474c-b01d-6b8c5642b1fa', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (791, N'a29f5194-09cf-431e-b727-452e2bdfbee6', N'a29f5194-09cf-431e-b727-452e2bdfbee6', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (792, N'192e3619-4815-40f3-a2d7-b1bf818d3390', N'192e3619-4815-40f3-a2d7-b1bf818d3390', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (793, N'5a9d9695-2582-4b84-ae05-db41ffc44b8c', N'5a9d9695-2582-4b84-ae05-db41ffc44b8c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (794, N'1496c8b7-49a3-47db-ae7f-33efbe926e8c', N'1496c8b7-49a3-47db-ae7f-33efbe926e8c', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (795, N'698e9d3a-9d1e-4fa1-ae4d-25708c93734b', N'698e9d3a-9d1e-4fa1-ae4d-25708c93734b', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (796, N'3b80b999-3ae2-40d0-b090-f85dface09b0', N'3b80b999-3ae2-40d0-b090-f85dface09b0', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (797, N'b870c7f3-48ba-4e9f-b64c-1683fe07a555', N'b870c7f3-48ba-4e9f-b64c-1683fe07a555', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (798, N'ab6c080c-98f6-4a96-8065-0705f8088a61', N'ab6c080c-98f6-4a96-8065-0705f8088a61', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (799, N'987df8df-7f81-4f0b-9a6b-397e182f8589', N'987df8df-7f81-4f0b-9a6b-397e182f8589', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
GO
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (800, N'638d6c81-96b1-4101-9597-7121871e990f', N'638d6c81-96b1-4101-9597-7121871e990f', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (801, N'23a8eaa9-1c7b-449b-8787-564d76964b92', N'23a8eaa9-1c7b-449b-8787-564d76964b92', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (802, N'54485231-9252-433a-819c-1d719938a5f5', N'54485231-9252-433a-819c-1d719938a5f5', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (803, N'a4743d90-97f0-44bb-91cf-bb21361831ca', N'a4743d90-97f0-44bb-91cf-bb21361831ca', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
INSERT [dbo].[Person] ([Id], [FirstName], [LastName], [Birthday], [DateCreated], [IsActive]) VALUES (804, N'ceb2395c-25c6-4f46-a631-ccfbae2f2abd', N'ceb2395c-25c6-4f46-a631-ccfbae2f2abd', CAST(N'2000-01-01' AS Date), CAST(N'2021-01-12T22:28:24.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET IDENTITY_INSERT [dbo].[Player] ON 

INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (1, N'fca25166-9e6d-462f-88e7-59f0a119e3fe', 23, 47, 9, 733, 1, 2, 5, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (2, N'af4fe783-1149-4271-8cf2-b2f2e9f18d87', 37, 45, 6, 718, 1, 2, 6, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (3, N'2eca966b-2b55-4e49-9b22-0442c579c27f', 50, 49, 1, 634, 1, 2, 7, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (4, N'93fac761-eecc-4408-bef1-bc8b4459a174', 13, 46, 8, 175, 1, 2, 8, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (5, N'c1a3a38a-b166-4acb-b4c2-901e796f54ea', 13, 49, 10, 788, 1, 2, 9, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (6, N'6876ab7b-47c8-4580-a16d-1d20d185422f', 12, 47, 7, 179, 1, 2, 10, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (7, N'6d693587-a80f-48c7-bdda-dc066717aca9', 31, 45, 10, 239, 1, 2, 11, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (8, N'17ad69e3-3339-4210-9dd5-8246c84e1d18', 31, 43, 2, 86, 1, 2, 12, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (9, N'a9bba7b3-dd86-4d4c-a43e-f99303b47eda', 28, 47, 8, 432, 1, 2, 13, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (10, N'ce924918-3ffb-47a0-a4a8-77733fb3dcb2', 41, 46, 5, 35, 1, 2, 14, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (11, N'ddbe11ae-25be-42a1-88e5-12c1559d72a0', 11, 40, 0, 727, 1, 2, 15, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (12, N'8f7aec53-5bcd-4fe8-b875-a46cd607351d', 17, 45, 9, 535, 1, 2, 16, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (13, N'fb85a977-6775-473b-a084-d1f635219606', 52, 40, 0, 601, 1, 2, 17, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (14, N'c26d3de3-93e5-4df4-b4c7-b4638d55289a', 43, 40, 8, 260, 1, 2, 18, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (15, N'abbf127e-b6cf-4bf8-9594-3221ef194d31', 43, 44, 10, 540, 1, 2, 19, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (16, N'3c62a797-4385-4774-973c-e86ba8264843', 22, 51, 2, 906, 1, 2, 20, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (17, N'067fc892-9433-4088-b416-7545b81b8c61', 27, 51, 10, 948, 1, 2, 21, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (18, N'a0128257-89d1-4fcd-a396-abf5cfaf798c', 36, 47, 0, 17, 1, 2, 22, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (19, N'f6371405-6e8e-46d9-8831-7195e2330f7e', 34, 43, 2, 769, 1, 2, 23, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (20, N'6308ac1d-fc16-430a-be31-0adaafefdea7', 18, 41, 0, 771, 1, 2, 24, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (21, N'7fa7001f-0ac7-4855-944e-dc75605999d5', 50, 45, 7, 269, 1, 2, 25, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (22, N'345af4af-f649-43cc-8ed7-1a508acb1dbc', 41, 41, 6, 620, 1, 2, 26, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (23, N'abba007a-dac1-4ebe-9e3c-dd005fe659cf', 28, 51, 10, 636, 1, 2, 27, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (24, N'f7295f2e-1361-45e4-8181-bc51de5a20f1', 26, 46, 4, 119, 1, 2, 28, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (25, N'f3e2bcef-1c11-4326-b422-2b7d9f92e71d', 26, 42, 0, 422, 1, 2, 29, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (26, N'3fa7db29-0322-41dc-b26d-55bd9a87b242', 23, 42, 7, 995, 1, 2, 30, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (27, N'6ac2e544-f466-445a-9046-ad97f16cbb8f', 42, 51, 10, 62, 1, 2, 31, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (28, N'63347d93-ded6-4664-88a2-91c698c6d63b', 44, 40, 5, 268, 1, 2, 32, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (29, N'4b0be1c7-1640-4825-9f3d-ce0e06b729a0', 51, 42, 1, 760, 1, 2, 33, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (30, N'bff7f703-2d5d-4ee3-baf6-6e874de4adae', 39, 50, 1, 628, 1, 2, 34, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (31, N'ccd10fe4-8e9c-4e25-88d3-89897cbb2cb5', 42, 62, 7, 1326, 2, 2, 35, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (32, N'008598a8-12ab-4502-a8d3-0493e6002773', 44, 61, 2, 1300, 2, 2, 36, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (33, N'2f35c73b-927b-4bfc-9ca7-916697b55991', 21, 54, 8, 1164, 2, 2, 37, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (34, N'ec856eb5-c98d-428b-9313-9260d8d4fa73', 24, 56, 4, 1580, 2, 2, 38, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (35, N'08a54c0f-c6bb-41df-aaed-e307c54afe63', 41, 57, 9, 1057, 2, 2, 39, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (36, N'b3458feb-5bf8-4404-9fd7-2d8fa853afac', 23, 59, 6, 1982, 2, 2, 40, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (37, N'9fabba2a-3793-41e4-bb19-f52a515a3a46', 29, 56, 10, 1471, 2, 2, 41, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (38, N'16dec032-ab6b-4b2d-9dff-f9e53858a8f9', 30, 53, 12, 1872, 2, 2, 42, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (39, N'bf1627a1-343f-4e7b-a427-485e3c815b3f', 18, 60, 5, 1035, 2, 2, 43, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (40, N'ca3422f2-cbb4-4154-9955-3413b9c5c41d', 26, 56, 3, 1030, 2, 2, 44, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (41, N'8076970a-7c23-4034-809a-32634a5b61c1', 38, 62, 4, 1036, 2, 2, 45, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (42, N'117d6b32-ba6d-4099-abfe-ddbb526a72e3', 49, 64, 12, 1013, 2, 2, 46, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (43, N'ed1428a4-0bb7-48c3-b4fa-ee56a176a635', 53, 48, 5, 1400, 2, 2, 47, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (44, N'2376ae97-8fd6-4810-90b1-5939df2ef658', 43, 50, 8, 1898, 2, 2, 48, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (45, N'eec4e486-b7e2-4af7-a711-b54d31930449', 45, 58, 3, 1671, 2, 2, 49, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (46, N'd633fbfd-06d5-4f22-9755-fea92299621b', 55, 51, 8, 1181, 2, 2, 50, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (47, N'a017401d-a63b-454f-aec6-cacdbd891744', 32, 59, 7, 1336, 2, 2, 51, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (48, N'08c0fa91-e9f3-4e2d-87c9-7ed9d0220337', 26, 57, 9, 1311, 2, 2, 52, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (49, N'2e48a394-b0d2-45e1-82cc-83d8fddd0f74', 38, 57, 7, 1484, 2, 2, 53, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (50, N'4d717f53-9ce8-4abd-a8d8-39e64e8585aa', 62, 55, 12, 1495, 2, 2, 54, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (51, N'3bccc560-5981-4a35-9a06-945143e6359f', 20, 58, 10, 1655, 2, 2, 55, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (52, N'6ff22ae0-dd50-4dd2-8894-3bd3c950d19e', 60, 60, 3, 1064, 2, 2, 56, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (53, N'be64dcc3-e00f-40d4-80cd-2e3b9b7ae2ba', 33, 50, 11, 1088, 2, 2, 57, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (54, N'13048b28-60fb-4fc6-954e-3c116881ca2f', 27, 55, 11, 1380, 2, 2, 58, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (55, N'e7b4e398-7775-486f-9de5-857a583314c1', 52, 55, 10, 1761, 2, 2, 59, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (56, N'96c30366-42fd-4460-bbb3-6ea1d3106abf', 46, 53, 8, 1605, 2, 2, 60, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (57, N'95bb0b15-d358-4794-a5d0-f8e42cd92c30', 57, 60, 6, 1452, 2, 2, 61, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (58, N'768426d9-6c4c-4dec-b59e-02b930cd400a', 48, 58, 8, 1699, 2, 2, 62, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (59, N'50f2c7c2-acfc-4876-b3bc-7e7be273b118', 33, 54, 9, 1254, 2, 2, 63, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (60, N'38f62ce1-01d0-4999-8e20-dcf2317928a3', 23, 57, 4, 1807, 2, 2, 64, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (61, N'4b2ffbab-0c85-4fe8-ac6d-57485113eb7a', 54, 56, 8, 1002, 2, 2, 65, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (62, N'5af05bec-f515-4d15-a609-fe616fce6a26', 38, 60, 6, 1422, 2, 2, 66, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (63, N'bf95725d-7ea8-4255-8eeb-129f37b45872', 48, 53, 2, 1995, 2, 2, 67, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (64, N'6e8d4e4b-0fb0-4924-8156-d1e59f6c7f50', 39, 49, 3, 1140, 2, 2, 68, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (65, N'be7e9c1e-0aaf-4df1-ac9b-bc40c5baf5d3', 57, 54, 8, 1384, 2, 2, 69, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (66, N'5d792685-44dc-4493-b973-4ada50c95afa', 21, 57, 5, 1588, 2, 2, 70, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (67, N'd3e066f3-62d6-4536-bdcc-a2c87925110c', 41, 59, 2, 1658, 2, 2, 71, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (68, N'9d2dd280-32fd-4985-862a-2de569c56f84', 55, 53, 7, 1200, 2, 2, 72, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (69, N'f6803b82-da31-48af-8c90-549bc37e4e19', 46, 53, 4, 1050, 2, 2, 73, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (70, N'cf88f33a-4a4f-4316-b71a-72cd4f4914b7', 46, 63, 4, 1716, 2, 2, 74, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (71, N'6d492896-64bf-4d9c-a4ff-46f420b6f9e9', 29, 52, 6, 1634, 2, 2, 75, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (72, N'7accf40f-682b-40e6-8762-42139d75c3ab', 42, 48, 9, 1307, 2, 2, 76, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (73, N'91f9bae5-5e81-4c31-b715-c00f79f763c1', 43, 48, 7, 1506, 2, 2, 77, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (74, N'72f3f8c2-e856-4b10-8487-2f455cfa49b0', 33, 60, 6, 1373, 2, 2, 78, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (75, N'dc7c840e-1dd6-4689-9047-9eefa6dd9d0a', 27, 63, 8, 1960, 2, 2, 79, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (76, N'c1be0184-91bb-424a-8781-c9c0cb51532a', 41, 54, 7, 1728, 2, 2, 80, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (77, N'86a24a86-593d-425c-b850-db5a633a2585', 41, 56, 10, 1741, 2, 2, 81, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (78, N'6b53b241-a6d8-4743-b45a-6ee8105b8f83', 23, 58, 2, 1980, 2, 2, 82, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (79, N'dcd2c04c-7656-4dc1-8d8a-2ec98a9d2f4e', 51, 50, 7, 1676, 2, 2, 83, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (80, N'fd4b59b2-6965-43c5-a42d-6975c7a4303c', 36, 62, 6, 1832, 2, 2, 84, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (81, N'18c753ac-3f6f-45df-847a-13db560f2984', 43, 59, 12, 1268, 2, 2, 85, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (82, N'aead777f-5f6e-42f4-8285-88698a9d5b94', 39, 57, 8, 1162, 2, 2, 86, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (83, N'be7e9cd1-1192-40bc-8df7-0f55b25a0a11', 54, 57, 4, 1955, 2, 2, 87, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (84, N'e20fd90c-7348-4a6d-83f4-09c1a9b79831', 23, 49, 9, 1363, 2, 2, 88, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (85, N'92b4be02-8049-4099-bd70-a03f6bd406ad', 58, 54, 4, 1838, 2, 2, 89, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (86, N'15912de8-0146-4879-a148-e9b32e69ad8d', 49, 49, 3, 1022, 2, 2, 90, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (87, N'48a6421a-230f-4b5e-bc5f-8ec1b7acb5d3', 25, 58, 5, 1254, 2, 2, 91, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (88, N'd02341ef-ca9d-47f1-b481-0ad226c00b57', 42, 49, 4, 1592, 2, 2, 92, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (89, N'2e0f936a-70b9-46bf-9de9-a05c9c1cf9c9', 54, 54, 10, 1725, 2, 2, 93, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (90, N'1479256f-48b3-4cfc-9ab4-62b55c56454e', 34, 53, 12, 1321, 2, 2, 94, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (91, N'62cb3a49-6d4f-4e49-8123-748488df6d75', 45, 49, 11, 1124, 2, 2, 95, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (92, N'3ecece7a-f9c4-4a71-9ce5-81d53f2fd7a0', 59, 56, 6, 1926, 2, 2, 96, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (93, N'a72ebdb9-40eb-4e57-9ec3-798f0d82960f', 27, 57, 8, 1041, 2, 2, 97, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (94, N'5a9fc6cc-c4a9-471f-adf3-519310b5029e', 45, 56, 5, 1176, 2, 2, 98, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (95, N'ddf2dd1c-897b-403c-93ec-a76783bd4fd1', 37, 62, 11, 1403, 2, 2, 99, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (96, N'fd9bd9a8-8c75-4ed5-98dd-c61dbce18774', 57, 60, 9, 1769, 2, 2, 100, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (97, N'00d5cff6-669e-4ec4-b17e-81ea3c4996b4', 36, 55, 4, 1684, 2, 2, 101, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (98, N'7e4e91a7-41bb-4ed6-a07a-a9f37423b988', 55, 50, 4, 1355, 2, 2, 102, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (99, N'1447a896-39e4-4a33-8e5a-c4706e4a647b', 54, 60, 7, 1564, 2, 2, 103, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (100, N'241d1d3d-b7e4-4970-87da-ea0e3932a444', 49, 58, 5, 1375, 2, 2, 104, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (101, N'c6f7be0d-a975-4fd3-b8dc-a45915aeab87', 21, 62, 12, 1509, 2, 2, 105, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (102, N'74437746-712e-469b-9032-c0faaa13a6f2', 37, 53, 3, 1448, 2, 2, 106, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (103, N'b866d97e-0917-46cb-ad2d-b1e07b3df6a6', 36, 51, 4, 1147, 2, 2, 107, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (104, N'2b31db92-647b-4441-9ba1-1d1f0aa90e1c', 48, 51, 4, 1437, 2, 2, 108, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (105, N'3913d3fe-8757-43b9-97da-2188ddd8a7f2', 55, 59, 6, 1133, 2, 2, 109, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (106, N'4f3696d1-1f5c-44be-86dc-81347eaf51d7', 40, 49, 4, 1982, 2, 2, 110, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (107, N'8749eb37-61cf-4901-b0e5-95ada1ec9401', 31, 52, 6, 1191, 2, 2, 111, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (108, N'be37ac9f-aab1-416b-9cc8-1ef0dd0b506a', 34, 60, 2, 1839, 2, 2, 112, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (109, N'03f86b97-ecf4-424b-ab86-c2c82ef2c5f9', 27, 63, 12, 1133, 2, 2, 113, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (110, N'd90d5bf5-bb05-431c-a4bc-36862d7bf0d8', 51, 62, 11, 1699, 2, 2, 114, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (111, N'63544e11-8775-4018-8e08-bfefb2030ae0', 64, 70, 12, 2149, 3, 2, 115, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (112, N'56e96b92-cd5f-41f5-aac0-09a9c8337dcc', 45, 57, 13, 2594, 3, 2, 116, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (113, N'6ba53c5b-718b-4fd8-8fa5-38deb4685fb1', 72, 60, 6, 2903, 3, 2, 117, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (114, N'8e89a87e-bc51-4552-bd0f-b2134eef9058', 38, 67, 12, 2881, 3, 2, 118, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (115, N'90fa266b-665f-4af1-845d-71463fa4b15d', 45, 69, 12, 2224, 3, 2, 119, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (116, N'4c360aed-7ec0-4e07-8a01-04b60b85023e', 49, 66, 4, 2436, 3, 2, 120, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (117, N'aa6e1d04-16ec-4d4b-a206-6757b5e74fd0', 55, 64, 10, 2503, 3, 2, 121, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (118, N'305b9a02-1551-42da-9844-f4e030d89b46', 34, 63, 8, 2630, 3, 2, 122, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (119, N'dbe4f3a2-2b1d-4202-9a46-3ff043a22748', 27, 75, 8, 2026, 3, 2, 123, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (120, N'0c0deb61-f99d-43fa-8492-4ae4767d42f4', 56, 65, 4, 2560, 3, 2, 124, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (121, N'94b2d26a-ec48-4924-9057-9a70accb43cf', 60, 73, 11, 2334, 3, 2, 125, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (122, N'a70a1ffe-eea3-4dac-a368-ed7d1b74c9be', 56, 73, 8, 2353, 3, 2, 126, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (123, N'a215ed73-2382-45d7-ae52-4110848167ed', 43, 64, 7, 2739, 3, 2, 127, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (124, N'14805449-2fa6-482b-afda-c993ed741c70', 71, 63, 14, 2778, 3, 2, 128, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (125, N'65da94e8-590d-45e9-a2b9-65fb4d8ae052', 54, 67, 7, 2726, 3, 2, 129, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (126, N'87e8c81f-88b8-431f-85b1-e054e74b4ee2', 35, 59, 4, 2326, 3, 2, 130, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (127, N'e0aaaa09-5eb8-4a48-9916-1c543902993d', 46, 68, 5, 2025, 3, 2, 131, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (128, N'6f710bcd-bd5a-4e1c-8f3c-e6d92de414be', 59, 74, 11, 2678, 3, 2, 132, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (129, N'78751a51-24bd-4131-8569-c9df47f1de58', 50, 60, 12, 2957, 3, 2, 133, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (130, N'23490d4e-41aa-49af-8ae3-0cf0c2818187', 44, 76, 12, 2186, 3, 2, 134, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (131, N'9f6a1b6d-01b3-4a13-a3ff-311ad7c8e916', 49, 62, 7, 2233, 3, 2, 135, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (132, N'18c8e51e-0b9d-4459-95df-5593e2be7f0d', 68, 64, 5, 2187, 3, 2, 136, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (133, N'90335f81-2625-43e4-bf15-366015415bab', 65, 68, 8, 2007, 3, 2, 137, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (134, N'f5cc0a1b-4671-4d6d-958a-1e634fbaaa0b', 30, 66, 4, 2158, 3, 2, 138, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (135, N'1fc5736b-a5a9-421c-8c64-1919a333efc1', 36, 59, 14, 2932, 3, 2, 139, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (136, N'83287ebc-9584-4e34-9e0b-bfba795642a4', 66, 65, 12, 2638, 3, 2, 140, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (137, N'2ec71794-35d9-42f2-b270-34b5670dc58a', 52, 61, 9, 2612, 3, 2, 141, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (138, N'ced38a38-fc87-4155-b615-93b2a817355a', 44, 60, 13, 2654, 3, 2, 142, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (139, N'4ac78a82-7314-4aaf-90e3-2ad22d670fa0', 65, 62, 13, 2871, 3, 2, 143, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (140, N'528f2774-da71-4d19-85e8-11f562e94545', 67, 70, 10, 2678, 3, 2, 144, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (141, N'0111f8fb-2c3a-41d8-8b79-c674f18d03d0', 35, 65, 7, 2260, 3, 2, 145, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (142, N'cea4e45c-6bbc-4158-8fbd-59f593fca46a', 42, 57, 4, 2185, 3, 2, 146, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (143, N'76abc292-81e6-416f-bfff-a016ee851ffb', 62, 66, 10, 2780, 3, 2, 147, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (144, N'0b1b1c26-bcdd-4194-9a7e-bc6ed1555cdb', 57, 63, 12, 2748, 3, 2, 148, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (145, N'177ae9f9-f86a-4f9e-aa49-77c9d7687a3b', 69, 66, 11, 2070, 3, 2, 149, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (146, N'effd5254-762b-48f8-b917-97695d8951c8', 61, 58, 11, 2832, 3, 2, 150, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (147, N'becf6b37-252f-454c-a9e7-d4c9bb636dfc', 73, 64, 13, 2469, 3, 2, 151, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (148, N'70d7e56c-598d-40e0-9bf3-daca1257f8ad', 49, 67, 12, 2475, 3, 2, 152, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (149, N'de25aa42-36e4-4fa9-8987-b67ce5a87992', 36, 66, 12, 2209, 3, 2, 153, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (150, N'55451d79-deeb-4d06-8d34-981289da451f', 35, 68, 5, 2051, 3, 2, 154, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (151, N'c2996ee0-3021-412c-93d4-d30a1304eaba', 54, 67, 4, 2453, 3, 2, 155, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (152, N'85689f01-10fb-449b-b8ae-dbf35b32d769', 55, 65, 9, 2262, 3, 2, 156, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (153, N'baceb521-5421-4739-804c-a3065477050a', 59, 73, 12, 2698, 3, 2, 157, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (154, N'5e4f2402-8bdd-4c1f-a23e-1b531b07ee3f', 41, 67, 12, 2424, 3, 2, 158, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (155, N'4e70cabb-aee7-4ef8-9976-5376fb399afa', 37, 68, 5, 2405, 3, 2, 159, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (156, N'a2b846b2-5cd4-4942-b138-4fcbbec228db', 56, 70, 14, 2447, 3, 2, 160, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (157, N'13324396-fedc-4287-be1a-1348b6a2122e', 52, 63, 9, 2216, 3, 2, 161, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (158, N'69c2bb93-e522-42b1-a870-3965f5b6d245', 65, 72, 4, 2307, 3, 2, 162, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (159, N'4690c4d1-8295-4917-ad9e-44e8b56a7aef', 40, 66, 11, 2189, 3, 2, 163, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (160, N'b66b1a62-d73d-48d0-9d52-363963be4b01', 36, 68, 13, 2723, 3, 2, 164, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (161, N'e3731160-3afc-4835-95da-0981f424a9e0', 59, 63, 14, 2765, 3, 2, 165, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (162, N'02405e04-2778-408f-9b00-73ccdf872434', 45, 69, 14, 2808, 3, 2, 166, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (163, N'ab62e084-0d12-4efb-92a1-a621932fcc8d', 54, 73, 11, 2385, 3, 2, 167, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (164, N'1fcbe944-69ce-4012-ad9a-1e48d1b3a549', 69, 66, 10, 2854, 3, 2, 168, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (165, N'42d855c2-9557-47af-a869-d0ed6f2d9c6c', 43, 57, 4, 2781, 3, 2, 169, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (166, N'ff0341e0-a3a5-4d99-a750-0a80a62b486f', 44, 71, 7, 2720, 3, 2, 170, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (167, N'1984931f-759b-4431-af33-36a481bf86c7', 62, 76, 12, 2702, 3, 2, 171, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (168, N'74ac7d09-988f-4f3e-9583-59f286230527', 74, 56, 11, 2744, 3, 2, 172, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (169, N'7b86836b-575d-4169-9357-ccce8908bad8', 64, 64, 11, 2032, 3, 2, 173, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (170, N'75d7ad5d-c41d-4225-9d26-f87a05484306', 50, 63, 9, 2008, 3, 2, 174, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (171, N'a29e4355-91fb-445f-92f4-e9343c02fe69', 79, 75, 7, 3501, 4, 2, 175, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (172, N'e59c2e37-7556-4125-a660-25b210433b19', 68, 66, 14, 3553, 4, 2, 176, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (173, N'9272b973-1db7-48a1-8ee3-363df0465939', 77, 70, 9, 3997, 4, 2, 177, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (174, N'ec8fb363-9801-4761-a08d-b00e149a8166', 34, 88, 8, 3650, 4, 2, 178, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (175, N'376a9ce8-47fd-46ca-a0e5-08de52b14389', 45, 83, 6, 3365, 4, 2, 179, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (176, N'2948d778-0cc1-4cfd-bd9f-78cfbae900e9', 60, 70, 7, 3957, 4, 2, 180, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (177, N'8e88e901-eaed-4435-9df3-5705d9723324', 73, 86, 8, 3985, 4, 2, 181, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (178, N'531cc69f-8da9-4ea4-a43a-4bd02ba9f41f', 74, 83, 8, 3191, 4, 2, 182, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (179, N'cbfc3cba-333e-4f75-a3f9-9e78a993f013', 88, 71, 8, 3923, 4, 2, 183, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (180, N'3dfaaa95-0a39-4c66-99f2-7bc3132860a1', 81, 86, 14, 3491, 4, 2, 184, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (181, N'dbfd3599-29a0-4a3d-b0e9-a2c2ac3a4869', 54, 68, 13, 3862, 4, 2, 185, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (182, N'69c6335e-cff9-414c-a2af-58d7b93d20c6', 61, 76, 16, 3453, 4, 2, 186, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (183, N'f8c61551-bd18-4d44-9130-6058ba717410', 71, 82, 8, 3657, 4, 2, 187, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (184, N'7b2ee46c-a821-4d7f-ab3d-4451e239e1c7', 57, 74, 12, 3595, 4, 2, 188, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (185, N'cf82e7f0-1131-4fab-b8b3-01bd0140ceb5', 87, 72, 13, 3069, 4, 2, 189, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (186, N'ea24c8c5-dc2d-4adc-8f56-89d3a4763637', 65, 88, 6, 3311, 4, 2, 190, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (187, N'34ba1601-bb44-4c27-8306-f6676c343747', 60, 82, 14, 3049, 4, 2, 191, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (188, N'57d3c54e-bccc-4f41-9576-b6cbb9d36cd6', 72, 69, 13, 3837, 4, 2, 192, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (189, N'af649520-d059-498b-a0cb-e009f08f45f3', 58, 88, 10, 3610, 4, 2, 193, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (190, N'a497e0ea-b3ff-465e-9e3a-6fa50808b156', 86, 81, 11, 3244, 4, 2, 194, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (191, N'5da65bde-07fe-4cb5-b1df-273dc38db57b', 50, 91, 14, 4725, 5, 2, 195, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (192, N'189e80f3-ccb4-4781-9837-79f2a6c494c4', 96, 97, 16, 4227, 5, 2, 196, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (193, N'6218d503-e111-42e3-9ff8-29cb1e78633f', 99, 91, 13, 4932, 5, 2, 197, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (194, N'2c869cd1-61d2-4e31-bd0d-09a47a51a253', 60, 78, 18, 4727, 5, 2, 198, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (195, N'dabf8f69-a7ab-4bc5-a443-35091dc4b84f', 79, 79, 9, 4392, 5, 2, 199, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (196, N'90d2145d-0bb9-4a18-b2ea-21eb2c5cf9e3', 55, 91, 9, 4083, 5, 2, 200, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (197, N'943356f4-b4de-4dfa-b956-26dd6f57e140', 43, 82, 14, 4553, 5, 2, 201, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (198, N'9ae88111-d8b7-4989-bc9f-883966307c2a', 84, 96, 11, 4800, 5, 2, 202, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (199, N'62da0153-91a2-42f2-a7d4-253db75ed38c', 65, 82, 11, 4429, 5, 2, 203, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (200, N'e0abfb07-2e08-47fa-8e67-024b86a00875', 75, 75, 13, 4078, 5, 2, 204, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (201, N'2b071f4e-4f44-4f7b-a5a5-e81e5d2f670e', 18, 46, 2, 106, 1, 4, 205, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (202, N'b9d4b2cc-e1b4-4bce-a550-108a99059444', 25, 43, 0, 460, 1, 4, 206, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (203, N'5ce78483-590e-40d9-8472-98f83e0d70db', 20, 45, 5, 489, 1, 4, 207, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (204, N'b6e86314-1350-4fb5-b577-41a00ffd4fc7', 15, 51, 1, 967, 1, 4, 208, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (205, N'a13d72d7-f85e-4dd3-84b0-f493861df06c', 38, 49, 8, 616, 1, 4, 209, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (206, N'cdc815db-bde6-426b-a350-4f86b3c5d3f6', 48, 42, 10, 386, 1, 4, 210, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (207, N'71a79ee8-3879-4728-ab24-1de79c615471', 35, 40, 5, 425, 1, 4, 211, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (208, N'4901cba7-443e-4ca1-ad98-3ea9e8e50dc7', 18, 52, 4, 970, 1, 4, 212, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (209, N'50d620f3-dae2-4c54-8ae1-6113a06789d6', 10, 43, 4, 129, 1, 4, 213, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (210, N'a30e2967-95c2-426c-8c32-7071b1b4c549', 51, 41, 8, 399, 1, 4, 214, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (211, N'40c6ee25-4833-484a-8540-67e2c70b598b', 24, 45, 10, 585, 1, 4, 215, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (212, N'96196ab6-a2d3-4aca-a8bb-a9a713015252', 20, 44, 4, 163, 1, 4, 216, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (213, N'd9ceed55-15c5-475d-a6b9-d5ca0469f8c6', 45, 42, 3, 875, 1, 4, 217, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (214, N'77e3ef07-9163-4f30-90af-a0188f7f4358', 40, 50, 5, 958, 1, 4, 218, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (215, N'e90b62be-aebd-4bb5-a059-3d007a0e2e51', 11, 41, 2, 761, 1, 4, 219, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (216, N'e55a6cfc-f3f0-4617-a700-ad2a54699cbb', 49, 41, 6, 956, 1, 4, 220, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (217, N'd8fc0c80-b129-4b0e-986e-05682914d3b8', 19, 44, 10, 173, 1, 4, 221, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (218, N'a30d9c79-53dc-4205-a6bf-54f6d2ffbaae', 48, 45, 0, 146, 1, 4, 222, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (219, N'f185e1c3-4be0-433f-8b3d-a7e9fa3b8278', 40, 41, 10, 583, 1, 4, 223, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (220, N'aa067057-9d5a-40a1-a2ad-04fa3d8b90ee', 38, 50, 3, 100, 1, 4, 224, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (221, N'7a01f80a-703c-49fb-8ccc-80795d8cd021', 48, 44, 10, 901, 1, 4, 225, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (222, N'a1b8ab61-421e-4663-a6d5-bbf5fc81aede', 13, 45, 8, 471, 1, 4, 226, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (223, N'9bfc7b47-315d-4914-9b67-af82166d7c38', 45, 41, 0, 48, 1, 4, 227, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (224, N'9b897307-e406-4ec8-9346-838968ed5822', 37, 51, 3, 572, 1, 4, 228, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (225, N'90205fc1-4ce9-41bf-9e41-3a3c417cb5a6', 22, 48, 9, 536, 1, 4, 229, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (226, N'084c613b-1f83-4328-b371-7403cdff6621', 34, 44, 7, 888, 1, 4, 230, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (227, N'5f97f3b2-40e8-4ca0-98fc-442ab83e43f2', 29, 41, 3, 53, 1, 4, 231, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (228, N'fc392afe-916d-4120-af42-46f17688c358', 24, 48, 4, 972, 1, 4, 232, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (229, N'a331a6c3-7512-42f3-8954-4a3cb76c2afe', 19, 43, 7, 159, 1, 4, 233, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (230, N'81a742ea-c78f-4f72-b635-a5e398144811', 41, 45, 0, 688, 1, 4, 234, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (231, N'2b1c57aa-6ac9-4f7b-b09f-9eec1193df73', 39, 52, 3, 1700, 2, 4, 235, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (232, N'bea9e7cf-0601-4205-ace2-943c540990ca', 31, 57, 12, 1238, 2, 4, 236, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (233, N'34228b75-40dd-4a97-be33-df0d9964e1f7', 64, 48, 8, 1551, 2, 4, 237, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (234, N'4d4301b4-277f-4e99-b849-76b06a4aa238', 48, 62, 5, 1966, 2, 4, 238, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (235, N'5175cf7e-e651-4278-abfe-fc23a95399c3', 60, 54, 6, 1615, 2, 4, 239, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (236, N'6c569fe8-4fe7-41bd-a487-6752ba36bd09', 47, 50, 8, 1922, 2, 4, 240, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (237, N'2aa08a2d-42c5-47ba-b481-8a31ed163840', 63, 56, 7, 1938, 2, 4, 241, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (238, N'297a1f8c-7c7c-4093-ba1b-fbda28c6fc55', 49, 49, 9, 1070, 2, 4, 242, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (239, N'83869ed7-f671-4ac6-ae08-9334c4cd4c89', 56, 56, 11, 1695, 2, 4, 243, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (240, N'ea32f80e-b746-4b2d-b1d8-b7c40a358716', 54, 56, 3, 1461, 2, 4, 244, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (241, N'a61fd804-086d-4faa-9b55-0b1979cb34d0', 58, 55, 4, 1142, 2, 4, 245, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (242, N'7e1b1da2-f6fa-4c19-81ab-011dab7fd196', 37, 52, 5, 1271, 2, 4, 246, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (243, N'02f56568-f925-49d9-92b1-4fcb8bade247', 63, 58, 10, 1640, 2, 4, 247, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (244, N'a8d95569-8132-4174-a8a6-c7f51730d567', 23, 50, 11, 1714, 2, 4, 248, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (245, N'bf287146-a1b7-4571-a440-66ca0fd3d1ed', 58, 63, 6, 1553, 2, 4, 249, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (246, N'd4da048f-a796-460b-a380-3d42941fd987', 25, 52, 5, 1867, 2, 4, 250, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (247, N'565ed0b3-e29a-4f9e-87a0-d3ff6a5bc382', 49, 60, 12, 1560, 2, 4, 251, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (248, N'522f49f6-4a7e-4353-bb1b-df6c4ff27d91', 19, 58, 11, 1182, 2, 4, 252, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (249, N'57ddcc14-fdbd-43d8-b402-23f8849b7826', 59, 56, 4, 1861, 2, 4, 253, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (250, N'f2496694-91d9-47eb-9d0c-ce1ebe63b43b', 27, 52, 7, 1017, 2, 4, 254, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (251, N'57e69cde-97ec-4050-ba97-8d5ece18460e', 29, 54, 7, 1387, 2, 4, 255, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (252, N'b0e99381-120a-4c9b-bf55-e4c9f8a60557', 51, 59, 8, 1201, 2, 4, 256, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (253, N'7fb81fcc-fccd-4165-8ed4-594c84d85c29', 34, 50, 11, 1055, 2, 4, 257, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (254, N'bd93f0de-9a3e-43a3-b1bb-123bbce409d2', 34, 52, 8, 1794, 2, 4, 258, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (255, N'925d2dd4-bada-4f43-b5cf-c06beeb9d238', 44, 62, 5, 1441, 2, 4, 259, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (256, N'b8aae1c1-47c1-479b-a576-f7120a0dafd2', 55, 48, 8, 1191, 2, 4, 260, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (257, N'e2da640d-40b8-4a72-97dc-3e63d08efb72', 53, 57, 9, 1662, 2, 4, 261, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (258, N'3e599faa-0008-4aea-a95b-615e67bbc9bd', 50, 59, 2, 1161, 2, 4, 262, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (259, N'0d79a46d-6418-4626-896c-b66985343e81', 47, 52, 6, 1883, 2, 4, 263, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (260, N'1d50324b-5134-4357-9d7e-bfca248a5ef3', 35, 59, 8, 1180, 2, 4, 264, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (261, N'7c4d6318-c31d-439a-8b86-b2b725a9be32', 19, 53, 3, 1960, 2, 4, 265, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (262, N'da3dccf8-e9c9-4047-9d17-4a4f592e1544', 35, 58, 2, 1753, 2, 4, 266, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (263, N'e84512e9-38a7-439c-846b-ae75f586645b', 41, 62, 10, 1037, 2, 4, 267, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (264, N'712c7828-f22e-4676-8843-c3d9835d6d21', 60, 60, 12, 1836, 2, 4, 268, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (265, N'b69669f8-ce58-4b3a-9eb2-b746ac014a84', 27, 53, 8, 1676, 2, 4, 269, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (266, N'ef57ace0-8f34-411e-a489-6bee28743885', 44, 55, 2, 1170, 2, 4, 270, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (267, N'de05706f-4add-41c8-b41f-0a207551b1f7', 55, 59, 3, 1651, 2, 4, 271, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (268, N'3f8ff354-4868-47f7-96b6-49686534afa9', 30, 54, 2, 1712, 2, 4, 272, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (269, N'53db31d1-eb84-48c0-b60c-ab61d8292a9b', 46, 62, 7, 1838, 2, 4, 273, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (270, N'442c93cd-ca5b-4327-aa3c-cf2e4f8ad92d', 36, 57, 7, 1595, 2, 4, 274, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (271, N'967515e5-1cf0-419a-b6be-50b106ffb3ca', 47, 60, 8, 1992, 2, 4, 275, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (272, N'3f55363a-4054-4aac-a6f7-05d3634f5247', 50, 64, 2, 1511, 2, 4, 276, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (273, N'd27a0d42-e7de-4d84-82a7-db1aa380081a', 40, 62, 11, 1011, 2, 4, 277, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (274, N'3789d1d3-7703-48b1-a0ac-85636a7c33f7', 48, 56, 7, 1682, 2, 4, 278, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (275, N'ead3149c-8837-4185-95ce-c053b4fead65', 27, 56, 3, 1045, 2, 4, 279, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (276, N'f5e9ca90-fcac-4b16-8f69-cfeff5f1a870', 22, 56, 5, 1587, 2, 4, 280, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (277, N'9b4dc2f3-4cdc-48f5-b4df-0123e4115e05', 36, 52, 6, 1424, 2, 4, 281, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (278, N'b6ac0e94-6cdc-46a3-875a-f9a22f82b690', 44, 55, 8, 1404, 2, 4, 282, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (279, N'f2f2c279-ab81-415b-b4d5-9657397c084b', 51, 56, 8, 1980, 2, 4, 283, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (280, N'3c36632d-3768-4474-9c41-5a62e8312e50', 47, 56, 3, 1818, 2, 4, 284, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (281, N'85064be3-9309-41b7-adff-aa492976c5b5', 24, 63, 5, 1412, 2, 4, 285, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (282, N'468aa6f6-39a1-4357-9d55-e01880f4a8c1', 46, 53, 10, 1084, 2, 4, 286, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (283, N'5b5eb88e-c033-434d-8dc4-0fc214402874', 24, 56, 5, 1446, 2, 4, 287, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (284, N'a4f46510-94b6-41dc-915f-376b1888a9c4', 62, 52, 12, 1913, 2, 4, 288, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (285, N'40ab959c-c039-49d5-8944-b86316ed624e', 28, 53, 9, 1447, 2, 4, 289, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (286, N'e1183ba3-b46c-4b80-9e5d-cbb54df5b362', 32, 52, 8, 1751, 2, 4, 290, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (287, N'457878db-2aca-41d4-b8ca-35c4cb57d4e5', 39, 53, 11, 1281, 2, 4, 291, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (288, N'5cacb8ff-5f95-4f06-85ea-b7cc6b86161c', 33, 53, 6, 1059, 2, 4, 292, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (289, N'e225acb6-e248-40af-9257-f490e7928871', 33, 51, 3, 1569, 2, 4, 293, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (290, N'5b01fc0e-1625-4992-a614-1228d2127514', 40, 49, 11, 1145, 2, 4, 294, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (291, N'3afbd087-5dec-4018-8e60-54224cbaa189', 35, 57, 4, 1125, 2, 4, 295, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (292, N'bb3c9886-d0a1-46d1-8add-b4cd274fc7c3', 44, 60, 10, 1438, 2, 4, 296, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (293, N'ae36452c-42fc-4175-b448-5df247b7c68a', 29, 53, 4, 1930, 2, 4, 297, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (294, N'0bfcad4c-f953-40b5-bd72-745c20cf1fff', 60, 62, 11, 1663, 2, 4, 298, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (295, N'232ed410-4c82-4fad-8a88-a0061ef71ff9', 64, 50, 6, 1445, 2, 4, 299, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (296, N'b09adaa0-5184-46bb-8c01-4b6f137eef9d', 51, 53, 9, 1142, 2, 4, 300, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (297, N'440233c5-eabf-4a06-af13-b90f106f85b4', 33, 53, 2, 1524, 2, 4, 301, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (298, N'08cf02c3-0aab-4059-ae36-9aa8b47ba7fd', 41, 52, 8, 1824, 2, 4, 302, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (299, N'c675376d-1cb7-4a38-8df7-2bb170e2f9d1', 38, 55, 7, 1919, 2, 4, 303, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (300, N'3e5a9508-2cca-44a2-9fb0-78acb0adef15', 57, 53, 12, 1014, 2, 4, 304, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (301, N'6fb5f576-ae13-4e6b-912a-cde9c2694b80', 57, 52, 12, 1223, 2, 4, 305, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (302, N'e392adc0-8d5b-4973-9452-a145fa5c2b12', 41, 55, 4, 1027, 2, 4, 306, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (303, N'63dbc56c-5a21-4842-8d26-a06e19179ae5', 26, 64, 9, 1900, 2, 4, 307, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (304, N'b23fa16d-b261-4a0f-bc91-cd2ba79c9609', 30, 52, 3, 1334, 2, 4, 308, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (305, N'ce424495-ec65-4e63-83ba-34a4b4cacad5', 43, 54, 10, 1955, 2, 4, 309, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (306, N'93016212-d24d-4184-aeac-293e4deaf88e', 51, 58, 4, 1774, 2, 4, 310, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (307, N'ec41bcdb-0f68-43d7-8e42-bdd4fe7f96f1', 53, 57, 11, 1089, 2, 4, 311, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (308, N'452005db-544f-48be-a9da-13a1a926e216', 38, 51, 12, 1060, 2, 4, 312, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (309, N'de74384d-6084-4e12-bb5c-b243b85aa7fe', 32, 49, 6, 1447, 2, 4, 313, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (310, N'aa464c07-739a-4a95-9a2b-33cf7fcc0596', 58, 55, 6, 1744, 2, 4, 314, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (311, N'3d570a0e-9728-45f4-b389-2d3696ad272a', 74, 73, 9, 2426, 3, 4, 315, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (312, N'15814b94-cebf-46b5-a003-bccff5b2e72b', 58, 74, 7, 2482, 3, 4, 316, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (313, N'baee1128-29f7-45fd-a693-a86dab417247', 57, 60, 13, 2989, 3, 4, 317, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (314, N'b9165858-9efe-4072-bad2-02f6231442ef', 64, 74, 7, 2669, 3, 4, 318, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (315, N'b9963dd8-6003-4f70-8263-06099b8b5a72', 76, 64, 14, 2459, 3, 4, 319, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (316, N'b840f178-7f5a-4d77-b028-b379d440c3b1', 43, 58, 11, 2407, 3, 4, 320, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (317, N'74668c2f-deec-4ffd-91f6-e3d90d8de872', 56, 73, 12, 2947, 3, 4, 321, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (318, N'707598d0-9229-428f-84e1-6af36dcd7b33', 48, 66, 8, 2189, 3, 4, 322, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (319, N'70e676ff-46ed-4c02-870c-e5ee54256f4e', 48, 65, 9, 2905, 3, 4, 323, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (320, N'30fb9544-2e38-494b-ac21-255f99e4beef', 34, 67, 5, 2677, 3, 4, 324, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (321, N'8e11aeda-9a56-430f-abe6-0a5ceffed109', 60, 69, 9, 2494, 3, 4, 325, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (322, N'ef789a28-e995-4bde-9656-0681e09b7cef', 55, 68, 4, 2936, 3, 4, 326, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (323, N'd136a5c8-dfae-49b4-84f0-80ba36e6cf45', 34, 68, 5, 2200, 3, 4, 327, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (324, N'65f3b495-f752-4fff-bc17-037190aeb469', 42, 69, 6, 2003, 3, 4, 328, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (325, N'40a3161a-4eff-42c3-84d3-ebefa78cf74c', 34, 72, 7, 2476, 3, 4, 329, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (326, N'2ae28354-77f4-4ffa-8d27-de084db0d874', 27, 70, 10, 2618, 3, 4, 330, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (327, N'5e8cebea-6217-479b-9b51-dc996e727029', 34, 64, 10, 2007, 3, 4, 331, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (328, N'e29f1141-5761-4e0f-bdab-0910e8c879f7', 29, 73, 8, 2883, 3, 4, 332, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (329, N'78aa0a2f-53f2-4de3-b35d-8b8d07e15583', 56, 71, 13, 2486, 3, 4, 333, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (330, N'85399112-b96e-4070-a989-b26d9c2bca35', 65, 67, 14, 2736, 3, 4, 334, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (331, N'5f4e42d9-1995-40f3-85fe-baf4c3adddf2', 66, 59, 14, 2287, 3, 4, 335, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (332, N'016d6a9f-19fd-489f-9c68-1ffbe3beaeb9', 42, 67, 14, 2960, 3, 4, 336, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (333, N'6d573353-d082-4dee-8e7e-d5547122ecfd', 43, 73, 8, 2964, 3, 4, 337, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (334, N'40823083-d0c2-46f5-83a6-1f92198a3b3f', 63, 69, 13, 2145, 3, 4, 338, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (335, N'3c4d9497-fc10-4020-bd99-39d55ae0f2cd', 67, 66, 10, 2802, 3, 4, 339, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (336, N'6a7528a1-b8a4-49bb-aa05-541f60edf0a9', 31, 63, 4, 2839, 3, 4, 340, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (337, N'32c7d260-71c1-42a5-bbb1-1d3d10315eb3', 64, 63, 5, 2623, 3, 4, 341, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (338, N'408efa64-c611-4a1d-83af-11fb897c9fc5', 64, 75, 8, 2244, 3, 4, 342, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (339, N'8d6b6c9e-cdf4-4de4-8a6f-cc7c5d0ddee5', 41, 61, 7, 2423, 3, 4, 343, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (340, N'3d8c28c6-cb8c-4f78-bde8-aea0d0300295', 59, 61, 9, 2271, 3, 4, 344, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (341, N'5dbc2b2a-977f-4f67-b757-dd51cfe303f2', 67, 71, 8, 2226, 3, 4, 345, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (342, N'323387cc-1f39-490d-a92c-0c31b5c8e6a1', 58, 58, 4, 2815, 3, 4, 346, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (343, N'02a7f6f3-ccb4-43b4-b43d-c39b7dc89a22', 43, 70, 8, 2699, 3, 4, 347, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (344, N'4a3628f5-79eb-4585-af44-e1cf4a7cdaf3', 63, 66, 14, 2016, 3, 4, 348, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (345, N'5e9c45e3-2c5b-4bb0-a27f-d0ecca385087', 36, 76, 4, 2421, 3, 4, 349, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (346, N'7133e7d7-4589-446a-8004-fcf40976f3cd', 47, 67, 13, 2452, 3, 4, 350, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (347, N'c05816e8-a98f-45e9-9fef-8833ef1e1d31', 54, 65, 5, 2343, 3, 4, 351, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (348, N'5de524f1-cd52-41f5-8a50-3977be6e2225', 56, 64, 7, 2888, 3, 4, 352, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (349, N'30401edc-22b6-428e-8bb3-478a192ab584', 34, 56, 5, 2942, 3, 4, 353, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (350, N'b7308e6d-3881-4172-b704-1b4c7dc1b1e3', 74, 66, 4, 2662, 3, 4, 354, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (351, N'aa8bfa4d-e555-4b84-9a5f-4d7e4b6769fe', 59, 75, 10, 2389, 3, 4, 355, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (352, N'71595a35-829c-482d-8bb5-0bb5382d8fa0', 41, 66, 13, 2714, 3, 4, 356, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (353, N'86e4abf0-d8ce-4714-94b3-badb84990d77', 53, 69, 11, 2907, 3, 4, 357, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (354, N'b2018fb5-b815-48a7-af3c-b0be7b4071e6', 64, 74, 6, 2226, 3, 4, 358, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (355, N'10692aa9-99a9-44c8-907e-d2b9fe734f42', 50, 62, 14, 2049, 3, 4, 359, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (356, N'b0217d3f-53e3-4066-b576-95e1f686986c', 47, 56, 12, 2883, 3, 4, 360, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (357, N'c31362c8-7081-4c67-9d1d-e8291d9cb493', 33, 61, 5, 2381, 3, 4, 361, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (358, N'98d74111-7945-40ce-9e32-06bac7c8af73', 46, 60, 9, 2179, 3, 4, 362, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (359, N'5b6f233a-5310-41a8-94a8-debaa2e72c50', 54, 64, 13, 2713, 3, 4, 363, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (360, N'5467173e-82b2-412f-afad-b0b33717eb93', 41, 69, 11, 2173, 3, 4, 364, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (361, N'0e7e7c44-3fba-460a-bb19-a781df42dc11', 75, 64, 12, 2060, 3, 4, 365, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (362, N'e49f1e98-d77b-40ac-aeed-b7073ea77578', 55, 68, 4, 2373, 3, 4, 366, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (363, N'6752b65d-5f73-46d4-baf2-016d620db9bd', 61, 70, 9, 2556, 3, 4, 367, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (364, N'729da056-d8de-4fd6-bfe6-376ddf37c801', 73, 61, 10, 2777, 3, 4, 368, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (365, N'10ceb2be-c9a3-4816-9959-e6bf3cce716e', 70, 66, 7, 2494, 3, 4, 369, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (366, N'91fbdff7-6281-4586-8ea0-bc79b2f2e8f4', 73, 64, 13, 2557, 3, 4, 370, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (367, N'13947248-0803-4312-ae61-d9bb38954824', 63, 74, 12, 2142, 3, 4, 371, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (368, N'6cd3896c-dab7-44d2-a53e-53ffe52ef92c', 61, 64, 9, 2954, 3, 4, 372, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (369, N'5310a960-4efe-4d9f-8422-45eb65e3214c', 34, 73, 10, 2081, 3, 4, 373, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (370, N'400863f4-47dd-40ff-8a23-0932ea69b1df', 40, 65, 4, 2748, 3, 4, 374, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (371, N'255e6f32-35f1-41e5-8da7-2cfa5f366771', 58, 66, 11, 3877, 4, 4, 375, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (372, N'8075291f-6096-452b-85ee-8a8d81d637b4', 39, 84, 11, 3129, 4, 4, 376, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (373, N'c12ffd4a-5b4d-4634-bca7-9ad73e32f144', 39, 65, 10, 3801, 4, 4, 377, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (374, N'a8f468b9-0cf0-4abd-ac9b-c78df3c984ab', 34, 70, 15, 3938, 4, 4, 378, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (375, N'63223837-9ca6-4929-abeb-fada9b18bf06', 50, 73, 6, 3167, 4, 4, 379, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (376, N'e1102e56-0ec4-444b-ac50-0a05bfe6dc91', 56, 87, 16, 3730, 4, 4, 380, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (377, N'e4f35ef5-3f06-4c1f-a5ff-152588f4b562', 82, 67, 12, 3509, 4, 4, 381, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (378, N'9dcbc4ed-b5f9-496f-be9c-f209f9d5ffbc', 66, 87, 13, 3369, 4, 4, 382, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (379, N'015dc4e6-02ba-4596-bcd0-172665598c17', 80, 82, 13, 3414, 4, 4, 383, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (380, N'f74e4ee6-28ca-4778-8475-2c0a1b9369ae', 58, 76, 9, 3009, 4, 4, 384, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (381, N'480d7a09-5890-46c1-86d2-9b78b84130f6', 58, 66, 15, 3355, 4, 4, 385, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (382, N'4dc1baed-7458-4851-9f1c-32d80bbeb420', 41, 71, 9, 3297, 4, 4, 386, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (383, N'997d67a2-1dd8-4518-9fff-f36c1f4ce153', 79, 64, 10, 3591, 4, 4, 387, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (384, N'b4f1366c-d8e8-4fdc-944d-42413399f9ef', 86, 76, 7, 3078, 4, 4, 388, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (385, N'cb379e03-44ca-4e50-8b87-45743fd53fe2', 46, 84, 9, 3258, 4, 4, 389, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (386, N'65fc17fd-35e1-40ac-a384-42735659d44e', 69, 86, 11, 3702, 4, 4, 390, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (387, N'442417b1-a043-45ca-953d-b48d25a7177f', 73, 80, 14, 3312, 4, 4, 391, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (388, N'89c202ed-9027-4332-b66a-89b5b398ecb1', 34, 65, 13, 3542, 4, 4, 392, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (389, N'f03990c0-b455-471c-b17c-e87d8e9f5b88', 67, 80, 11, 3855, 4, 4, 393, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (390, N'e0d69714-6ab7-4a96-b629-6fe899ae3226', 80, 74, 8, 3357, 4, 4, 394, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (391, N'245733b2-7642-48ec-a4a1-03e8df03e7e3', 79, 93, 14, 4619, 5, 4, 395, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (392, N'ae416214-221f-48d8-8ec1-26b9ef747f8d', 82, 73, 15, 4504, 5, 4, 396, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (393, N'5b919527-882f-4686-a994-4a745e55c60c', 49, 83, 15, 4463, 5, 4, 397, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (394, N'346c5a96-ee4f-4c7d-8432-2027408b6dae', 96, 97, 8, 4109, 5, 4, 398, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (395, N'65d66e45-bd50-4a1f-881f-359f081ab698', 86, 74, 17, 4861, 5, 4, 399, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (396, N'3c2aeeef-c85d-4d44-bf8d-9fa22a14fd48', 64, 91, 15, 4734, 5, 4, 400, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (397, N'67be1d97-860d-4973-8f2d-f1a2f58e5ef4', 92, 84, 8, 4257, 5, 4, 401, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (398, N'1dbcfb21-2328-4b67-ac62-572f25758c28', 79, 93, 9, 4746, 5, 4, 402, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (399, N'83268cdf-8d25-41bc-91d2-055fe1c7bfc1', 46, 72, 8, 4293, 5, 4, 403, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (400, N'd373c028-7ac0-4a1a-ae09-5109619d875f', 82, 84, 15, 4297, 5, 4, 404, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (401, N'559b2bb5-47c0-4f4f-96f9-d4a2f565010b', 47, 46, 10, 901, 1, 5, 405, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (402, N'363f1965-6cae-412a-bd19-81d0aad58193', 52, 52, 1, 164, 1, 5, 406, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (403, N'56d681a2-1173-41c8-b8e3-a0c13f6d0482', 45, 50, 1, 891, 1, 5, 407, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (404, N'5e89f298-f6d8-4912-b1a3-827024d25ea6', 25, 41, 0, 532, 1, 5, 408, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (405, N'dd3e7f1f-a419-42d8-be2f-945408be56d3', 13, 45, 2, 758, 1, 5, 409, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (406, N'245155fc-2f69-449f-8656-90f1e98f3a87', 43, 47, 9, 709, 1, 5, 410, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (407, N'2fc8d329-266e-4243-9812-552f5a5d8ff5', 13, 48, 7, 184, 1, 5, 411, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (408, N'adc1c44c-77f5-4e7b-ad94-2de6feab9e5e', 19, 42, 4, 169, 1, 5, 412, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (409, N'30540088-44df-46f6-b932-f6ac4f3f11e7', 18, 52, 9, 182, 1, 5, 413, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (410, N'a8bb1878-ddfa-45d1-9726-4832aba844f0', 11, 44, 9, 309, 1, 5, 414, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (411, N'da35fcdf-241d-4c09-96a8-b574f9f2c257', 24, 50, 1, 858, 1, 5, 415, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (412, N'532e90ab-9773-457d-86fe-ec420dc94c82', 14, 48, 2, 344, 1, 5, 416, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (413, N'cbabcb2f-ca28-4312-a815-016a5f50b1f3', 27, 44, 3, 76, 1, 5, 417, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (414, N'f04bc918-3a20-4ce9-a5de-81b2d20d637b', 28, 44, 10, 780, 1, 5, 418, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (415, N'ef8b904a-aa61-4039-be76-f38438b2b6c2', 47, 50, 1, 0, 1, 5, 419, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (416, N'2b3240a9-ae43-44b1-9b43-57a2008fd1b1', 31, 57, 2, 1794, 2, 5, 420, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (417, N'2abcf65c-a4cd-4d39-bbcf-5c2fb1b1d792', 60, 56, 7, 1356, 2, 5, 421, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (418, N'ea526bac-aef7-4edc-8d70-012d36c13e39', 52, 57, 12, 1302, 2, 5, 422, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (419, N'd643ce64-6372-44c6-a197-fdb00c8d6c01', 24, 53, 8, 1501, 2, 5, 423, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (420, N'99993a53-ac28-4aea-b110-6710a533e6aa', 31, 58, 11, 1461, 2, 5, 424, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (421, N'5aa41026-b290-4544-8c70-4d7fc26a3ce5', 56, 54, 5, 1265, 2, 5, 425, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (422, N'7762e61a-2ffb-4980-a1d6-665401414201', 33, 51, 12, 1861, 2, 5, 426, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (423, N'9c3ab7a1-2cfd-4ef0-95f8-bc92bd0e4c3e', 28, 57, 3, 1311, 2, 5, 427, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (424, N'48c20b8d-e73d-437a-b988-ff4433827d79', 30, 56, 4, 1158, 2, 5, 428, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (425, N'b64ba188-97d5-4650-a8e8-1ad7bd98fa79', 28, 61, 7, 1093, 2, 5, 429, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (426, N'd5b74d4a-f628-430e-bffb-d143d2c1e6c8', 47, 58, 3, 1691, 2, 5, 430, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (427, N'd8e9e063-278b-48f0-be69-8b7061c6c24d', 18, 50, 11, 1565, 2, 5, 431, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (428, N'27c7e7db-e39f-47db-ab15-768c91db8d77', 33, 53, 6, 1691, 2, 5, 432, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (429, N'c8c87bb1-cf53-49c1-b6e4-3a22473b75c5', 51, 50, 10, 1401, 2, 5, 433, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (430, N'f236e3ba-7b69-498c-8250-36a279fd4e3b', 21, 63, 3, 1699, 2, 5, 434, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (431, N'd19586aa-3d90-45dc-8a78-73aeae5af174', 25, 61, 5, 1104, 2, 5, 435, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (432, N'd29b442d-ac8e-45dd-bb2f-0e073bf5f572', 54, 57, 2, 1368, 2, 5, 436, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (433, N'538c368e-88c2-4632-9fef-21bf9996a5b3', 57, 50, 5, 1131, 2, 5, 437, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (434, N'3ec538b4-edb0-4603-a7ee-917a9529f8c5', 48, 56, 4, 1835, 2, 5, 438, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (435, N'6214c1a6-e9d6-4d7d-8702-33fc99ed452e', 54, 57, 7, 1750, 2, 5, 439, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (436, N'83da5261-c018-455c-be45-c3bf7ee527c5', 44, 56, 2, 1081, 2, 5, 440, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (437, N'7982a7a4-a59e-4cb5-a625-915c454def84', 39, 57, 4, 1658, 2, 5, 441, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (438, N'bb9508bb-6ac7-4172-b427-67cd1713a4bd', 22, 52, 7, 1547, 2, 5, 442, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (439, N'6d39a699-fffe-4f7e-b264-46bce4ba7aa9', 23, 63, 11, 1980, 2, 5, 443, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (440, N'dbc8e77c-8709-4ebe-9883-6e890295c593', 49, 64, 4, 1530, 2, 5, 444, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (441, N'afdb3119-d0fa-4e4d-a409-c9295b397ebd', 56, 59, 8, 1569, 2, 5, 445, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (442, N'd2fa4411-d5c4-40f2-a9f0-9303c684d711', 32, 61, 4, 1512, 2, 5, 446, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (443, N'f6b09a31-0809-421b-acaa-60d2f92f9020', 32, 51, 12, 1881, 2, 5, 447, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (444, N'ba3b5f30-f659-450c-8035-a39aefbcb952', 42, 58, 2, 1121, 2, 5, 448, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (445, N'050003d5-dde1-4c17-813e-baf8e79bb680', 59, 56, 2, 1349, 2, 5, 449, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (446, N'aa872959-8d06-4d1b-add1-e62b001e2655', 63, 53, 3, 1343, 2, 5, 450, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (447, N'daf8a56b-8190-43d9-a624-28f8147a08c9', 40, 55, 10, 1411, 2, 5, 451, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (448, N'593c1cb5-c3e1-4e72-b79a-0b22ea89b6a5', 45, 64, 2, 1190, 2, 5, 452, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (449, N'0a06ac28-df38-416a-b41e-f4047343942e', 60, 62, 12, 1620, 2, 5, 453, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (450, N'69e1dd90-22eb-4cb1-82cb-6991530ad963', 51, 52, 8, 1716, 2, 5, 454, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (451, N'4ef5f002-77db-4c0b-80ed-d7a7baa56a30', 62, 53, 12, 1576, 2, 5, 455, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (452, N'0322abd6-801d-4048-9766-4a5f2c5411c1', 36, 60, 3, 1288, 2, 5, 456, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (453, N'6e9d5370-1292-42f9-9141-f689ecf61267', 53, 52, 8, 1433, 2, 5, 457, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (454, N'040a4254-1ede-47c4-82a3-a47039d67ff4', 32, 52, 4, 1424, 2, 5, 458, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (455, N'fad615b2-3501-4504-9fba-de0092c3447d', 60, 58, 3, 1102, 2, 5, 459, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (456, N'889576b7-22c4-4323-bc7a-2bd0a683b0f8', 40, 76, 8, 2363, 3, 5, 460, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (457, N'b749f2a0-c5a7-4114-9be7-886ef8d44c11', 68, 71, 6, 2840, 3, 5, 461, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (458, N'756b37a6-a7b6-4318-98a5-e25797281104', 40, 68, 6, 2727, 3, 5, 462, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (459, N'becb8a30-33fd-4999-9ad0-f257e91e0390', 38, 60, 9, 2250, 3, 5, 463, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (460, N'91f8b684-7c1b-4760-9f22-fbe4a020224b', 69, 65, 13, 2289, 3, 5, 464, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (461, N'077a01c8-d4b1-4ffe-a0fe-7bc3d75cf3ac', 33, 65, 7, 2105, 3, 5, 465, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (462, N'65b9cceb-4fdd-4773-87aa-8978d66c8a85', 59, 67, 5, 2973, 3, 5, 466, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (463, N'bee9d214-a7de-44da-9004-760541166b0e', 73, 58, 9, 2785, 3, 5, 467, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (464, N'8bc94b61-06f5-4fd0-ad14-61f6058533fd', 35, 73, 9, 2031, 3, 5, 468, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (465, N'2cf4e222-a9f0-4100-906c-5a905fdf8126', 40, 71, 7, 2821, 3, 5, 469, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (466, N'26a2527b-be0c-4658-8811-a56ff80b2dc9', 60, 71, 6, 2550, 3, 5, 470, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (467, N'c696d1b0-f5bd-4b6e-93f1-d61cfe0502ad', 68, 75, 12, 2069, 3, 5, 471, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (468, N'dae1322a-6b92-419f-9943-ae65d74ada9d', 40, 61, 10, 2672, 3, 5, 472, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (469, N'aff85fb6-407f-4ebb-af74-e5b6edddd165', 47, 65, 14, 2636, 3, 5, 473, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (470, N'918f9220-fb1e-4c83-91be-2f3057320d62', 50, 69, 10, 2615, 3, 5, 474, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (471, N'29d7a6dc-677e-4a12-b7d6-1c1cb7fe7780', 66, 66, 12, 2982, 3, 5, 475, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (472, N'8e4f0a67-adbe-4604-bbc8-74ca8eb53224', 44, 64, 11, 2303, 3, 5, 476, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (473, N'68f184ef-aa5d-4c4d-8030-b55205a003e3', 40, 68, 13, 2703, 3, 5, 477, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (474, N'c7454363-2707-477e-9638-7555691c99eb', 65, 76, 8, 2317, 3, 5, 478, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (475, N'eaa916e2-7847-4a86-9c1c-8be2a4862baf', 42, 68, 4, 2794, 3, 5, 479, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (476, N'aec17a8a-1366-489f-a07f-c07d60f6d478', 30, 67, 9, 2700, 3, 5, 480, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (477, N'46dfb620-e891-436e-a2e2-87ba9d8add2d', 29, 67, 10, 2843, 3, 5, 481, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (478, N'8db9c398-0c5a-43a4-a97c-e6db38566c67', 41, 72, 9, 2309, 3, 5, 482, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (479, N'2859c3c7-4245-43f7-bed6-14797544b4bb', 48, 69, 12, 2580, 3, 5, 483, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (480, N'5496d543-9f38-42cb-81d4-90fa6df6d1bd', 43, 70, 10, 2839, 3, 5, 484, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (481, N'91b6ba69-c412-44bb-a015-5a945821df3c', 47, 68, 11, 2379, 3, 5, 485, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (482, N'c30e3aef-6fef-48ef-a6b1-bd0c979b58dc', 39, 71, 10, 2573, 3, 5, 486, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (483, N'406384d3-5f18-4296-bf55-d09b4d71b755', 65, 62, 14, 2757, 3, 5, 487, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (484, N'340044bb-170b-4e5c-af5b-f557544213bc', 59, 67, 5, 2212, 3, 5, 488, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (485, N'29cffd0c-4f17-4fb8-80fb-92f3cd2996ef', 75, 61, 11, 2534, 3, 5, 489, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (486, N'0293ef0b-dbcf-4136-a0fe-1cbaf3c82627', 72, 64, 11, 3117, 4, 5, 490, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (487, N'5e2f0229-a309-4876-8c41-e71efcbaa0b1', 36, 79, 7, 3089, 4, 5, 491, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (488, N'2c9330a8-6d3d-48d0-8f75-a19df3c82a5b', 70, 88, 11, 3199, 4, 5, 492, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (489, N'27739703-0bde-4892-8c5c-a39466fbb10d', 76, 68, 11, 3064, 4, 5, 493, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (490, N'ec7f5c55-9348-42b1-aa80-71d6c6a82e52', 51, 72, 16, 3005, 4, 5, 494, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (491, N'41c6c120-d884-4992-bd0e-ef52a4e52a3a', 37, 84, 9, 3700, 4, 5, 495, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (492, N'683a2fd7-99e4-435c-ba93-170a838bd922', 73, 64, 9, 3679, 4, 5, 496, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (493, N'755f0980-3e1e-4399-b9e2-570c6aa22a76', 75, 72, 11, 3902, 4, 5, 497, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (494, N'8e951fdf-b5d0-4409-ba7c-dc9e337a47c2', 88, 67, 13, 3584, 4, 5, 498, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (495, N'e5556976-beef-496a-ba7f-c09d4583f172', 86, 70, 11, 3956, 4, 5, 499, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (496, N'df4910f0-8130-41f7-a55f-e8dd191c60a7', 78, 82, 8, 4350, 5, 5, 500, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (497, N'c35715f8-3d75-4bb9-8e35-25631f6da565', 61, 75, 15, 4058, 5, 5, 501, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (498, N'f1a0d22b-5c8b-4a3d-b949-0649e05a6ab8', 85, 79, 15, 4556, 5, 5, 502, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (499, N'19b3189f-8a78-4c54-99b2-e9fb62d0d4a6', 94, 97, 8, 4845, 5, 5, 503, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (500, N'38984599-3bc0-49ed-90c0-4d4ed25def5b', 42, 81, 8, 4970, 5, 5, 504, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (501, N'b5cb15b5-36f4-4b51-bc29-49390f4fcc66', 43, 51, 3, 361, 1, 6, 505, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (502, N'd6e6fb97-78fa-41a5-a6ac-8408f36759a9', 47, 44, 1, 863, 1, 6, 506, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (503, N'98fcd8e5-5e60-444f-8628-5cddbe956f2d', 22, 52, 4, 448, 1, 6, 507, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (504, N'9abc1a52-2b32-45ef-8ac5-33419158ccff', 15, 46, 10, 59, 1, 6, 508, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (505, N'9999288b-a9ec-43c4-bfa7-8231420a1f19', 52, 41, 6, 636, 1, 6, 509, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (506, N'eb0244d0-f5cb-4381-adec-ae613368d398', 46, 51, 10, 988, 1, 6, 510, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (507, N'ec536ad9-6b5b-4e79-a4b4-2719f104fda1', 49, 46, 8, 931, 1, 6, 511, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (508, N'3286777c-5fbd-4f97-8b4c-e67d8d536ee8', 18, 41, 4, 784, 1, 6, 512, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (509, N'da711410-3fa1-4e6d-9623-b8aae4d55f0b', 21, 44, 1, 767, 1, 6, 513, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (510, N'9e6b3a67-f4d1-4834-90ce-310b16227b0c', 45, 50, 1, 880, 1, 6, 514, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (511, N'22080fae-ea50-4b83-95df-182465ae6d41', 39, 49, 7, 305, 1, 6, 515, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (512, N'88bf49cd-e3f3-4589-b3d1-7c8c1b05d841', 27, 44, 8, 274, 1, 6, 516, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (513, N'eeaf17cc-f91a-4a9d-bf5f-dded5b66ee07', 13, 46, 3, 510, 1, 6, 517, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (514, N'93db712e-76d0-4398-8cba-33dc84fc314d', 36, 48, 4, 723, 1, 6, 518, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (515, N'1bb3e875-c822-465f-bbb0-8761cc2fa0ad', 23, 42, 9, 343, 1, 6, 519, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (516, N'5d859750-3d0a-4f34-a66c-0ddca2e43804', 25, 40, 0, 132, 1, 6, 520, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (517, N'39bbbfd7-0a88-4340-9cdb-86e4a8efc92a', 29, 46, 8, 58, 1, 6, 521, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (518, N'b266b73c-e049-40ce-8811-ae3bda2918c5', 23, 40, 6, 30, 1, 6, 522, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (519, N'6c9425e9-2ec3-45c9-a6da-e6f52a5b911f', 33, 41, 9, 18, 1, 6, 523, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (520, N'fab702e0-6c6e-4fe2-843a-148aaec0a980', 43, 51, 3, 537, 1, 6, 524, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (521, N'6d5b5b49-e3ec-4216-9966-51f8b3cb78c6', 18, 42, 3, 395, 1, 6, 525, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (522, N'1004a72a-2a78-4278-b1ea-716e98310713', 40, 44, 10, 448, 1, 6, 526, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (523, N'a43f4233-2f57-4ecf-9468-18392b136093', 28, 46, 2, 902, 1, 6, 527, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (524, N'e02af96c-6dcf-489a-8f9c-4bd5948e888d', 24, 49, 7, 124, 1, 6, 528, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (525, N'e8c82087-7b14-445a-8e92-4b30c2e600fc', 50, 43, 3, 292, 1, 6, 529, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (526, N'e4f11715-2d49-4eb0-986a-e2ce3402ea7c', 36, 41, 10, 271, 1, 6, 530, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (527, N'76380281-1232-4017-813b-80ee00bde6e1', 18, 40, 3, 565, 1, 6, 531, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (528, N'10807351-29b4-46c6-b02a-eb1d0b2ec9ff', 15, 47, 9, 904, 1, 6, 532, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (529, N'78d448ef-908a-45f6-b132-d063f6bf838b', 19, 41, 0, 458, 1, 6, 533, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (530, N'855a3e4d-aa61-42aa-abe4-d5999f1abe6f', 45, 43, 6, 973, 1, 6, 534, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (531, N'dc37cdef-65a4-43ff-bda7-5197f069f596', 43, 57, 7, 1357, 2, 6, 535, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (532, N'628fa9c4-b8a6-4610-a3e6-ecd4c500394c', 28, 55, 2, 1364, 2, 6, 536, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (533, N'd972dbba-143f-4e82-afae-87c6831f3896', 54, 62, 10, 1037, 2, 6, 537, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (534, N'696af66b-fa5b-48d9-bfd5-4c2bf6e5a6b6', 26, 48, 7, 1567, 2, 6, 538, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (535, N'9b315834-5f3d-4e34-964b-60c39a55e455', 53, 54, 6, 1066, 2, 6, 539, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (536, N'95541971-6a86-4e7d-9ca7-6fc13f8818d2', 26, 60, 2, 1105, 2, 6, 540, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (537, N'e3dccb0c-b14b-492c-9828-ba84aea72c41', 27, 54, 10, 1849, 2, 6, 541, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (538, N'd484fd23-36e3-422d-99fb-662138cbc896', 39, 54, 2, 1734, 2, 6, 542, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (539, N'2b51492b-01b8-45fc-be6c-505704fcb785', 59, 60, 8, 1191, 2, 6, 543, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (540, N'64a28b48-139c-43f7-89ce-9fedc3d0ac78', 60, 56, 2, 1447, 2, 6, 544, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (541, N'5861f5ae-6f62-4675-a4b0-d2da4b48284c', 46, 57, 4, 1788, 2, 6, 545, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (542, N'345a700a-b8af-4fa0-ace3-a68ba072e1fa', 35, 53, 5, 1870, 2, 6, 546, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (543, N'9727c4a5-38dc-475c-af8d-a998a3ea57f2', 44, 51, 2, 1499, 2, 6, 547, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (544, N'7fc578fd-b5c7-4319-83ac-169d0e02238a', 30, 57, 4, 1126, 2, 6, 548, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (545, N'11bbf20d-bfe2-4d70-aae0-1714b9af7fbb', 24, 54, 5, 1524, 2, 6, 549, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (546, N'b37d4445-08f9-4eea-a740-cfdc62f9329d', 27, 58, 6, 1057, 2, 6, 550, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (547, N'595be576-722b-49d7-8681-4a15681aa723', 45, 51, 3, 1243, 2, 6, 551, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (548, N'4ccb7630-80b0-4d7c-a0c4-26238ec85bcb', 54, 59, 12, 1601, 2, 6, 552, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (549, N'04252cdc-16bb-406f-8635-554fe263b0d6', 18, 62, 6, 1027, 2, 6, 553, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (550, N'6e03bcb2-0cf4-4b05-ac5c-2679aa4b1f26', 35, 51, 6, 1834, 2, 6, 554, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (551, N'd78f618e-772f-402b-9cd0-8f8471ce22dd', 25, 57, 4, 1062, 2, 6, 555, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (552, N'965e2709-3f55-4831-94f7-eea9c306c204', 22, 48, 5, 1210, 2, 6, 556, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (553, N'4cea379d-050f-4b5b-ad01-4944a96d8f59', 49, 49, 2, 1492, 2, 6, 557, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (554, N'1253cb7e-8a36-4403-b01c-8256107a5c3a', 40, 56, 2, 1344, 2, 6, 558, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (555, N'e740c47c-63b8-4d69-9570-d77a2494e3e2', 21, 56, 10, 1338, 2, 6, 559, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (556, N'e8f5afe0-642b-4a1d-961e-db5142269d6b', 53, 49, 2, 1020, 2, 6, 560, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (557, N'b81f862f-f087-4f70-8dbc-c10c0e7c7a1f', 48, 56, 5, 1944, 2, 6, 561, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (558, N'392635b7-3681-47ff-a5cf-91b093962550', 26, 57, 11, 1882, 2, 6, 562, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (559, N'ece441d7-cd0c-4198-ad8b-6d5d0038d7ca', 63, 48, 4, 1801, 2, 6, 563, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (560, N'f224abd0-a5e1-481d-869d-8072d9f6f6ef', 47, 57, 8, 1964, 2, 6, 564, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (561, N'b4ef304c-bb0c-4258-9084-d685f7c00957', 62, 49, 3, 1160, 2, 6, 565, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (562, N'e8ba6c50-0d25-4c64-8cda-ba53e0b95473', 50, 53, 8, 1595, 2, 6, 566, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (563, N'db40f2dd-f954-463d-8076-080e852e046f', 49, 51, 9, 1381, 2, 6, 567, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (564, N'daa0b26d-1fc9-4f15-8560-60bbd25b8f09', 51, 59, 8, 1933, 2, 6, 568, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (565, N'8019f2c5-e106-40c2-a782-48ada426f6e9', 57, 50, 4, 1791, 2, 6, 569, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (566, N'7deb3575-37d1-4a1f-a8d8-65dd8de7373b', 57, 53, 10, 1454, 2, 6, 570, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (567, N'5b98f194-d4f9-4774-8d90-7cb211073722', 58, 53, 3, 1336, 2, 6, 571, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (568, N'ba9d8f72-fd2e-426a-ac88-5804bf41b4af', 44, 48, 5, 1145, 2, 6, 572, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (569, N'3610336b-d95a-4a9e-b3bc-7b8a9557cbea', 48, 54, 2, 1619, 2, 6, 573, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (570, N'e2871611-3902-4f36-abdb-63b5402faa3e', 50, 55, 6, 1935, 2, 6, 574, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (571, N'c8e07923-96f5-45cb-9167-dcfd37557a06', 22, 53, 5, 1347, 2, 6, 575, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (572, N'f3407b8e-13d6-4959-aad1-0bd48726730a', 30, 62, 10, 1741, 2, 6, 576, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (573, N'976e08d4-9e12-41e9-b3a8-51ad47aa8da5', 41, 52, 9, 1852, 2, 6, 577, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (574, N'5e0f30a4-20b8-434e-bea6-62c7b069e05b', 44, 63, 6, 1982, 2, 6, 578, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (575, N'68a0e308-ad28-499b-a8f4-1858858ee926', 47, 52, 7, 1619, 2, 6, 579, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (576, N'a5dfb21a-5f3a-4dd8-b0ab-6d376b3a5f7f', 64, 55, 12, 1153, 2, 6, 580, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (577, N'79e5a05f-d696-459b-9ec0-feb7b43e2725', 25, 56, 8, 1011, 2, 6, 581, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (578, N'f4b6fb76-7e9b-4336-a78e-efe56ce06437', 23, 52, 4, 1019, 2, 6, 582, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (579, N'03e09529-a010-45c3-86bb-c6db300f8c1e', 59, 56, 3, 1510, 2, 6, 583, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (580, N'ecc15c84-a627-4c70-b4e2-9e835f76eea4', 33, 63, 8, 1829, 2, 6, 584, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (581, N'c603fd4e-78b1-4e94-bdd9-af2cdc38472b', 35, 60, 10, 1733, 2, 6, 585, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (582, N'30238630-8274-44e8-aea9-e70759e8454c', 35, 59, 6, 1757, 2, 6, 586, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (583, N'c53c3e33-7944-4fa1-a6ec-a44b0e07f3b2', 53, 58, 2, 1575, 2, 6, 587, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (584, N'838a87b7-9ae1-4916-a7ed-8c7c430ac456', 43, 51, 9, 1348, 2, 6, 588, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (585, N'638283e6-fb73-411a-a0f2-1bb3067845cc', 44, 59, 10, 1488, 2, 6, 589, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (586, N'6fe9f0e3-dbcf-4e71-bf4b-5ced92d4efc2', 49, 59, 9, 1710, 2, 6, 590, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (587, N'8f79d3c9-f8cb-43a0-b5ba-0e6ae3292f04', 22, 49, 8, 1319, 2, 6, 591, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (588, N'ab59a44a-9b96-44b6-95ee-064bd84ab523', 56, 57, 9, 1792, 2, 6, 592, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (589, N'ad112058-9a9f-48c1-974f-cfd7c74657e3', 35, 52, 3, 1437, 2, 6, 593, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (590, N'37d89267-0372-4218-a1c8-9f1e97b022b3', 49, 56, 7, 1092, 2, 6, 594, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (591, N'086e2fc2-60b1-40c1-9abe-3f272c9d935e', 60, 63, 5, 1182, 2, 6, 595, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (592, N'f80448b1-68aa-44f8-961c-c3bd5c357439', 23, 56, 5, 1664, 2, 6, 596, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (593, N'842eedc2-a399-4170-a112-b4b1ffbb557a', 43, 59, 5, 1973, 2, 6, 597, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (594, N'c16414f3-7b74-4aeb-9bd4-2da9d5e67ad7', 54, 56, 9, 1900, 2, 6, 598, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (595, N'fd945c86-116c-4717-b94b-62f4719e4498', 60, 57, 4, 1465, 2, 6, 599, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (596, N'bdf51a05-2429-4260-9bda-af6baec71025', 58, 52, 4, 1939, 2, 6, 600, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (597, N'271acd58-9d7c-4274-9cf8-1aa7c9deb710', 20, 63, 5, 1700, 2, 6, 601, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (598, N'15bd2b49-bc31-4d76-8827-cc95bbbad422', 25, 54, 4, 1539, 2, 6, 602, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (599, N'39616182-961e-47a0-bada-7a2d2d2d5c76', 49, 57, 6, 1568, 2, 6, 603, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (600, N'4744201a-2b66-4e56-a555-b33269caf5e2', 41, 50, 5, 1772, 2, 6, 604, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (601, N'7833079f-4b85-440d-91d5-66969d224255', 46, 53, 12, 1373, 2, 6, 605, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (602, N'a6cd7895-8c1f-4eee-9a4f-3d8adf1a7044', 21, 50, 6, 1456, 2, 6, 606, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (603, N'31f91856-eeef-4329-9f60-db9c351f01a8', 18, 53, 12, 1272, 2, 6, 607, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (604, N'a3d0e49e-6ef6-4c6f-b7b6-a42169ab85f7', 30, 64, 4, 1560, 2, 6, 608, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (605, N'42dfa6dd-1fbb-4b4b-a7ff-67ae747f99ad', 22, 58, 10, 1476, 2, 6, 609, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (606, N'b3fc61c4-8af0-445b-9c75-675cb80eb9e2', 63, 54, 10, 1638, 2, 6, 610, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (607, N'bdae2d58-3ed1-4de9-8d2b-95d1db092902', 33, 54, 11, 1685, 2, 6, 611, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (608, N'042fff89-07b8-4f04-8899-4404c165a7b0', 18, 49, 5, 1177, 2, 6, 612, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (609, N'edad8e40-17f9-4611-a13a-2e51b19e6e30', 53, 59, 9, 1420, 2, 6, 613, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (610, N'2c7f6ab2-fc8c-4612-ba11-7911d156b284', 26, 53, 8, 1053, 2, 6, 614, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (611, N'148d3cc3-5c30-441b-80c2-fa8d9cf6446b', 50, 65, 11, 2959, 3, 6, 615, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (612, N'3c58ae39-96da-476d-a634-c89a4dd2e7a3', 43, 65, 12, 2486, 3, 6, 616, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (613, N'689cd1b5-09d5-4497-a8d8-27694583c344', 66, 62, 13, 2723, 3, 6, 617, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (614, N'8bc88de9-266f-47ac-8113-1c910d7c235b', 42, 64, 8, 2213, 3, 6, 618, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (615, N'73c9c0c9-3fcd-4405-a11c-03a62d65f206', 65, 64, 8, 2992, 3, 6, 619, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (616, N'c6b63451-a245-4a43-a9d0-eceeabc1b884', 33, 67, 9, 2703, 3, 6, 620, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (617, N'4d3aa57b-4e4f-4bb4-8333-bea7eba0f66e', 50, 66, 10, 2248, 3, 6, 621, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (618, N'1d701f9a-263f-47f1-9bba-4ddca23d87aa', 54, 66, 6, 2120, 3, 6, 622, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (619, N'e165a7d3-5b40-4fc1-8380-7276dabc519a', 45, 59, 6, 2757, 3, 6, 623, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (620, N'f5350311-bf43-4e0c-a3f5-719db6a97f9b', 26, 59, 11, 2213, 3, 6, 624, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (621, N'8ce181dd-1371-483a-9b1d-93777d0cfff8', 66, 70, 9, 2744, 3, 6, 625, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (622, N'd7b555f3-d539-4c1a-8596-a36834824b8d', 30, 58, 10, 2610, 3, 6, 626, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (623, N'03d2d6eb-0417-41e5-9d48-0008103a36ec', 50, 71, 12, 2438, 3, 6, 627, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (624, N'18ceda65-8c72-4308-81f2-5b753c12bc23', 44, 70, 4, 2790, 3, 6, 628, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (625, N'fd2909cf-7185-404b-b2fd-c26712d126b8', 26, 70, 14, 2168, 3, 6, 629, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (626, N'8e73eeb5-854c-4652-af8f-fd2be7e740ce', 53, 71, 10, 2512, 3, 6, 630, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (627, N'e080f610-8297-4291-9f78-e4dfd526e326', 57, 61, 12, 2627, 3, 6, 631, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (628, N'0a0f434a-c80f-4976-b1b6-0e1d1b13b4e3', 41, 74, 7, 2143, 3, 6, 632, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (629, N'a5aa9b39-51f5-4b6e-b882-ad28b16f6ab5', 58, 60, 7, 2865, 3, 6, 633, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (630, N'8d161b99-d505-4d60-9167-ba8d2b27bfe5', 56, 72, 4, 2451, 3, 6, 634, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (631, N'23d6a16d-afe1-432b-8095-2f11d66bf0b9', 58, 67, 5, 2468, 3, 6, 635, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (632, N'5d53b437-5645-4e0c-8420-5a8eda45bdbb', 46, 66, 6, 2931, 3, 6, 636, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (633, N'2d6ae59f-7cfd-46a8-a89b-8fd2cb0e9f58', 57, 62, 6, 2051, 3, 6, 637, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (634, N'524fddf7-142e-431d-9191-81dab41dedf0', 51, 64, 4, 2708, 3, 6, 638, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (635, N'e831dcd0-1bd5-4754-9477-b034b0639cab', 58, 59, 9, 2203, 3, 6, 639, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (636, N'1eedaa8c-d4ce-49c6-95f8-3ed68b1ab5a3', 64, 73, 12, 2870, 3, 6, 640, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (637, N'd0d57223-ea9c-41c1-adff-29a4856c73df', 51, 65, 5, 2226, 3, 6, 641, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (638, N'2e4bccdc-eb50-4e42-8755-0dd1433f6846', 35, 66, 12, 2073, 3, 6, 642, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (639, N'609ef9dc-4aa2-4fe1-a5be-ecbbc68ba5b4', 49, 66, 5, 2772, 3, 6, 643, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (640, N'6c710b5a-a537-460e-9e97-8bda293ebccc', 60, 76, 10, 2467, 3, 6, 644, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (641, N'f605d1f4-f459-465e-ac8a-b4b787b78c8a', 54, 76, 8, 2355, 3, 6, 645, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (642, N'99c33795-e4f9-499c-a29f-c1f8fb4cdb95', 65, 66, 9, 2506, 3, 6, 646, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (643, N'd1b7865a-0c68-4075-9dd1-4228c3d304f1', 56, 63, 4, 2779, 3, 6, 647, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (644, N'2e56a5fb-c04e-46fb-ae9a-392df8ba5d7d', 40, 63, 6, 2851, 3, 6, 648, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (645, N'10e4b313-08f8-47a9-9a85-d21975cc4e3b', 50, 66, 13, 2963, 3, 6, 649, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (646, N'f81dbf18-d3d3-4899-b6b8-61b76e53374c', 35, 75, 5, 2119, 3, 6, 650, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (647, N'c9f4b948-4d0d-4c39-a878-dd4d8310f06d', 31, 64, 12, 2623, 3, 6, 651, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (648, N'b2f7a647-6ec6-418b-ba46-7b0386b16cc7', 68, 65, 11, 2824, 3, 6, 652, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (649, N'd1987ba8-6c81-46c6-af9b-29c36492beaa', 44, 72, 7, 2446, 3, 6, 653, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (650, N'd5c4169c-44c7-4d70-be54-2dca272074dd', 29, 66, 10, 2480, 3, 6, 654, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (651, N'b0a272d7-6ada-4054-aa33-27b8d4da5b79', 40, 64, 9, 2855, 3, 6, 655, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (652, N'0cf22a3c-6a32-4fa3-81f9-fc56490cb47f', 59, 75, 7, 2508, 3, 6, 656, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (653, N'ce9da0e3-a11a-4baa-96ea-a62bc48b3a03', 53, 58, 10, 2883, 3, 6, 657, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (654, N'177eeb84-95e5-48e5-942e-e94e25146344', 59, 65, 6, 2450, 3, 6, 658, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (655, N'f2b6196f-7199-42b3-b12b-506df045a964', 36, 67, 10, 2655, 3, 6, 659, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (656, N'ef16c3f6-dddb-49f4-b72f-3b8263d69192', 47, 76, 4, 2079, 3, 6, 660, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (657, N'8743c251-3f06-48d6-af14-be6256ca2e25', 46, 62, 12, 2626, 3, 6, 661, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (658, N'a9bc83bf-ef21-4a11-8510-f7013550f145', 38, 73, 10, 2109, 3, 6, 662, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (659, N'd3948e46-cf61-4b23-850f-50bde327c466', 31, 66, 13, 2643, 3, 6, 663, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (660, N'c3cf99b2-b25c-48d0-906c-d2bbc87c5584', 69, 68, 5, 2003, 3, 6, 664, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (661, N'cef7db2b-58dd-469d-b5c1-f187ddc1b6b0', 63, 62, 9, 2425, 3, 6, 665, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (662, N'62296675-0d7f-49cc-9031-e30f1e16dfc7', 32, 73, 8, 2774, 3, 6, 666, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (663, N'c1d43f2f-e2cd-4eee-96ba-5e269fca3cba', 44, 74, 6, 2298, 3, 6, 667, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (664, N'4f58ad2a-bf7f-47fb-b8eb-d7e27fe58c70', 67, 57, 5, 2124, 3, 6, 668, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (665, N'843ea99e-c2de-4944-a9bd-3cf966a3e8aa', 59, 70, 14, 2434, 3, 6, 669, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (666, N'bae941b2-06a8-42d9-bd7a-1f5a979bfb28', 53, 67, 12, 2245, 3, 6, 670, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (667, N'83236918-8acd-469f-beb9-fac645e68065', 44, 66, 8, 2070, 3, 6, 671, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (668, N'f6a9704c-ca64-46c4-a56a-821fd7ec9803', 43, 66, 10, 2440, 3, 6, 672, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (669, N'3fa2e30f-33db-4ee5-86f3-724efa4ec4de', 34, 74, 11, 2415, 3, 6, 673, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (670, N'115a0809-fb9e-4382-84dd-07307a4259da', 62, 71, 13, 2408, 3, 6, 674, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (671, N'12f2e15b-9b79-47e6-a17f-b73bf9468e00', 69, 68, 6, 3880, 4, 6, 675, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (672, N'a1f19fae-1eb2-43da-a0ad-5e8e716bbed5', 45, 85, 13, 3957, 4, 6, 676, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (673, N'81985732-1ac1-49c4-95d4-096417845794', 55, 64, 6, 3800, 4, 6, 677, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (674, N'ff216b28-b721-492c-b255-49b5fe0a85e9', 62, 78, 9, 3777, 4, 6, 678, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (675, N'af878ad9-51b1-4562-b613-b6fd22a94519', 84, 84, 16, 3752, 4, 6, 679, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (676, N'28890a7c-1546-45c0-b9d9-bfeef5c2c053', 66, 85, 6, 3081, 4, 6, 680, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (677, N'676e7a5f-eaad-4402-ab4f-9a9e82a30d48', 66, 73, 16, 3543, 4, 6, 681, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (678, N'dd0044f4-1bf8-43ff-8877-f18f129e1bd2', 63, 86, 9, 3357, 4, 6, 682, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (679, N'20adb881-f776-4d3a-ae57-4ca310545958', 72, 85, 15, 3167, 4, 6, 683, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (680, N'b97946df-6ec4-4cb3-b7f9-246cd4756e60', 84, 69, 13, 3499, 4, 6, 684, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (681, N'50cb2fd6-404b-4415-b9f1-cd24ac15ce32', 56, 72, 8, 3131, 4, 6, 685, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (682, N'bb01bcaa-79aa-4a6f-8755-f086b3d1112c', 66, 75, 14, 3221, 4, 6, 686, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (683, N'9570284d-3dcb-48b5-811e-7f5225ae41fe', 74, 71, 11, 3254, 4, 6, 687, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (684, N'57862ef0-6ead-4ee7-b9d7-c64e012249d8', 68, 83, 13, 3947, 4, 6, 688, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (685, N'987682e6-cad7-4526-bc1a-00b186b80f43', 69, 76, 15, 3041, 4, 6, 689, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (686, N'b082939d-be0f-4404-97e9-e3998ce6fdb0', 68, 67, 12, 3156, 4, 6, 690, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (687, N'6f4cff5d-f9a6-4661-a44e-45356d8f102d', 38, 67, 12, 3482, 4, 6, 691, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (688, N'58f0c2a1-9269-4899-aab6-612e5926f4aa', 52, 69, 9, 3562, 4, 6, 692, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (689, N'545eb514-ec18-49d6-9ad9-2e3916d23756', 47, 70, 8, 3945, 4, 6, 693, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (690, N'6499efd0-9a5f-4a61-895e-c92046801245', 71, 79, 7, 3875, 4, 6, 694, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (691, N'28d60a8c-8420-43f1-8bd1-e9497aaf1b9c', 68, 91, 16, 4373, 5, 6, 695, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (692, N'5361ecab-b83a-43c7-9330-0180f6dd9a2e', 48, 83, 14, 4986, 5, 6, 696, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (693, N'3815eba5-4009-4545-a56f-10e13ad4c208', 99, 72, 17, 4412, 5, 6, 697, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (694, N'c68d7922-a7b6-4ad6-bc6f-e0ffd8b806da', 60, 80, 18, 4520, 5, 6, 698, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (695, N'59b2e438-bad4-4fde-bd6d-cd39d576c4f5', 80, 90, 15, 4532, 5, 6, 699, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (696, N'05af803c-d3a1-4413-8003-9b7072d2d0b4', 88, 98, 15, 4999, 5, 6, 700, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (697, N'8e19c730-4d43-4716-b275-d9b4794cd308', 76, 73, 10, 4310, 5, 6, 701, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (698, N'902f12e2-2652-4047-a749-5e40553885f1', 66, 100, 16, 4171, 5, 6, 702, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (699, N'dd5d6740-a85d-4ef0-bde9-cebf7cd511b9', 80, 92, 11, 4230, 5, 6, 703, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (700, N'f332f5c7-3153-4637-bdbd-2594bd7e286f', 100, 76, 13, 4123, 5, 6, 704, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (701, N'f8553b7c-f77a-435e-8fa8-1ff618355daa', 51, 44, 2, 260, 1, 7, 705, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (702, N'f48a34f0-5e65-474f-a2e9-8199af92d7d4', 49, 52, 4, 882, 1, 7, 706, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (703, N'43469173-ce61-413f-b860-1b60fbd40e7c', 45, 44, 0, 447, 1, 7, 707, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (704, N'7218dda6-5332-47db-968e-ca287a20d7ef', 43, 45, 6, 740, 1, 7, 708, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (705, N'410fa1ca-82b9-443f-a43c-2a4e9a75767b', 24, 50, 10, 186, 1, 7, 709, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (706, N'02876fd4-ab9e-4870-a7ef-479bf5ff9f18', 21, 41, 8, 658, 1, 7, 710, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (707, N'17efd877-acc8-4080-a575-3bc21e780d0f', 19, 50, 5, 242, 1, 7, 711, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (708, N'7b0aa0ef-0b0d-463b-be1e-8309756c34ce', 38, 43, 1, 879, 1, 7, 712, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (709, N'dd51d2dc-005e-4a70-9383-3be18c4b24c2', 33, 47, 6, 525, 1, 7, 713, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (710, N'6b3a12f9-5e64-489f-8909-ea198d484ab0', 52, 43, 0, 738, 1, 7, 714, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (711, N'393426ed-8ec9-41ec-b59d-a2442174a752', 39, 48, 10, 930, 1, 7, 715, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (712, N'd09ebd72-6ca8-4622-baaa-a4bcdb8aaea1', 11, 47, 6, 99, 1, 7, 716, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (713, N'e05cecf2-1fc9-4949-b9d8-2628721e6c32', 52, 51, 5, 842, 1, 7, 717, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (714, N'a49ad050-1ab5-4058-82ae-3739fd235fd5', 11, 50, 5, 942, 1, 7, 718, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (715, N'4d07a399-2d2e-459d-a01f-2158e84ea18e', 28, 42, 6, 409, 1, 7, 719, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (716, N'9b55c404-f236-4eaf-beac-6ec65af980ff', 41, 60, 5, 1765, 2, 7, 720, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (717, N'5dca5ed7-e964-4ae7-a107-60afcc2e5d3f', 33, 52, 9, 1801, 2, 7, 721, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (718, N'2cc38784-11ae-4047-84b5-bf0b48d249a5', 47, 53, 10, 1113, 2, 7, 722, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (719, N'45bdf158-1573-4fc5-b6e1-33ea24071856', 46, 57, 4, 1562, 2, 7, 723, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (720, N'65c1fc76-42fc-45ce-9c32-88eca29461b4', 51, 55, 12, 1022, 2, 7, 724, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (721, N'1e1bc030-f926-49ed-93b8-4c9855fc0199', 33, 52, 10, 1517, 2, 7, 725, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (722, N'64b821a2-2aa0-4d28-936c-76dc7b18873d', 57, 58, 12, 1172, 2, 7, 726, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (723, N'49bba193-8892-4615-a6a4-526acfdd9297', 18, 48, 6, 1208, 2, 7, 727, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (724, N'6ce62d31-c678-40e2-a18e-56ef87633cec', 45, 54, 10, 1832, 2, 7, 728, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (725, N'37febfc3-2b72-4bd5-95eb-3585d7258534', 36, 49, 4, 1924, 2, 7, 729, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (726, N'5aec871a-64be-4d90-98f4-bd336f55dfb7', 38, 50, 9, 1606, 2, 7, 730, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (727, N'fdb5330d-4732-4800-94b7-fbff269f834c', 26, 61, 6, 1351, 2, 7, 731, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (728, N'8bcce2aa-02a6-4290-b5da-4ea079d3dccc', 62, 55, 4, 1936, 2, 7, 732, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (729, N'02161c37-13bd-4f68-b60f-16854108d10a', 51, 52, 2, 1220, 2, 7, 733, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (730, N'f9e497b2-d0b4-4ec5-9b1e-7a82d46d8008', 31, 58, 2, 1297, 2, 7, 734, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (731, N'4e5b5a4f-03eb-48aa-9ccb-4577ef81a561', 46, 53, 11, 1297, 2, 7, 735, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (732, N'9f05f60b-682f-42ef-bd76-c28fad9bf694', 24, 60, 6, 1562, 2, 7, 736, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (733, N'f9ca9fa4-9a33-455a-8f09-c6c95988ba29', 52, 57, 5, 1282, 2, 7, 737, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (734, N'5dd6bb77-506e-4d59-bc8a-6dc3fb45ce88', 59, 60, 6, 1781, 2, 7, 738, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (735, N'c2524a60-eccb-485b-b87c-099cfb36994f', 30, 48, 5, 1549, 2, 7, 739, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (736, N'd3288a13-2764-40ac-b05f-4836cb8caacb', 26, 56, 10, 1437, 2, 7, 740, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (737, N'582d79b3-212a-4971-8720-ad652823c677', 51, 50, 6, 1842, 2, 7, 741, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (738, N'd46d4a33-5fe4-46c1-b708-1a7e2f2d844c', 52, 48, 7, 1141, 2, 7, 742, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (739, N'd5eff66c-3a1a-4224-8085-a672d59935ea', 21, 63, 5, 1356, 2, 7, 743, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (740, N'a0fd9647-fd46-462a-8c66-d14743afde1f', 59, 48, 10, 1109, 2, 7, 744, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (741, N'96e00952-9ea3-4827-a449-07bb36c5985d', 54, 63, 4, 1584, 2, 7, 745, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (742, N'248553c9-d1b3-46c7-882c-287a864fcdf1', 27, 57, 6, 1293, 2, 7, 746, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (743, N'1758e774-253b-443d-a17e-f9cc1bdba03a', 23, 53, 3, 1506, 2, 7, 747, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (744, N'e497ce0a-1ef7-4701-8f9d-86a769f19544', 30, 64, 12, 1717, 2, 7, 748, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (745, N'596f5c9e-d21d-4fd8-ac8e-b1c06df99422', 58, 64, 8, 1258, 2, 7, 749, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (746, N'2265cd07-02f4-458c-b456-f46888f38dbc', 36, 58, 11, 1848, 2, 7, 750, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (747, N'9f4211cf-2825-415a-80fd-76e72b8c793b', 59, 60, 10, 1581, 2, 7, 751, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (748, N'1b0ef054-dd0c-4c8c-9c59-cb375e34ed52', 47, 57, 3, 1239, 2, 7, 752, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (749, N'086d3c76-a1f2-41c4-9607-bd1853f4d5f8', 63, 57, 10, 1298, 2, 7, 753, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (750, N'e4b29e50-97cd-4256-b9ca-fb8f2a20d25a', 35, 57, 6, 1497, 2, 7, 754, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (751, N'248b00e2-ac85-46c4-a256-8dd4304031c6', 34, 52, 9, 1404, 2, 7, 755, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (752, N'35cf690a-bb00-4991-b661-575ee90473b2', 30, 60, 9, 1056, 2, 7, 756, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (753, N'e14770ab-7ce4-4501-a35e-caf3a0345138', 29, 59, 7, 1154, 2, 7, 757, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (754, N'1240cc6d-2865-4bcb-bd41-12eb07c611be', 25, 58, 5, 1294, 2, 7, 758, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (755, N'45b64186-0a81-44a1-b4d7-1271c5dcacc9', 31, 58, 10, 1640, 2, 7, 759, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (756, N'31778ea0-fc4d-4377-9f09-8f7bc0dbeb31', 76, 64, 9, 2592, 3, 7, 760, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (757, N'562942c5-b9c2-449d-9652-534816c60546', 50, 64, 14, 2483, 3, 7, 761, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (758, N'6e9ce62f-5cf8-4c0b-8ae4-e50edffd44bb', 52, 64, 5, 2951, 3, 7, 762, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (759, N'08ea845c-ea8f-4df9-b0b2-ced929aa3bfc', 41, 71, 13, 2489, 3, 7, 763, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (760, N'86f28688-7aac-4a9b-9d77-00202c2f3a24', 35, 76, 4, 2334, 3, 7, 764, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (761, N'00d28482-b120-46b0-a1bf-486eb10ef9fb', 26, 63, 6, 2363, 3, 7, 765, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (762, N'0e674374-44e6-434e-bfff-48a37d86381b', 42, 64, 14, 2673, 3, 7, 766, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (763, N'c35485f6-69a0-4060-ab62-56d74f246283', 64, 65, 7, 2115, 3, 7, 767, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (764, N'6a727577-c5e2-4752-8eb4-611857b82398', 40, 57, 9, 2744, 3, 7, 768, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (765, N'c415fee8-efc6-4c93-b815-a80de428cbd7', 39, 58, 7, 2554, 3, 7, 769, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (766, N'686f1352-6fd3-4417-a0b2-8fec6481f229', 60, 64, 5, 2443, 3, 7, 770, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (767, N'b89717fb-55af-4dad-acb4-d34ed0cbb13f', 52, 64, 4, 2920, 3, 7, 771, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (768, N'b011058f-3fc7-4939-b964-ce2ee667d3c7', 75, 65, 7, 2938, 3, 7, 772, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (769, N'bf4d6ef6-278b-4986-b23f-cd5c7eb69cee', 66, 66, 11, 2988, 3, 7, 773, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (770, N'96c56b38-4e2a-4e85-aa41-7ea294093b3e', 43, 67, 12, 2718, 3, 7, 774, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (771, N'920f45a1-142d-4b88-845c-a0fca3213e0a', 49, 68, 9, 2110, 3, 7, 775, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (772, N'15ddd7aa-52de-4fff-8640-7ad652eedb1c', 62, 66, 6, 2342, 3, 7, 776, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (773, N'e7553a9e-5829-49fb-b2d1-c6a5e3bb1032', 56, 58, 8, 2697, 3, 7, 777, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (774, N'c13249b3-92b2-49ba-934f-2fa36fa3ee87', 29, 65, 4, 2536, 3, 7, 778, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (775, N'569cb5b7-4870-4286-a55a-b50bcd0db62a', 49, 72, 8, 2400, 3, 7, 779, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (776, N'218cf70f-45a9-4ef1-8ba8-3d1574710c06', 50, 67, 4, 2753, 3, 7, 780, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (777, N'c6e335ea-3420-4fea-a6ab-29b46ac24589', 40, 75, 14, 2723, 3, 7, 781, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (778, N'bdb5bc2e-5fcb-4e13-b61a-9a4ccfc2c900', 67, 64, 13, 2634, 3, 7, 782, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (779, N'fe4bf30a-98b6-4bbe-bb91-d2c72e1610ab', 68, 68, 10, 2924, 3, 7, 783, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (780, N'd4fad83a-d535-41b5-8e3b-f3c5f088d74a', 46, 61, 10, 2673, 3, 7, 784, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (781, N'c9fc30ca-ebc2-471c-b3a5-d023a74a26a5', 32, 68, 12, 2118, 3, 7, 785, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (782, N'17de02ae-ffe9-4f77-bea4-4ed1687ce5b3', 38, 70, 5, 2709, 3, 7, 786, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (783, N'71c11786-1383-47d2-95a4-15c4ff06a2d7', 46, 58, 13, 2048, 3, 7, 787, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (784, N'0b5d82ea-6722-4624-be50-1a87cc4804ac', 64, 64, 5, 2087, 3, 7, 788, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (785, N'a050d9c7-7a5c-4596-a775-ef4b062a95cc', 54, 66, 4, 2461, 3, 7, 789, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (786, N'9f6934a2-cd16-474c-b01d-6b8c5642b1fa', 60, 80, 11, 3580, 4, 7, 790, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (787, N'a29f5194-09cf-431e-b727-452e2bdfbee6', 44, 76, 8, 3755, 4, 7, 791, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (788, N'192e3619-4815-40f3-a2d7-b1bf818d3390', 75, 88, 16, 3724, 4, 7, 792, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (789, N'5a9d9695-2582-4b84-ae05-db41ffc44b8c', 48, 79, 14, 3094, 4, 7, 793, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (790, N'1496c8b7-49a3-47db-ae7f-33efbe926e8c', 58, 73, 8, 3920, 4, 7, 794, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (791, N'698e9d3a-9d1e-4fa1-ae4d-25708c93734b', 73, 65, 7, 3334, 4, 7, 795, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (792, N'3b80b999-3ae2-40d0-b090-f85dface09b0', 62, 81, 14, 3525, 4, 7, 796, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (793, N'b870c7f3-48ba-4e9f-b64c-1683fe07a555', 78, 86, 14, 3615, 4, 7, 797, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (794, N'ab6c080c-98f6-4a96-8065-0705f8088a61', 78, 87, 13, 3189, 4, 7, 798, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (795, N'987df8df-7f81-4f0b-9a6b-397e182f8589', 53, 86, 14, 3956, 4, 7, 799, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (796, N'638d6c81-96b1-4101-9597-7121871e990f', 86, 98, 10, 4211, 5, 7, 800, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (797, N'23a8eaa9-1c7b-449b-8787-564d76964b92', 64, 91, 14, 4533, 5, 7, 801, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (798, N'54485231-9252-433a-819c-1d719938a5f5', 45, 84, 11, 4267, 5, 7, 802, 1)
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (799, N'a4743d90-97f0-44bb-91cf-bb21361831ca', 75, 82, 9, 4982, 5, 7, 803, 1)
GO
INSERT [dbo].[Player] ([Id], [Name], [Activity], [Skill], [Temper], [Score], [RankId], [RegionId], [PersonId], [IsActive]) VALUES (800, N'ceb2395c-25c6-4f46-a631-ccfbae2f2abd', 93, 89, 9, 4499, 5, 7, 804, 1)
SET IDENTITY_INSERT [dbo].[Player] OFF
GO
SET IDENTITY_INSERT [dbo].[Rank] ON 

INSERT [dbo].[Rank] ([Id], [Name], [Score], [IsActive]) VALUES (1, N'Bronze', 0, 1)
INSERT [dbo].[Rank] ([Id], [Name], [Score], [IsActive]) VALUES (2, N'Silver', 1000, 1)
INSERT [dbo].[Rank] ([Id], [Name], [Score], [IsActive]) VALUES (3, N'Gold', 2000, 1)
INSERT [dbo].[Rank] ([Id], [Name], [Score], [IsActive]) VALUES (4, N'Platinum', 3000, 1)
INSERT [dbo].[Rank] ([Id], [Name], [Score], [IsActive]) VALUES (5, N'Diamond', 4000, 1)
SET IDENTITY_INSERT [dbo].[Rank] OFF
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (1, N'Africa', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (2, N'Asia', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (3, N'Australia', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (4, N'Europe', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (5, N'Middle East', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (6, N'North America', 1)
INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (7, N'South America', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (100, N'Admin', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (200, N'GameMaster', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (300, N'Business', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (400, N'Player', 1)
GO
SET IDENTITY_INSERT [dbo].[Synergy] ON 

INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (1, 1, 1, 1000, 106)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (2, 1, 2, 1000, 109)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (3, 1, 3, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (4, 1, 4, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (5, 1, 5, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (6, 1, 6, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (7, 1, 7, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (8, 1, 8, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (9, 2, 1, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (10, 2, 2, 18000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (11, 2, 3, 500, 109)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (12, 2, 4, 500, 110)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (13, 2, 5, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (14, 2, 6, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (15, 2, 7, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (16, 2, 8, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (17, 3, 1, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (18, 3, 2, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (19, 3, 3, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (20, 3, 4, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (21, 3, 5, 500, 110)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (22, 3, 6, 500, 110)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (23, 3, 7, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (24, 3, 8, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (25, 4, 1, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (26, 4, 2, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (27, 4, 3, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (28, 4, 4, 2000, 105)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (29, 4, 5, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (30, 4, 6, 2000, 100)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (31, 4, 7, 500, 112)
INSERT [dbo].[Synergy] ([Id], [CharacterId], [WeaponId], [Constant], [Multiplier]) VALUES (32, 4, 8, 500, 110)
SET IDENTITY_INSERT [dbo].[Synergy] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Email], [Username], [Password], [RoleId], [PersonId], [IsActive]) VALUES (1, N'admin@gamemaster.xyz', N'admin', N'AQAAAAEAACcQAAAAEBONHPWodnZUVcfn71P7zf0Z/nLLmijUTNCdCFECQymz4w0bpYSzkTykK1rmxQKcFw==', 100, 1, 1)
INSERT [dbo].[User] ([Id], [Email], [Username], [Password], [RoleId], [PersonId], [IsActive]) VALUES (2, N'gamemaster@gamemaster.xyz', N'gamemaster', N'AQAAAAEAACcQAAAAEBONHPWodnZUVcfn71P7zf0Z/nLLmijUTNCdCFECQymz4w0bpYSzkTykK1rmxQKcFw==', 200, 2, 1)
INSERT [dbo].[User] ([Id], [Email], [Username], [Password], [RoleId], [PersonId], [IsActive]) VALUES (3, N'business@gamemaster.xyz', N'business', N'AQAAAAEAACcQAAAAEBONHPWodnZUVcfn71P7zf0Z/nLLmijUTNCdCFECQymz4w0bpYSzkTykK1rmxQKcFw==', 300, 3, 1)
INSERT [dbo].[User] ([Id], [Email], [Username], [Password], [RoleId], [PersonId], [IsActive]) VALUES (4, N'player@gamemaster.xyz', N'player', N'AQAAAAEAACcQAAAAEBONHPWodnZUVcfn71P7zf0Z/nLLmijUTNCdCFECQymz4w0bpYSzkTykK1rmxQKcFw==', 400, 4, 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[Weapon] ON 

INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (1, N'Bow', 2, 3, 10, 5, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (2, N'XBow', 1, 1, 9, 9, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (3, N'Daggers', 1, 5, 5, 9, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (4, N'Poison', 1, 7, 6, 7, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (5, N'Lance', 8, 2, 6, 3, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (6, N'Sword', 9, 2, 5, 2, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (7, N'Staff', 4, 9, 3, 4, 1)
INSERT [dbo].[Weapon] ([Id], [Name], [Block], [Magic], [Power], [Speed], [IsActive]) VALUES (8, N'Grimoire', 1, 10, 3, 5, 1)
SET IDENTITY_INSERT [dbo].[Weapon] OFF
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GamePlayer] ADD  CONSTRAINT [DF_GamePlayer_IsWinner]  DEFAULT ((0)) FOR [IsWinner]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Player] ADD  CONSTRAINT [DF_Player_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Rank] ADD  CONSTRAINT [DF_Rank_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Region] ADD  CONSTRAINT [DF_Region_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Role] ADD  CONSTRAINT [DF_Role_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Season] ADD  CONSTRAINT [DF_Season_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Weapon] ADD  CONSTRAINT [DF_Weapon_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CharacterDetails]  WITH CHECK ADD  CONSTRAINT [FK_CharacterDetails_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[CharacterDetails] CHECK CONSTRAINT [FK_CharacterDetails_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[CharacterDetails]  WITH CHECK ADD  CONSTRAINT [FK_CharacterDetails_SeasonId_Season_id] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[CharacterDetails] CHECK CONSTRAINT [FK_CharacterDetails_SeasonId_Season_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_RegionId_Region_id] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_RegionId_Region_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_SeasonId_Season_id] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_SeasonId_Season_id]
GO
ALTER TABLE [dbo].[GamePlayer]  WITH CHECK ADD  CONSTRAINT [FK_GamePlayer_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[GamePlayer] CHECK CONSTRAINT [FK_GamePlayer_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[GamePlayer]  WITH CHECK ADD  CONSTRAINT [FK_GamePlayer_GameId_Game_id] FOREIGN KEY([GameId])
REFERENCES [dbo].[Game] ([Id])
GO
ALTER TABLE [dbo].[GamePlayer] CHECK CONSTRAINT [FK_GamePlayer_GameId_Game_id]
GO
ALTER TABLE [dbo].[GamePlayer]  WITH CHECK ADD  CONSTRAINT [FK_GamePlayer_PlayerId_Player_id] FOREIGN KEY([PlayerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[GamePlayer] CHECK CONSTRAINT [FK_GamePlayer_PlayerId_Player_id]
GO
ALTER TABLE [dbo].[GamePlayer]  WITH CHECK ADD  CONSTRAINT [FK_GamePlayer_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[GamePlayer] CHECK CONSTRAINT [FK_GamePlayer_WeaponId_Weapon_id]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_PersonId_Person_id] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_PersonId_Person_id]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_RankId_Rank_id] FOREIGN KEY([RankId])
REFERENCES [dbo].[Rank] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_RankId_Rank_id]
GO
ALTER TABLE [dbo].[Player]  WITH CHECK ADD  CONSTRAINT [FK_Player_RegionId_Region_id] FOREIGN KEY([RegionId])
REFERENCES [dbo].[Region] ([Id])
GO
ALTER TABLE [dbo].[Player] CHECK CONSTRAINT [FK_Player_RegionId_Region_id]
GO
ALTER TABLE [dbo].[Synergy]  WITH CHECK ADD  CONSTRAINT [FK_Synergy_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[Synergy] CHECK CONSTRAINT [FK_Synergy_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[Synergy]  WITH CHECK ADD  CONSTRAINT [FK_Synergy_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[Synergy] CHECK CONSTRAINT [FK_Synergy_WeaponId_Weapon_id]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_PersonId_Person_id] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_PersonId_Person_id]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_RoleId_Role_id] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_RoleId_Role_id]
GO
ALTER TABLE [dbo].[WeaponDetails]  WITH CHECK ADD  CONSTRAINT [FK_WeaponDetails_SeasonId_Season_id] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[WeaponDetails] CHECK CONSTRAINT [FK_WeaponDetails_SeasonId_Season_id]
GO
ALTER TABLE [dbo].[WeaponDetails]  WITH CHECK ADD  CONSTRAINT [FK_WeaponDetails_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[WeaponDetails] CHECK CONSTRAINT [FK_WeaponDetails_WeaponId_Weapon_id]
GO
/****** Object:  StoredProcedure [dbo].[NewCharacter]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewCharacter] @Name nvarchar(50), @Health int, @Mana int, @Mobility int, @Strength int
AS
DECLARE @CharacterOutput table(Id int,
                               Name nvarchar(50),
                               Health int,
                               Mana int,
                               Mobility int,
                               Strength int,
                               IsActive bit);
INSERT [Character] (Name, Health, Mana, Mobility, Strength, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Health, INSERTED.Mana, INSERTED.Mobility, INSERTED.Strength, INSERTED.IsActive
        INTO @CharacterOutput
VALUES (@Name, @Health, @Mana, @Mobility, @Strength, 1);
SELECT * FROM @CharacterOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewGame]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewGame] @SeasonId int, @RegionId int, @StartTime DateTime
AS
DECLARE @GameOutput table(Id int,
                         SeasonId int,
                         RegionId int,
                         StartTime DateTime);
INSERT [Game] (SeasonId, RegionId, StartTime)
    OUTPUT INSERTED.Id, INSERTED.SeasonId, INSERTED.RegionId, INSERTED.StartTime
        INTO @GameOutput
VALUES (@SeasonId, @RegionId, @StartTime);
SELECT * FROM @GameOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewPerson]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewPerson] @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime
AS
DECLARE @PersonOutput table(Id int,
                           FirstName nvarchar(50),
                           LastName nvarchar(50),
                           Birthday date,
                           DateCreated datetime,
                           IsActive bit);
INSERT [Person] (FirstName, LastName, Birthday, DateCreated, IsActive)
    OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
        INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
SELECT * FROM @PersonOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewPlayer]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewPlayer] @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime, @Name nvarchar(50), @Activity int, @Skill int, @Temper int, @Score int, @RegionId int
AS
DECLARE @PersonOutput table(Id int,
                           FirstName nvarchar(50),
                           LastName nvarchar(50),
                           Birthday date,
                           DateCreated datetime,
                           IsActive bit);
INSERT [Person] (FirstName, LastName, Birthday, DateCreated, IsActive)
    OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
        INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
DECLARE @PlayerOutput table(Id int,
                           Name nvarchar(50),
                           Activity int,
                           Skill int,
                           Temper int,
                           Score int,
                           RankId int,
                           RegionId int,
                           PersonId int,
                           IsActive bit);
INSERT [Player] (Name, Activity, Skill, Temper, Score, RankId, RegionId, PersonId, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Activity, INSERTED.Skill, INSERTED.Temper, INSERTED.Score, INSERTED.RankId, INSERTED.RegionId, INSERTED.PersonId, INSERTED.IsActive
        INTO @PlayerOutput
VALUES (@Name, @Activity, @Skill, @Temper, @Score, (SELECT TOP(1) Id FROM [Rank] WHERE Score <= @Score ORDER BY Score DESC), @RegionId, (SELECT Id FROM @PersonOutput), 1);
SELECT * FROM @PlayerOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewSeason]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewSeason] @Name nvarchar(100), @StartDate DateTime, @EndDate DateTime
AS
DECLARE @SeasonOutput table(Id int,
                           Name nvarchar(100),
                           StartDate DateTime,
                           EndDate DateTime,
                           IsActive bit);
INSERT [Season] (Name, StartDate, EndDate, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.StartDate, INSERTED.EndDate, INSERTED.IsActive
        INTO @SeasonOutput
VALUES (@Name, @StartDate, @EndDate, 1);
SELECT * FROM @SeasonOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewUser]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewUser] @FirstName nvarchar(50), @LastName nvarchar(50), @Birthday date, @DateCreated datetime, @Email nvarchar(100), @Username nvarchar(50), @Password nvarchar(100), @RoleId int
AS
DECLARE @PersonOutput table(Id int,
                           FirstName nvarchar(50),
                           LastName nvarchar(50),
                           Birthday date,
                           DateCreated datetime,
                           IsActive bit);
INSERT [Person] (FirstName, LastName, Birthday, DateCreated, IsActive)
    OUTPUT INSERTED.Id, INSERTED.FirstName, INSERTED.LastName, INSERTED.Birthday, INSERTED.DateCreated, INSERTED.IsActive
        INTO @PersonOutput
VALUES (@FirstName, @LastName, @Birthday, @DateCreated, 1);
DECLARE @UserOutput table(Id int,
                          Email nvarchar(100),
                          Username nvarchar(50),
                          Password nvarchar(100),
                          RoleId int,
                          PersonId int,
                          IsActive bit);
INSERT [User] (Email, Username, Password, RoleId, PersonId, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Email, INSERTED.Username, INSERTED.Password, INSERTED.RoleId, INSERTED.PersonId, INSERTED.IsActive
        INTO @UserOutput
VALUES (@Email, @Username, @Password, @RoleId, (SELECT Id FROM @PersonOutput), 1);
SELECT * FROM @UserOutput;
GO
/****** Object:  StoredProcedure [dbo].[NewWeapon]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[NewWeapon] @Name nvarchar(50), @Block int, @Magic int, @Power int, @Speed int
AS
DECLARE @WeaponOutput table(Id int,
                           Name nvarchar(50),
                           Block int,
                           Magic int,
                           Power int,
                           Speed int,
                           IsActive bit);
INSERT [Weapon] (Name, Block, Magic, Power, Speed, IsActive)
    OUTPUT INSERTED.Id, INSERTED.Name, INSERTED.Block, INSERTED.Magic, INSERTED.Power, INSERTED.Speed, INSERTED.IsActive
        INTO @WeaponOutput
VALUES (@Name, @Block, @Magic, @Power, @Speed, 1);
SELECT * FROM @WeaponOutput;
GO
/****** Object:  StoredProcedure [dbo].[UpdatePlayerRank]    Script Date: 1/13/2021 12:33:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdatePlayerRank]
AS
UPDATE P
    SET RankId = (
    SELECT TOP(1) Id
    FROM [Rank]
    WHERE Score <= P.Score
    ORDER BY Score DESC)
FROM [Player] P;
GO
USE [master]
GO
ALTER DATABASE [GameMaster] SET  READ_WRITE 
GO
