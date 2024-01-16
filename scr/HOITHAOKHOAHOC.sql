Create Database HOITHAOKHOAHOC
	go
	Use HOITHAOKHOAHOC
	go 

CREATE TABLE HoiThao 
(
	MaHoiThao varchar (7) primary key,
    TenHoiThao nvarchar(50),
    MaDonViToChuc varchar (7)
);

CREATE TABLE ChuDe
(
    MaChuDe varchar(7) primary key,
    TenChuDe nvarchar (50)
);

CREATE TABLE DonViToChuc
(
	MaDonViToChuc varchar(7) primary key,
    TenDonViToChuc nvarchar (50),
    DiaChiDonViToChuc nvarchar (50),
    SdtDonViToChuc int 
);

CREATE TABLE DonViCongTac
(
	MaDonViCongTac varchar (7) primary key,
	TenDonViCongTac nvarchar (50),
	DiaChiDonViCongTac nvarchar (50)
);

CREATE TABLE ChucDanh
(
	MaChucDanh varchar (7) primary key,
	TenChucDanh nvarchar (50)
);

CREATE TABLE ChucVu
(
	MaChucVu varchar (7) primary key,
	TenChucVu nvarchar (50)
);

CREATE TABLE NguoiThamDu
(
	MaNguoiThamDu varchar (7) primary key,
	TenNguoiThamDu nvarchar (50),
	Email nvarchar (50),
	SdtNguoiThamDu int,
	MaDonViCongTac varchar (7),
	MaChucVu varchar (7),
	MaChucDanh varchar (7)
);

CREATE TABLE VaiTro 
(
	MaVaiTro varchar (7) primary key,
	TenVaiTro nvarchar (20),
	MaPhien varchar (7)
);

CREATE TABLE Phien
(
	MaPhien varchar (7) primary key,
	ThoiGianPhien varchar(50),
	DiaDiemPhien nvarchar (50),
	ThoiGianBatDau VARCHAR(50),
	ThoiGianKetThuc VARCHAR(50)  
); 

CREATE TABLE Phong
(
	MaPhong varchar (7) primary key,
	TenPhong nvarchar (20),
	MaPhien varchar(7)
);

CREATE TABLE BaiThamLuan
(
	MaBaiThamLuan varchar(7) primary key,
	TenBaiThamLuan nvarchar (200),
	MaChuDe varchar (7),
	MaPhong varchar(7)
);
  
------Bài tham luận - người tham dự- vai trò------
CREATE TABLE BaiThamLuan_NguoiThamDu_VaiTro
(
	MaBaiThamLuan varchar (7),
	MaNguoiThamDu varchar (7),
	MaVaiTro varchar (7),
	FOREIGN KEY (MaBaiThamLuan) REFERENCES BaiThamLuan(MaBaiThamLuan),
    FOREIGN KEY (MaNguoiThamDu) REFERENCES NguoiThamDu(MaNguoiThamDu),
    FOREIGN KEY (MaVaiTro) REFERENCES VaiTro(MaVaiTro),
    PRIMARY KEY (MaBaiThamLuan, MaNguoiThamDu, MaVaiTro)
);

------Hội thảo - chủ đề------
CREATE TABLE HoiThao_ChuDe 
(
    MaHoiThao varchar (7),
    MaChuDe varchar (7),
    FOREIGN KEY (MaHoiThao) REFERENCES HoiThao(MaHoiThao),
    FOREIGN KEY (MaChuDe) REFERENCES ChuDe(MaChuDe),
    PRIMARY KEY (MaHoiThao, MaChuDe)
);

------Người tham dự - phiên------
CREATE TABLE NguoiThamDu_Phien 
(
	MaNguoiThamDu varchar (7),
    MaPhien varchar (7),
    FOREIGN KEY (MaNguoiThamDu) REFERENCES NguoiThamDu(MaNguoiThamDu),
    FOREIGN KEY (MaPhien) REFERENCES Phien(MaPhien),
    PRIMARY KEY (MaNguoiThamDu, MaPhien)
);

----Nhập dữ liệu vào bảng HOITHAO----
INSERT INTO HoiThao(MaHoiThao, TenHoiThao, MaDonViToChuc) VALUES
('HT1', N'Các vấn đề nghiên cứu khoa học kỹ thuật 2022 RET5', 'DV1'),
('HT2', N'Các vấn đề nghiên cứu khoa học kỹ thuật 2023 RET6', 'DV1');

SELECT * 
FROM HoiThao

----Nhập dữ liệu CHUDE----
INSERT INTO ChuDe(MaChuDe, TenChuDe) VALUES
('CD1',	N'Công nghệ thông tin'),
('CD2',	N'Kỹ thuật Điện và Điện tử'),
('CD3',	N'Kỹ thuật điều khiển tự động hóa'),
('CD4',	N'Công trình dân dụng'),
('CD5',	N'Kỹ sư cơ khí'),
('CD6',	N'Kỹ thuật ô tô'),
('CD7',	N'Điện tử quang học'),
('CD8',	N'Ứng dụng AI');

SELECT * 
FROM ChuDe

----Nhập dữ liệu DONVITOCHUC----
INSERT INTO DonViToChuc(MaDonViToChuc, TenDonViToChuc, DiaChiDonViToChuc, SdtDonViToChuc) VALUES
('DV1', N'Trường Đại học Trà Vinh', N'Nguyễn Thiện Thành, Khóm 4, Phường 5, TP Trà Vinh', '0294355246');

SELECT * 
FROM DonViToChuc

----Nhập dữ liệu DONVICONGTAC----
INSERT INTO DonViCongTac(MaDonViCongTac,TenDonViCongTac,DiaChiDonViCongTac) VALUES
('TVU', N'Trường Đại học Trà Vinh', N'Nguyễn Thiện Thành, Khóm 4, Phường 5, TP Trà Vinh'),
('DL', 'FCU', N'Đài Loan'),
('KZT', N'Đại học Nazarbayev', 'Kazakhstan'),
('CND', 'VIU', 'Canada'),
('TN', N'Đại học Thái Nguyên', N'Thái Nguyên'),
('CTH', 'Hositco', N'Việt Nam'),
('VHT', N'Đại học Văn Hữu Thịnh', N'Trà Vinh'),
('TG', N'Đại học Tiền Giang', N'Tiền Giang'),
('KG', N'Trường Cao đẳng Kiên Giang', N'Kiên Giang'),
('CT', N'Đại học Cần Thơ', N'Cần Thơ');

SELECT * 
FROM DonViCongTac

----Nhập dữ liệu CHUCDANH----
INSERT INTO ChucDanh (MaChucDanh, TenChucDanh) VALUES
('CHD1', N'Thạc sĩ'),
('CHD2', N'Tiến sĩ'),
('CHD3', N'Giáo sư.Tiến sĩ'),
('CHD4', N'Phó Giáo sư.Tiến sĩ');

SELECT * 
FROM ChucDanh

----Nhập dữ liệu CHUCVU----
INSERT INTO ChucVu(MaChucVu, TenChucVu) VALUES
('CV1', N'Chủ tịch Ủy ban Chương trình'),
('CV2', N'Phó Chủ tịch Ủy ban Chương trình'),
('CV3', N'Chủ tịch chương trình kỹ thuật'),
('CV4', N'Chủ tịch đồng chương trình'),
('CV5', N'Ủy ban chương trình kỹ thuật'),
('CV6', N'Thư ký'),
('CV7', N'Diển giả'),
('CV8', N'Chủ tọa');

SELECT * 
FROM ChucVu

