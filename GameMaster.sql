USE [master]
GO
/****** Object:  Database [GameMaster]    Script Date: 1/5/2021 12:00:00 AM ******/
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
ALTER DATABASE [GameMaster] SET  DISABLE_BROKER 
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
ALTER DATABASE [GameMaster] SET RECOVERY SIMPLE 
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
ALTER DATABASE [GameMaster] SET QUERY_STORE = OFF
GO
USE [GameMaster]
GO
/****** Object:  Table [dbo].[Character]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Character](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Strength] [int] NOT NULL,
	[Mobility] [int] NOT NULL,
	[Health] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Character] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CharacterDetails]    Script Date: 1/5/2021 12:22:01 AM ******/
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
	[WinRate] [real] NULL,
 CONSTRAINT [PK_CharacterDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Player1Id] [int] NOT NULL,
	[Player2Id] [int] NOT NULL,
	[Character1Id] [int] NOT NULL,
	[Character2Id] [int] NOT NULL,
	[Weapon1Id] [int] NOT NULL,
	[Weapon2Id] [int] NOT NULL,
	[GamewinnerId] [int] NOT NULL,
	[SeasonId] [int] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Birthday] [date] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Player]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Player](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[RegionId] [int] NOT NULL,
	[RankId] [int] NOT NULL,
	[Score] [int] NULL,
	[Skill] [int] NOT NULL,
	[Temper] [int] NOT NULL,
	[DateCreated] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Player] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rank]    Script Date: 1/5/2021 12:22:01 AM ******/
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
/****** Object:  Table [dbo].[Region]    Script Date: 1/5/2021 12:22:01 AM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SynergiesAgainstCharacterCharacter]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SynergiesAgainstCharacterCharacter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Character1Id] [int] NOT NULL,
	[Character2Id] [int] NOT NULL,
	[Constant] [int] NOT NULL,
	[Multiplier] [int] NOT NULL,
 CONSTRAINT [PK_SynergiesAgainstCharacterCharacter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SynergiesAgainstCharacterWeapon]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SynergiesAgainstCharacterWeapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[WeaponId] [int] NOT NULL,
	[CharacterId] [int] NOT NULL,
	[Constant] [int] NOT NULL,
	[Multiplier] [int] NOT NULL,
 CONSTRAINT [PK_SynergiesAgainstCharacterWeapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SynergiesAgainstWeaponWeapon]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SynergiesAgainstWeaponWeapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Weapon1Id] [int] NOT NULL,
	[Weapon2_id] [int] NOT NULL,
	[Constant] [int] NOT NULL,
	[Multiplier] [int] NOT NULL,
 CONSTRAINT [PK_SynergiesAgainstWeaponWeapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SynergiesWith]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SynergiesWith](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[Constant] [int] NOT NULL,
	[Multiplier] [int] NOT NULL,
 CONSTRAINT [PK_SynergiesWith] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageAgainstCharacterCharacter]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageAgainstCharacterCharacter](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Character1Id] [int] NOT NULL,
	[Character2Id] [int] NOT NULL,
	[GamesPlayed] [int] NULL,
	[GamesWon] [int] NULL,
	[WinRate] [real] NULL,
 CONSTRAINT [PK_UsageAgainstCharacterCharacter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageAgainstCharacterWeapon]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageAgainstCharacterWeapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CharacterId] [int] NOT NULL,
	[WeaponId] [int] NOT NULL,
	[GamesPlayed] [int] NULL,
	[GamesWon] [int] NULL,
	[WinRate] [real] NULL,
 CONSTRAINT [PK_UsageAgainstCharacterWeapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsageAgainstWeaponWeapon]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsageAgainstWeaponWeapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Weapon1Id] [int] NOT NULL,
	[Weapon2Id] [int] NOT NULL,
	[GamesPlayed] [int] NULL,
	[GamesWon] [int] NULL,
	[WinRate] [real] NULL,
 CONSTRAINT [PK_UsageAgainstWeaponWeapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
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
/****** Object:  Table [dbo].[VersionInfo]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VersionInfo](
	[Version] [bigint] NOT NULL,
	[AppliedOn] [datetime] NULL,
	[Description] [nvarchar](1024) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [UC_Version]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE UNIQUE CLUSTERED INDEX [UC_Version] ON [dbo].[VersionInfo]
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Weapon]    Script Date: 1/5/2021 12:22:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Weapon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Power] [int] NOT NULL,
	[Speed] [int] NOT NULL,
	[Block] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Weapon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WeaponDetails]    Script Date: 1/5/2021 12:22:01 AM ******/
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
	[WinRate] [real] NULL,
 CONSTRAINT [PK_WeaponDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Region] ON 

