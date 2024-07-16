USE [Books_DWH]
GO
/****** Object:  Table [dbo].[Dim_book]    Script Date: 1/5/2024 4:47:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_book](
	[book_id_sk] [int] IDENTITY(1,1) NOT NULL,
	[book_id_bk] [int] NULL,
	[title] [varchar](400) NULL,
	[isbn13] [varchar](13) NULL,
	[num_pages] [int] NULL,
	[publication_date] [date] NULL,
	[languag_id_bk] [int] NULL,
	[language_code] [varchar](8) NULL,
	[language_name] [varchar](50) NULL,
	[publisher_id_bk] [int] NULL,
	[publisher_name] [nvarchar](1000) NULL,
	[author_id_bk] [int] NULL,
	[author_name] [varchar](400) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_Dim_book] PRIMARY KEY CLUSTERED 
(
	[book_id_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_customer]    Script Date: 1/5/2024 4:47:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_customer](
	[customer_id_sk] [int] IDENTITY(1,1) NOT NULL,
	[customer_id_bk] [int] NULL,
	[first_name] [varchar](200) NULL,
	[last_name] [varchar](200) NULL,
	[email] [varchar](350) NULL,
	[address_id_bk] [int] NULL,
	[street_num] [varchar](10) NULL,
	[street_name] [varchar](200) NULL,
	[city] [varchar](100) NULL,
	[country_id_bk] [int] NULL,
	[country_name] [varchar](200) NULL,
	[status_id_bk] [int] NULL,
	[address_status] [varchar](30) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_Dim_customer] PRIMARY KEY CLUSTERED 
(
	[customer_id_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dim_orders]    Script Date: 1/5/2024 4:47:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dim_orders](
	[order_id_sk] [int] IDENTITY(1,1) NOT NULL,
	[order_id_bk] [int] NULL,
	[order_date] [datetime] NULL,
	[history_id_bk] [int] NULL,
	[status_date] [datetime] NULL,
	[status_id_bk] [int] NULL,
	[status_value] [varchar](20) NULL,
	[method_id_bk] [int] NULL,
	[method_name] [varchar](100) NULL,
	[cost] [decimal](6, 2) NULL,
	[start_date] [datetime] NULL,
	[end_date] [datetime] NULL,
	[is_current] [tinyint] NULL,
 CONSTRAINT [PK_Dim_orders] PRIMARY KEY CLUSTERED 
(
	[order_id_sk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_sales_order]    Script Date: 1/5/2024 4:47:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_sales_order](
	[book_id_fk] [int] NULL,
	[customer_id_fk] [int] NULL,
	[order_id_fk] [int] NULL,
	[date_fk] [int] NULL,
	[order_line_bk] [int] NULL,
	[price] [decimal](5, 2) NULL,
	[created_at] [datetime] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_order_Dim_book] FOREIGN KEY([book_id_fk])
REFERENCES [dbo].[Dim_book] ([book_id_sk])
GO
ALTER TABLE [dbo].[Fact_sales_order] CHECK CONSTRAINT [FK_Fact_sales_order_Dim_book]
GO
ALTER TABLE [dbo].[Fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_order_Dim_customer] FOREIGN KEY([customer_id_fk])
REFERENCES [dbo].[Dim_customer] ([customer_id_sk])
GO
ALTER TABLE [dbo].[Fact_sales_order] CHECK CONSTRAINT [FK_Fact_sales_order_Dim_customer]
GO
ALTER TABLE [dbo].[Fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_order_Dim_orders] FOREIGN KEY([order_id_fk])
REFERENCES [dbo].[Dim_orders] ([order_id_sk])
GO
ALTER TABLE [dbo].[Fact_sales_order] CHECK CONSTRAINT [FK_Fact_sales_order_Dim_orders]
GO
ALTER TABLE [dbo].[Fact_sales_order]  WITH CHECK ADD  CONSTRAINT [FK_Fact_sales_order_DimDate] FOREIGN KEY([date_fk])
REFERENCES [dbo].[DimDate] ([DateSK])
GO
ALTER TABLE [dbo].[Fact_sales_order] CHECK CONSTRAINT [FK_Fact_sales_order_DimDate]
GO