----Nhập dữ liệu NGUOITHAMDU----
INSERT INTO NguoiThamDu(MaNguoiThamDu,TenNguoiThamDu,MaDonViCongTac,MaChucVu,MaChucDanh) VALUES
('TD1', N'Nguyễn Minh Hòa','TVU','CV1','CHD4'),
('TD2', N'Võ Phước Hùng','TVU','CV2','CHD2'),
('TD3',	N'Huỳnh Công Khôi','TVU','CV2','CHD2'),
('TD4',	N'Phạm Quốc Phong','TVU','CV3','CHD2'),
('TD5', N'Nguyễn Thái Sơn','TVU','CV3','CHD4'),
('TD6', N'Trương Văn Mến','TVU','CV4','CHD2'),
('TD7', N'Nguyễn Nhứt Lam','TVU','CV4','CHD2'),
('TD8', N'Cao Phương Thảo','TVU','CV4','CHD2'),
('TD9', N'Huỳnh Văn Hiệp','TVU','CV4','CHD2'),
('TD10', N'Tang-Chieh Liu','DL','CV5','CHD3'),
('TD11', N'Cheng Ching-Hwa','DL','CV5','CHD3'),
('TD12', N'Nguyễn Tất Đắc','TVU','CV5','CHD3'),
('TD13', N'Tze-Yee Ho','DL','CV5','CHD3'),
('TD14', N'Đỗ Đức Tôn','KZT','CV5','CHD4'),
('TD15', N'His Min-Chen','DL','CV5','CHD3'),
('TD16', N'Nguyễn Hiếu Minh','TVU','CV5','CHD4'),
('TD17', N'Trần Văn Chính','TVU','CV5','CHD4'),
('TD18', N'Brian Dick','CND','CV5','CHD2'),
('TD19', N'Bùi Văn Tùng','TN','CV5','CHD2'),
('TD20', N'Đặng Xuân Trọng','CTH','CV5','CHD2'),
('TD21', N'Hoàng Trung Kiên','TVU','CV5','CHD2'),
('TD22', N'Lâm Thành Thép','TVU','CV5','CHD2'),
('TD23', N'Lê Nam Tuấn','TVU','CV5','CHD2'),
('TD24', N'Lê Thanh Tưởng','TVU','CV5','CHD2'),
('TD25', N'Ngô Hữu Huy','TN','CV5','CHD2'),
('TD26', N'Nguyễn Bảo Ân','TVU','CV5','CHD2'),
('TD27', N'Nguyễn Đức Tuệ','TVU','CV5','CHD2'),
('TD28', N'Nguyễn Khắc Huân','TVU','CV5','CHD2'),
('TD29', N'Nguyễn Thanh Tâm','TVU','CV5','CHD2'),
('TD30', N'Nguyễn Trần Diễm Hạnh','TVU','CV5','CHD2'),
('TD31', N'Nguyễn Tuấn Nghĩa','TVU','CV5','CHD2'),
('TD32', N'Nguyễn Việt Phan','TVU','CV5','CHD2'),
('TD33', N'Phạm Văn Hoan','TVU','CV5','CHD2'),
('TD34', N'Trần Song Toàn','TVU','CV5','CHD2'),
('TD35', N'Trần Văn Tân','TVU','CV5','CHD2'),
('TD36', N'Trương Hoàng Linh','TVU','CV5','CHD2'),
('TD37', N'Trương Văn Mến','TVU','CV5','CHD2'),
('TD38', N'Văn Hữu Huệ','TVU','CV5','CHD2'),
('TD39', N'Văn Hữu Thịnh','TVU','CV5','CHD2'),
('TD40', N'Vũ Quang Hiếu','TVU','CV5','CHD2'),
('TD41', N'Vũ Thắng','TVU','CV5','CHD2'),
('TD42', N'Nguyễn Đức Bình','TN','CV5','CHD2'),
('TD43', N'Duong Van Hieu','TG','CV5','CHD2'),
('TD44', N'Nguyễn Thanh Tuấn','KG','CV5','CHD2'),
('TD45', N'Đỗ Nguyễn Duy Phương','CT','CV5','CHD2'),
('TD46', N'Quách Ngọc Thịnh','CT','CV5','CHD2'),
('TD47', N'Nguyễn Hoàng Vũ','CT','CV5','CHD2'),
('TD48', N'Lương Vinh Quốc Danh','CT','CV5','CHD2'),
('TD49', N'Phan Tấn Tài','TVU','CV5','CHD2'),
('TD50', N'Đặng Hoàng Vũ','TVU','CV6',''),
('TD51', N'Hà Thị Thuý Vi','TVU','CV6',''),
('TD52', N'Bùi Thị Thu Thủy','TVU','CV6',''),
('TD53', N'Huỳnh Thị Mỹ Dung','TVU','CV6',''),
('TD54', N'Võ Duy Nhất','','',''),
('TD55', N'Nguyễn Anh Tuấn','','',''),
('TD56', N'Bùi Trọng Tấn','','',''),
('TD57', N'Trần Bảo Huy','','',''),
('TD58', N'Nguyen Trung Mung','','',''),
('TD59', N'Tăng Tấn Minh','','',''),
('TD60', N'Diệp Thanh Tùng','TVU','CV7','CHD4'),
('TD61', N'Thạch Mỹ Thuật','','',''),
('TD62', N'Mai Phước Trai','','',''),
('TD63', N'Nguyễn Văn Dũ','','',''),
('TD64', N'Trần Hồng Vân','','',''),
('TD65', N'Đặng Hoàng Minh','','',''),
('TD66', N'Nguyễn Việt Đức','','',''),
('TD67', N'Lý Quốc Hùng','','',''),
('TD68', N'Phan Thị Phương Nam','TVU','',''),
('TD69', N'Nguyễn Khánh Duy','','',''),
('TD70', N'Tran Quang Quy','','',''),
('TD71', N'Nguyen Thi Thuy Linh','','',''),
('TD72', N'Nguyen Thi Thu Oanh','','',''),
('TD73', N'Nguyễn Thái Nghe','','',''),
('TD74', N'Hứa Minh Nhựt','','',''),
('TD75', N'Lê Thị Đức Ngọc','','',''),
('TD76', N'Đoàn Thanh Nghị','','',''),
('TD77', N'Phi Cong Huy','','',''),
('TD78', N'Tran Quy Nam','','',''),
('TD79', N'Nguyen Kim Dang','','',''),
('TD80', N'Hồ Ngọc Hà','TVU','',''),
('TD81', N'Do Chi Tam','','',''),
('TD82', N'Khong Huu Duy','','',''),
('TD83', N'Pham Dinh Liem','','',''),
('TD84', N'Võ Minh Huy','','',''),
('TD85', N'Thanh Cong Nguyen','','',''),
('TD86', N'Huỳnh Hữu Trí','','',''),
('TD87', N'Từ Hồng Nhung','','',''),
('TD88', N'Nguyễn Hoài Sơn','','',''),
('TD89', N'Thuan Lam Phat','','',''),
('TD90', N'Saren','','',''),
('TD91', N'Trieu L.Vo','','',''),
('TD92', N'Huỳnh Thanh Bảnh','','',''),
('TD93', N'Nguyen Phuoc Thanh','','',''),
('TD94', N'Phan Văn Tuân','','',''),
('TD95', N'Van Chinh Truong','','',''),
('TD96', N'Nguyễn Văn Thơ','','',''),
('TD97', N'Trieu Khoa Nguyen','','',''),
('TD98', N'Dương Ngọc Bích','','',''),
('TD99', N'Minh Hung Duong','','',''),
('TD100', N'Giang Kiến Quốc','','',''),
('TD101', N'Thanh-Nghi Doan','','',''),
('TD102', N'Elinane Shroter','','',''),
('TD103', N'Thanh-Binh Phan','','',''),
('TD104', N'Huỳnh Phước Hải','','',''),
('TD105', N'Nguyễn Mộng Hiển','','',''),
('TD106', N'Nguyễn Ngọc Tiền','','',''),
('TD107', N'Lê Thanh Tùng','','',''),
('TD108', N'Phan Thế Hiếu','','',''),
('TD109', N'Đặng Hữu Phúc','','',''),
('TD110', N'Lê Minh Hải','','',''),
('TD111', N'Quoc Cuong Nguyen','','',''),
('TD112', N'Nguyễn Quốc Huy','','',''),
('TD113', N'Hoang Tan Huynh ','','','');

SELECT * 
FROM NguoiThamDu