INSERT [dbo].[Region] ([Id], [Name], [IsActive]) VALUES (1, N'EU', 1)
SET IDENTITY_INSERT [dbo].[Region] OFF
GO
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (1, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_001_RoleTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (2, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_002_PersonTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (3, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_003_RegionTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (4, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_004_UserTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (5, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_005_SeasonTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (6, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_006_RankTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (7, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_007_PlayerTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (8, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_008_WeaponTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (9, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_009_CharacterTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (10, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_010_CharacterDetailsTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (11, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_011_WeaponDetailsTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (12, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_012_GameTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (14, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_014_SynergiesWithTable')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (15, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_015_UsageAgainstCharacterCharacter')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (16, CAST(N'2021-01-04T21:00:53.000' AS DateTime), N'_016_UsageAgainstWeaponWeapon')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (17, CAST(N'2021-01-04T21:00:54.000' AS DateTime), N'_017_UsageAgainstCharacterWeapon')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (18, CAST(N'2021-01-04T21:00:54.000' AS DateTime), N'_018_SynergiesAgainstCharacterCharacter')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (19, CAST(N'2021-01-04T21:00:54.000' AS DateTime), N'_019_SynergiesAgainstWeaponWeapon')
INSERT [dbo].[VersionInfo] ([Version], [AppliedOn], [Description]) VALUES (20, CAST(N'2021-01-04T21:00:54.000' AS DateTime), N'_020_SynergiesAgainstCharacterWeapon')
GO
/****** Object:  Index [IX_CharacterDetails_CharacterId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterDetails_CharacterId] ON [dbo].[CharacterDetails]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_CharacterDetails_SeasonId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_CharacterDetails_SeasonId] ON [dbo].[CharacterDetails]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Character1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Character1Id] ON [dbo].[Game]
(
	[Character1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Character2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Character2Id] ON [dbo].[Game]
(
	[Character2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_GamewinnerId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_GamewinnerId] ON [dbo].[Game]
(
	[GamewinnerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Player1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Player1Id] ON [dbo].[Game]
(
	[Player1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Player2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Player2Id] ON [dbo].[Game]
(
	[Player2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_SeasonId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_SeasonId] ON [dbo].[Game]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Weapon1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Weapon1Id] ON [dbo].[Game]
(
	[Weapon1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Game_Weapon2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Game_Weapon2Id] ON [dbo].[Game]
(
	[Weapon2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Player_PersonId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Player_PersonId] ON [dbo].[Player]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Player_RankId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Player_RankId] ON [dbo].[Player]
(
	[RankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_Player_RegionId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_Player_RegionId] ON [dbo].[Player]
(
	[RegionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstCharacterCharacter_Character1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstCharacterCharacter_Character1Id] ON [dbo].[SynergiesAgainstCharacterCharacter]
(
	[Character1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstCharacterCharacter_Character2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstCharacterCharacter_Character2Id] ON [dbo].[SynergiesAgainstCharacterCharacter]
(
	[Character2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstCharacterWeapon_CharacterId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstCharacterWeapon_CharacterId] ON [dbo].[SynergiesAgainstCharacterWeapon]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstCharacterWeapon_WeaponId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstCharacterWeapon_WeaponId] ON [dbo].[SynergiesAgainstCharacterWeapon]
(
	[WeaponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstWeaponWeapon_Weapon1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstWeaponWeapon_Weapon1Id] ON [dbo].[SynergiesAgainstWeaponWeapon]
(
	[Weapon1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesAgainstWeaponWeapon_Weapon2_id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesAgainstWeaponWeapon_Weapon2_id] ON [dbo].[SynergiesAgainstWeaponWeapon]
(
	[Weapon2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesWith_CharacterId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesWith_CharacterId] ON [dbo].[SynergiesWith]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_SynergiesWith_WeaponId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_SynergiesWith_WeaponId] ON [dbo].[SynergiesWith]
(
	[WeaponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstCharacterCharacter_Character1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstCharacterCharacter_Character1Id] ON [dbo].[UsageAgainstCharacterCharacter]
(
	[Character1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstCharacterCharacter_Character2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstCharacterCharacter_Character2Id] ON [dbo].[UsageAgainstCharacterCharacter]
(
	[Character2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstCharacterWeapon_CharacterId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstCharacterWeapon_CharacterId] ON [dbo].[UsageAgainstCharacterWeapon]
(
	[CharacterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstCharacterWeapon_WeaponId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstCharacterWeapon_WeaponId] ON [dbo].[UsageAgainstCharacterWeapon]
(
	[WeaponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstWeaponWeapon_Weapon1Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstWeaponWeapon_Weapon1Id] ON [dbo].[UsageAgainstWeaponWeapon]
(
	[Weapon1Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_UsageAgainstWeaponWeapon_Weapon2Id]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_UsageAgainstWeaponWeapon_Weapon2Id] ON [dbo].[UsageAgainstWeaponWeapon]
(
	[Weapon2Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_PersonId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_PersonId] ON [dbo].[User]
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_RoleId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_User_RoleId] ON [dbo].[User]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WeaponDetails_SeasonId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_WeaponDetails_SeasonId] ON [dbo].[WeaponDetails]
(
	[SeasonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_WeaponDetails_WeaponId]    Script Date: 1/5/2021 12:22:01 AM ******/
CREATE NONCLUSTERED INDEX [IX_WeaponDetails_WeaponId] ON [dbo].[WeaponDetails]
(
	[WeaponId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Character] ADD  CONSTRAINT [DF_Character_IsActive]  DEFAULT ((1)) FOR [IsActive]
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
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Character1Id_Character_id] FOREIGN KEY([Character1Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Character1Id_Character_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Character2Id_Character_id] FOREIGN KEY([Character2Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Character2Id_Character_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_GamewinnerId_Player_id] FOREIGN KEY([GamewinnerId])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_GamewinnerId_Player_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Player1Id_Player_id] FOREIGN KEY([Player1Id])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Player1Id_Player_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Player2Id_Player_id] FOREIGN KEY([Player2Id])
REFERENCES [dbo].[Player] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Player2Id_Player_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_SeasonId_Season_id] FOREIGN KEY([SeasonId])
REFERENCES [dbo].[Season] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_SeasonId_Season_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Weapon1Id_Weapon_id] FOREIGN KEY([Weapon1Id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Weapon1Id_Weapon_id]
GO
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Weapon2Id_Weapon_id] FOREIGN KEY([Weapon2Id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Weapon2Id_Weapon_id]
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
ALTER TABLE [dbo].[SynergiesAgainstCharacterCharacter]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstCharacterCharacter_Character1Id_Character_id] FOREIGN KEY([Character1Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterCharacter] CHECK CONSTRAINT [FK_SynergiesAgainstCharacterCharacter_Character1Id_Character_id]
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterCharacter]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstCharacterCharacter_Character2Id_Character_id] FOREIGN KEY([Character2Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterCharacter] CHECK CONSTRAINT [FK_SynergiesAgainstCharacterCharacter_Character2Id_Character_id]
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterWeapon]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstCharacterWeapon_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterWeapon] CHECK CONSTRAINT [FK_SynergiesAgainstCharacterWeapon_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterWeapon]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstCharacterWeapon_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstCharacterWeapon] CHECK CONSTRAINT [FK_SynergiesAgainstCharacterWeapon_WeaponId_Weapon_id]
GO
ALTER TABLE [dbo].[SynergiesAgainstWeaponWeapon]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstWeaponWeapon_Weapon1Id_Weapon_id] FOREIGN KEY([Weapon1Id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstWeaponWeapon] CHECK CONSTRAINT [FK_SynergiesAgainstWeaponWeapon_Weapon1Id_Weapon_id]
GO
ALTER TABLE [dbo].[SynergiesAgainstWeaponWeapon]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesAgainstWeaponWeapon_Weapon2_id_Weapon_id] FOREIGN KEY([Weapon2_id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[SynergiesAgainstWeaponWeapon] CHECK CONSTRAINT [FK_SynergiesAgainstWeaponWeapon_Weapon2_id_Weapon_id]
GO
ALTER TABLE [dbo].[SynergiesWith]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesWith_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[SynergiesWith] CHECK CONSTRAINT [FK_SynergiesWith_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[SynergiesWith]  WITH CHECK ADD  CONSTRAINT [FK_SynergiesWith_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[SynergiesWith] CHECK CONSTRAINT [FK_SynergiesWith_WeaponId_Weapon_id]
GO
ALTER TABLE [dbo].[UsageAgainstCharacterCharacter]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstCharacterCharacter_Character1Id_Character_id] FOREIGN KEY([Character1Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstCharacterCharacter] CHECK CONSTRAINT [FK_UsageAgainstCharacterCharacter_Character1Id_Character_id]
GO
ALTER TABLE [dbo].[UsageAgainstCharacterCharacter]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstCharacterCharacter_Character2Id_Character_id] FOREIGN KEY([Character2Id])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstCharacterCharacter] CHECK CONSTRAINT [FK_UsageAgainstCharacterCharacter_Character2Id_Character_id]
GO
ALTER TABLE [dbo].[UsageAgainstCharacterWeapon]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstCharacterWeapon_CharacterId_Character_id] FOREIGN KEY([CharacterId])
REFERENCES [dbo].[Character] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstCharacterWeapon] CHECK CONSTRAINT [FK_UsageAgainstCharacterWeapon_CharacterId_Character_id]
GO
ALTER TABLE [dbo].[UsageAgainstCharacterWeapon]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstCharacterWeapon_WeaponId_Weapon_id] FOREIGN KEY([WeaponId])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstCharacterWeapon] CHECK CONSTRAINT [FK_UsageAgainstCharacterWeapon_WeaponId_Weapon_id]
GO
ALTER TABLE [dbo].[UsageAgainstWeaponWeapon]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstWeaponWeapon_Weapon1Id_Weapon_id] FOREIGN KEY([Weapon1Id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstWeaponWeapon] CHECK CONSTRAINT [FK_UsageAgainstWeaponWeapon_Weapon1Id_Weapon_id]
GO
ALTER TABLE [dbo].[UsageAgainstWeaponWeapon]  WITH CHECK ADD  CONSTRAINT [FK_UsageAgainstWeaponWeapon_Weapon2Id_Weapon_id] FOREIGN KEY([Weapon2Id])
REFERENCES [dbo].[Weapon] ([Id])
GO
ALTER TABLE [dbo].[UsageAgainstWeaponWeapon] CHECK CONSTRAINT [FK_UsageAgainstWeaponWeapon_Weapon2Id_Weapon_id]
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
USE [master]
GO
ALTER DATABASE [GameMaster] SET  READ_WRITE 
GO
