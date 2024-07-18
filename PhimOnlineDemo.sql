use master
go

drop database ShopOnline_Demo
go
-- Tạo database ShopOnline_Demo
create database ShopOnline_Demo
go
use ShopOnline_Demo
go

-- 1: Tạo Table [Accounts] chứa tài khoản thành viên được phép sử dụng các trang quản trị ----
create table TaiKhoan
(
	taiKhoan varchar(20) primary key not null,
	matKhau varchar(20) not null,
	hoDem nvarchar(50) null,
	tenTV nvarchar(30) not null,
	ngaysinh datetime ,
	gioiTinh bit default 1,
	soDT nvarchar(20),
	email nvarchar(50),
	diaChi nvarchar(250),
	trangThai bit default 0,
	ghiChu ntext
)
go

-- 2: Tạo Table [Customers] chứa Thông tin khách hàng  ---------------------------------------
create table KhachHang
(
	maKH varchar(10) primary key not null,
	tenKH nvarchar(50) not null,
	soDT varchar(20) ,
	email varchar(50),
	diaChi nvarchar(250),
	ngaySinh datetime ,
	gioiTinh bit default 1,
	ghiChu ntext
)
go

-- 3: Tạo Table [Articles] chứa thông tin về các bài viết phục vụ cho quảng bá sản phẩm, ------
--    xu hướng mua sắm hiện nay của người tiêu dùng , ...             ------------------------- 
create table BaiViet
(
	maBV varchar(10) primary key not null,
	tenBV nvarchar(250) not null,
	hinhDD varchar(max) DEFAULT '',
	ndTomTat nvarchar(4000) DEFAULT '',
	ngayDang datetime ,
	loaiTin nvarchar(30),
	noiDung nvarchar(4000),
	taiKhoan varchar(20) not null ,
	daDuyet bit default 0,
	soLanDoc int default 0,
	foreign key (taiKhoan) references taiKhoan(taiKhoan) on update cascade 
)
go 

create table LoaiPhim
(
	maLoai int primary key not null identity,
	tenLoai nvarchar(88) not null,
	ghiChu ntext default '',
	
)

go


-- 4: Tạo Table [Products] chứa thông tin của sản phẩm online --------------
create table PHIM
(
	MAPHIM int primary key not null,
	TENPHIM nvarchar(500) not NULL,
	hinhDD varchar(max) DEFAULT '',
	ndTomTat nvarchar(4000) DEFAULT '',
	ngayDang DATETIME DEFAULT CURRENT_TIMESTAMP,
	maLoai int not null references LoaiPhim(maLoai),
	noiDung nvarchar(4000) DEFAULT '',
	taiKhoan varchar(20) not null foreign key references taiKhoan(taiKhoan) on update cascade,
	dvt nvarchar(32) default N'Cái',
	daDuyet bit default 0,
	nhaSanXuat nvarchar(500) default '',
	daodien nvarchar(300) default '',
	quocgia nvarchar(100) default '',
	dienvien nvarchar(400) default '',
	theloai nvarchar(200) default '',
	ngaychieu datetime,
)
go

/*========================== Nhập dữ liệu ảnh ==============================*/



create table MenuPhim(
	MAPHIM int primary key not null,
	TENPHIM nvarchar(500) not NULL,
	hinhDD varchar(max) DEFAULT '',
	maLoai int not null references LoaiPhim(maLoai),
	
)
go

CREATE TABLE VE
(
	MAPHIM int primary key not null,
	TENPHIM nvarchar(500) not NULL,
	DiaDiem nvarchar(200) default '',
	hinhDD varchar(max) DEFAULT '',
	ThoiGian nvarchar(100) default '',
	maLoai int not null references LoaiPhim(maLoai),
	NGAYCHIEU varchar(30)
)
go



/*========================== Nhập dữ liệu mẫu ==============================*/

-- YC 1: Nhập thông tin tài khoản, tối thiểu 5 thành viên sẽ dùng để làm việc với các trang: Administrative pages
insert into taiKhoan
values('minh','123',N'Nguyễn Minh','Quang',06/12/1996,1,0935694223,'minhminh@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')
insert into taiKhoan
values('admin','abc',N'Nguyễn Quang',N'Hưng',06/12/1996,1,0935694223,'nqhung@gmail.com','472 CMT8, P.11,Q3, TP.HCM',1,'')
GO

insert into LoaiPhim(tenLoai) values(N'Hài')
insert into LoaiPhim(tenLoai) values(N'Tâm Lý')
insert into LoaiPhim(tenLoai) values(N'Tình Cảm')
insert into LoaiPhim(tenLoai) values(N'Hành Động')
insert into LoaiPhim(tenLoai) values(N'Phiêu Lưu')
insert into LoaiPhim(tenLoai) values(N'Chiến Tranh')
insert into LoaiPhim(tenLoai) values(N'Giả Tưởng')
insert into LoaiPhim(tenLoai) values(N'Giật Gân')
insert into LoaiPhim(tenLoai) values(N'Kinh Dị')
insert into LoaiPhim(tenLoai) values(N'Hoạt Hình')
insert into LoaiPhim(tenLoai) values(N'Thần Thoại')
go

