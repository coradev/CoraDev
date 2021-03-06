USE [CoraDev]
GO
/****** Object:  Table [dbo].[category]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[chapters]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chapters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[comments]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lesson_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[purport] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[courses]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[courses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [int] NOT NULL,
	[category_id] [int] NOT NULL DEFAULT ((1)),
	[title] [nvarchar](255) NOT NULL,
	[fee] [float] NOT NULL,
	[introduce] [nvarchar](max) NOT NULL,
	[purport] [nvarchar](max) NOT NULL,
	[cover_image] [varchar](255) NOT NULL,
	[intro_video] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[enrollment]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[enrollment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[is_paid_subscription] [bit] NOT NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lessons]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lessons](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[chapter_id] [int] NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[video_link] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[price] [float] NOT NULL,
	[joindate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[orders]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[student_id] [int] NOT NULL,
	[totalmoney] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reply_comment]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reply_comment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[commentid] [int] NOT NULL,
	[studentid] [int] NOT NULL,
	[purport] [nvarchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_admin]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_admin](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[user_student]    Script Date: 7/24/2021 10:31:05 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[category] ON 

INSERT [dbo].[category] ([id], [name]) VALUES (1, N'Lập trình C++')
INSERT [dbo].[category] ([id], [name]) VALUES (2, N'Lập trình Java')
INSERT [dbo].[category] ([id], [name]) VALUES (3, N'Lập trình Python')
INSERT [dbo].[category] ([id], [name]) VALUES (5, N'Lập trình Android')
INSERT [dbo].[category] ([id], [name]) VALUES (7, N'Lập trình PHP')
INSERT [dbo].[category] ([id], [name]) VALUES (8, N'Lập trình JavaScript')
INSERT [dbo].[category] ([id], [name]) VALUES (9, N'HTML and CSS')
SET IDENTITY_INSERT [dbo].[category] OFF
SET IDENTITY_INSERT [dbo].[chapters] ON 

INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (22, 5, N'Giới thiệu')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (23, 5, N'Làm quen với công cụ')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (24, 5, N'Làm quen với HTML')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (25, 5, N'Làm quen với CSS')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (26, 5, N'Đệm, viền và khoảng lề')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (27, 5, N'Thuộc tính tạo nền')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (28, 5, N'Thuộc tính vị trí')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (29, 6, N'Giới thiệu')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (30, 6, N'Làm quen')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (32, 6, N'Kiến thức cốt lõi (phần 1)')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (33, 6, N'HTML DOM')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (34, 6, N'Form validation (cách 1)')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (35, 8, N'Bắt đầu')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (36, 8, N'Lời khuyên trước khóa học')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (37, 13, N'Chapter 1')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (38, 13, N'Chapter 2')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (39, 7, N'Chapter 1')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (40, 7, N'Chapter 2')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (41, 7, N'Chapter 3')
INSERT [dbo].[chapters] ([id], [course_id], [name]) VALUES (42, 7, N'Chapter 4')
SET IDENTITY_INSERT [dbo].[chapters] OFF
SET IDENTITY_INSERT [dbo].[comments] ON 

INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (1, 18, 1, N'First comment')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (2, 18, 1, N'Second comment')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (3, 18, 4, N'Third comment')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (4, 17, 1, N'Xin chao cac ban')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (5, 17, 13, N'Chào cậu nhé')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (6, 26, 13, N'Đây là comment hehe')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (7, 18, 13, N'project như này mà cô Vân Anh không cho điểm cao thì khóc :(')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (8, 19, 13, N'Trường quá đẹp trai !!!')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (9, 23, 1, N'Đã cài đặt được môi trường')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (10, 17, 1, N'Hello')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (11, 22, 1, N'Hello')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (12, 17, 17, N'Tớ là Long')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (13, 17, 1, N'Xin chao cac ban 1123')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (14, 27, 1, N'hello')
INSERT [dbo].[comments] ([id], [lesson_id], [student_id], [purport]) VALUES (15, 18, 1, N'Hello Tien ANh')
SET IDENTITY_INSERT [dbo].[comments] OFF
SET IDENTITY_INSERT [dbo].[courses] ON 

INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (5, 1, 9, N'HTML, CSS từ zero đến Hero VIPRO', 50, N'Khóa học đề cao việc thực hành qua những ví dụ trong thực tế giúp học viên nhanh chóng xây dựng được giao diện website', N'Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)
Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó
Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học
Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)
Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết', N'cafedevn_html.png', N'R6plN3FvzFY')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (6, 1, 8, N'Lập trình Javascript cơ bản (bản đầy đủ)', 50, N'Khóa học Javascript cơ bản dành cho mọi đối tượng bắt đầu học lập trình với nội dung ngắn gọn, dễ hiểu và hệ thống làm bài tập phong phú', N'Máy vi tính kết nối internet (Windows, Ubuntu hoặc MacOS)
Ý thức tự học cao, trách nhiệm cao, kiên trì bền bỉ không ngại cái khó
Không được nóng vội, bình tĩnh học, làm bài tập sau mỗi bài học
Khi học nếu có khúc mắc hãy tham gia hỏi/đáp tại group FB: Học lập trình web (fullstack.edu.vn)
Bạn không cần biết gì hơn nữa, trong khóa học tôi sẽ chỉ cho bạn những gì bạn cần phải biết', N'2.svg', N'0SJE9dYdpps')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (7, 1, 9, N'Xây dựng web responsive', 50, N'Khóa học này sẽ giúp bạn nắm chắc tư tưởng cốt lõi của việc xây dựng giao diện website responsive và áp dụng trong thực tế', N'Biết cách xây dựng website Responsive
Hiểu được tư tưởng thiết kế với Grid system
Tự tay xây dựng được thư viện CSS Grid
Tự hiểu được Grid layout trong bootstrap', N'1.svg', N'uz5LIP85J5Y')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (8, 1, 8, N'Xây dựng web với NodeJS & ExpressJS', 49, N'Xây dựng web trong thực tế với NodeJS & ExpressJS với cách chia sẻ chi tiết, tận tâm, dễ hiểu và chất giọng giàu sức sống của người chia sẻ', N'Nắm chắc lý thuyết chung trong việc xây dựng web
Biết cách làm việc với Mongoose, MongoDB trong NodeJS
Xây dựng web với Express bằng kiến thức thực tế
Biết cách xây dựng API theo chuẩn RESTful API
Nắm chắc lý thuyết về API và RESTful API
Được chia sẻ lại kinh nghiệm làm việc thực tế
Nắm chắc khái niệm về giao thức HTTP
Hiểu rõ tư tưởng và cách hoạt động của mô hình MVC
Học được cách tổ chức code trong thực tế
Biết cách deploy (triển khai) website lên internet', N'3.svg', N'z2f7RHgvddc')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (9, 1, 9, N'HTML, CSS tips', 60, N'Tutorials về HTML, CSS, UI, UX sẽ được tổng hợp tại khóa học này, các video có nội dung ngắn gọn, súc tích giúp học viên có thể ứng dụng ngay vào thực tế', N'Cách làm đúng đắn trong thực tế (best practice)
Các thủ thuật, kinh nghiệm xây dựng UI, UX
Các kỹ năng nâng cao khi xây dựng giao diện web
Kinh nghiệm, thủ thuật tối ưu ứng dụng Front-end', N'4.svg', N'nB6cJh_bb1U')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (10, 1, 1, N'Lập trình giao diện Megaman Tool với WPF', 25, N'Mega Man, được biết đến với cái tên Rockman tại Nhật Bản, là một trò chơi video nền tảng hành động năm 1987 được phát triển và phát hành bởi Capcom cho Hệ thống giải trí Nintendo.', N'Understand and distinguish network devices.
Understand the importance and practical application of the network
Ability to make choices about basic network packages in practice
Ability to make choices about basic network devices in practice
Know how to set up a LAN / Wifi in the family (Including devices? What to configure? How to configure, how many machines to serve as needed)
Know how to handle basic network problems.
The ability to analyze and assess the quality of network services and to select a range of stable network', N'default.svg', N'16i_UKrZEtc')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (13, 1, 3, N'CSS cho người mới bắt đầu', 2, N'Trong tin học, các tập tin định kiểu theo tầng – dịch từ tiếng Anh là Cascading Style Sheets – được dùng để miêu tả cách trình bày các tài liệu viết bằng ngôn ngữ HTML và XHTML. Ngoài ra ngôn ngữ định kiểu theo tầng cũng có thể dùng cho XML, SVG, XUL.', N'CSS thật sự là gì?
Làm cách nào để trang trí trang web của tôi với hình nền và màu sắc? 
CSS thật sự là gì? 
Giống như HTML,', N'cafedevn_css.jpg', N'0SJE9dYdpp')
INSERT [dbo].[courses] ([id], [admin_id], [category_id], [title], [fee], [introduce], [purport], [cover_image], [intro_video]) VALUES (14, 1, 9, N'Lập trình PHP cho người mới moi bắt đầu', 0, N'Hello 1', N'Hellloooooooooooooooo
123
1234', N'cafedevn_css.jpg', N'R6plN3FvzFY')
SET IDENTITY_INSERT [dbo].[courses] OFF
SET IDENTITY_INSERT [dbo].[enrollment] ON 

INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (1, 1, 5, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (2, 1, 8, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (4, 14, 8, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (5, 1, 10, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (6, 13, 6, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (7, 16, 7, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (8, 16, 9, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (10, 1, 9, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (11, 17, 5, 1)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (12, 17, 7, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (13, 17, 8, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (14, 1, 6, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (15, 1, 7, 0)
INSERT [dbo].[enrollment] ([id], [student_id], [course_id], [is_paid_subscription]) VALUES (16, 19, 8, 0)
SET IDENTITY_INSERT [dbo].[enrollment] OFF
SET IDENTITY_INSERT [dbo].[lessons] ON 

INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (17, 22, N'Làm được gì sau khóa học', N'R6plN3FvzFY')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (18, 22, N'HTML, CSS là  cái gì ?', N'zwsPND378OQ')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (19, 23, N'Làm quen với Dev tools', N'7BJiPyN4zZ0')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (20, 23, N'Cài đặt môi trường', N'ZotVkQDC6mU')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (21, 24, N'Cấu trúc file HTML', N'LYnrFSGLCl8')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (22, 29, N'Lời khuyên trước khóa học', N'-jV06pqjUUc')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (23, 29, N'Cài đặt môi trường', N'efI98nT8Ffo')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (24, 30, N'Sử dụng JS trong file HTML', N'W0vEUmyvthQ')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (25, 30, N'Khai báo biến', N'CLbx37dqYEI')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (26, 22, N'Test get id youtube', N'R6plN3FvzFY')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (27, 35, N'HTTP Protocol', N'SdcdneSdoV4')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (28, 37, N'Lesson 1', N'6gt3UMCPH_M')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (29, 39, N'Lesson 1', N'AlOrzDuO60Y')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (30, 39, N'Lesson 2', N'LYnrFSGLCl8')
INSERT [dbo].[lessons] ([id], [chapter_id], [title], [video_link]) VALUES (31, 42, N'Lesson 78', N'yn8D2B2380M')
SET IDENTITY_INSERT [dbo].[lessons] OFF
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (1, 5, 50, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (2, 8, 49, CAST(N'2021-02-01' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (3, 8, 49, CAST(N'2021-03-14' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (4, 10, 25, CAST(N'2021-03-16' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (5, 6, 50, CAST(N'2021-03-16' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (6, 7, 50, CAST(N'2021-03-16' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (7, 9, 60, CAST(N'2021-03-17' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (8, 10, 25, CAST(N'2021-03-19' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (9, 9, 60, CAST(N'2021-03-19' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (10, 5, 50, CAST(N'2021-03-20' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (11, 7, 50, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (11, 8, 49, CAST(N'2021-03-25' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (12, 6, 50, CAST(N'2021-03-28' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (13, 7, 50, CAST(N'2021-04-01' AS Date))
INSERT [dbo].[order_detail] ([order_id], [course_id], [price], [joindate]) VALUES (14, 8, 49, CAST(N'2021-04-01' AS Date))
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (1, 1, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (2, 1, 49)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (3, 14, 49)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (4, 1, 25)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (5, 13, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (6, 16, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (7, 16, 60)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (8, 1, 25)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (9, 1, 60)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (10, 17, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (11, 17, 99)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (12, 1, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (13, 1, 50)
INSERT [dbo].[orders] ([id], [student_id], [totalmoney]) VALUES (14, 19, 49)
SET IDENTITY_INSERT [dbo].[orders] OFF
SET IDENTITY_INSERT [dbo].[user_admin] ON 

INSERT [dbo].[user_admin] ([id], [name], [email], [password]) VALUES (1, N'Quang Trường', N'truongnq2k@gmail.com', N'truong')
INSERT [dbo].[user_admin] ([id], [name], [email], [password]) VALUES (2, N'Admin TruongDz', N'truong@gmail.com', N'123321a')
SET IDENTITY_INSERT [dbo].[user_admin] OFF
SET IDENTITY_INSERT [dbo].[user_student] ON 

INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (1, N'Trường sss', N'truong@gmail.com', N'123321a')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (4, N'Hữu Hưng', N'hungme0@gmail.com', N'hihi12345')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (12, N'Quang Trường', N'truong001@gmail.com', N'12345')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (13, N'Trịnh Tuấn Sang', N'sang@gmail.com', N'12121212')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (14, N'Dương Tiến Dũng', N'dungkaka123@gmail.com', N'123456')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (15, N'truong01', N'truong01@gmail.com', N'123456')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (16, N'Bao Long', N'long@fpt.vn', N'111111')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (17, N'Nguyễn Đức Long', N'long@gmail.com', N'123456')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (18, N'Trần Duy Thanh', N'thanh@gmail.com', N'123456')
INSERT [dbo].[user_student] ([id], [name], [email], [password]) VALUES (19, N'tongtiensinh', N'tongtiensinh@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[user_student] OFF
ALTER TABLE [dbo].[chapters]  WITH CHECK ADD  CONSTRAINT [FK_chapters_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[chapters] CHECK CONSTRAINT [FK_chapters_courses]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_lessons] FOREIGN KEY([lesson_id])
REFERENCES [dbo].[lessons] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_lessons]
GO
ALTER TABLE [dbo].[comments]  WITH CHECK ADD  CONSTRAINT [FK_comments_user_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[user_student] ([id])
GO
ALTER TABLE [dbo].[comments] CHECK CONSTRAINT [FK_comments_user_student]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_category] FOREIGN KEY([category_id])
REFERENCES [dbo].[category] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_category]
GO
ALTER TABLE [dbo].[courses]  WITH CHECK ADD  CONSTRAINT [FK_courses_user_admin] FOREIGN KEY([admin_id])
REFERENCES [dbo].[user_admin] ([id])
GO
ALTER TABLE [dbo].[courses] CHECK CONSTRAINT [FK_courses_user_admin]
GO
ALTER TABLE [dbo].[enrollment]  WITH CHECK ADD  CONSTRAINT [FK_enrollment_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[enrollment] CHECK CONSTRAINT [FK_enrollment_courses]
GO
ALTER TABLE [dbo].[enrollment]  WITH CHECK ADD  CONSTRAINT [FK_enrollment_user_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[user_student] ([id])
GO
ALTER TABLE [dbo].[enrollment] CHECK CONSTRAINT [FK_enrollment_user_student]
GO
ALTER TABLE [dbo].[lessons]  WITH CHECK ADD  CONSTRAINT [FK_lessons_chapters] FOREIGN KEY([chapter_id])
REFERENCES [dbo].[chapters] ([id])
GO
ALTER TABLE [dbo].[lessons] CHECK CONSTRAINT [FK_lessons_chapters]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_courses] FOREIGN KEY([course_id])
REFERENCES [dbo].[courses] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_courses]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_orders] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_orders]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_user_student] FOREIGN KEY([student_id])
REFERENCES [dbo].[user_student] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK_orders_user_student]
GO
ALTER TABLE [dbo].[reply_comment]  WITH CHECK ADD  CONSTRAINT [FK_reply_comment_comments] FOREIGN KEY([commentid])
REFERENCES [dbo].[comments] ([id])
GO
ALTER TABLE [dbo].[reply_comment] CHECK CONSTRAINT [FK_reply_comment_comments]
GO