----Nhập dữ liệu bảng VAITRO----
INSERT INTO VaiTro(MaVaiTro,TenVaiTro,MaPhien) VALUES
('PB1',	N'Phản biện 1','PD'),
('PB1.1', N'Phản biện 1','PD1'),
('PB1.2', N'Phản biện 1','PD2'),
('PB1.3', N'Phản biện 1','PD3'),
('PB1.4', N'Phản biện 1','PSS1'),
('PB1.5', N'Phản biện 1','PSS1.11'),
('PB1.6', N'Phản biện 1','PSS1.12'),
('PB1.7', N'Phản biện 1','PSS1.13'),
('PB1.8', N'Phản biện 1','PSS1.2'),
('PB1.9', N'Phản biện 1','PSS1.21'),
('PB1.10', N'Phản biện 1','PSS1.22'),
('PB1.11', N'Phản biện 1','PSS1.23'),
('PB1.12', N'Phản biện 1','PSS1.3'),
('PB1.13', N'Phản biện 1','PSS1.31'),
('PB1.14', N'Phản biện 1','PSS1.32'),
('PB1.15', N'Phản biện 1','PSS1.33'),
('PB1.16', N'Phản biện 1','PSS1.4'),
('PB1.17', N'Phản biện 1','PSS1.41'),
('PB1.18', N'Phản biện 1','PSS1.42'),
('PB1.19', N'Phản biện 1','PSS1.43'),
('PB1.20', N'Phản biện 1','PSS1.5'),
('PB1.21', N'Phản biện 1','PSS1.51'),
('PB1.22', N'Phản biện 1','PSS1.52'),
('PB1.23', N'Phản biện 1','PSS1.53'),
('PB1.24', N'Phản biện 1','PSS1.6'),
('PB1.25', N'Phản biện 1','PSS1.61'),
('PB1.26', N'Phản biện 1','PSS1.62'),
('PB1.27', N'Phản biện 1','PSS1.63'),
('PB1.28', N'Phản biện 1','PSS2'),
('PB1.29', N'Phản biện 1','PSS2.11'),
('PB1.30', N'Phản biện 1','PSS2.12'),
('PB1.31', N'Phản biện 1','PSS2.13'),
('PB1.32', N'Phản biện 1','PSS2.14'),
('PB1.33', N'Phản biện 1','PSS2.2'),
('PB1.34', N'Phản biện 1','PSS2.21'),
('PB1.35', N'Phản biện 1','PSS2.22'),
('PB1.36', N'Phản biện 1','PSS2.23'),
('PB1.37', N'Phản biện 1','PSS2.24'),
('PB1.38', N'Phản biện 1','PSS2.3'),
('PB1.39', N'Phản biện 1','PSS2.31'),
('PB1.40', N'Phản biện 1','PSS2.32'),
('PB1.41', N'Phản biện 1','PSS2.33'),
('PB1.42', N'Phản biện 1','PSS2.34'),
('PB1.43', N'Phản biện 1','PSS2.4'),
('PB1.44', N'Phản biện 1','PSS2.41'),
('PB1.45', N'Phản biện 1','PSS2.42'),
('PB1.46', N'Phản biện 1','PSS2.43'),
('PB1.47', N'Phản biện 1','PSS2.44'),
('PB1.48', N'Phản biện 1','PSS2.5'),
('PB1.49', N'Phản biện 1','PSS2.51'),
('PB1.50', N'Phản biện 1','PSS2.52'),
('PB1.51', N'Phản biện 1','PSS2.53'),
('PB1.52', N'Phản biện 1','PSS2.54'),
('PB1.53', N'Phản biện 1','PSS2.6'),
('PB1.54', N'Phản biện 1','PSS2.61'),
('PB1.55', N'Phản biện 1','PSS2.62'),
('PB1.56', N'Phản biện 1','PSS2.63'),
('PB1.57', N'Phản biện 1','PSS2.64'),

('PB2',	N'Phản biện 2','PD'),
('PB2.1', N'Phản biện 2','PD1'),
('PB2.2', N'Phản biện 2','PD2'),
('PB2.3', N'Phản biện 2','PD3'),
('PB2.4', N'Phản biện 2','PSS1'),
('PB2.5', N'Phản biện 2','PSS1.11'),
('PB2.6', N'Phản biện 2','PSS1.12'),
('PB2.7', N'Phản biện 2','PSS1.13'),
('PB2.8', N'Phản biện 2','PSS1.2'),
('PB2.9', N'Phản biện 2','PSS1.21'),
('PB2.10', N'Phản biện 2','PSS1.22'),
('PB2.11', N'Phản biện 2','PSS1.23'),
('PB2.12', N'Phản biện 2','PSS1.3'),
('PB2.13', N'Phản biện 2','PSS1.31'),
('PB2.14', N'Phản biện 2','PSS1.32'),
('PB2.15', N'Phản biện 2','PSS1.33'),
('PB2.16', N'Phản biện 2','PSS1.4'),
('PB2.17', N'Phản biện 2','PSS1.41'),
('PB2.18', N'Phản biện 2','PSS1.42'),
('PB2.19', N'Phản biện 2','PSS1.43'),
('PB2.20', N'Phản biện 2','PSS1.5'),
('PB2.21', N'Phản biện 2','PSS1.51'),
('PB2.22', N'Phản biện 2','PSS1.52'),
('PB2.23', N'Phản biện 2','PSS1.53'),
('PB2.24', N'Phản biện 2','PSS1.6'),
('PB2.25', N'Phản biện 2','PSS1.61'),
('PB2.26', N'Phản biện 2','PSS1.62'),
('PB2.27', N'Phản biện 2','PSS1.63'),
('PB2.28', N'Phản biện 2','PSS2'),
('PB2.29', N'Phản biện 2','PSS2.11'),
('PB2.30', N'Phản biện 2','PSS2.12'),
('PB2.31', N'Phản biện 2','PSS2.13'),
('PB2.32', N'Phản biện 2','PSS2.14'),
('PB2.33', N'Phản biện 2','PSS2.2'),
('PB2.34', N'Phản biện 2','PSS2.21'),
('PB2.35', N'Phản biện 2','PSS2.22'),
('PB2.36', N'Phản biện 2','PSS2.23'),
('PB2.37', N'Phản biện 2','PSS2.24'),
('PB2.38', N'Phản biện 2','PSS2.3'),
('PB2.39', N'Phản biện 2','PSS2.31'),
('PB2.40', N'Phản biện 2','PSS2.32'),
('PB2.41', N'Phản biện 2','PSS2.33'),
('PB2.42', N'Phản biện 2','PSS2.34'),
('PB2.43', N'Phản biện 2','PSS2.4'),
('PB2.44', N'Phản biện 2','PSS2.41'),
('PB2.45', N'Phản biện 2','PSS2.42'),
('PB2.46', N'Phản biện 2','PSS2.43'),
('PB2.47', N'Phản biện 2','PSS2.44'),
('PB2.48', N'Phản biện 2','PSS2.5'),
('PB2.49', N'Phản biện 2','PSS2.51'),
('PB2.50', N'Phản biện 2','PSS2.52'),
('PB2.51', N'Phản biện 2','PSS2.53'),
('PB2.52', N'Phản biện 2','PSS2.54'),
('PB2.53', N'Phản biện 2','PSS2.6'),
('PB2.54', N'Phản biện 2','PSS2.61'),
('PB2.55', N'Phản biện 2','PSS2.62'),
('PB2.56', N'Phản biện 2','PSS2.63'),
('PB2.57', N'Phản biện 2','PSS2.64'),

('KM1', N'Khách mời','PD'),
('KM1.1', N'Khách mời','PD1'),
('KM1.2', N'Khách mời','PD2'),
('KM1.3', N'Khách mời','PD3'),
('KM1.4', N'Khách mời','PSS1.1'),
('KM1.5', N'Khách mời','PSS1.11'),
('KM1.6', N'Khách mời','PSS1.12'),
('KM1.7', N'Khách mời','PSS1.13'),
('KM1.8', N'Khách mời','PSS1.2'),
('KM1.9', N'Khách mời','PSS1.21'),
('KM1.10', N'Khách mời','PSS1.22'),
('KM1.11', N'Khách mời','PSS1.23'),
('KM1.12', N'Khách mời','PSS1.3'),
('KM1.13', N'Khách mời','PSS1.31'),
('KM1.14', N'Khách mời','PSS1.32'),
('KM1.15', N'Khách mời','PSS1.33'),
('KM1.16', N'Khách mời','PSS1.4'),
('KM1.17', N'Khách mời','PSS1.41'),
('KM1.18', N'Khách mời','PSS1.42'),
('KM1.19', N'Khách mời','PSS1.43'),
('KM1.20', N'Khách mời','PSS1.5'),
('KM1.21', N'Khách mời','PSS1.51'),
('KM1.22', N'Khách mời','PSS1.52'),
('KM1.23', N'Khách mời','PSS1.53'),
('KM1.24', N'Khách mời','PSS1.6'),
('KM1.25', N'Khách mời','PSS1.61'),
('KM1.26', N'Khách mời','PSS1.62'),
('KM1.27', N'Khách mời','PSS1.63'),
('KM1.28', N'Khách mời','PSS2.1'),
('KM1.29', N'Khách mời','PSS2.11'),
('KM1.30', N'Khách mời','PSS2.12'),
('KM1.31', N'Khách mời','PSS2.13'),
('KM1.32', N'Khách mời','PSS2.14'),
('KM1.33', N'Khách mời','PSS2.2'),
('KM1.34', N'Khách mời','PSS2.21'),
('KM1.35', N'Khách mời','PSS2.22'),
('KM1.36', N'Khách mời','PSS2.23'),
('KM1.37', N'Khách mời','PSS2.24'),
('KM1.38', N'Khách mời','PSS2.3'),
('KM1.39', N'Khách mời','PSS2.31'),
('KM1.40', N'Khách mời','PSS2.32'),
('KM1.41', N'Khách mời','PSS2.33'),
('KM1.42', N'Khách mời','PSS2.34'),
('KM1.43', N'Khách mời','PSS2.4'),
('KM1.44', N'Khách mời','PSS2.41'),
('KM1.45', N'Khách mời','PSS2.42'),
('KM1.46', N'Khách mời','PSS2.43'),
('KM1.47', N'Khách mời','PSS2.44'),
('KM1.48', N'Khách mời','PSS2.5'),
('KM1.49', N'Khách mời','PSS2.51'),
('KM1.50', N'Khách mời','PSS2.52'),
('KM1.51', N'Khách mời','PSS2.53'),
('KM1.52', N'Khách mời','PSS2.54'),
('KM1.53', N'Khách mời','PSS2.6'),
('KM1.54', N'Khách mời','PSS2.61'),
('KM1.55', N'Khách mời','PSS2.62'),
('KM1.56', N'Khách mời','PSS2.63'),
('KM1.57', N'Khách mời','PSS2.64'),

