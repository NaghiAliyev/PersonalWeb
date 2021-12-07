CREATE TABLE [Articles] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	Site varchar(255) NOT NULL,
	Link varchar(255) NOT NULL,
	FileId integer NOT NULL,
	Description varchar(255),
	Date datetime,
  CONSTRAINT [PK_ARTICLES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Files] (
	Id integer NOT NULL IDENTITY(1, 1),
	FileType varchar(255) NOT NULL,
	FileName varchar(255) NOT NULL,
	FileSize varchar(255) NOT NULL,
	FileUrl varchar(255) NOT NULL,
	Date datetime,
  CONSTRAINT [PK_FILES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Skills] (
	Id integer NOT NULL IDENTITY(1, 1),
	Name varchar(255) NOT NULL,
	Profession varchar(255) NOT NULL,
	Type binary NOT NULL,
	EduType varchar(255) NOT NULL,
	StartDate datetime NOT NULL,
	FinishDate datetime,	
  CONSTRAINT [PK_SKILLS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [WorkCategory] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	ClassName varchar(255) NOT NULL,
  CONSTRAINT [PK_WORKCATEGORY] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Services] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL UNIQUE,
	Description varchar(255) NOT NULL UNIQUE,
	Icon varchar(255) NOT NULL,
  CONSTRAINT [PK_SERVICES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [About] (
	Id integer NOT NULL IDENTITY(1, 1),
	FirstName varchar(255) NOT NULL,
	Surname varchar(255) NOT NULL,
	Age integer NOT NULL,
	Location varchar(255) NOT NULL,
	Phone varchar(255) NOT NULL,
	Email varchar(255) NOT NULL,
	Description varchar(255),
	Title varchar(255) NOT NULL,
	Title2 varchar(255) NOT NULL,
	FileId integer,
  CONSTRAINT [PK_ABOUT] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Setting] (
	Id integer NOT NULL IDENTITY(1, 1),
	Description varchar(255),
	FileId integer NOT NULL,
  CONSTRAINT [PK_SETTING] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [SocialMedias] (
	Id integer NOT NULL IDENTITY(1, 1),
	Name varchar(255) NOT NULL,
	IconUrl varchar(255) NOT NULL,
	Url varchar(255) NOT NULL,
  CONSTRAINT [PK_SOCIALMEDIAS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO
CREATE TABLE [Works] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	Link varchar(255) NOT NULL,
	CategoryId integer NOT NULL,
	StartTime datetime NOT NULL,
	FinishTime datetime NOT NULL,
	EditTime datetime NOT NULL,
	Image varchar(255) NOT NULL,
	Description varchar(255) NOT NULL,
  CONSTRAINT [PK_WORK] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Technologies] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
	Duration varchar(255) NOT NULL,
	IconUrl varchar(255) NOT NULL,
	Url varchar(255) NOT NULL,
	FileId integer NOT NULL,
	TechCategoryId integer NOT NULL,
  CONSTRAINT [PK_TECHNOLOGIES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO
CREATE TABLE [TechCategory] (
	Id integer NOT NULL IDENTITY(1, 1),
	Title varchar(255) NOT NULL,
  CONSTRAINT [PK_TECHCATEGORY] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)
)
GO
CREATE TABLE [UsedTechologies] (
	Id integer NOT NULL IDENTITY(1, 1),
	WorkId integer NOT NULL,
	TechnologyId integer NOT NULL,
  CONSTRAINT [PK_USEDTECHOLOGIES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Messages] (
	Id integer NOT NULL IDENTITY(1, 1),
	SenderName varchar(255) NOT NULL,
	SenderEmail varchar(255) NOT NULL,
	Title varchar(255) NOT NULL UNIQUE,
	Body varchar(255) NOT NULL UNIQUE,
	Date datetime NOT NULL,
  CONSTRAINT [PK_MESSAGES] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [Testimonials] (
	Id integer NOT NULL IDENTITY(1, 1),
	Name varchar(255) NOT NULL,
	Info varchar(255) NOT NULL,
	Comment Text NOT NULL,
	FileId integer NOT NULL,
	Date datetime NOT NULL,
  CONSTRAINT [PK_TESTIMONIALS] PRIMARY KEY CLUSTERED
  (
  [Id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO

ALTER TABLE [Articles] WITH CHECK ADD CONSTRAINT [Articles_fk0] FOREIGN KEY ([FileId]) REFERENCES [Files]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Articles] CHECK CONSTRAINT [Articles_fk0]
GO

ALTER TABLE [Works] WITH CHECK ADD CONSTRAINT [Work_fk0] FOREIGN KEY ([CategoryId]) REFERENCES [WorkCategory]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Works] CHECK CONSTRAINT [Work_fk0]
GO

ALTER TABLE [Testimonials] WITH CHECK ADD CONSTRAINT [Testimonials_fk0] FOREIGN KEY ([FileId]) REFERENCES [Files]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Testimonials] CHECK CONSTRAINT [Testimonials_fk0]
GO

ALTER TABLE [About] WITH CHECK ADD CONSTRAINT [About_fk0] FOREIGN KEY ([FileId]) REFERENCES [Files]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [About] CHECK CONSTRAINT [About_fk0]
GO

ALTER TABLE [Setting] WITH CHECK ADD CONSTRAINT [Setting_fk0] FOREIGN KEY ([FileId]) REFERENCES [Files]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [Setting] CHECK CONSTRAINT [Setting_fk0]
GO

ALTER TABLE [Technologies] WITH CHECK ADD CONSTRAINT [Technologies_fk0] FOREIGN KEY ([TechCategoryId]) REFERENCES [TechCategory]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Technologies] CHECK CONSTRAINT [Technologies_fk0]
GO

ALTER TABLE [Technologies] WITH CHECK ADD CONSTRAINT [Technologies_fk1] FOREIGN KEY ([FileId]) REFERENCES [Files]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [Technologies] CHECK CONSTRAINT [Technologies_fk1]
GO

ALTER TABLE [UsedTechologies] WITH CHECK ADD CONSTRAINT [UsedTechologies_fk0] FOREIGN KEY ([WorkId]) REFERENCES [Works]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [UsedTechologies] CHECK CONSTRAINT [UsedTechologies_fk0]
GO
ALTER TABLE [UsedTechologies] WITH CHECK ADD CONSTRAINT [UsedTechologies_fk1] FOREIGN KEY ([TechnologyId]) REFERENCES [Technologies]([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [UsedTechologies] CHECK CONSTRAINT [UsedTechologies_fk1]
GO


