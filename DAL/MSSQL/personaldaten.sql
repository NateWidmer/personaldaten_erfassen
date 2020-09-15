USE [master]
GO
/****** Object:  Database [personaldaten]    Script Date: 11/09/2020 15:27:02 ******/
CREATE DATABASE [personaldaten]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'personaldaten', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\personaldaten.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'personaldaten_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\personaldaten_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [personaldaten] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [personaldaten].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [personaldaten] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [personaldaten] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [personaldaten] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [personaldaten] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [personaldaten] SET ARITHABORT OFF 
GO
ALTER DATABASE [personaldaten] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [personaldaten] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [personaldaten] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [personaldaten] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [personaldaten] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [personaldaten] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [personaldaten] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [personaldaten] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [personaldaten] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [personaldaten] SET  DISABLE_BROKER 
GO
ALTER DATABASE [personaldaten] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [personaldaten] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [personaldaten] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [personaldaten] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [personaldaten] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [personaldaten] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [personaldaten] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [personaldaten] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [personaldaten] SET  MULTI_USER 
GO
ALTER DATABASE [personaldaten] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [personaldaten] SET DB_CHAINING OFF 
GO
ALTER DATABASE [personaldaten] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [personaldaten] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [personaldaten] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [personaldaten] SET QUERY_STORE = OFF
GO
USE [personaldaten]
GO
/****** Object:  Table [dbo].[firmendaten]    Script Date: 11/09/2020 15:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[firmendaten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firmenname] [varchar](50) NOT NULL,
	[abteilung] [varchar](50) NOT NULL,
	[berufsbezeichnung] [varchar](50) NOT NULL,
	[berufsbeschreibung] [varchar](50) NULL,
 CONSTRAINT [PK_firmendaten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[personaldaten]    Script Date: 11/09/2020 15:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[personaldaten](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nachname] [varchar](50) NOT NULL,
	[vorname] [varchar](50) NOT NULL,
	[geburtstag] [date] NOT NULL,
	[email] [varchar](50) NULL,
	[ahv_nr] [varchar](50) NOT NULL,
	[personal_nr] [int] NOT NULL,
	[telefon] [varchar](50) NULL,
	[fk_firmendaten] [int] NOT NULL,
 CONSTRAINT [PK_personaldaten] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[protokoll]    Script Date: 11/09/2020 15:27:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[protokoll](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[datum] [datetime] NOT NULL,
	[email] [varchar](50) NOT NULL,
	[funktion] [varchar](20) NOT NULL,
 CONSTRAINT [PK_protokoll] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[personaldaten]  WITH CHECK ADD  CONSTRAINT [fk_personaldaten] FOREIGN KEY([fk_firmendaten])
REFERENCES [dbo].[firmendaten] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[personaldaten] CHECK CONSTRAINT [fk_personaldaten]
GO
USE [master]
GO
ALTER DATABASE [personaldaten] SET  READ_WRITE 
GO