('TG1', N'Tác giả độc lập','PD'),
('TG1.1', N'Tác giả độc lập','PD1'),
('TG1.2', N'Tác giả độc lập','PD2'),
('TG1.3', N'Tác giả độc lập','PD3'),
('TG1.4', N'Tác giả độc lập','PSS1.1'),
('TG1.5', N'Tác giả độc lập','PSS1.11'),
('TG1.6', N'Tác giả độc lập','PSS1.12'),
('TG1.7', N'Tác giả độc lập','PSS1.13'),
('TG1.8', N'Tác giả độc lập','PSS1.2'),
('TG1.9', N'Tác giả độc lập','PSS1.21'),
('TG1.10', N'Tác giả độc lập','PSS1.22'),
('TG1.11', N'Tác giả độc lập','PSS1.23'),
('TG1.12', N'Tác giả độc lập','PSS1.3'),
('TG1.13', N'Tác giả độc lập','PSS1.31'),
('TG1.14', N'Tác giả độc lập','PSS1.32'),
('TG1.15', N'Tác giả độc lập','PSS1.33'),
('TG1.16', N'Tác giả độc lập','PSS1.4'),
('TG1.17', N'Tác giả độc lập','PSS1.41'),
('TG1.18', N'Tác giả độc lập','PSS1.42'),
('TG1.19', N'Tác giả độc lập','PSS1.43'),
('TG1.20', N'Tác giả độc lập','PSS1.5'),
('TG1.21', N'Tác giả độc lập','PSS1.51'),
('TG1.22', N'Tác giả độc lập','PSS1.52'),
('TG1.23', N'Tác giả độc lập','PSS1.53'),
('TG1.24', N'Tác giả độc lập','PSS1.6'),
('TG1.25', N'Tác giả độc lập','PSS1.61'),
('TG1.26', N'Tác giả độc lập','PSS1.62'),
('TG1.27', N'Tác giả độc lập','PSS1.63'),
('TG1.28', N'Tác giả độc lập','PSS2.1'),
('TG1.29', N'Tác giả độc lập','PSS2.11'),
('TG1.30', N'Tác giả độc lập','PSS2.12'),
('TG1.31', N'Tác giả độc lập','PSS2.13'),
('TG1.32', N'Tác giả độc lập','PSS2.14'),
('TG1.33', N'Tác giả độc lập','PSS2.2'),
('TG1.34', N'Tác giả độc lập','PSS2.21'),
('TG1.35', N'Tác giả độc lập','PSS2.22'),
('TG1.36', N'Tác giả độc lập','PSS2.23'),
('TG1.37', N'Tác giả độc lập','PSS2.24'),
('TG1.38', N'Tác giả độc lập','PSS2.3'),
('TG1.39', N'Tác giả độc lập','PSS2.31'),
('TG1.40', N'Tác giả độc lập','PSS2.32'),
('TG1.41', N'Tác giả độc lập','PSS2.33'),
('TG1.42', N'Tác giả độc lập','PSS2.34'),
('TG1.43', N'Tác giả độc lập','PSS2.4'),
('TG1.44', N'Tác giả độc lập','PSS2.41'),
('TG1.45', N'Tác giả độc lập','PSS2.42'),
('TG1.46', N'Tác giả độc lập','PSS2.43'),
('TG1.47', N'Tác giả độc lập','PSS2.44'),
('TG1.48', N'Tác giả độc lập','PSS2.5'),
('TG1.49', N'Tác giả độc lập','PSS2.51'),
('TG1.50', N'Tác giả độc lập','PSS2.52'),
('TG1.51', N'Tác giả độc lập','PSS2.53'),
('TG1.52', N'Tác giả độc lập','PSS2.54'),
('TG1.53', N'Tác giả độc lập','PSS2.6'),
('TG1.54', N'Tác giả độc lập','PSS2.61'),
('TG1.55', N'Tác giả độc lập','PSS2.62'),
('TG1.56', N'Tác giả độc lập','PSS2.63'),
('TG1.57', N'Tác giả độc lập','PSS2.64'),

('TG2', N'Tác giả thứ nhất','PD'),
('TG2.1', N'Tác giả thứ nhất','PD1'),
('TG2.2', N'Tác giả thứ nhất','PD2'),
('TG2.3', N'Tác giả thứ nhất','PD3'),
('TG2.4', N'Tác giả thứ nhất','PSS1.1'),
('TG2.5', N'Tác giả thứ nhất','PSS1.11'),
('TG2.6', N'Tác giả thứ nhất','PSS1.12'),
('TG2.7', N'Tác giả thứ nhất','PSS1.13'),
('TG2.8', N'Tác giả thứ nhất','PSS1.2'),
('TG2.9', N'Tác giả thứ nhất','PSS1.21'),
('TG2.10', N'Tác giả thứ nhất','PSS1.22'),
('TG2.11', N'Tác giả thứ nhất','PSS1.23'),
('TG2.12', N'Tác giả thứ nhất','PSS1.3'),
('TG2.13', N'Tác giả thứ nhất','PSS1.31'),
('TG2.14', N'Tác giả thứ nhất','PSS1.32'),
('TG2.15', N'Tác giả thứ nhất','PSS1.33'),
('TG2.16', N'Tác giả thứ nhất','PSS1.4'),
('TG2.17', N'Tác giả thứ nhất','PSS1.41'),
('TG2.18', N'Tác giả thứ nhất','PSS1.42'),
('TG2.19', N'Tác giả thứ nhất','PSS1.43'),
('TG2.20', N'Tác giả thứ nhất','PSS1.5'),
('TG2.21', N'Tác giả thứ nhất','PSS1.51'),
('TG2.22', N'Tác giả thứ nhất','PSS1.52'),
('TG2.23', N'Tác giả thứ nhất','PSS1.53'),
('TG2.24', N'Tác giả thứ nhất','PSS1.6'),
('TG2.25', N'Tác giả thứ nhất','PSS1.61'),
('TG2.26', N'Tác giả thứ nhất','PSS1.62'),
('TG2.27', N'Tác giả thứ nhất','PSS1.63'),
('TG2.28', N'Tác giả thứ nhất','PSS2.1'),
('TG2.29', N'Tác giả thứ nhất','PSS2.11'),
('TG2.30', N'Tác giả thứ nhất','PSS2.12'),
('TG2.31', N'Tác giả thứ nhất','PSS2.13'),
('TG2.32', N'Tác giả thứ nhất','PSS2.14'),
('TG2.33', N'Tác giả thứ nhất','PSS2.2'),
('TG2.34', N'Tác giả thứ nhất','PSS2.21'),
('TG2.35', N'Tác giả thứ nhất','PSS2.22'),
('TG2.36', N'Tác giả thứ nhất','PSS2.23'),
('TG2.37', N'Tác giả thứ nhất','PSS2.24'),
('TG2.38', N'Tác giả thứ nhất','PSS2.3'),
('TG2.39', N'Tác giả thứ nhất','PSS2.31'),
('TG2.40', N'Tác giả thứ nhất','PSS2.32'),
('TG2.41', N'Tác giả thứ nhất','PSS2.33'),
('TG2.42', N'Tác giả thứ nhất','PSS2.34'),
('TG2.43', N'Tác giả thứ nhất','PSS2.4'),
('TG2.44', N'Tác giả thứ nhất','PSS2.41'),
('TG2.45', N'Tác giả thứ nhất','PSS2.42'),
('TG2.46', N'Tác giả thứ nhất','PSS2.43'),
('TG2.47', N'Tác giả thứ nhất','PSS2.44'),
('TG2.48', N'Tác giả thứ nhất','PSS2.5'),
('TG2.49', N'Tác giả thứ nhất','PSS2.51'),
('TG2.50', N'Tác giả thứ nhất','PSS2.52'),
('TG2.51', N'Tác giả thứ nhất','PSS2.53'),
('TG2.52', N'Tác giả thứ nhất','PSS2.54'),
('TG2.53', N'Tác giả thứ nhất','PSS2.6'),
('TG2.54', N'Tác giả thứ nhất','PSS2.61'),
('TG2.55', N'Tác giả thứ nhất','PSS2.62'),
('TG2.56', N'Tác giả thứ nhất','PSS2.63'),
('TG2.57', N'Tác giả thứ nhất','PSS2.64'),

