USE [master]
GO
/****** Object:  Database [ContactsDB]    Script Date: 30/08/2023 6:51:43 p. m. ******/
CREATE DATABASE [ContactsDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ContactsDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ContactsDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ContactsDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ContactsDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ContactsDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactsDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactsDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ContactsDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ContactsDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ContactsDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ContactsDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ContactsDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ContactsDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ContactsDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ContactsDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ContactsDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ContactsDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ContactsDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ContactsDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ContactsDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ContactsDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ContactsDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ContactsDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ContactsDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ContactsDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ContactsDB] SET  MULTI_USER 
GO
ALTER DATABASE [ContactsDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ContactsDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ContactsDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ContactsDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ContactsDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ContactsDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ContactsDB] SET QUERY_STORE = OFF
GO
USE [ContactsDB]
GO
/****** Object:  Table [dbo].[Contacts]    Script Date: 30/08/2023 6:51:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Phone] [varchar](50) NULL,
	[Address] [varchar](250) NULL,
 CONSTRAINT [PK_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suministro_Credito]    Script Date: 30/08/2023 6:51:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suministro_Credito](
	[idSuministro_Credito] [int] IDENTITY(1,1) NOT NULL,
	[consecutivo] [varchar](10) NULL,
	[fecha_registro] [datetime] NULL,
	[tipo_solicitud] [varchar](45) NULL,
	[monto] [varchar](20) NULL,
	[plazo] [varchar](5) NULL,
	[apellidos_nombres_razon_social] [varchar](225) NULL,
	[tipo_persona] [varchar](15) NULL,
	[tipo_identificacion] [varchar](5) NULL,
	[numero_identificacion] [varchar](20) NULL,
	[DV] [varchar](10) NULL,
	[representante_legal] [varchar](300) NULL,
	[cargo] [varchar](100) NULL,
	[correo_electronico] [varchar](200) NULL,
	[direccion_correspondecia] [varchar](300) NULL,
	[ciudad] [varchar](45) NULL,
	[departamento] [varchar](45) NULL,
	[telefono] [varchar](45) NULL,
	[celular] [varchar](45) NULL,
	[correo_electronico_facturacion] [varchar](200) NULL,
	[entidad_razon_social_ref_comerciales] [varchar](225) NULL,
	[direccion_ref_comerciales] [varchar](220) NULL,
	[nom_contacto_ref_comerciales] [varchar](200) NULL,
	[entidad_razon_social_ref_comerciales_dos] [varchar](225) NULL,
	[direccion_ref_comerciales_dos] [varchar](220) NULL,
	[nom_contacto_ref_comerciales_dos] [varchar](200) NULL,
	[cargo_ref_comerciales_dos] [varchar](100) NULL,
	[telefono_ref_comerciales_dos] [varchar](12) NULL,
	[cargo_ref_comerciales] [varchar](100) NULL,
	[telefono_ref_comerciales] [varchar](12) NULL,
	[entidad_financiera] [varchar](150) NULL,
	[tipo_cuenta] [varchar](45) NULL,
	[numero_cuenta] [varchar](50) NULL,
	[oficina] [varchar](45) NULL,
	[nombre_contacto_tesoreria] [varchar](200) NULL,
	[cargo_contacto_tesoreria] [varchar](45) NULL,
	[telefono_contacto_tesoreria] [varchar](10) NULL,
	[celular_contacto_tesoreria] [varchar](10) NULL,
	[correo_electronico_contacto_tesoreria] [varchar](220) NULL,
	[nombre_contacto_contabilidad] [varchar](200) NULL,
	[cargo_contacto_contabilidad] [varchar](45) NULL,
	[telefono_contacto_contabilidad] [varchar](10) NULL,
	[celular_contacto_contabilidad] [varchar](10) NULL,
	[correo_electronico_contacto_contabilidad] [varchar](220) NULL,
	[nombre_contacto_compras] [varchar](200) NULL,
	[cargo_contacto_compras] [varchar](45) NULL,
	[telefono_contacto_compras] [varchar](10) NULL,
	[celular_contacto_compras] [varchar](10) NULL,
	[correo_electronico_contacto_compras] [varchar](220) NULL,
	[ruta_rut] [varchar](500) NULL,
	[ruta_estado_financiero] [varchar](500) NULL,
	[ruta_existencia] [varchar](500) NULL,
	[ruta_cert_ingresos] [varchar](500) NULL,
	[ruta_tarjeta_profesional] [varchar](500) NULL,
	[ruta_cert_antecedentes] [varchar](500) NULL,
	[nombre_apellido_firma] [varchar](250) NULL,
	[nro_cedula_firma] [varchar](12) NULL,
	[representa_legal_firma] [varchar](250) NULL,
	[centro_distribucion] [varchar](120) NULL,
	[cupo_sugerido] [varchar](10) NULL,
	[plazo_aliar] [varchar](5) NULL,
	[nom_asesor_comercial] [varchar](220) NULL,
 CONSTRAINT [PK_Suministro_Credito] PRIMARY KEY CLUSTERED 
(
	[idSuministro_Credito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ContactsDB] SET  READ_WRITE 
GO
