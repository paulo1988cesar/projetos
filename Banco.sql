USE [AppGame]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EMPRESTIMO]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EMPRESTIMO](
	[CODEMPRESTIMO] [int] IDENTITY(1,1) NOT NULL,
	[CODUSER] [nvarchar](128) NOT NULL,
	[CODGAME] [int] NOT NULL,
	[DATAEMPRESTIMO] [date] NULL,
 CONSTRAINT [PK_EMPRESTIMO] PRIMARY KEY CLUSTERED 
(
	[CODEMPRESTIMO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GAME]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GAME](
	[CODGAME] [int] IDENTITY(1,1) NOT NULL,
	[CODPLATAFORMA] [int] NOT NULL,
	[CODUSER] [nvarchar](128) NOT NULL,
	[DESCRICAO] [varchar](100) NOT NULL,
	[ANO] [int] NOT NULL,
	[TITULOEMPRESTADO] [bit] NULL,
 CONSTRAINT [PK_GAME] PRIMARY KEY CLUSTERED 
(
	[CODGAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PLATAFORMA]    Script Date: 25/04/2018 20:59:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PLATAFORMA](
	[CODPLATAFORMA] [int] IDENTITY(1,1) NOT NULL,
	[DESCRICAO] [varchar](1000) NOT NULL,
 CONSTRAINT [PK_PLATAFORMA] PRIMARY KEY CLUSTERED 
(
	[CODPLATAFORMA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201804232141170_InitialCreate', N'AppGamer.Models.ApplicationDbContext', 0x1F8B0800000000000400DD5C5B6FE3B6127E2F70FE83A0A7738AD4CAE5EC624F606F913AC99EA09B0BD6D9C5795BD012ED082B51AA44A5098AFEB23EF427F52F9CA144C9E24D175BB19D628145440EBF190E87E47038F45F7FFC39FEF1290CAC479CA47E4426F6D1E8D0B6307123CF27CB899DD1C50FEFEC1FDFFFE3BBF185173E595F4ABA1346072D493AB11F288D4F1D27751F7088D251E8BB4994460B3A72A3D0415EE41C1F1EFEC7393A723040D8806559E34F19A17E88F30FF89C46C4C531CD50701D7938487939D4CC7254EB0685388D918B27F6591C7F80AF645490DAD659E02310638683856D2142228A280879FA39C5339A4464398BA10005F7CF3106BA050A52CC853F5D9177EDC7E131EB87B36A5842B9594AA3B027E0D109578C23375F4BBD76A53850DD05A8983EB35EE7EA9BD8571ECE8B3E4501284066783A0D12463CB1AF2B1667697C83E9A86C382A202F1380FB354ABE8DEA880756E7760795211D8F0ED9BF036B9A05344BF084E08C262838B0EEB279E0BB3FE3E7FBE81B269393A3F9E2E4DD9BB7C83B79FB6F7CF2A6DE53E82BD0090550749744314E4036BCA8FA6F5B8ED8CE911B56CD6A6D0AAD802DC19CB0AD6BF4F41193257D80D972FCCEB62EFD27EC9525DCB83E131FA61034A249069F375910A07980AB7AA79127FBBF81EBF19BB78370BD418FFE321F7A893F4C9C04E6D5271CE4B5E9831F17D34B18EFAF9CEC328942F62DDA5751FB75166589CB3A131949EE51B2C454946EECAC8CB7934933A8E1CDBA44DD7FD36692AAE6AD25651D5A6726942CB63D1B4A795F966F678B83ED07062F372DA69126839376AA91D4F4C02A09564673D4D5680874E6EFBC065E84C80F0658043B7001E763E12721AE7AF953042687486F99EF509AC21AE0FD17A50F0DA2C39F03883EC36E968069CE280AE317E776F710117C93857366F1DBE335D8D0DCFF1A5D229746C90561AD36C6FB18B9DFA28C5E10EF1C51FC99BA2520FBBCF7C3EE00838873E6BA384D2FC198B1378DC0B72E01AF083D39EE0DC756A75D3B21D300F9A1DE0B91D6D1AF25E9CA13D15328DE88814CE7913489FA315AFAA49BA825A959D482A255544ED6575406D64D524E691634276895B3A01ACCC7CB476878272F87DD7F2F6FB3CDDBB416D4D4388315127FC00427B08C797788529C90D50874593776E12CE4C3C798BEF8DE9473FA82826C68566BCD867C11187E36E4B0FB3F1B7231A1F8D1F79857D2E1E85312037C277AFDA9AA7DCE49926D7B3A08DDDC36F3EDAC01A6E97296A691EBE7B34013F4E2210B517EF0E1ACF6F845D11B3906021D0343F7D9960725D0375B36AA5B728E034CB175E61641C1294A5DE4A96A840E793D042B77548D60AB588828DCF70A4FB0749CB046881D825298A93EA1EAB4F089EBC72868D592D4B2E316C6FA5EF1906BCE718C0963D8AA892ECCF5A10F2640C5471A94360D8D9D9AC5351BA2C16B358D799B0BBB1A772522B1159B6CF19D0D76C9FDB71731CC668D6DC1389B55D2450063186F1706CACF2A5D0D403EB8EC9B814A2726838172976A2B062A6A6C07062AAAE4D519687144ED3AFED27975DFCC533C286F7F5B6F54D70E6C53D0C79E9966E17B421B0A2D70A29AE7F99C55E227AA399C819CFC7C967257573611063EC3540CD9ACFC5DAD1FEA3483C846D404B832B416507E01A8002913AA8770652CAF513AEE45F4802DE36E8DB07CED97606B36A062D72F426B84E6EB52D9383B9D3EAA9E55D6A01879A7C3420D476310F2E22576BC83524C715955315D7CE13EDE70AD637C301A14D4E2B91A94547666702D95A6D9AE259D43D6C725DB484B92FB64D052D999C1B5C46DB45D491AA7A0875BB0918AC42D7CA0C956463AAADDA6AA1B3B4572142F183B862CAAF1358A639F2C6B5955BCC49A152955D31F66FDD38DC202C371534DD651256DC58946095A62A9165883A4977E92D27344D11CB138CFD40B1532EDDE6A58FE4B96F5ED531DC4721F28A9D9DF95E909D7F6C246AB7A221CE012BA173277268FA16B065FDFDC62296E284089266C3F8D822C2466EFCADCBAB8BCABB72F4A5484B123C9AF784F8AAA141F57D47BA7515167C4102354792EEB8F9219C2A4EBD2EFAC6BDBE48B9A51CAD0541DC514AEDAD9A8995C98EE2325BB86FD07AA15E1656614CF47A903F0A29E18B5940605AC56D71D55CC3AA9638A35DD11A5D4923AA454D543CA7A02892064BD622D3C8346F514DD39A829237574B5B63BB22679A40EADA95E035B23B35CD71D55935F5207D65477C75E259BC82BE81EEF59C603CB7A9B5671A0DD6CD73260BCCC7238CCA657BBB7AF03D58A7B62F19B79058C97EFA529194F75EB995211C4D8CC940C18E63547B8EE16979CC63B7A33A670872D2CEB4D77F866BC7E06FBA266A19CE864928A7B75B2934E70637E9A6A7F2CA31CAF0A12DB2AD5085BFA734A71386204A3D92FC134F0315BC04B826B44FC054E6991B7611F1F1E1D4B4F6EF6E7F98B93A65EA0398D9ADEC08863B685142CF28812F701256A42C4064F4456A04AACF98A78F86962FF96B73ACDC316ECAFBCF8C0BA4A3F13FF970C2AEE930C5BBFAB099EC3A4CC379FADF6F4814377AD5EFDEF6BD1F4C0BA4D60C69C5A87922ED71961F1D9432F698AA61B48B3F66388D73BA184F7065A546942ACFFBC60EED3419E169452FE33444FFFEA2B9AF6F9C046889A270243E10DA242D3138075B08CE9FF1E7CD23CFDBF5F67F5CF01D611CDF814C027FDC1E48700DD97A1B2E50EB71ACD81681B4B52AEE7D644EA8DB22A77BD3729F9D61B4D7435A7BA07DC0679D36B58C62B4B391E6C77D464140F86BD4BD37EF134E27DC91C5EE574EC3661789B39C20DB7417FABD4E03D4866D324E7EC3E0178DBB6660AE2EE791665BF34DF3D33369EB2B5FB64DE6D1B9B29CCBBE7C6D62B6577CF6C6D57FBE78E2DADF316BAF3045C3597C87019A38B05B725D816817338E1CF233082C2A32CDE45EA33BA9AB2515B18AE48CC4CCDA964326365E2287C158A66B6FDFACA37FCC6CE729A66B68604CC26DE7CFD6FE4CD699A791BD21A77911AAC4D2CD4A56BB7AC634DB94FAF291558E8494BE6799BCFDA78B3FE9A327F07518A307B0C77C4AF27D17710950C39757A24F6AAD7BDB077D67E4111F6EFD45FAE20D8EF2912EC0ABB664573451651B9794B1295245284E61A53E4C1967A96507F815C0AD52CC69C3FECCEE376ECA6638EBD2B729BD138A3D0651CCE0321E0C59C8026FE79F6B228F3F836CE7FA364882E80983E8BCDDF929F323FF02AB92F3531210304F32E7844978D256591DDE573857413918E405C7D9553748FC33800B0F496CCD0235E473630BF8F7889DCE75504D004D23E10A2DAC7E73E5A26284C39C6AA3D7C820D7BE1D3FBFF03F924F49648540000, N'6.1.3-40302')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'05ab66bf-9ce0-4a9e-9e29-8303029c9da4', N'bbrunoale@gmail.com', 0, N'APlRkSY2V7dsqysUp1KmYE0OYOOcx4AsTz9O58c9zh49lv2fVfusUES3ltk+r6QenQ==', N'ef86f365-360c-46d2-bd2c-571efdc742d4', NULL, 0, 0, NULL, 1, 0, N'bbrunoale@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'53819e70-1695-488c-b93f-4e0c92e8f475', N'edsonsantosgg@gmail.com', 0, N'AExrweQgZItldG4IoefyoFCByKchUevbGLisXD1IswB0UGaRzErGPPHkLZCT07B9dg==', N'18a00d72-7bf3-4037-8661-0bb1ff3f893b', NULL, 0, 0, NULL, 1, 0, N'edsonsantosgg@gmail.com')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName]) VALUES (N'dd14184d-9850-4962-9962-81d1ccc42675', N'paulo1988cesar@msn.com', 0, N'AI6X4IHOseX6PVhZtQ4cd7+X5klhu5rjWhMpyZVj5Q+cPHGMxogfj1OIWcBWJNjvxw==', N'956f3718-d10c-42bb-ad7a-41b12004adf8', NULL, 0, 0, NULL, 1, 0, N'paulo1988cesar@msn.com')
GO
SET IDENTITY_INSERT [dbo].[EMPRESTIMO] ON 

GO
INSERT [dbo].[EMPRESTIMO] ([CODEMPRESTIMO], [CODUSER], [CODGAME], [DATAEMPRESTIMO]) VALUES (2, N'05ab66bf-9ce0-4a9e-9e29-8303029c9da4', 5, CAST(0x283E0B00 AS Date))
GO
INSERT [dbo].[EMPRESTIMO] ([CODEMPRESTIMO], [CODUSER], [CODGAME], [DATAEMPRESTIMO]) VALUES (3, N'53819e70-1695-488c-b93f-4e0c92e8f475', 12, CAST(0x283E0B00 AS Date))
GO
INSERT [dbo].[EMPRESTIMO] ([CODEMPRESTIMO], [CODUSER], [CODGAME], [DATAEMPRESTIMO]) VALUES (4, N'53819e70-1695-488c-b93f-4e0c92e8f475', 6, CAST(0x283E0B00 AS Date))
GO
INSERT [dbo].[EMPRESTIMO] ([CODEMPRESTIMO], [CODUSER], [CODGAME], [DATAEMPRESTIMO]) VALUES (5, N'53819e70-1695-488c-b93f-4e0c92e8f475', 8, CAST(0x283E0B00 AS Date))
GO
INSERT [dbo].[EMPRESTIMO] ([CODEMPRESTIMO], [CODUSER], [CODGAME], [DATAEMPRESTIMO]) VALUES (6, N'53819e70-1695-488c-b93f-4e0c92e8f475', 3, CAST(0x283E0B00 AS Date))
GO
SET IDENTITY_INSERT [dbo].[EMPRESTIMO] OFF
GO
SET IDENTITY_INSERT [dbo].[GAME] ON 

GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (1, 1, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Halo 2', 2013, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (2, 3, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Need for Speed Underground', 2010, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (3, 1, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Sea of Thieves', 2017, 1)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (4, 3, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Dead Space', 2011, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (5, 1, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Dead Space 2', 2012, 1)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (6, 3, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Dead Space 3', 2013, 1)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (7, 2, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Injustice 2', 2017, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (8, 3, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Borderlands 2', 2012, 1)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (9, 2, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Forza Horizon 3', 2016, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (10, 2, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Extinction', 2018, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (11, 3, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Fifa 2018', 2017, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (12, 1, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Destiny', 2014, 1)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (13, 5, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Mario Party 8', 2007, 0)
GO
INSERT [dbo].[GAME] ([CODGAME], [CODPLATAFORMA], [CODUSER], [DESCRICAO], [ANO], [TITULOEMPRESTADO]) VALUES (14, 5, N'dd14184d-9850-4962-9962-81d1ccc42675', N'Wii Sports', 2006, 0)
GO
SET IDENTITY_INSERT [dbo].[GAME] OFF
GO
SET IDENTITY_INSERT [dbo].[PLATAFORMA] ON 

GO
INSERT [dbo].[PLATAFORMA] ([CODPLATAFORMA], [DESCRICAO]) VALUES (1, N'MICROSOFT XBOX 360')
GO
INSERT [dbo].[PLATAFORMA] ([CODPLATAFORMA], [DESCRICAO]) VALUES (2, N'MICROSOFT XBOX ONE')
GO
INSERT [dbo].[PLATAFORMA] ([CODPLATAFORMA], [DESCRICAO]) VALUES (3, N'PC')
GO
INSERT [dbo].[PLATAFORMA] ([CODPLATAFORMA], [DESCRICAO]) VALUES (5, N'Nitendo Wi')
GO
SET IDENTITY_INSERT [dbo].[PLATAFORMA] OFF
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[EMPRESTIMO]  WITH CHECK ADD  CONSTRAINT [FK_EMPRESTIMO_GAME] FOREIGN KEY([CODGAME])
REFERENCES [dbo].[GAME] ([CODGAME])
GO
ALTER TABLE [dbo].[EMPRESTIMO] CHECK CONSTRAINT [FK_EMPRESTIMO_GAME]
GO
ALTER TABLE [dbo].[EMPRESTIMO]  WITH CHECK ADD  CONSTRAINT [FK_EMPRESTIMO_USUARIO] FOREIGN KEY([CODUSER])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[EMPRESTIMO] CHECK CONSTRAINT [FK_EMPRESTIMO_USUARIO]
GO
ALTER TABLE [dbo].[GAME]  WITH CHECK ADD  CONSTRAINT [FK_GAME_PLATAFORMA] FOREIGN KEY([CODPLATAFORMA])
REFERENCES [dbo].[PLATAFORMA] ([CODPLATAFORMA])
GO
ALTER TABLE [dbo].[GAME] CHECK CONSTRAINT [FK_GAME_PLATAFORMA]
GO
ALTER TABLE [dbo].[GAME]  WITH CHECK ADD  CONSTRAINT [FK_GAME_USER] FOREIGN KEY([CODUSER])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[GAME] CHECK CONSTRAINT [FK_GAME_USER]
GO