('TG3', N'Tác giả liên hệ','PD'),
('TG3.1', N'Tác giả liên hệ','PD1'),
('TG3.2', N'Tác giả liên hệ','PD2'),
('TG3.3', N'Tác giả liên hệt','PD3'),
('TG3.4', N'Tác giả liên hệ','PSS1.1'),
('TG3.5', N'Tác giả liên hệ','PSS1.11'),
('TG3.6', N'Tác giả liên hệ','PSS1.12'),
('TG3.7', N'Tác giả liên hệ','PSS1.13'),
('TG3.8', N'Tác giả liên hệ','PSS1.2'),
('TG3.9', N'Tác giả liên hệ','PSS1.21'),
('TG3.10', N'Tác giả liên hệ','PSS1.22'),
('TG3.11', N'Tác giả liên hệ','PSS1.23'),
('TG3.12', N'Tác giả liên hệ','PSS1.3'),
('TG3.13', N'Tác giả liên hệ','PSS1.31'),
('TG3.14', N'Tác giả liên hệ','PSS1.32'),
('TG3.15', N'Tác giả liên hệ','PSS1.33'),
('TG3.16', N'Tác giả liên hệ','PSS1.4'),
('TG3.17', N'Tác giả liên hệ','PSS1.41'),
('TG3.18', N'Tác giả liên hệ','PSS1.42'),
('TG3.19', N'Tác giả liên hệ','PSS1.43'),
('TG3.20', N'Tác giả liên hệ','PSS1.5'),
('TG3.21', N'Tác giả liên hệ','PSS1.51'),
('TG3.22', N'Tác giả liên hệ','PSS1.52'),
('TG3.23', N'Tác giả liên hệ','PSS1.53'),
('TG3.24', N'Tác giả liên hệ','PSS1.6'),
('TG3.25', N'Tác giả liên hệ','PSS1.61'),
('TG3.26', N'Tác giả liên hệ','PSS1.62'),
('TG3.27', N'Tác giả liên hệ','PSS1.63'),
('TG3.28', N'Tác giả liên hệ','PSS2.1'),
('TG3.29', N'Tác giả liên hệ','PSS2.11'),
('TG3.30', N'Tác giả liên hệ','PSS2.12'),
('TG3.31', N'Tác giả liên hệ','PSS2.13'),
('TG3.32', N'Tác giả liên hệ','PSS2.14'),
('TG3.33', N'Tác giả liên hệ','PSS2.2'),
('TG3.34', N'Tác giả liên hệ','PSS2.21'),
('TG3.35', N'Tác giả liên hệ','PSS2.22'),
('TG3.36', N'Tác giả liên hệ','PSS2.23'),
('TG3.37', N'Tác giả liên hệ','PSS2.24'),
('TG3.38', N'Tác giả liên hệ','PSS2.3'),
('TG3.39', N'Tác giả liên hệ','PSS2.31'),
('TG3.40', N'Tác giả liên hệ','PSS2.32'),
('TG3.41', N'Tác giả liên hệ','PSS2.33'),
('TG3.42', N'Tác giả liên hệ','PSS2.34'),
('TG3.43', N'Tác giả liên hệ','PSS2.4'),
('TG3.44', N'Tác giả liên hệ','PSS2.41'),
('TG3.45', N'Tác giả liên hệ','PSS2.42'),
('TG3.46', N'Tác giả liên hệ','PSS2.43'),
('TG3.47', N'Tác giả liên hệ','PSS2.44'),
('TG3.48', N'Tác giả liên hệ','PSS2.5'),
('TG3.49', N'Tác giả liên hệ','PSS2.51'),
('TG3.50', N'Tác giả liên hệ','PSS2.52'),
('TG3.51', N'Tác giả liên hệ','PSS2.53'),
('TG3.52', N'Tác giả liên hệ','PSS2.54'),
('TG3.53', N'Tác giả liên hệ','PSS2.6'),
('TG3.54', N'Tác giả liên hệ','PSS2.61'),
('TG3.55', N'Tác giả liên hệ','PSS2.62'),
('TG3.56', N'Tác giả liên hệ','PSS2.63'),
('TG3.57', N'Tác giả liên hệ','PSS2.64'),

('TG4', N'Đồng tác giả','PD'),
('TG4.1', N'Đồng tác giả','PD1'),
('TG4.2', N'Đồng tác giả','PD2'),
('TG4.3', N'Đồng tác giả','PD3'),
('TG4.4', N'Đồng tác giả','PSS1.1'),
('TG4.5', N'Đồng tác giả','PSS1.11'),
('TG4.6', N'Đồng tác giả','PSS1.12'),
('TG4.7', N'Đồng tác giả','PSS1.13'),
('TG4.8', N'Đồng tác giả','PSS1.2'),
('TG4.9', N'Đồng tác giả','PSS1.21'),
('TG4.10', N'Đồng tác giả','PSS1.22'),
('TG4.11', N'Đồng tác giả','PSS1.23'),
('TG4.12', N'Đồng tác giả','PSS1.3'),
('TG4.13', N'Đồng tác giả','PSS1.31'),
('TG4.14', N'Đồng tác giả','PSS1.32'),
('TG4.15', N'Đồng tác giả','PSS1.33'),
('TG4.16', N'Đồng tác giả','PSS1.4'),
('TG4.17', N'Đồng tác giả','PSS1.41'),
('TG4.18', N'Đồng tác giả','PSS1.42'),
('TG4.19', N'Đồng tác giả','PSS1.43'),
('TG4.20', N'Đồng tác giả','PSS1.5'),
('TG4.21', N'Đồng tác giả','PSS1.51'),
('TG4.22', N'Đồng tác giả','PSS1.52'),
('TG4.23', N'Đồng tác giả','PSS1.53'),
('TG4.24', N'Đồng tác giả','PSS1.6'),
('TG4.25', N'Đồng tác giả','PSS1.61'),
('TG4.26', N'Đồng tác giả','PSS1.62'),
('TG4.27', N'Đồng tác giả','PSS1.63'),
('TG4.28', N'Đồng tác giả','PSS2.1'),
('TG4.29', N'Đồng tác giả','PSS2.11'),
('TG4.30', N'Đồng tác giả','PSS2.12'),
('TG4.31', N'Đồng tác giả','PSS2.13'),
('TG4.32', N'Đồng tác giả','PSS2.14'),
('TG4.33', N'Đồng tác giả','PSS2.2'),
('TG4.34', N'Đồng tác giả','PSS2.21'),
('TG4.35', N'Đồng tác giả','PSS2.22'),
('TG4.36', N'Đồng tác giả','PSS2.23'),
('TG4.37', N'Đồng tác giả','PSS2.24'),
('TG4.38', N'Đồng tác giả','PSS2.3'),
('TG4.39', N'Đồng tác giả','PSS2.31'),
('TG4.40', N'Đồng tác giả','PSS2.32'),
('TG4.41', N'Đồng tác giả','PSS2.33'),
('TG4.42', N'Đồng tác giả','PSS2.34'),
('TG4.43', N'Đồng tác giả','PSS2.4'),
('TG4.44', N'Đồng tác giả','PSS2.41'),
('TG4.45', N'Đồng tác giả','PSS2.42'),
('TG4.46', N'Đồng tác giả','PSS2.43'),
('TG4.47', N'Đồng tác giả','PSS2.44'),
('TG4.48', N'Đồng tác giả','PSS2.5'),
('TG4.49', N'Đồng tác giả','PSS2.51'),
('TG4.50', N'Đồng tác giả','PSS2.52'),
('TG4.51', N'Đồng tác giả','PSS2.53'),
('TG4.52', N'Đồng tác giả','PSS2.54'),
('TG4.53', N'Đồng tác giả','PSS2.6'),
('TG4.54', N'Đồng tác giả','PSS2.61'),
('TG4.55', N'Đồng tác giả','PSS2.62'),
('TG4.56', N'Đồng tác giả','PSS2.63'),
('TG4.57', N'Đồng tác giả','PSS2.64');