-- YC3: Nhập thông tin bài viết, Tối thiểu 10 bài viết thuộc loại: giới thiệu sản phẩm, khuyến mãi, quảng cáo, ... 
--      liên quan đến sản phẩm mà bạn dự định kinh doanh trong đồ án sẽ thực hiện
-- Chi tiết Phim -------------------------------------------------------------------------------------------------------

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('76876', N'CON NHÓT MÓT CHỒNG', '/Materials/Images/sanPham/b1.jpg',
			          N'Lấy cảm hứng từ web drama Chuyện Xóm Tui, phiên bản điện ảnh sẽ mang một màu sắc hoàn toàn khác: hài hước hơn, gần gũi và nhiều cảm xúc hơn. Bộ phim là câu chuyện của Nhót - người phụ nữ “chưa kịp già” đã sắp bị mãn kinh, vội vàng đi tìm chồng. Nhưng sâu thẳm trong cô là khao khát muốn có một đứa con, và luôn muốn hàn gắn với người cha suốt ngày say xỉn của mình.
					  Phim mới  Con Nhót Mót Chồng ra mắt tại các rạp chiếu phim từ 28.04.2023.', 'admin',2,N'Galaxy Studio, Thu Trang Entertainment, Galaxy Play',N'
					  Hài,  Tâm Lý',N'Vũ Ngọc Đãng',N'Tiến Luật,  Thái Hòa,  Thu Trang',N'Việt Nam',21/04/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('88600', N'Lật Mặt 6: Tấm Vé Định Mệnh', '/Materials/Images/sanPham/b2.jpg',
			          N'Một nhóm bạn thân lâu năm bất ngờ nhận được cơ hội đổi đời  khi biết tấm vé của cả nhóm trúng giải độc đắc 136.8 tỷ. Đột nhiên An, người nắm giữ tấm vé bất ngờ gặp tai nạn không qua khỏi. Đứng trước món tiền trúng số đáng mơ ước lẽ ra sẽ dễ dàng có được trong tầm tay, nhóm bạn bước chân vào hành trình đi tìm tờ vé số. Nhưng đó chỉ là khởi đầu của vô số những sự kiện không ngờ đến. Liệu hành trình tìm kiếm và chia chác món tiền trong mơ béo bở này sẽ thực sự dẫn đưa cả nhóm đến đâu? 
					  Phim mới Lật Mặt 6: Tấm Vé Định Mệnh ra mắt tại các rạp chiếu phim từ 28.04.2023.', 'admin',2,N'',
					  N'Hài, Tình Cảm, Tâm Lý, Hành Động',N'Lý Hải',N'Hoàng Mèo, Trần Kim Hải, Thanh Thức, Huy Khánh, Quốc Cường, Trung Dũng',N'Việt Nam',26/04/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('66017', N'Guardians Of The Galaxy Vol.3', '/Materials/Images/sanPham/b3.jpg',
			          N'Trong phần phim thứ 3 về Vệ Binh Dải Ngân Hà, biệt đội mà chúng ta từng biết sẽ có một vài sự thay đổi. Peter Quill vẫn đang chìm đắm trong nỗi đau mất đi Gamora nhưng vẫn phải làm tròn trách nhiệm tập hợp cả đội để bảo vệ toàn vũ trụ. Họ phải đối mặt với một nhiệm vụ cam go và nếu như  thất bại, đội Vệ Binh có thể phải kết thúc sứ mệnh của họ. Dù không có quá nhiều người biết đến từ trước khi lên phim lần đầu tiên vào năm 2014, “rạp xiếc giải ngân hà” vẫn nhận được sự yêu thích hùng hậu từ người hâm mộ. Tiếp đà thành công đó, phần tiếp theo mang tên Guardian of The Galaxy Vol.2  cũng được đánh giá vô cùng tích cực. Năm nay, phần cuối Guardians of the Galaxy Vol.3 là bộ phim chiếu rạp nhiều người hâm mộ mong chờ.
					  Phim mới Vệ binh dải Ngân Hà 3 ra mắt tại các rạp chiếu phim từ 03.05.2023.', 'admin',2,N'Marvel Studios',
					  N'Hành động, Phiêu lưu, Hài',N'James Gun',N'Bradley Cooper, Vin Diesel, Chris Pratt, Karen Gillan, Zoe Saldana, Dave Bautista',N'Mỹ',03/05/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('73136', N'The Super Mario Bros. Movie', '/Materials/Images/sanPham/b10.jpg',
			          N'The Super Mario Bros. Movie  xoay quanh cuộc phiêu lưu ở thế giới Vương quốc Nấm của anh em thợ sửa ống nước Mario và Luigi. Sau khi tình cờ bước tới vùng đất lạ từ một ống nước, Luigi đã bị chia tách với Mario và rơi vào tay quái vật rùa xấu xa Bowser, hắn đang âm mưu độc chiếm thế giới. Trong lúc cố gắng tìm kiếm người anh em của mình, Mario đã chạm mặt anh bạn nấm Toad và công chúa Peach. Từ đây họ sát cánh bên nhau trên hành trình ngăn chặn thế lực hắc ám.'
					  , 'admin',2,N'Galaxy Studio, Thu Trang Entertainment, Galaxy Play',
					  N'Hoạt hình, Phiêu lưu',N'Michael Jelenic, Aaron Horvath',N'Chris Pratt, Jack Black, Keegan-Michael Key, Anya Taylor-Joy',N'Mỹ, Nhật Bản',07/04/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('62071', N'Cats In The Museum', '/Materials/Images/sanPham/b5.jpg',
			          N'Chuyện phim xoay quanh chú mèo Vincent bắt tay cùng chú chuột Maurice để cố gắng thoát khỏi lũ lụt trong một chiếc đàn piano cũ. Một nhóm thủy thủ đã vô tình lấy được cây đàn và gửi nó đến viện bảo tàng. Tại đây, Vincent gặp một đội mèo ưu tú, làm nhiệm vụ bảo vệ những kiệt tác khỏi các loài gặm nhấm và sâu bọ khác trong nhiều năm qua. Mặc dù khao khát tìm được một mái ấm, Vincent buộc phải giấu tất cả về sự tồn tại của Maurice. Mọi chuyện trở nên phức tạp khi một trong những bức tranh vĩ đại nhất thế giới được đưa đến viện bảo tàng. Một thế lực bí ẩn đang cố gắng đánh cắp bức tranh, buộc Vincent, Maurice và hội mèo tinh hoa phải cùng nhau làm tất cả để bảo vệ kiệt tác này… Liệu Vincent và đồng đội của mình có đủ can đảm và trí thông minh để cứu lấy những kiệt tác của Da Vinci và bảo vệ danh tiếng cho bảo tàng không?', 
					  'admin',2,N'Licensing Brands',N'Phiêu lưu, Hoạt hình, Hài',N'Vasiliy Rovenskiy',N'Aleksandr Gavrilin, Polina Gagarina, Anton Eldarov',N'Nga',28/04/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('68698', N'The Accursed', '/Materials/Images/sanPham/b11.jpg',
			          N'Câu chuyện bắt đầu khi Elly được gia đình của một người bạn nhờ chăm sóc một người phụ nữ lớn tuổi sống trong một căn nhà gỗ hẻo lánh trong vài ngày. Nhận lời đồng ý, nhưng sau đó Elly phát hiện ra sự xuất hiện của một con quỷ đang ẩn náu trong người phụ nữ chỉ chực chờ để thoát ra. Cùng lúc đó, những bí ẩn về cái chết của mẹ cô dần dần được gợi mở bởi những cơn ác mộng mà Elly phải trải qua.
					  Phim mới Cơn Thịnh Nộ Từ Cõi Âm ra mắt tại các rạp chiếu phim từ 12.05.2023.', 'admin',2,N'Blood Red Films',
					  N'Giật gân, Kinh dị',N'Kevin Lewis',N'Sarah Grey, Meg Foster, Sarah Dumont',N'Mỹ',12/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('73202', N'The Black Demon', '/Materials/Images/sanPham/b12.jpg',
			          N'Quái Vật Đen  xoay quanh câu chuyện khi kỳ nghỉ bình dị của gia đình Oilman Paul Sturges biến thành cơn ác mộng. Bởi họ đã gặp phải một con cá mập Megalodon hung dữ, 
					  không từ bất kỳ khoảnh khắc nào để bảo vệ lãnh thổ của mình. Bị mắc kẹt và tấn công liên tục, Paul và gia đình của mình phải tìm cách để an toàn sống sót trở về bờ trước khi con cá mập khát máu này tấn công lần nữa.
					  Phim mới Quái Vật Đen ra mắt tại các rạp chiếu phim từ 12.05.2023.', 'admin',2,N'Buzzfeed Studios',
					  N'Giả Tưởng, Giật gân',N'Adrian Grunberg',N'Josh Lucas, Julio Cesar',N'Mỹ',12/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('68172', N'Sisu', '/Materials/Images/sanPham/c3.jpg',
			          N'Một cựu binh tìm được mỏ vàng ở Phần Lan, tuy nhiên anh bị lính Phát Xít tấn công và cướp đi số kho báu. Chàng cựu binh quyết tâm báo thù để lấy lại những thứ thuộc về mình.
					  Phim mới Sisu: Già Gân Báo Thù, ra mắt tại các rạp chiếu phim từ 12.05.2023.', 'admin',2,N'Stage 6 Films',
					  N'Chiến tranh, Hành động',N'Jalmari Helander',N'Jack Doolan, Jorma Tommila, Aksel Hennie',N'',11/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('91830', N'Fireheart', '/Materials/Images/sanPham/c2.jpg',
			          N'Cô Bé Cứu Hoả đưa người xem bước vào hành trình phiêu lưu kỳ thú của Georgia Nolan - một cô bé thông minh, nhiệt huyết với ước mơ trở thành lính cứu hoả như ba mình. Tuy nhiên, năm 1932 tại New York, phụ nữ không được phép làm công việc này.Nhưng cơ hội “vàng” đã đến khi Georgia nảy ra ý định cải trang thành Joe - một chàng trai vụng về gia nhập đội cứu hoả do chính ba mình thành lập. Vừa phải bảo vệ danh tính thật, vừa phải dấn thân vào phi vụ mạo hiểm: Giải cứu những người lính cứu hoả của thành phố đã lần lượt biến mất trong ngọn lửa bí ẩn thiêu rụi Nhà hát Broadway, liệu Georgia có dũng cảm vượt qua tất cả và thành công?', 
					  'admin',2,N'eOne Films, Caramel Film',N'Hoạt hình',N'Theodore Ty, Laurent Zeitoun',N'Valérie Lemercier, Alice Pol, Vincent Cassel',N'Canada, Pháp',6/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('68728', N'Hypnotic', '/Materials/Images/sanPham/c1.jpg',
			          N'Phim theo chân thám tử Daniel Rourke (Ben Affleck) trong hành trình tìm kiếm cô con gái bị mất tích. Anh sớm nhận ra tất cả những chuyện bí ẩn này đều liên quan đến một người đàn ông có sức mạnh thôi miên. \
					  Với sự hỗ trợ từ nhà ngoại cảm Diana Cruz (Alice Braga), Daniel bắt đầu truy đuổi hắn và phải tìm mọi cách để đưa con gái mình trở về nhà an toàn.
					  Phim mới Những Kẻ Thao Túng khởi chiếu 12.05.2023 tại rạp chiếu phim toàn quốc.', 
					  'admin',2,N'Ingenious Media',N'Tâm lý, Hành động',N'Robert Rodriguez',N'Ben Affleck, William Fitchtner, Alice Braga',N'Mỹ',11/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('67355', N'Fast X', '/Materials/Images/sanPham/c4.jpg',
			          N'Trong Fast Five (2011), Dom và nhóm của anh đã tiêu diệt trùm ma túy người Brazil Hernan Reyes ở Rio De Janeiro. Điều họ không biết là con trai của Reyes, 
					  Dante đã chứng kiến tất cả và dành 12 năm qua để lên một kế hoạch “hoàn hảo” sẽ khiến gia đình Dom phải trả giá đắt.
					  Phim mới  Fast & Furious 10, ra mắt tại các rạp chiếu phim từ 19.05.2023.', 'admin',3,N'Universal Pictures',
					  N'Hành động, Tội phạm',N'Louis Leterrier',N'Helen Mirren, Scott Eastwood, Vin Diesel,...',N'Mỹ',19/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('60803', N'The Little Mermaid', '/Materials/Images/sanPham/c5.jpg',
			          N'“Nàng Tiên Cá” là câu chuyện được yêu thích về Ariel - một nàng tiên cá trẻ xinh đẹp và mạnh mẽ với khát khao phiêu lưu. Ariel là con gái út của Vua Triton và cũng là người ngang ngạnh nhất, nàng khao khát khám phá về thế giới bên kia đại dương. Trong một lần ghé thăm đất liền, nàng đã phải lòng Hoàng tử Eric bảnh bao. Trong khi tiên cá bị cấm tiếp xúc với con người, Ariel đã làm theo trái tim mình. Nàng đã thỏa thuận với phù thủy biển Ursula hung ác để cơ hội sống cuộc sống trên đất liền. Nhưng cuối cùng việc này lại đe dọa tới mạng sống của Ariel và vương miện của cha nàng.
					  Phim mới The Little Mermaid, ra mắt tại các rạp chiếu phim từ 21.04.2023.', 'admin',3,N'Conglomerate Media, Walt Disney Pictures',
					  N'Tâm lý, Giả Tưởng, Thần thoại, Phiêu lưu',N'Rob Marshall, Blake Harris',N'Jonah Hauer-King, William Moseley,...',N'Mỹ',26/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('70015', N'The Creeping', '/Materials/Images/sanPham/c6.jpg',
			          N'Một cựu binh tìm được mỏ vàng ở Phần Lan, tuy nhiên anh bị lính Phát Xít tấn công và cướp đi số kho báu. Chàng cựu binh quyết tâm báo thù để lấy lại những thứ thuộc về mình.
					  Phim mới Oán Hồn ra mắt tại các rạp chiếu phim từ 26.05.2023.', 'admin',3,N'Cryptoscope Films',
					  N'Kinh dị, Tâm lý',N'Jamie Hooper',N'Sophie Thompson, Taliyah Blair, Riann Steele',N'Mỹ',26/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('91382', N'Doraemon: Nobita’s Sky Utopia 2023', '/Materials/Images/sanPham/c7.jpg',
			          N'Doraemon: Nobita’s Sky Utopia 2023 kể về chuyến phiêu lưu của Doraemon, Nobita và những người bạn thân tới Paradapia - một hòn đảo hình trăng lưỡi liềm lơ lửng trên bầu trời.
					   Ở nơi đó, tất cả đều hoàn hảo… đến mức cậu nhóc Nobita mê ngủ ngày cũng có thể trở thành một thần đồng toán học, một siêu sao thể thao.
					  Phim mới Doraemon: Nobita và Vùng Đất Lý Tưởng Trên Bầu Trời ra mắt tại các rạp chiếu phim từ 26.05.2023.', 'admin',3,N'Shin-Ei Animation',
					  N'Hoạt hình',N'Douyama Takumi',N'Mizuta Wasabi, Megumi Oohara',N'Nhật Bản',20/5/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('91831', N'Spider-Man: Across The Spider-Verse', '/Materials/Images/sanPham/c8.jpg',
			          N'Miles Morales tái xuất trong phần tiếp theo của bom tấn hoạt hình từng đoạt giải Oscar - Spider-Man: Across the Spider-Verse. Sau khi gặp lại Gwen Stacy, chàng Spider-Man thân thiện đến từ Brooklyn phải du hành qua đa vũ trụ và gặp một nhóm Người Nhện chịu trách nhiệm bảo vệ các thế giới song song. Nhưng khi nhóm siêu anh hùng xung đột về cách xử lý một mối đe dọa mới, Miles buộc phải đọ sức với các Người Nhện khác và phải xác định lại ý nghĩa của việc trở thành một người hùng để có thể cứu những người cậu yêu thương nhất.
					  Phim mới Người Nhện: Du Hành Vũ Trụ Nhện ra mắt tại các rạp chiếu phim từ 01.06.2023.', 'admin',3,N'Columbia Pictures, Marvel Studios, Sony Pictures',
					  N'Hoạt hình, Giả Tưởng',N'Justin K. Thompson, Kemp Powers, Joaquim Dos Santos',N'Oscar Isaac, Shameik Moore,...',N'Mỹ',1/6/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('72937', N'Transformers: Rise Of The Beasts', '/Materials/Images/sanPham/c9.jpg',
			          N'Transformers: Rise Of The Beasts  lấy bối cảnh vào năm 1994, khoảng thời gian tiếp sau khi Bumblebee xuất hiện. Như tựa đề đã thể hiện, phần phim này dựa theo bộ truyện Beast Wars cực kỳ ăn khách vào thập niên 1990. Đây cũng là lần đầu tiên, một nhóm robot mới xuất hiện, có khả năng biến mình thành động vật thay vì ôtô như trước đó.
					  Phim mới Transformers: Quái Thú Trỗi Dậy ra mắt tại các rạp chiếu phim từ 09.06.2023.', 'admin',3,N'Paramount Pictures',
					  N'Giả Tưởng, Hành động',N'Steven Caple Jr.',N'Ron Perlman, Dominique Fishback, Dương Tử Quỳnh',N'Mỹ',9/6/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('90058', N'Flash', '/Materials/Images/sanPham/c10.jpg',
			          N'Câu chuyện của Flash bắt đầu khi Barry Allen (Ezra Miller thủ vai) sử dụng siêu năng lực của mình để du hành thời gian nhằm thay đổi những sự kiện trong quá khứ. Nhưng khi nỗ lực cứu lấy gia đình mình vô tình thay đổi tương lai, Barry bị kẹt lại trong một thực tại, nơi tướng Zod tái xuất và đe dọa hủy diệt tất cả, nhưng không có bất cứ siêu anh hùng nào đứng ra giải cứu… Trừ khi Barry có thể thuyết phục một Batman rất khác và giải cứu một cư dân Kryptonian đang bị cầm tù… dẫu có thể đó không phải người mà anh thực sự tìm kiếm. Để giải cứu thế giới hiện tại cũng như trở lại tương lai mình từng biết, niềm hy vọng duy nhất của Barry là phải chạy đua vì cuộc đời mình. Vậy nhưng, sự hy sinh tuyệt đối đó có là đủ để đưa thế giới về lại như ban đầu?  
					  Phim mới The Flash ra mắt tại các rạp chiếu phim từ 06.2023.', 'admin',3,N'Warner Bros',
					  N'Giả Tưởng, Hành động',N'James Gunn',N'Ben Affleck, Ezra Miller',N'Mỹ',16/6/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('60751', N'Elemental', '/Materials/Images/sanPham/c11.jpg',
			          N'Bộ phim sẽ là hành trình xoay quanh mối quan hệ giữa cô nàng guyên tố lửa, Ember (do Lewis lồng tiếng) và chàng trai nguyên tố nước, Wade (do Athie lồng tiếng), những cá thể không thể chạm được đến nhau; nhưng cùng nhau khám phá xem họ có bao nhiêu điểm chung giống nhau 
					  Phim mới Xứ Sở Các Nguyên Tố ra mắt tại các rạp chiếu phim từ 16.06.2023.', 'admin',3,N'Walt Disney Pictures, PIXAR',
					  N'Phiêu lưu, Hài, Hoạt hình',N'Peter Sohn',N'Mamoudou Athie, Leah Lewis, Wendi McLendon-Covey',N'Mỹ',16/6/2023,N'Bộ');
go

insert into PHIM(MAPHIM, TENPHIM, hinhDD, ndTomTat, taiKhoan, maLoai, nhaSanXuat, theloai, daodien, dienvien, quocgia, ngaychieu,dvt) 
              values('97404', N'No Hard Feelings', '/Materials/Images/sanPham/c12.jpg',
			          N'Trong phim, Jennifer Lawrence thủ vai một cô gái lẳng lơ, sống này đây mai đó với đủ loại công việc. Cho tới một ngày, một cặp vợ chồng trung niên tìm tới và thuê cô quyến rũ cậu con trai 19 tuổi của mình. Thế là hành trình của bà cô U40 đi cò cưa trai trẻ bắt đầu, đầy khó khăn với biết bao tình huống khó đỡ, éo le.Phim mới  Vú Em Dạy “Yêu” ra mắt tại các rạp chiếu phim từ 23.06.2023.'
					  ,'admin',3,N'Sony Pictures',
					  N'Hài',N'Genedy Tartakovsky',N'Ebon Moss-Bachrach, Natalie Morales, Jennifer Lawrence',N'Mỹ',23/6/2023,N'Bộ');
go



-- VE THEO PHIM VS THEO RAP--------------------------------------------------------------------------------------------------

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('88600', N'Lật Mặt 6: Tấm Vé Định Mệnh', '/Materials/Images/sanPham/d2.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('76876', N'CON NHÓT MÓT CHỒNG', '/Materials/Images/sanPham/d1.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('66017', N'Guardians Of The Galaxy Vol.3', '/Materials/Images/sanPham/d3.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('68172', N'Sisu', '/Materials/Images/sanPham/d7.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('67355', N'Fast X', '/Materials/Images/sanPham/d8.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('73202', N'The Black Demon', '/Materials/Images/sanPham/d9.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('68698', N'The Accursed', '/Materials/Images/sanPham/d10.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('68728', N'Hypnotic', '/Materials/Images/sanPham/d11.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('91830', N'Fireheart', '/Materials/Images/sanPham/d4.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('62071', N'Cats In The Museum', '/Materials/Images/sanPham/d6.jpg',4);
go

insert into VE(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('73136', N'The Super Mario Bros. Movie', '/Materials/Images/sanPham/d12.jpg',4);
go

-- MENU PHIM DANG CHIEU --------------------------------------------------------------------------------------------------

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('88600', N'Lật Mặt 6: Tấm Vé Định Mệnh', '/Materials/Images/sanPham/d2.jpg',5);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('76876', N'CON NHÓT MÓT CHỒNG', '/Materials/Images/sanPham/d1.jpg',5);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('66017', N'Guardians Of The Galaxy Vol.3', '/Materials/Images/sanPham/d3.jpg',5);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('68172', N'Sisu', '/Materials/Images/sanPham/d7.jpg',5);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('73202', N'The Black Demon', '/Materials/Images/sanPham/d9.jpg',5);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('68698', N'The Accursed', '/Materials/Images/sanPham/d10.jpg',5);
go

-- MENU PHIM SAP CHIEU --------------------------------------------------------------------------------------------------


insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('67355', N'Fast X', '/Materials/Images/sanPham/d8.jpg',6);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('91382', N'Doraemon: Nobita’s Sky Utopia 2023', '/Materials/Images/sanPham/d13.jpg',6);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('60803', N'The Little Mermaid', '/Materials/Images/sanPham/d14.jpg',6);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('70015', N'The Creeping', '/Materials/Images/sanPham/d15.jpg',6);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('91831', N'Spider-Man: Across The Spider-Verse', '/Materials/Images/sanPham/d16.jpg',6);
go

insert into MenuPhim(MAPHIM, TENPHIM, hinhDD, maLoai)
			values('72937', N'Transformers: Rise Of The Beasts', '/Materials/Images/sanPham/d17.jpg',6);
go

-- BAI VIET --------------------------------------------------------------------------------------------------

insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV01',N'Tổng Hợp Các Mẫu Đồng Hồ Con Thỏ ','/Materials/Images/DangBai/db_01.jpg',
							'2022/12/16',N'Năm Quý Mão trong truyền thống văn hóa phương Đông vừa là con mèo, cũng vừa là con thỏ. Cùng khám phá những mẫu đồng hồ con thỏ đến từ các thương hiệu lớn chào đón Tết Nguyên Đán - Xuân Quý Mão 2023.,
							', 'admin','QC',1,N'Năm “Mão” (卯) trong truyền thống phương Đông vừa là năm con Mèo, cũng vừa là năm con Thỏ - xuất phát từ sự đồng âm - từ 卯 trong tiếng Nôm (quốc ngữ cổ của người Việt Nam) còn được đọc là “méo”, “mẹo” hay “mẽo”. 
							Trong văn hóa của người Việt Nam, loài mèo gắn liền với nhiều hình ảnh mang tính dân gian, chính vì thế nó đã được lựa chọn để trở thành một trong 12 con giáp của đất nước chúng ta. Nhưng ở một số quốc gia khác như Nhật Bản hay Trung Quốc, 
							loài thỏ lại có một số đặc tính phù hợp với văn hóa cũng như một số câu chuyện dân gian, chính vì thế năm Mão của họ sẽ là năm con Thỏ.',12345)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV02',N'Giới Thiệu Đồng hồ Zenith Defy Extreme Double Tourbillon','/Materials/Images/DangBai/db_03.jpg',
							'2022/12/16',N'Đồng hồ Zenith Defy Extreme Double Tourbillon với bộ máy chuyển động chronograph tần số cao,
							', 'admin','QC',1,N'Zenith Defy Extreme ra mắt vào năm 2021 với tư cách là người anh em có hàm lượng testosterone cao đối với bộ sưu tập Defy vốn đã nam tính, mạnh mẽ, hiệu suất cao. Ra mắt lần đầu với đồng hồ bấm giờ 1/100 giây với hai bộ thoát, 
							Defy Extreme đã trở lại với bộ máy chuyển động chronograph tần số cao thậm chí còn phức tạp hơn được trang bị hai cơ chế tourbillon độc lập. Titanium đánh bóng hoặc sợi carbon đen bóng mượt với các điểm nhấn bằng vàng hồng được phun cát, 
							Defy Extreme Double Tourbillon tự hào có bộ máy bấm giờ tiên tiến nhất của thương hiệu Zenith cho đến nay, với một tourbillon 60 giây điều khiển thời gian và một tourbillon 5 giây điều khiển đồng hồ bấm giờ.',1234500)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV03',N'Vacheron Constantin Traditionnelle Tourbillon ','/Materials/Images/DangBai/db_02.jpg',
							'2022/12/16',N'Ba mẫu đồng hồ Vacheron Constantin Traditionnelle Tourbillon Phoenix and Dragon với mặt số phượng hoàng và rồng
							', 'admin','QC',1,N'Truyền thuyết Phượng Hoàng và Long của phương Đông được thể hiện bằng hình ảnh trên mặt số của chiếc đồng hồ Vacheron Constantin Traditionnelle Tourbillon phiên bản giới hạn mới này. 
							Ở trung tâm của lớp vỏ bằng vàng 18K 5N được chạm khắc tinh xảo, các sinh vật huyền thoại được tạo hình dưới dạng các đồ trang sức điêu khắc trên mặt số chạm khắc thủ công. Tourbillon là của Calibre 2160 siêu mỏng, một bộ chuyển động sản xuất trong nhà được trang bị một rotor ngoại vị.',198998)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV04',N'Tổng Hợp Các Mẫu Đồng Hồ Con Thỏ ','/Materials/Images/DangBai/db_01.jpg',
							'2022/12/16',N'Năm Quý Mão trong truyền thống văn hóa phương Đông vừa là con mèo, cũng vừa là con thỏ. Cùng khám phá những mẫu đồng hồ con thỏ đến từ các thương hiệu lớn chào đón Tết Nguyên Đán - Xuân Quý Mão 2023.,
							', 'admin','QC',1,N'Năm “Mão” (卯) trong truyền thống phương Đông vừa là năm con Mèo, cũng vừa là năm con Thỏ - xuất phát từ sự đồng âm - từ 卯 trong tiếng Nôm (quốc ngữ cổ của người Việt Nam) còn được đọc là “méo”, “mẹo” hay “mẽo”. 
							Trong văn hóa của người Việt Nam, loài mèo gắn liền với nhiều hình ảnh mang tính dân gian, chính vì thế nó đã được lựa chọn để trở thành một trong 12 con giáp của đất nước chúng ta. Nhưng ở một số quốc gia khác như Nhật Bản hay Trung Quốc, 
							loài thỏ lại có một số đặc tính phù hợp với văn hóa cũng như một số câu chuyện dân gian, chính vì thế năm Mão của họ sẽ là năm con Thỏ.',12345)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV05',N'Giới Thiệu Đồng hồ Zenith Defy Extreme Double Tourbillon','/Materials/Images/DangBai/db_03.jpg',
							'2022/12/16',N'Đồng hồ Zenith Defy Extreme Double Tourbillon với bộ máy chuyển động chronograph tần số cao,
							', 'admin','QC',1,N'Zenith Defy Extreme ra mắt vào năm 2021 với tư cách là người anh em có hàm lượng testosterone cao đối với bộ sưu tập Defy vốn đã nam tính, mạnh mẽ, hiệu suất cao. Ra mắt lần đầu với đồng hồ bấm giờ 1/100 giây với hai bộ thoát, 
							Defy Extreme đã trở lại với bộ máy chuyển động chronograph tần số cao thậm chí còn phức tạp hơn được trang bị hai cơ chế tourbillon độc lập. Titanium đánh bóng hoặc sợi carbon đen bóng mượt với các điểm nhấn bằng vàng hồng được phun cát, 
							Defy Extreme Double Tourbillon tự hào có bộ máy bấm giờ tiên tiến nhất của thương hiệu Zenith cho đến nay, với một tourbillon 60 giây điều khiển thời gian và một tourbillon 5 giây điều khiển đồng hồ bấm giờ.',1234500)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV06',N'Vacheron Constantin Traditionnelle Tourbillon ','/Materials/Images/DangBai/db_02.jpg',
							'2022/12/16',N'Ba mẫu đồng hồ Vacheron Constantin Traditionnelle Tourbillon Phoenix and Dragon với mặt số phượng hoàng và rồng
							', 'admin','QC',1,N'Truyền thuyết Phượng Hoàng và Long của phương Đông được thể hiện bằng hình ảnh trên mặt số của chiếc đồng hồ Vacheron Constantin Traditionnelle Tourbillon phiên bản giới hạn mới này. 
							Ở trung tâm của lớp vỏ bằng vàng 18K 5N được chạm khắc tinh xảo, các sinh vật huyền thoại được tạo hình dưới dạng các đồ trang sức điêu khắc trên mặt số chạm khắc thủ công. Tourbillon là của Calibre 2160 siêu mỏng, một bộ chuyển động sản xuất trong nhà được trang bị một rotor ngoại vị.',198998)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV07',N'Giới Thiệu Đồng hồ Zenith Defy Extreme Double Tourbillon','/Materials/Images/DangBai/db_03.jpg',
							'2022/12/16',N'Đồng hồ Zenith Defy Extreme Double Tourbillon với bộ máy chuyển động chronograph tần số cao,
							', 'admin','QC',1,N'Zenith Defy Extreme ra mắt vào năm 2021 với tư cách là người anh em có hàm lượng testosterone cao đối với bộ sưu tập Defy vốn đã nam tính, mạnh mẽ, hiệu suất cao. Ra mắt lần đầu với đồng hồ bấm giờ 1/100 giây với hai bộ thoát, 
							Defy Extreme đã trở lại với bộ máy chuyển động chronograph tần số cao thậm chí còn phức tạp hơn được trang bị hai cơ chế tourbillon độc lập. Titanium đánh bóng hoặc sợi carbon đen bóng mượt với các điểm nhấn bằng vàng hồng được phun cát, 
							Defy Extreme Double Tourbillon tự hào có bộ máy bấm giờ tiên tiến nhất của thương hiệu Zenith cho đến nay, với một tourbillon 60 giây điều khiển thời gian và một tourbillon 5 giây điều khiển đồng hồ bấm giờ.',1234500)
							go
insert into BaiViet(maBV, tenBV, hinhDD, ngayDang, ndTomTat, taiKhoan, loaiTin, daDuyet, noiDung, soLanDoc)
					values('BV08',N'Vacheron Constantin Traditionnelle Tourbillon ','/Materials/Images/DangBai/db_02.jpg',
							'2022/12/16',N'Ba mẫu đồng hồ Vacheron Constantin Traditionnelle Tourbillon Phoenix and Dragon với mặt số phượng hoàng và rồng
							', 'admin','QC',1,N'Truyền thuyết Phượng Hoàng và Long của phương Đông được thể hiện bằng hình ảnh trên mặt số của chiếc đồng hồ Vacheron Constantin Traditionnelle Tourbillon phiên bản giới hạn mới này. 
							Ở trung tâm của lớp vỏ bằng vàng 18K 5N được chạm khắc tinh xảo, các sinh vật huyền thoại được tạo hình dưới dạng các đồ trang sức điêu khắc trên mặt số chạm khắc thủ công. Tourbillon là của Calibre 2160 siêu mỏng, một bộ chuyển động sản xuất trong nhà được trang bị một rotor ngoại vị.',198998)
							go
