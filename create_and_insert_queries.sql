GO
/****** Object:  Table [dbo].[Address]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[PK_Address_ID] [tinyint] NOT NULL,
	[Street_Name] [nvarchar](100) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[Zip_Code] [int] NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[PK_Address_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Coupons]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coupons](
	[Coupon_Code] [tinyint] NOT NULL,
	[Coupon_Name] [nvarchar](50) NOT NULL,
	[Terms_and_Conditions] [nvarchar](100) NULL,
	[Discount] [float] NULL,
 CONSTRAINT [PK_Coupon] PRIMARY KEY CLUSTERED 
(
	[Coupon_Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[PK_Customer_ID] [tinyint] NOT NULL,
	[Customer_First_Name] [nvarchar](50) NOT NULL,
	[Customer_Last_Name] [nvarchar](50) NOT NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Email_Address] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FK_Address_ID] [tinyint] NULL,
	[Card_Number] [bigint] NOT NULL,
	[Card_Holder_Name] [nvarchar](50) NOT NULL,
	[Expiry_Date] [date] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[PK_Customer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_Partner]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Partner](
	[PK_Partner_ID] [tinyint] NOT NULL,
	[Partner_Name] [nvarchar](50) NOT NULL,
	[FK_Address_ID] [tinyint] NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Overall_Partner_Rating] [float] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Delivery_Partner] PRIMARY KEY CLUSTERED 
(
	[PK_Partner_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Delivery_Rating]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_Rating](
	[FK_Order_ID] [tinyint] NOT NULL,
	[Partner_Rating] [tinyint] NOT NULL,
	[Comments] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[PK_Item_ID] [tinyint] NOT NULL,
	[Item_Name] [nvarchar](50) NOT NULL,
	[Ingredients] [nvarchar](100) NOT NULL,
	[Price] [smallint] NULL,
	[Calories] [smallint] NOT NULL,
	[Availability] [nvarchar](1) NULL,
	[FK_Restaurant_ID] [tinyint] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[PK_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[PK_Order_ID] [tinyint] NOT NULL,
	[Item_SubTotal_Price] [tinyint] NOT NULL,
	[Tax] [float] NOT NULL,
	[Item_Total_Price] [float] NULL,
	[Order_Time] [datetime] NULL,
	[Order_Status] [nvarchar](50) NOT NULL,
	[Order_Preferences] [nvarchar](50) NULL,
	[FK_Customer_ID] [tinyint] NOT NULL,
	[FK_Partner_ID] [tinyint] NOT NULL,
	[FK_Payment_ID] [tinyint] NOT NULL,
	[FK_Coupon_Code] [tinyint] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[PK_Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Quantity]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Quantity](
	[FK_Order_ID] [tinyint] NOT NULL,
	[FK_Item_ID] [tinyint] NOT NULL,
	[Quantity] [tinyint] NOT NULL,
 CONSTRAINT [PK_Order_Subtotal] PRIMARY KEY CLUSTERED 
(
	[FK_Order_ID] ASC,
	[FK_Item_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[PK_Payment_ID] [tinyint] NOT NULL,
	[Mode_of_Payment] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[PK_Payment_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurant_Rating]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurant_Rating](
	[FK_Order_ID] [tinyint] NOT NULL,
	[Restaurant_Rating] [float] NOT NULL,
	[Comments] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Restaurants]    Script Date: 12/20/2021 1:21:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Restaurants](
	[PK_Restaurant_ID] [tinyint] NOT NULL,
	[Restaurant_Name] [nvarchar](50) NOT NULL,
	[FK_Address_ID] [tinyint] NULL,
	[Phone_Number] [nvarchar](50) NOT NULL,
	[Overall_Restaurant_Rating] [float] NOT NULL,
 CONSTRAINT [PK_Restaurants] PRIMARY KEY CLUSTERED 
(
	[PK_Restaurant_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (1, N'462-9844 Fringilla Rd.', N'Buffalo', N'New York', N'USA', 62464)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (2, N'487-396 Maecenas Road', N'Buffalo', N'New York', N'USA', 10703)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (3, N'Ap #287-6583 Velit. Av.', N'Buffalo', N'New York', N'USA', 41323)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (4, N'490-8039 Auctor Road', N'Buffalo', N'New York', N'USA', 21306)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (5, N'7970 Accumsan Street', N'Buffalo', N'New York', N'USA', 29149)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (6, N'Ap #893-9170 Nunc Av.', N'Buffalo', N'New York', N'USA', 97948)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (7, N'412-6187 Nulla Ave', N'Buffalo', N'New York', N'USA', 67984)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (8, N'144-4983 Varius Rd.', N'Buffalo', N'New York', N'USA', 67423)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (9, N'605-5681 Et Road', N'Buffalo', N'New York', N'USA', 36598)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (10, N'4554 Libero. St.', N'Buffalo', N'New York', N'USA', 71446)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (11, N'6197 Aptent Rd.', N'Buffalo', N'New York', N'USA', 52769)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (12, N'733-9132 Feugiat Street', N'Buffalo', N'New York', N'USA', 76065)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (13, N'863-7787 Cursus. Ave', N'Buffalo', N'New York', N'USA', 77784)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (14, N'3742 Hendrerit Av.', N'Buffalo', N'New York', N'USA', 88842)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (15, N'280-9058 Tempor Road', N'Buffalo', N'New York', N'USA', 75366)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (16, N'Ap #946-2685 Accumsan Road', N'Buffalo', N'New York', N'USA', 98118)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (17, N'985-3948 Interdum. Rd.', N'Buffalo', N'New York', N'USA', 54524)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (18, N'Ap #227-229 Imperdiet St.', N'Buffalo', N'New York', N'USA', 40136)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (19, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 17106)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (20, N'Ap #820-6393 Curae Rd.', N'Buffalo', N'New York', N'USA', 21003)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (21, N'479-4024 Amet St.', N'Buffalo', N'New York', N'USA', 65663)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (22, N'7051 Quisque St.', N'Buffalo', N'New York', N'USA', 44810)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (23, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 21166)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (24, N'306-8954 Integer Road', N'Buffalo', N'New York', N'USA', 43663)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (25, N'611-6328 Nullam St.', N'Buffalo', N'New York', N'USA', 65568)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (26, N'499 Et Road', N'Buffalo', N'New York', N'USA', 45809)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (27, N'1092 Aliquam Rd.', N'Buffalo', N'New York', N'USA', 91691)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (28, N'375-8926 Ultricies Av.', N'Buffalo', N'New York', N'USA', 68853)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (29, N'290-5257 Duis Rd.', N'Buffalo', N'New York', N'USA', 88226)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (30, N'5857 Aliquam Rd.', N'Buffalo', N'New York', N'USA', 99892)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (31, N'Ap #746-5133 Dictum Av.', N'Buffalo', N'New York', N'USA', 32556)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (32, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 71127)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (33, N'Ap #594-6226 Ultrices Ave', N'Buffalo', N'New York', N'USA', 78443)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (34, N'988-5053 Sed St.', N'Buffalo', N'New York', N'USA', 35484)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (35, N'273-8236 Ultrices St.', N'Buffalo', N'New York', N'USA', 82734)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (36, N'Ap #558-3879 Dolor. Avenue', N'Buffalo', N'New York', N'USA', 65627)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (37, N'828-9675 Donec Av.', N'Buffalo', N'New York', N'USA', 22633)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (38, N'950-2171 Turpis Rd.', N'Buffalo', N'New York', N'USA', 93637)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (39, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 50677)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (40, N'6646 Ut Street', N'Buffalo', N'New York', N'USA', 66362)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (41, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 96651)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (42, N'Ap #313-4697 Ac Rd.', N'Buffalo', N'New York', N'USA', 91148)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (43, N'168-3844 Faucibus Avenue', N'Buffalo', N'New York', N'USA', 73359)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (44, N'212-140 Amet St.', N'Buffalo', N'New York', N'USA', 75603)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (45, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 71764)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (46, N'883-8361 Nonummy Avenue', N'Buffalo', N'New York', N'USA', 78736)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (47, N'Ap #625-3902 Nulla Av.', N'Buffalo', N'New York', N'USA', 85827)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (48, N'6876 Dictum Rd.', N'Buffalo', N'New York', N'USA', 86339)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (49, N'462-9844 Fringilla Rd.,62464,Illinois,United States', N'Buffalo', N'New York', N'USA', 69852)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (50, N'1789 Tellus St.', N'Buffalo', N'New York', N'USA', 72211)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (51, N'Ap #464-9140 Nibh Street', N'Buffalo', N'New York', N'USA', 38776)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (52, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 85447)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (53, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 72597)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (54, N'Ap #255-9125 Nullam Road', N'Buffalo', N'New York', N'USA', 20390)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (55, N'191-4271 Orci. Ave', N'Buffalo', N'New York', N'USA', 64442)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (56, N'736-1897 Velit. Av.', N'Buffalo', N'New York', N'USA', 25803)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (57, N'Ap #102-8408 Lobortis. Ave', N'Buffalo', N'New York', N'USA', 98855)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (58, N'4907 Aliquet. St.', N'Buffalo', N'New York', N'USA', 56814)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (59, N'991-4943 Sem Street', N'Buffalo', N'New York', N'USA', 99734)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (60, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 91573)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (61, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 28492)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (62, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 57448)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (63, N'Ap #712-7807 Ligula. Ave', N'Buffalo', N'New York', N'USA', 81288)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (64, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 48063)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (65, N'339-332 Sed Avenue', N'Buffalo', N'New York', N'USA', 27804)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (66, N'Ap #577-6594 Vehicula. Av.', N'Buffalo', N'New York', N'USA', 57036)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (67, N'Ap #857-2969 Donec Rd.', N'Buffalo', N'New York', N'USA', 14321)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (68, N'9123 In Rd.', N'Buffalo', N'New York', N'USA', 87483)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (69, N'Ap #705-3592 Mauris St.', N'Buffalo', N'New York', N'USA', 28753)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (70, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 46714)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (71, N'491-5648 Quisque Road', N'Buffalo', N'New York', N'USA', 35177)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (72, N'310-7987 Nibh St.', N'Buffalo', N'New York', N'USA', 86417)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (73, N'220-2284 Dis Street', N'Buffalo', N'New York', N'USA', 71168)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (74, N'Ap #244-9142 Tempor Rd.', N'Buffalo', N'New York', N'USA', 77825)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (75, N'Ap #476-8114 Nulla Rd.', N'Buffalo', N'New York', N'USA', 72313)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (76, N'Ap #748-8686 In Avenue', N'Buffalo', N'New York', N'USA', 21388)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (77, N'Ap #316-2827 Commodo Rd.', N'Buffalo', N'New York', N'USA', 79138)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (78, N'Ap #910-5224 Dolor St.', N'Buffalo', N'New York', N'USA', 32232)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (79, N'Ap #782-7877 Aliquam Rd.', N'Buffalo', N'New York', N'USA', 20944)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (80, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 22801)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (81, N'Ap #254-7673 Malesuada Rd.', N'Buffalo', N'New York', N'USA', 31379)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (82, N'571-6855 Odio. Av.', N'Buffalo', N'New York', N'USA', 35236)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (83, N'Ap #672-7485 Gravida Ave', N'Buffalo', N'New York', N'USA', 35148)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (84, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 85613)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (85, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 11397)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (86, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 86402)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (87, N'Ap #853-5926 Commodo St.', N'Buffalo', N'New York', N'USA', 63905)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (88, N'931-2367 Lectus Rd.', N'Buffalo', N'New York', N'USA', 91330)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (89, N'285-9688 Nunc. St.', N'Buffalo', N'New York', N'USA', 75711)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (90, N'386-748 Nulla Road', N'Buffalo', N'New York', N'USA', 84864)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (91, N'590-4600 Ornare Ave', N'Buffalo', N'New York', N'USA', 13111)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (92, N'864-9346 Et Ave', N'Buffalo', N'New York', N'USA', 77197)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (93, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 26310)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (94, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 72482)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (95, N'Ap #762-4451 Mi Rd.', N'Buffalo', N'New York', N'USA', 92518)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (96, N'Ap #280-9736 Cursus. St.', N'Buffalo', N'New York', N'USA', 96876)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (97, N'668-1176 Auctor St.', N'Buffalo', N'New York', N'USA', 62223)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (98, N'185-2594 Etiam Rd.', N'Buffalo', N'New York', N'USA', 25722)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (99, N'7567 Sem Avenue', N'Buffalo', N'New York', N'USA', 82560)
GO
INSERT [dbo].[Address] ([PK_Address_ID], [Street_Name], [City], [State], [Country], [Zip_Code]) VALUES (100, N'Ap #464-9140 Nibh Street,38776,Montana,United States', N'Buffalo', N'New York', N'USA', 39821)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (1, N'M48yP', N'Get a discount of 2$', 2)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (2, N'K49vx', N'Get a discount of 1$', 1)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (3, N'F16pp', N'Get a discount of 2$', 2)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (4, N'I32wX', N'Get a discount of 1$', 1)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (5, N'W42m3', N'Get a discount of 2$', 2)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (6, N'D83zA', N'Get a discount of 1$', 1)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (7, N'F78pR', N'Get a discount of 1$', 1)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (8, N'W20mw', N'Get a discount of 1$', 1)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (9, N'O93bQ', N'Get a discount of 2$', 2)
GO
INSERT [dbo].[Coupons] ([Coupon_Code], [Coupon_Name], [Terms_and_Conditions], [Discount]) VALUES (10, N'A73nH', N'Get a discount of 2$', 2)
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (1, N'Ruprecht', N'Maase', N'360-317-5601', N'rmaase0@networksolutions.com', N'rmaase0', N'uxMDEWVjY3Q', 1, 5504360000000000, N'Ruprecht Maase', CAST(N'2024-03-22' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (2, N'Inez', N'Kenrat', N'466-436-3747', N'ikenrat1@buzzfeed.com', N'ikenrat1', N'2gCVeItt9t', 2, 374288000000000, N'Inez Kenrat', CAST(N'2023-01-27' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (3, N'Samantha', N'Stenson', N'900-338-7394', N'sstenson2@barnesandnoble.com', N'sstenson2', N'HwH0XA6WHfj', 3, 5602260000000000, N'Samantha Stenson', CAST(N'2024-06-28' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (4, N'Jourdain', N'Hryskiewicz', N'827-468-1667', N'jhryskiewicz3@opera.com', N'jhryskiewicz3', N'lKkLdG', 4, 3555140000000000, N'Jourdain Hryskiewicz', CAST(N'2023-05-07' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (5, N'Gabriel', N'Eagger', N'817-796-1849', N'geagger4@hatena.ne.jp', N'geagger4', N'vHx5hmx', 5, 4913760000000000, N'Gabriel Eagger', CAST(N'2024-11-12' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (6, N'Winn', N'Bunney', N'865-655-1929', N'wbunney5@nymag.com', N'wbunney5', N'TMsgqflhYvFa', 6, 340360000000000, N'Winn Bunney', CAST(N'2022-02-21' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (7, N'Amberly', N'Hasnip', N'466-737-0560', N'ahasnip6@mozilla.com', N'ahasnip6', N'dCT1ieDc6fl7', 7, 5108760000000000, N'Amberly Hasnip', CAST(N'2023-12-31' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (8, N'Corbett', N'People', N'574-838-6408', N'cpeople7@diigo.com', N'cpeople7', N'zVOrQ1rNM', 8, 3530030000000000, N'Corbett People', CAST(N'2023-06-09' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (9, N'Briano', N'Henkmann', N'925-999-8122', N'bhenkmann8@blinklist.com', N'bhenkmann8', N'1PRnwv9i79', 9, 6771680000000000000, N'Briano Henkmann', CAST(N'2023-03-08' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (10, N'Christy', N'Fishley', N'554-326-7659', N'cfishley9@hc360.com', N'cfishley9', N'GLfUCBrASJ', 10, 56022200000000000, N'Christy Fishley', CAST(N'2022-08-15' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (11, N'Dewie', N'Kettel', N'699-576-7766', N'dkettela@jiathis.com', N'dkettela', N'sOW5LI', 11, 6763110000000000000, N'Dewie Kettel', CAST(N'2025-04-01' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (12, N'Maximilianus', N'Gollop', N'570-739-3459', N'mgollopb@addthis.com', N'mgollopb', N'0sj3vfyVy0', 12, 6761660000000000000, N'Maximilianus Gollop', CAST(N'2022-12-12' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (13, N'Archibaldo', N'Christy', N'429-719-6996', N'achristyc@redcross.org', N'achristyc', N'pVYOGoZ', 13, 3532730000000000, N'Archibaldo Christy', CAST(N'2025-06-30' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (14, N'Gerty', N'Siss', N'481-233-9218', N'gsissd@webmd.com', N'gsissd', N'OC5VJtz', 14, 3558080000000000, N'Gerty Siss', CAST(N'2025-02-10' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (15, N'Rand', N'Pavlov', N'206-477-1962', N'rpavlove@umich.edu', N'rpavlove', N'RxNWkZ', 15, 3559430000000000, N'Rand Pavlov', CAST(N'2022-02-09' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (16, N'Karoline', N'Adnams', N'541-643-6924', N'kadnamsf@rakuten.co.jp', N'kadnamsf', N'DNwiMQ', 16, 670685000000000000, N'Karoline Adnams', CAST(N'2021-11-11' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (17, N'Town', N'Frill', N'285-206-6953', N'tfrillg@google.ca', N'tfrillg', N'Hponto4', 17, 3541110000000000, N'Town Frill', CAST(N'2021-08-05' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (18, N'Kamillah', N'Olyet', N'343-637-4524', N'kolyeth@list-manage.com', N'kolyeth', N'hNWmg3', 18, 346183000000000, N'Kamillah Olyet', CAST(N'2025-10-01' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (19, N'Glori', N'Whittock', N'816-850-8757', N'gwhittocki@wordpress.org', N'gwhittocki', N'yrHwEacdO', 19, 3555660000000000, N'Glori Whittock', CAST(N'2024-01-15' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (20, N'Jemimah', N'Ellingsworth', N'471-671-4216', N'jellingsworthj@nifty.com', N'jellingsworthj', N'pxgAhsNHuRb', 20, 201849000000000, N'Jemimah Ellingsworth', CAST(N'2024-02-19' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (21, N'Brigitte', N'Ridehalgh', N'929-786-5175', N'bridehalghk@nyu.edu', N'bridehalghk', N'IIlTelRBVeA', 21, 5010130000000000, N'Brigitte Ridehalgh', CAST(N'2023-08-02' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (22, N'Ruy', N'Percival', N'561-223-7099', N'rpercivall@yelp.com', N'rpercivall', N'uxYuV78qkG', 22, 6771330000000000, N'Ruy Percival', CAST(N'2022-11-02' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (23, N'Jemmy', N'Hagwood', N'823-142-2990', N'jhagwoodm@dot.gov', N'jhagwoodm', N'O2c3JY', 23, 4792120000000000, N'Jemmy Hagwood', CAST(N'2024-03-29' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (24, N'Ronica', N'Dragoe', N'924-108-0086', N'rdragoen@odnoklassniki.ru', N'rdragoen', N'QawfJuOMc', 24, 30449200000000, N'Ronica Dragoe', CAST(N'2024-04-27' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (25, N'Saxe', N'Pawels', N'834-967-3015', N'spawelso@theatlantic.com', N'spawelso', N'lEG1gGd8ot', 25, 3550300000000000, N'Saxe Pawels', CAST(N'2024-11-24' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (26, N'Ariadne', N'Lawland', N'825-707-3827', N'alawlandp@nih.gov', N'alawlandp', N'Y1WWtnZ', 26, 3571530000000000, N'Ariadne Lawland', CAST(N'2021-10-20' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (27, N'Kitti', N'Grimsell', N'946-598-7898', N'kgrimsellq@163.com', N'kgrimsellq', N'olrJdIlJ', 27, 201691000000000, N'Kitti Grimsell', CAST(N'2024-05-10' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (28, N'Kaylee', N'Cambell', N'946-743-1833', N'kcambellr@technorati.com', N'kcambellr', N'MW6oD4', 28, 4026850000000000, N'Kaylee Cambell', CAST(N'2022-12-02' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (29, N'Kingston', N'Parriss', N'745-904-1609', N'kparrisss@mashable.com', N'kparrisss', N'SmBXSN9', 29, 502004000000000000, N'Kingston Parriss', CAST(N'2024-05-08' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (30, N'Israel', N'Stud', N'577-485-5896', N'istudt@hugedomains.com', N'istudt', N'28NbIz', 30, 5100140000000000, N'Israel Stud', CAST(N'2024-11-13' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (31, N'Aleta', N'Goghin', N'929-158-1926', N'agoghinu@google.com', N'agoghinu', N'c7GXde4kO7sX', 31, 4026550000000000, N'Aleta Goghin', CAST(N'2021-10-13' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (32, N'Olga', N'Pordal', N'817-190-4202', N'opordalv@typepad.com', N'opordalv', N'gMAjIQiIEq', 32, 5115800000000000, N'Olga Pordal', CAST(N'2024-03-21' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (33, N'Lucina', N'Ferrieres', N'388-534-0139', N'lferrieresw@simplemachines.org', N'lferrieresw', N'XPM3Qnzcv', 33, 6396550000000000, N'Lucina Ferrieres', CAST(N'2022-03-21' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (34, N'Cirilo', N'Halsworth', N'577-331-1651', N'chalsworthx@prweb.com', N'chalsworthx', N'5O3qMC4N', 34, 3589840000000000, N'Cirilo Halsworth', CAST(N'2023-08-29' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (35, N'Valaree', N'Harman', N'280-651-3869', N'vharmany@amazon.de', N'vharmany', N'rESYR3', 35, 5100140000000000, N'Valaree Harman', CAST(N'2025-09-27' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (36, N'Caz', N'Courtes', N'383-772-1900', N'ccourtesz@mac.com', N'ccourtesz', N'HP1r8wM', 36, 3588210000000000, N'Caz Courtes', CAST(N'2023-05-19' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (37, N'Jules', N'Yude', N'873-591-3301', N'jyude10@nymag.com', N'jyude10', N'Wm54FR', 37, 3570230000000000, N'Jules Yude', CAST(N'2023-11-29' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (38, N'Orson', N'Guinn', N'483-138-1003', N'oguinn11@house.gov', N'oguinn11', N'zjOJIPUysj', 38, 3547080000000000, N'Orson Guinn', CAST(N'2021-10-07' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (39, N'Barn', N'Durtnall', N'486-137-2747', N'bdurtnall12@wunderground.com', N'bdurtnall12', N'UBj64Sm8', 39, 5002350000000000, N'Barn Durtnall', CAST(N'2023-02-15' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (40, N'Marion', N'Benezet', N'188-330-0407', N'mbenezet13@quantcast.com', N'mbenezet13', N'vrSripKgJf', 40, 3564030000000000, N'Marion Benezet', CAST(N'2023-01-27' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (41, N'Haskel', N'Rasper', N'403-452-5313', N'hrasper14@twitpic.com', N'hrasper14', N'VHlUD5N7BSTS', 41, 5602240000000000, N'Haskel Rasper', CAST(N'2024-08-07' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (42, N'Grace', N'Becerro', N'474-227-4595', N'gbecerro15@ihg.com', N'gbecerro15', N'fix6AL', 42, 3576780000000000, N'Grace Becerro', CAST(N'2024-01-05' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (43, N'Basile', N'Vakhrushev', N'428-321-6741', N'bvakhrushev16@cloudflare.com', N'bvakhrushev16', N'38JcgDaj8c', 43, 3585830000000000, N'Basile Vakhrushev', CAST(N'2023-06-09' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (44, N'Carmela', N'MacAlpin', N'870-172-4018', N'cmacalpin17@omniture.com', N'cmacalpin17', N'YxsxNtx', 44, 3543160000000000, N'Carmela MacAlpin', CAST(N'2022-03-11' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (45, N'Kirbie', N'Noell', N'612-630-8975', N'knoell18@mit.edu', N'knoell18', N'fUORpR', 45, 3568380000000000, N'Kirbie Noell', CAST(N'2025-06-26' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (46, N'Stace', N'Verdon', N'963-223-1114', N'sverdon19@nasa.gov', N'sverdon19', N'uxLbGPNH', 46, 3550780000000000, N'Stace Verdon', CAST(N'2024-08-22' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (47, N'Grady', N'Vigrass', N'769-473-3952', N'gvigrass1a@msu.edu', N'gvigrass1a', N'32ZeVGGLATar', 47, 4041370000000, N'Grady Vigrass', CAST(N'2023-08-10' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (48, N'Simonne', N'Pagnin', N'852-560-5338', N'spagnin1b@meetup.com', N'spagnin1b', N'QpkvcVerk2y', 48, 3557660000000000, N'Simonne Pagnin', CAST(N'2023-11-29' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (49, N'Paige', N'Duce', N'785-806-7319', N'pduce1c@ask.com', N'pduce1c', N'HbApc1', 49, 6392320000000000, N'Paige Duce', CAST(N'2022-08-08' AS Date))
GO
INSERT [dbo].[Customer] ([PK_Customer_ID], [Customer_First_Name], [Customer_Last_Name], [Phone_Number], [Email_Address], [Username], [Password], [FK_Address_ID], [Card_Number], [Card_Holder_Name], [Expiry_Date]) VALUES (50, N'Donielle', N'Greenfield', N'352-675-7886', N'dgreenfield1d@japanpost.jp', N'dgreenfield1d', N'BKfcmcp6ox', 50, 3545510000000000, N'Donielle Greenfield', CAST(N'2024-01-13' AS Date))
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (1, N'Denton Farmer', 76, N'1-266-697-5204', 4, N'Denton', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (2, N'Tanner Miles', 77, N'1-332-622-5176', 3, N'Tanner', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (3, N'Ora Glenn', 78, N'(491) 736-6843', 5, N'Ora', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (4, N'Seth Lyons', 79, N'1-669-227-2386', 4, N'Seth', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (5, N'Lee Kent', 80, N'(678) 788-0380', 4, N'Lee', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (6, N'Kibo Figueroa', 81, N'(956) 736-4075', 4, N'Kibo', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (7, N'Jescie Whitehead', 82, N'1-780-995-8243', 4, N'Jescie', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (8, N'Carly Patrick', 83, N'1-521-831-8589', 3, N'Carly', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (9, N'Alexa Hodge', 84, N'(264) 851-7453', 3.5, N'Alexa', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (10, N'Donovan Wilkerson', 85, N'(238) 483-3073', 4, N'Donovan', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (11, N'Ishmael Graham', 86, N'(751) 601-8743', 4, N'Ishmael', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (12, N'Olivia Poole', 87, N'1-712-508-5386', 3.5, N'Olivia', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (13, N'Wylie Ratliff', 88, N'(533) 846-1387', 3.5, N'Wylie', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (14, N'Quentin Bernard', 89, N'(851) 126-7428', 3, N'Quentin', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (15, N'Kareem Holder', 90, N'(227) 250-2838', 3, N'Kareem', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (16, N'Dorothy Warren', 91, N'(365) 586-1292', 3, N'Dorothy', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (17, N'Cameran Ingram', 92, N'(566) 316-1479', 4, N'Cameran', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (18, N'Robert Clements', 93, N'(121) 195-6363', 4, N'Robert', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (19, N'Chandler Mcfadden', 94, N'(716) 251-6312', 4, N'Chandler', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (20, N'Ashton Booker', 95, N'1-278-658-5309', 3.5, N'Ashton', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (21, N'Janna Washington', 96, N'(692) 304-1831', 3.5, N'Janna', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (22, N'Marcia Horne', 97, N'1-224-652-0611', 4.5, N'Marcia', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (23, N'Holmes Carpenter', 98, N'1-521-312-8785', 4.5, N'Holmes', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (24, N'Nicholas Austin', 99, N'(426) 331-8264', 4, N'Nicholas', N'*****')
GO
INSERT [dbo].[Delivery_Partner] ([PK_Partner_ID], [Partner_Name], [FK_Address_ID], [Phone_Number], [Overall_Partner_Rating], [Username], [Password]) VALUES (25, N'Alan Harvey', 100, N'1-839-438-6695', 4.5, N'Alan', N'*****')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (1, 4, N'Good.')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (2, 5, N'Delivered food on time')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (3, 3, N'Friendly')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (4, 3, N'Good food')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (5, 3, N'Average service delivery')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (6, 3, N'Average service delivery')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (7, 3, N'Average service delivery')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (8, 3, N'Average service delivery')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (9, 2, N'Waited for long')
GO
INSERT [dbo].[Delivery_Rating] ([FK_Order_ID], [Partner_Rating], [Comments]) VALUES (10, 4, N'Delivered food on time')
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (1, N'Margherita  Pizza', N'Tomato Sauce, Mozzarella, Basil', 8, 350, NULL, 1)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (2, N'Piccolo', N'Mushrooms, Mozzarella', 9, 300, NULL, 3)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (3, N'Marinara', N'Cheese, Onions, Shrimp, Tama', 10, 350, NULL, 3)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (4, N'Hot Sea', N'Shrimp, Cheese, Tama, Chilli', 11, 250, NULL, 4)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (5, N'Oriental Chicken', N'Chicken, Mushrooms, Pepper, Cheese, Onion', 5, 200, NULL, 4)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (6, N'Hawaiin', N'Ham, Pineapple, Mozarella', 4, 300, NULL, 2)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (7, N'Greek Salad', N'Fresh mixed green topped with tomatoes, red onions, cucumbers, feta, olives, pepper', 4, 200, NULL, 2)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (8, N'Caesar Salad', N'Chicken, parmesan, lemon, caesar sauce ', 3, 250, NULL, 2)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (9, N'Italian Salad', N'Classic antipasti, green olives, feta', 5, 300, NULL, 1)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (10, N'Taco Salad', N'Ground beef, veggies, cheese, salsa, sour cream, chips', 6, 200, NULL, 1)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (11, N'BBQ Salad', N'Cherry, green onions, sweet BBQ sauce', 4, 250, NULL, 5)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (12, N'Mediterranean Salad', N'Shrimps, Salmon, cherry mint', 5, 300, NULL, 3)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (13, N'Chicken Salad', N'Cherry chicken, red onion, olives, paprika', 6, 250, NULL, 5)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (14, N'Chef', N'Roast beef, cheese, eggs, olives', 9, 250, NULL, 5)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (15, N'Crispy chicken wrap cheese & curry with chips', N'Chips, chicken,  cheese, Mayonaise', 8, 350, NULL, 4)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (16, N'Fries', N'Potato, oil', 3, 300, NULL, 6)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (17, N'Bombaloni Beans', N'Butter beans, garlic, herbs, butter, extra virgin olive oil', 4, 350, NULL, 6)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (18, N'Fresh Oysters', N'Oysters', 8, 150, NULL, 7)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (19, N'Fish Sticks', N'Fish, Tartar sauce', 9, 250, NULL, 7)
GO
INSERT [dbo].[Items] ([PK_Item_ID], [Item_Name], [Ingredients], [Price], [Calories], [Availability], [FK_Restaurant_ID]) VALUES (20, N'Kids Grilled Cheese Sandwich', N'Cheddar cheese, grilled pain de mie', 6, 300, NULL, 7)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (1, 9, 0.7875, 7.7875, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Delivered', N'No Jalepenos', 2, 1, 1, 1)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (2, 18, 1.575, 19.575, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Delivered', NULL, 4, 7, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (3, 5, 0.4375, 3.4375, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'Delivered', NULL, 5, 10, 1, 3)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (4, 11, 0.9625, 10.9625, CAST(N'2021-02-03T00:00:00.000' AS DateTime), N'Delivered', NULL, 6, 5, 2, 4)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (5, 8, 0.7, 6.6999999999999993, CAST(N'2021-05-01T00:00:00.000' AS DateTime), N'Delivered', N'No Onions', 7, 11, 2, 5)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (6, 18, 1.575, 19.575, CAST(N'2021-01-01T00:00:00.000' AS DateTime), N'Delivered', NULL, 8, 3, 2, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (7, 6, 0.525, 5.525, CAST(N'2021-05-05T00:00:00.000' AS DateTime), N'Delivered', NULL, 2, 12, 2, 2)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (8, 5, 0.4375, 5.4375, CAST(N'2021-04-04T00:00:00.000' AS DateTime), N'Delivered', N'No Mushrooms', 9, 2, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (9, 9, 0.7875, 9.7875, CAST(N'2021-03-15T00:00:00.000' AS DateTime), N'Delivered', NULL, 10, 8, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (10, 10, 0.875, 10.875, CAST(N'2021-05-15T00:00:00.000' AS DateTime), N'Delivered', NULL, 15, 6, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (11, 12, 1.05, 13.05, CAST(N'2021-04-10T00:00:00.000' AS DateTime), N'Delivered', NULL, 1, 3, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (12, 33, 2.8875, 35.8875, CAST(N'2021-05-10T00:00:00.000' AS DateTime), N'Delivered', NULL, 3, 5, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (13, 5, 0.4375, 5.4375, CAST(N'2021-05-11T00:00:00.000' AS DateTime), N'Delivered', NULL, 3, 6, 1, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (14, 4, 0.35, 4.35, CAST(N'2021-04-11T00:00:00.000' AS DateTime), N'Delivered', NULL, 11, 9, 2, NULL)
GO
INSERT [dbo].[Order] ([PK_Order_ID], [Item_SubTotal_Price], [Tax], [Item_Total_Price], [Order_Time], [Order_Status], [Order_Preferences], [FK_Customer_ID], [FK_Partner_ID], [FK_Payment_ID], [FK_Coupon_Code]) VALUES (15, 8, 0.7, 8.7, CAST(N'2021-04-12T00:00:00.000' AS DateTime), N'Delivered', NULL, 2, 2, 1, NULL)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (1, 2, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (2, 14, 2)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (3, 12, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (4, 4, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (5, 1, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (6, 14, 2)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (7, 13, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (8, 5, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (9, 14, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (10, 9, 2)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (11, 10, 2)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (12, 4, 3)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (13, 5, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (14, 6, 1)
GO
INSERT [dbo].[Order_Quantity] ([FK_Order_ID], [FK_Item_ID], [Quantity]) VALUES (15, 7, 2)
GO
INSERT [dbo].[Payment] ([PK_Payment_ID], [Mode_of_Payment], [Description]) VALUES (1, N'Card', N'The payment was made using a card')
GO
INSERT [dbo].[Payment] ([PK_Payment_ID], [Mode_of_Payment], [Description]) VALUES (2, N'Cash', N'The payment was made using cash')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (1, 4, N'Great food.')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (2, 4, N'Best chicken wings!!')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (3, 3, N'Average')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (4, 3.5, N'Good')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (5, 4, N'Great')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (6, 4.5, N'Delicious')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (7, 3, N'Shrimp tempura was crispy but greasy')
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (8, 3.5, NULL)
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (9, 3.5, NULL)
GO
INSERT [dbo].[Restaurant_Rating] ([FK_Order_ID], [Restaurant_Rating], [Comments]) VALUES (10, 2.5, N'Average')
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (1, N'Buffalo burger', 51, N'1-716-168-2334', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (2, N'Hens Nest', 52, N'(920) 788-0322', 4)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (3, N'Zetis', 53, N'(714) 415-4077', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (4, N'Texas Roadhouse', 54, N'(713) 769-5745', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (5, N'Red Robin', 55, N'1-768-416-3165', 4)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (6, N'Wegmans', 56, N'1-791-214-8170', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (7, N'Storming Crab', 57, N'1-254-995-8125', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (8, N'Wendy''s', 58, N'1-236-742-8874', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (9, N'The Dapper Goose', 59, N'1-233-882-1769', 3.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (10, N'Jack Rabbit', 60, N'(608) 660-3231', 3.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (11, N'Storming Crab', 61, N'1-556-331-3363', 4)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (12, N'Moe''s SouthwestGrill', 62, N'(916) 715-3712', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (13, N'SNY Slice of New York', 63, N'(281) 588-0474', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (14, N'Buffalo Soul', 64, N'1-725-437-1084', 4.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (15, N'Oliver', 65, N'1-955-491-5191', 4.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (16, N'Roost', 66, N'1-987-762-7788', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (17, N'West Side Bazaar', 67, N'(554) 188-3778', 2.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (18, N'Tandoori Hut', 68, N'1-276-211-8388', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (19, N'Korean Drama', 69, N'1-833-121-7210', 3)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (20, N'Japanese Sushi', 70, N'(621) 624-6814', 4)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (21, N'Indian Dosa', 71, N'1-171-856-2288', 4.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (22, N'Betty''s', 72, N'(886) 977-8873', 3.5)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (23, N'Olive Garden', 73, N'1-457-493-6577', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (24, N'Chefs', 74, N'1-448-867-5173', 2)
GO
INSERT [dbo].[Restaurants] ([PK_Restaurant_ID], [Restaurant_Name], [FK_Address_ID], [Phone_Number], [Overall_Restaurant_Rating]) VALUES (25, N'Ted hortons', 75, N'(271) 434-1535', 2)
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [fk_address_id] FOREIGN KEY([FK_Address_ID])
REFERENCES [dbo].[Address] ([PK_Address_ID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [fk_address_id]
GO
ALTER TABLE [dbo].[Delivery_Partner]  WITH CHECK ADD  CONSTRAINT [part_fk_address_id] FOREIGN KEY([FK_Address_ID])
REFERENCES [dbo].[Address] ([PK_Address_ID])
GO
ALTER TABLE [dbo].[Delivery_Partner] CHECK CONSTRAINT [part_fk_address_id]
GO
ALTER TABLE [dbo].[Delivery_Rating]  WITH CHECK ADD  CONSTRAINT [do_fk_delivery_rating] FOREIGN KEY([FK_Order_ID])
REFERENCES [dbo].[Order] ([PK_Order_ID])
GO
ALTER TABLE [dbo].[Delivery_Rating] CHECK CONSTRAINT [do_fk_delivery_rating]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [oo_fk_restaurant_id] FOREIGN KEY([FK_Restaurant_ID])
REFERENCES [dbo].[Restaurants] ([PK_Restaurant_ID])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [oo_fk_restaurant_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [oc_fk_coupon_code] FOREIGN KEY([FK_Coupon_Code])
REFERENCES [dbo].[Coupons] ([Coupon_Code])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [oc_fk_coupon_code]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [oc_fk_customer_id] FOREIGN KEY([FK_Customer_ID])
REFERENCES [dbo].[Customer] ([PK_Customer_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [oc_fk_customer_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [op_fk_partner_id] FOREIGN KEY([FK_Partner_ID])
REFERENCES [dbo].[Delivery_Partner] ([PK_Partner_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [op_fk_partner_id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [op_fk_payment_id] FOREIGN KEY([FK_Payment_ID])
REFERENCES [dbo].[Payment] ([PK_Payment_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [op_fk_payment_id]
GO
ALTER TABLE [dbo].[Order_Quantity]  WITH CHECK ADD  CONSTRAINT [oo_fk_item_id] FOREIGN KEY([FK_Item_ID])
REFERENCES [dbo].[Items] ([PK_Item_ID])
GO
ALTER TABLE [dbo].[Order_Quantity] CHECK CONSTRAINT [oo_fk_item_id]
GO
ALTER TABLE [dbo].[Order_Quantity]  WITH CHECK ADD  CONSTRAINT [oo_fk_order_id] FOREIGN KEY([FK_Order_ID])
REFERENCES [dbo].[Order] ([PK_Order_ID])
GO
ALTER TABLE [dbo].[Order_Quantity] CHECK CONSTRAINT [oo_fk_order_id]
GO
ALTER TABLE [dbo].[Restaurant_Rating]  WITH CHECK ADD  CONSTRAINT [ro_fk_restaurant_rating] FOREIGN KEY([FK_Order_ID])
REFERENCES [dbo].[Order] ([PK_Order_ID])
GO
ALTER TABLE [dbo].[Restaurant_Rating] CHECK CONSTRAINT [ro_fk_restaurant_rating]
GO
ALTER TABLE [dbo].[Restaurants]  WITH CHECK ADD  CONSTRAINT [res_fk_address_id] FOREIGN KEY([FK_Address_ID])
REFERENCES [dbo].[Address] ([PK_Address_ID])
GO
ALTER TABLE [dbo].[Restaurants] CHECK CONSTRAINT [res_fk_address_id]
GO
