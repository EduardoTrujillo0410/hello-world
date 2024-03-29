USE [DBZapatos]
GO
/****** Object:  Table [dbo].[Referencia]    Script Date: 24/06/2022 23:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Referencia](
	[idReferencia] [int] IDENTITY(1,1) NOT NULL,
	[nomReferencia] [varchar](50) NOT NULL,
	[refSerial] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Referencia] PRIMARY KEY CLUSTERED 
(
	[idReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 24/06/2022 23:40:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[idStock] [int] IDENTITY(1,1) NOT NULL,
	[serial] [nvarchar](50) NOT NULL,
	[nomReferencia] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[idStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Referencia] ON 

INSERT [dbo].[Referencia] ([idReferencia], [nomReferencia], [refSerial]) VALUES (1, N'NIKE AIR FORCE 1', N'qqq')
INSERT [dbo].[Referencia] ([idReferencia], [nomReferencia], [refSerial]) VALUES (2, N'NIKE SB', N'nsbEDU')
INSERT [dbo].[Referencia] ([idReferencia], [nomReferencia], [refSerial]) VALUES (3, N'NIKE RUNNING', N'edumary22')
INSERT [dbo].[Referencia] ([idReferencia], [nomReferencia], [refSerial]) VALUES (4, N'NIKE PRO', N'aaa111')
SET IDENTITY_INSERT [dbo].[Referencia] OFF
GO
SET IDENTITY_INSERT [dbo].[Stock] ON 

INSERT [dbo].[Stock] ([idStock], [serial], [nomReferencia]) VALUES (9, N'EDU0410', N'NIKE AIR FORCE 1')
INSERT [dbo].[Stock] ([idStock], [serial], [nomReferencia]) VALUES (10, N'MGB22', N'NIKE PRO')
INSERT [dbo].[Stock] ([idStock], [serial], [nomReferencia]) VALUES (11, N'CIELOPOWER', N'NIKE SB')
INSERT [dbo].[Stock] ([idStock], [serial], [nomReferencia]) VALUES (13, N'VN1-43', N'VELEZ NEGROS')
SET IDENTITY_INSERT [dbo].[Stock] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Referencia]    Script Date: 24/06/2022 23:40:49 ******/
ALTER TABLE [dbo].[Referencia] ADD  CONSTRAINT [IX_Referencia] UNIQUE NONCLUSTERED 
(
	[refSerial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosReferencia]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosReferencia]
(@prmIdReferencia int,
@prmRefSerial varchar(50)
)
as
	begin
		update Referencia
		set Referencia.refSerial = @prmRefSerial
		where Referencia.idReferencia = @prmIdReferencia
	end
GO
/****** Object:  StoredProcedure [dbo].[spActualizarDatosStock]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarDatosStock]
(@prmIdStock int,
@prmSerial varchar(50)
)
as
	begin
		update Stock
		set Stock.serial = @prmSerial
		where Stock.idStock = @prmIdStock
	end
GO
/****** Object:  StoredProcedure [dbo].[spEliminarReferencia]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarReferencia]
(@prmIdReferencia int)
as
	delete from Referencia where idReferencia = @prmIdReferencia;
GO
/****** Object:  StoredProcedure [dbo].[spEliminarStock]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarStock]
(@prmIdStock int)
as
	delete from Stock where idStock = @prmIdStock;
GO
/****** Object:  StoredProcedure [dbo].[spListarReferencias]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarReferencias]
AS
	BEGIN
		SELECT F.idReferencia,
			   F.nomReferencia,
			   F.refSerial
		FROM Referencia F
	END	
GO
/****** Object:  StoredProcedure [dbo].[spListarStock]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spListarStock]
AS
	BEGIN
		SELECT S.idStock,
			   S.serial,
			   S.nomReferencia
		FROM Stock S
	END	
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarReferencia]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarReferencia]
(@prmNomReferencia varchar(50),
@prmRefSerial varchar(50)
)
AS
	BEGIN
		INSERT INTO Referencia(nomReferencia, refSerial)
		VALUES(@prmNomReferencia, @prmRefSerial)
	END
GO
/****** Object:  StoredProcedure [dbo].[spRegistrarStock]    Script Date: 24/06/2022 23:40:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistrarStock]
(@prmSerial varchar(50),
@prmNomReferencia varchar(50)
)
AS
	BEGIN
		INSERT INTO Stock(serial, nomReferencia)
		VALUES(@prmSerial, @prmNomReferencia)
	END
GO