SELECT * 
FROM VaiTro

----Nhập dữ liệu PHIEN----
INSERT INTO Phien(MaPhien, ThoiGianPhien, DiaDiemPhien, ThoiGianBatDau ,ThoiGianKetThuc)VALUES
('PD', '08:00:00 - 11:45:00', 'E21.105', '22-07-2023 08:00:00', '22-07-2023 11:45:00'),
('PD1', '08:00:00 - 11:45:00', 'E21.105', '22-07-2023 09:00:00', '22-07-2023 09:50:00'),
('PD2', '08:00:00 - 11:45:00', 'E21.105', '22-07-2023 09:50:00', '22-07-2023 10:40:00'),
('PD3', '08:00:00 - 11:45:00', 'E21.105', '22-07-2023 10:40:00', '22-07-2023 11:30:00'),
('PSS1.1', '13:00:00 - 14:00:00', 'B21.201', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.11', '13:00:00 - 14:00:00', 'B21.201', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.12', '13:00:00 - 14:00:00', 'B21.201', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.13', '13:00:00 - 14:00:00', 'B21.201', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),
('PSS1.2', '13:00:00 - 14:00:00', 'B21.202', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.21', '13:00:00 - 14:00:00', 'B21.202', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.22', '13:00:00 - 14:00:00', 'B21.202', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.23', '13:00:00 - 14:00:00', 'B21.202', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),
('PSS1.3', '13:00:00 - 14:00:00', 'B21.203', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.31', '13:00:00 - 14:00:00', 'B21.203', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.32', '13:00:00 - 14:00:00', 'B21.203', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.33', '13:00:00 - 14:00:00', 'B21.203', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),
('PSS1.4', '13:00:00 - 14:00:00', 'B21.204', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.41', '13:00:00 - 14:00:00', 'B21.204', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.42', '13:00:00 - 14:00:00', 'B21.204', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.43', '13:00:00 - 14:00:00', 'B21.204', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),
('PSS1.5', '13:00:00 - 14:00:00', 'B21.205', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.51', '13:00:00 - 14:00:00', 'B21.205', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.52', '13:00:00 - 14:00:00', 'B21.205', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.53', '13:00:00 - 14:00:00', 'B21.205', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),
('PSS1.6', '13:00:00 - 14:00:00', 'B21.207', '22-07-2023 13:00:00', '22-07-2023 14:00:00'),
('PSS1.61', '13:00:00 - 14:00:00', 'B21.207', '22-07-2023 13:00:00', '22-07-2023 13:20:00'),
('PSS1.62', '13:00:00 - 14:00:00', 'B21.207', '22-07-2023 13:20:00', '22-07-2023 13:40:00'),
('PSS1.63', '13:00:00 - 14:00:00', 'B21.207', '22-07-2023 13:40:00', '22-07-2023 14:00:00'),

('PSS2.1', '14:10:00 - 15:30:00', 'B21.201', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.11', '14:10:00 - 14:30:00', 'B21.201', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.12', '14:30:00 - 14:50:00', 'B21.201', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.13', '14:50:00 - 15:10:00', 'B21.201', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.14', '15:10:00 - 15:30:00', 'B21.201', '22-07-2023 15:10:00', '22-07-2023 15:30:00'),
('PSS2.2', '14:10:00 - 15:30:00', 'B21.202', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.21', '14:10:00 - 14:30:00', 'B21.202', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.22', '14:30:00 - 14:50:00', 'B21.202', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.23', '14:50:00 - 15:10:00', 'B21.202', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.24', '15:10:00 - 15:30:00', 'B21.202', '22-07-2023 15:10:00', '22-07-2023 15:30:00'),
('PSS2.3', '14:10:00 - 15:30:00', 'B21.203', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.31', '14:10:00 - 14:30:00', 'B21.203', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.32', '14:30:00 - 14:50:00', 'B21.203', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.33', '14:50:00 - 15:10:00', 'B21.203', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.34', '15:10:00 - 15:30:00', 'B21.203', '22-07-2023 15:10:00', '22-07-2023 15:30:00'),
('PSS2.4', '14:10:00 - 15:30:00', 'B21.204', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.41', '14:10:00 - 14:30:00', 'B21.204', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.42', '14:30:00 - 14:50:00', 'B21.204', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.43', '14:50:00 - 15:10:00', 'B21.204', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.44', '15:10:00 - 15:30:00', 'B21.204', '22-07-2023 15:10:00', '22-07-2023 15:30:00'),
('PSS2.5', '14:10:00 - 15:30:00', 'B21.205', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.51', '14:10:00 - 14:30:00', 'B21.205', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.52', '14:30:00 - 14:50:00', 'B21.205', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.53', '14:50:00 - 15:10:00', 'B21.205', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.54', '15:10:00 - 15:30:00', 'B21.205', '22-07-2023 15:10:00', '22-07-2023 15:30:00'),
('PSS2.6', '14:10:00 - 15:30:00', 'B21.207', '22-07-2023 14:10:00', '22-07-2023 15:30:00'),
('PSS2.61', '14:10:00 - 14:30:00', 'B21.207', '22-07-2023 14:10:00', '22-07-2023 14:30:00'),
('PSS2.62', '14:30:00 - 14:50:00', 'B21.207', '22-07-2023 14:30:00', '22-07-2023 14:50:00'),
('PSS2.63', '14:50:00 - 15:10:00', 'B21.207', '22-07-2023 14:50:00', '22-07-2023 15:10:00'),
('PSS2.64', '15:10:00 - 15:30:00', 'B21.207', '22-07-2023 15:10:00', '22-07-2023 15:30:00');

SELECT * 
FROM Phien

----Nhập dữ liệu bảng PHONG----
INSERT INTO Phong(MaPhong,TenPhong,MaPhien) VALUES
('E21.5', N'Hội Trường', 'PD'),
('E21.51', N'Hội Trường', 'PD1'),
('E21.52', N'Hội Trường', 'PD2'),
('E21.53', N'Hội Trường', 'PD3'),
('B21.11', N'Phòng lý thuyết 1', 'PSS1.1'),
('B21.111', N'Phòng lý thuyết 1', 'PSS1.11'),
('B21.112', N'Phòng lý thuyết 1', 'PSS1.12'),
('B21.113', N'Phòng lý thuyết 1', 'PSS1.13'),
('B21.21', N'Phòng lý thuyết 2', 'PSS1.2'),
('B21.211', N'Phòng lý thuyết 2', 'PSS1.21'),
('B21.212', N'Phòng lý thuyết 2', 'PSS1.22'),
('B21.213', N'Phòng lý thuyết 2', 'PSS1.23'),
('B21.31', N'Phòng lý thuyết 3', 'PSS1.3'),
('B21.311', N'Phòng lý thuyết 3', 'PSS1.31'),
('B21.312', N'Phòng lý thuyết 3', 'PSS1.32'),
('B21.313', N'Phòng lý thuyết 3', 'PSS1.33'),
('B21.41', N'Phòng lý thuyết 4', 'PSS1.4'),
('B21.411', N'Phòng lý thuyết 4', 'PSS1.41'),
('B21.412', N'Phòng lý thuyết 4', 'PSS1.42'),
('B21.413', N'Phòng lý thuyết 4', 'PSS1.43'),
('B21.51', N'Phòng lý thuyết 5', 'PSS1.5'),
('B21.511', N'Phòng lý thuyết 5', 'PSS1.51'),
('B21.512', N'Phòng lý thuyết 5', 'PSS1.52'),
('B21.513', N'Phòng lý thuyết 5', 'PSS1.53'),
('B21.71', N'Phòng lý thuyết 6', 'PSS1.6'),
('B21.711', N'Phòng lý thuyết 6', 'PSS1.61'),
('B21.712', N'Phòng lý thuyết 6', 'PSS1.62'),
('B21.713', N'Phòng lý thuyết 6', 'PSS1.63'),

('B21.12', N'Phòng lý thuyết 1', 'PSS2.1'),
('B21.121', N'Phòng lý thuyết 1', 'PSS2.11'),
('B21.122', N'Phòng lý thuyết 1', 'PSS2.12'),
('B21.123', N'Phòng lý thuyết 1', 'PSS2.13'),
('B21.124', N'Phòng lý thuyết 1', 'PSS2.14'),
('B21.22', N'Phòng lý thuyết 2', 'PSS2.2'),
('B21.221', N'Phòng lý thuyết 2', 'PSS2.21'),
('B21.222', N'Phòng lý thuyết 2', 'PSS2.22'),
('B21.223', N'Phòng lý thuyết 2', 'PSS2.23'),
('B21.224', N'Phòng lý thuyết 2', 'PSS2.24'),
('B21.32', N'Phòng lý thuyết 3', 'PSS2.3'),
('B21.321', N'Phòng lý thuyết 3', 'PSS2.31'),
('B21.322', N'Phòng lý thuyết 3', 'PSS2.32'),
('B21.323', N'Phòng lý thuyết 3', 'PSS2.33'),
('B21.324', N'Phòng lý thuyết 3', 'PSS2.34'),
('B21.42', N'Phòng lý thuyết 4', 'PSS2.4'),
('B21.421', N'Phòng lý thuyết 4', 'PSS2.41'),
('B21.422', N'Phòng lý thuyết 4', 'PSS2.42'),
('B21.423', N'Phòng lý thuyết 4', 'PSS2.43'),
('B21.424', N'Phòng lý thuyết 4', 'PSS2.44'),
('B21.52', N'Phòng lý thuyết 5', 'PSS2.5'),
('B21.521', N'Phòng lý thuyết 5', 'PSS2.51'),
('B21.522', N'Phòng lý thuyết 5', 'PSS2.52'),
('B21.523', N'Phòng lý thuyết 5', 'PSS2.53'),
('B21.524', N'Phòng lý thuyết 5', 'PSS2.54'),
('B21.72', N'Phòng lý thuyết 6', 'PSS2.6'),
('B21.721', N'Phòng lý thuyết 6', 'PSS2.61'),
('B21.722', N'Phòng lý thuyết 6', 'PSS2.62'),
('B21.723', N'Phòng lý thuyết 6', 'PSS2.63'),
('B21.724', N'Phòng lý thuyết 6', 'PSS2.64');

SELECT * 
FROM Phong

----Nhập dữ liệu BAITHAMLUAN----
INSERT INTO BaiThamLuan(MaBaiThamLuan,TenBaiThamLuan,MaChuDe,MaPhong) VALUES
('Bai1', N'Ước tính và dự báo tốc độ gió phục vụ điều khiển, vận hành và quy hoạch các nhà máy điện gió','CD2','E21.51'),
('Bai2', N'AI trong sản xuất','CD1','E21.52'),
('Bai3', N'Hiệu chỉnh giáo dục lập trình: Tích hợp các thực hành kỹ thuật phần mềm thiết yếu','CD1','E21.53'),
('Bai11', N'Nghiên cứu trạng thái sạc (SOC) và trạng thái năng lượng (SOE) của pin Lithium Ion trên xe điện','CD2','B21.111'),
('Bai02', N'Đánh giá thực trạng, phân loại điều kiện lao động đối với công nhân hoạt động ngành dệt may và đề xuất giải pháp cải thiện điều kiện lao động','CD4','B21.112'),
('Bai43', N'Thiết kế mô hình phần cứng trong hệ thống kiểm soát lực kéo trên xe','CD6','B21.113'),
('Bai28', N'Nghiên cứu các thông số in 3D ảnh hưởng đến độ lệch của sản phẩm bằng phương pháp Taguchi','CD3','B21.211'),
('Bai21', N'Nghiên cứu cơ chế phóng điện của đá mài kim cương trong môi trường sương mù','CD2','B21.212'),
('Bai12', N'Thiết kế và thử nghiệm xác định thông số vận hành máy bóc vỏ mía theo nguyên lý chổi tròn','CD4','B21.213'),
('Bai31', N'Áp dụng phương pháp lọc cộng tác cho hệ thống đề xuất tài liệu','CD8','B21.311'),
('Bai32', N'Phát triển hệ thống IoT để cảnh báo sốc nhiệt cho vật nuôi','CD8','B21.312'),
('Bai7', N'Xử lý dữ liệu lớn với apache spark','CD1','B21.313'),
('Bai8', N'Phân loại bài báo sử dụng machine learning: Nghiên cứu điển hình của tạp chí khoa học đại học Trà Vinh','CD1','B21.411'),
('Bai37', N'Một mạng lưới thần kinh lan truyền ngược với độ trễ và cửa sổ thay đổi để dự báo nhu cầu du lịch','CD4','B21.412'),
('Bai19', N'Đánh giá của Vision Transformer về nhận dạng hình ảnh thời tiết','CD4','B21.413'),
('Bai9', N'Sử dụng SIMATIC IOT2050 để điều khiển và giám sát các trạm MPS','CD1','B21.511'),
('Bai13', N'Đánh giá tác động của tấm pin mặt trời tới môi trường','CD7','B21.512'),
('Bai15', N'Ứng dụng của Automation Studio trong giáo dục','CD3','B21.513'),
('Bai6', N'Lựa chọn phương pháp phân tích độ trễ không thể thiếu: Phương pháp tiếp cận AHP-RII tích hợp','CD1','B21.711'),
('Bai27', N'Đề xuất giải pháp xây dựng một bến cảng kết cấu phù hợp cho các phương tiện nhẹ và tàu thuyền trong khu vực địa chất của tỉnh Trà Vinh','CD4','B21.712'),
('Bai36', N'Tối ưu hóa tấm composite cứng bằng cách sử dụng Balancing composite tối ưu hóa chuyển động','CD3','B21.713'),

('Bai10', N'Nghiên cứu so sánh các loại bộ điều khiển khác nhau trong hệ thống chống bó cứng phanh bằng MATLAB/Simulink','CD6','B21.121'),
('Bai5', N'Xây dựng thuật toán điều khiển khả năng phản hồi của túi khí ô tô','CD6','B21.122'),
('Bai4', N'Mô phỏng số học của quá trình quay điện bằng Comsol Multiphysicals','CD2','B21.221'),
('Bai22', N'Mô hình dầm Timoshenko rời rạc dùng để mô hình dầm có diện tích mặt cắt ngang không đều, độ cong và độ võng lớn','CD4','B21.222'),
('Bai20', N'Hệ thống khuyến nghị: Đánh giá ngắn','CD4','B21.321'),
('Bai17', N'Giảng dạy thực hành DevOps và Kỹ thuật phần mềm bằng hệ thống đánh giá lập trình tự động','CD1','B21.322'),
('Bai38', N'Một hệ thống phát hiện cú ngã mới sử dụng phương pháp hỗ trợ máy đi bộ thông minh và phương pháp máy học','CD4','B21.323'),
('Bai39', N'Phân tích nhật ký Git trong Hệ thống đánh giá lập trình tự động nhận biết chất lượng mã: Một nghiên cứu điển hình','CD1','B21.324'),
('Bai40', N'Hệ thống mới dự báo thiệt hại do bệnh hại lúa ở tỉnh An Giang, Việt Nam','CD4','B21.421'),
('Bai34', N'Một nghiên cứu thực nghiệm về phát hiện đánh giá giả mạo','CD8','B21.422'),
('Bai42', N'Kỹ thuật ẩn dữ liệu có thể đảo ngược và ứng dụng trong bảo mật thông tin','CD1','B21.423'),
('Bai30', N'Khai thác mạch võng mạc dựa trên việc cải thiện khả năng phát hiện đường','CD4','B21.424'),
('Bai23', N'Phân tích ổn định của hệ thống điện Nhà máy nhiệt điện Duyên Hải','CD2','B21.521'),
('Bai41', N'Xây dựng mô hình phân tích ổn định đường dây Nhà máy nhiệt điện Duyên Hải 1 đầuu nối vào lưới điện 220 kv vùng đồng bằng sông Cửu Long','CD2','B21.522'),
('Bai16', N'Nghiên cứu giải pháp phân loại chi tiết bằng kỹ thuật xử lý ảnh','CD1','B21.721'),
('Bai26', N'Phân đoạn LiDAR 3D dựa trên phân cụm Euclide cho hệ thống nhúng','CD1','B21.722'),
('Bai33', N'Nghiên cứu hệ thống đo nhiệt độ cơ thể người tự động dựa trên Internet of Things','CD4','B21.723');

SELECT * 
FROM BaiThamLuan

----NGUOITHAMDU - BAITHAMLUAN - VAITRO----
INSERT BaiThamLuan_NguoiThamDu_VaiTro(MaBaiThamLuan,MaNguoiThamDu,MaVaiTro) VALUES
('Bai1','TD14','TG1.1'),
('Bai2','TD54','TG1.2'),
('Bai3','TD26','TG1.3'),
('Bai11','TD28','TG2.5'),
('Bai11','TD55','TG3.5'),
('Bai11','TD56','TG4.5'),
('Bai02','TD20','TG2.6'),
('Bai02','TD57','TG3.3'),
('Bai02','TD58','TG4.6'),
('Bai02','TD59','TG4.6'),
('Bai43','TD49','TG1.7'),
('Bai28','TD61','TG2.9'),
('Bai28','TD4','TG3.9'),
('Bai28','TD62','TG4.9'),
('Bai21','TD63','TG2.10'),
('Bai21','TD64','TG3.10'),
('Bai12','TD65','TG2.11'),
('Bai12','TD66','TG4.11'),
('Bai31','TD67','TG2.13'),
('Bai31','TD68','TG3.13'),
('Bai32','TD69','TG2.14'),
('Bai32','TD5','TG3.14'),
('Bai7','TD70','TG2.15'),
('Bai7','TD42','TG3.15'),
('Bai7','TD71','TG4.15'),
('Bai7','TD72','TG4.15'),
('Bai8','TD73','TG2.17'),
('Bai8','TD74','TG3.17'),
('Bai8','TD26','TG4.17'),
('Bai37','TD75','TG2.18'),
('Bai37','TD76','TG3.18'),
('Bai19','TD77','TG2.19'),
('Bai19','TD78','TG3.19'),
('Bai9','TD79','TG2.21'),
('Bai9','TD64','TG3.21'),
('Bai13','TD35','TG2.22'),
('Bai13','TD80','TG3.22'),
('Bai13','TD81','TG4.22'),
('Bai15','TD82','TG2.23'),
('Bai15','TD83','TG3.23'),
('Bai6','TD84','TG2.25'),
('Bai6','TD53','TG3.25'),
('Bai27','TD85','TG2.26'),
('Bai27','TD86','TG3.26'),
('Bai27','TD87','TG4.26'),
('Bai36','TD88','TG2.27'),
('Bai36','TD89','TG3.27'),
('Bai36','TD90','TG4.27'),
('Bai36','TD91','TG4.27'),

('Bai10','TD6','TG2.29'),
('Bai10','TD92','TG3.29'),
('Bai5','TD62','TG2.30'),
('Bai5','TD93','TG3.30'),
('Bai5','TD94','TG4.30'),
('Bai5','TD4','TG4.30'),
('Bai4','TD95','TG2.34'),
('Bai4','TD96','TG3.34'),
('Bai4','TD97','TG4.34'),
('Bai22','TD98','TG2.35'),
('Bai22','TD6','TG3.35'),
('Bai22','TD99','TG4.35'),
('Bai22','TD100','TG4.35'),
('Bai20','TD30','TG1.39'),
('Bai17','TD26','TG2.40'),
('Bai17','TD51','TG4.40'),
('Bai38','TD101','TG2.41'),
('Bai38','TD102','TG3.41'),
('Bai38','TD103','TG4.41'),
('Bai39','TD26','TG2.42'),
('Bai39','TD51','TG3.42'),
('Bai39','TD15','TG4.42'),
('Bai40','TD76','TG2.44'),
('Bai40','TD104','TG3.44'),
('Bai34','TD7','TG1.45'),
('Bai42','TD2','TG1.46'),
('Bai30','TD105','TG1.47'),
('Bai32','TD106','TG2.49'),
('Bai32','TD107','TG3.49'),
('Bai32','TD108','TG4.49'),
('Bai41','TD107','TG2.50'),
('Bai41','TD108','TG3.50'),
('Bai41','TD106','TG4.50'),
('Bai16','TD109','TG2.54'),
('Bai16','TD34','TG4.54'),
('Bai26','TD110','TG2.55'),
('Bai26','TD34','TG3.55'),
('Bai33','TD111','TG2.56'),
('Bai33','TD112','TG3.56'),
('Bai33','TD113','TG4.56');

SELECT * 
FROM BaiThamLuan_NguoiThamDu_VaiTro
ORDER BY MaNguoiThamDu

----HOITHAO - CHUDE----
INSERT INTO HoiThao_ChuDe(MaHoiThao,MaChuDe) VALUES
('HT1','CD1'),
('HT1','CD2'),
('HT1','CD3'),
('HT1','CD4'),
('HT1','CD5'),
('HT1','CD6'),
('HT1','CD7'),
('HT1','CD8'),
('HT2','CD1'),
('HT2','CD2'),
('HT2','CD3'),
('HT2','CD4'),
('HT2','CD5'),
('HT2','CD6'),
('HT2','CD7'),
('HT2','CD8');

SELECT * 
FROM HoiThao_ChuDe

----Người tham dự - phiên----
INSERT INTO NguoiThamDu_Phien(MaNguoiThamDu,MaPhien) VALUES
('TD60','PD'),
('TD4','PD'),
('TD14','PD1'),
('TD54','PD2'),
('TD26','PD3'),
('TD6','PSS1.1'),
('TD28','PSS1.11'),
('TD55','PSS1.11'),
('TD56','PSS1.11'),
('TD20','PSS1.12'),
('TD57','PSS1.12'),
('TD58','PSS1.12'),
('TD59','PSS1.12'),
('TD49','PSS1.13');

SELECT * 
FROM NguoiThamDu_Phien

--Hiển thị các hội thảo thuộc đơn vị tổ chức
SELECT TenHoiThao, TenDonViToChuc
FROM HoiThao a,DonViToChuc b
WHERE a.MaDonViToChuc=b.MaDonViToChuc

---Hiển thị tên hội thảo tên chủ đề thuộc hội thảo
SELECT TenHoiThao, TenChuDe 
FROM HoiThao a, HoiThao_ChuDe b, ChuDe c
WHERE a.MaHoiThao=b.MaHoiThao
and b.MaChuDe=c.MaChuDe

---Bài tham luận thuộc chủ đề 
SELECT TenBaiThamLuan, TenChuDe
FROM BaiThamLuan a, ChuDe b
WHERE a.MaChuDe=b.MaChuDe

---Tên các bài tham luận, tên tác giả, vai trò của tác giả
SELECT  TenBaiThamLuan,TenVaiTro,TenNguoiThamDu
FROM BaiThamLuan a, VaiTro b, BaiThamLuan_NguoiThamDu_VaiTro c, NguoiThamDu d
WHERE a.MaBaiThamLuan=c.MaBaiThamLuan
and b.MaVaiTro=c.MaVaiTro
and c.MaNguoiThamDu=d.MaNguoiThamDu
ORDER BY TenBaiThamLuan

---Các bài tham luận tại các phòng các phiên
SELECT  TenBaiThamLuan,TenPhong,ThoiGianPhien,ThoiGianBatDau,ThoiGianKetThuc
FROM BaiThamLuan a, Phong b, Phien c
WHERE a.MaPhong=b.MaPhong
and b.MaPhien=c.MaPhien
ORDER BY TenPhong

---Người tham dự có chức vụ, chức danh
SELECT  TenNguoiThamDu,TenChucVu, TenChucDanh
FROM ChucVu a, NguoiThamDu b, ChucDanh c
WHERE a.MaChucVu=b.MaChucVu
and b.MaChucDanh=c.MaChucDanh

---Người tham dự có đơn vị công tác
SELECT TenNguoiThamDu,TenDonViCongTac
FROM NguoiThamDu a, DonViCongTac b
WHERE a.MaDonViCongTac=b.MaDonViCongTac