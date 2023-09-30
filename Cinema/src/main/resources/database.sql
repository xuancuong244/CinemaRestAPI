create database RapPhim

use RapPhim

create table ChucVu(
	MaCV varchar(5) primary key,
	TenCV nvarchar(150)
);

create table ChiNhanh(
    MaCN varchar(5) primary key,
    TenCN nvarchar(150),
    DiaChi nvarchar(500),
    SoDT varchar(10)
);
create table NhanVien(
	MaNV varchar(5) primary key,
	HoTen nvarchar(150),
	GioiTinh int,
	MatKhau varchar(10),
	NgaySinh DATE,
	SoDT varchar(10),
	MaCV varchar(5),
	CONSTRAINT fk_nv_cv FOREIGN key (MaCV) REFERENCES ChucVu (MaCV)
);
create table LichLamViec(
    ID_LLV int AUTO_INCREMENT primary key,
    NgayLam Date,
    ThoiGianBatDau time,
    ThoiGianKetThuc time,
    LuongCoBan float,
    MaNV varchar(5),
    MaCN varchar(5),
    CONSTRAINT fk_llv_nv FOREIGN key (MaNV) REFERENCES NhanVien (MaNV),
    CONSTRAINT fk_llv_cn FOREIGN key (MaCN) REFERENCES ChiNhanh (MaCN)
);

create table CSVC(
    MaCSVC varchar(5) primary key,
    TenCSVC nvarchar(150),
    Hinh nvarchar(150)
);
create table KhachHang(
	MaKH int AUTO_INCREMENT primary key,
	TenKH nvarchar(150),
	MatKhau varchar(10),
	Email varchar(30) unique,
	SoDT varchar(10),
	DiaChi nvarchar(500),
	GioiTinh bit,
	IdFB nvarchar(150),
	HinhFB nvarchar(150)
);

create table Topping(
	MaTopping varchar(5) primary key,
	TenTopping nvarchar(150),
	SoLuongDangCo int,
	Gia float,
	hinh nvarchar(150)
);

create table LoaiGhe(
	MaLoai int primary key ,
	TenLoai nvarchar(150),
	PhuThu float
);

create table Ghe(
	MaGhe varchar(5) primary key,
	TenGhe varchar(5),
	MaLoai int,
	CONSTRAINT fk_ghe_loaighe foreign key (MaLoai) references LoaiGhe(MaLoai)
);

create table TheLoai(
	MaTheLoai varchar(5) primary key,
	TenTheLoai nvarchar(150)
);

create table Phim(
	MaPhim varchar(5) primary key,
	TenPhim nvarchar(150),
	DienVien nvarchar(150),
	NamSX int,
	Hinh nvarchar(150),
	DaoDien nvarchar(150),
	QuocGia nvarchar(150),
	ThoiLuong nvarchar(150),
	MoTa nvarchar(150),
	Traller nvarchar(150)
);

create table ChiTietPhim(
	MaPhim varchar(5),
	MaTheLoai varchar(5),
	primary key (MaPhim,MaTheLoai),
	constraint fk_ctphim_phim foreign key (MaPhim) references Phim(MaPhim) on delete cascade,
	constraint fk_ctphim_theloai foreign key (MaTheLoai) references TheLoai(MaTheLoai)
);

create table NgayChieu(
	Stt int AUTO_INCREMENT primary key,
	Ngay date,
	GioBatDau time
);

create table PhongChieu(
	MaPhong varchar(5) primary key,
	TenPhong nvarchar(150),
	MaCN varchar(5),
	constraint fk_pc_cn foreign key (MaCN) references ChiNhanh(MaCN)
);

create table ChiTietGhe (
	MaCTGhe int primary key,
	MaPhong varchar(5),
	MaGhe varchar(5),
	constraint fk_ctghe_phong foreign key (MaPhong) references PhongChieu(MaPhong),
	constraint fk_ctghe_ghe foreign key(MaGhe) references Ghe (MaGhe)
);
create table CT_CSVC(
    MaCSVC varchar(5),
    MaPhong varchar(5),
	SoLuong int,
    primary key (MaCSVC,MaPhong),
    constraint fk_ctcsvc_phong foreign key (MaPhong) references PhongChieu(MaPhong),
	constraint fk_ctcsvc_csvc foreign key(MaCSVC) references CSVC (MaCSVC)
);
create table XuatChieu(
	Stt int AUTO_INCREMENT primary key,
	GiaXuatChieu float,
	Ngay int,
	MaPhong varchar(5),
	MaPhim varchar(5),
	foreign key(Ngay) references NgayChieu(Stt),
	constraint fk_xuatchieu_phong foreign key(MaPhong) references PhongChieu(MaPhong),
constraint fk_xuatchieu_phim foreign key (MaPhim) references Phim(MaPhim) on delete cascade
);

create table Ve(
	IdVe int AUTO_INCREMENT primary key,
	TongGiaVe float,
	ThueVAT float,
	MaKH int,
	MaCTGhe int,
	Stt_XC int,
	constraint fk_ve_khachhang foreign key (MaKH) references KhachHang(MaKH) on delete cascade,
	constraint fk_ve_ctghe foreign key(MaCTGhe) references ChiTietGhe(MaCTGhe)
);

create table ChiTietTopping(
	IdVe int,
	MaTopping varchar(5),
	SoLuongMua int,
	primary key(IdVe,MaTopping),
	constraint fk_ctTopping_Topping foreign key(MaTopping) references Topping(MaTopping) on delete cascade,
	constraint fk_ctTopping_Ve foreign key(IdVe) references Ve(IdVe) on delete cascade
);
 
 -- Chức vụ
insert into ChucVu values ('CV1', N'Quản trị');
insert into ChucVu values ('CV2', N'Nhân viên quản lí vé');
insert into ChucVu values ('CV3', N'Nhân viên quản lí phim');
insert into ChucVu values ('CV4', N'Nhân viên quản lí phòng chiếu');
insert into ChucVu values ('CV5', N'Nhân viên quản lí lịch chiếu');
insert into ChucVu values ('CV6', N'Ban quản lí');
insert into ChucVu values ('CV7', N'Khách hàng');

-- Chi nhánh
insert into ChiNhanh values ('CN1', N'TP.HCM', N'645 Quang Trung, Phường 11, Gò Vấp, TP Hồ Chí Minh, Việt Nam', '0123456789');
insert into ChiNhanh values ('CN2', N'Hà Nội', N'8 Đê La Thành, Giảng Võ, Ba Đình, Hà Nội, Việt Nam', '0234567891');
insert into ChiNhanh values ('CN3', N'Cần Thơ', N'21 Đ.3 tháng 2, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', '0346517892');
insert into ChiNhanh values ('CN4', N'Đà Nẵng', N'10 Nại Nam, Hòa Cường Bắc, Hài Châu, Đà Nẵng, Việt Nam', '0282413567');
insert into ChiNhanh values ('CN5', N'Khánh Hòa', N'231 Lê Hồng Phong, Phước Tân, Nha Trang, Khánh Hòa, Việt Nam', '0907845613');
-- Cơ sở vật chất (giành cho nvql phòng chiếu)

-- Khách hàng

-- Nhân viên

-- Ngày chiếu

-- Thể loại
insert into THELOAI values ('LP01','Hành động');
insert into THELOAI values ('LP02','Hài');
insert into THELOAI values ('LP03','Hoạt hình');
insert into THELOAI values ('LP04','Tình cảm');
insert into THELOAI values ('LP05','Kinh dị');

-- Phim

-- chi tiết phim

-- phòng chiếu

-- CT-CSVC

-- Xuất chiếu

-- Loại ghế
insert into LoaiGhe values(1, N'Thường',45000);
insert into LoaiGhe values(2, N'Đôi',60000);
insert into LoaiGhe values(3,N'Vip',75000);

-- Ghế
insert into Ghe values('g1','A1',1);
insert into Ghe values('g2','A2',1);
insert into Ghe values('g3','A3',1);
insert into Ghe values('g4','A4',1);
insert into Ghe values('g5','A5',1);
insert into Ghe values('g6','A6',1);
insert into Ghe values('g7','A7',1);
insert into Ghe values('g8','A8',1);
insert into Ghe values('g9','A9',1);
insert into Ghe values('g10','A10',1);
insert into Ghe values('g11','A11',1);
insert into Ghe values('g12','A12',1);
insert into Ghe values('g13','B1',1);
insert into Ghe values('g14','B2',1);
insert into Ghe values('g15','B3',1);
insert into Ghe values('g16','B4',1);
insert into Ghe values('g17','B5',1);
insert into Ghe values('g18','B6',1);
insert into Ghe values('g19','B7',1);
insert into Ghe values('g20','B8',1);
insert into Ghe values('g21','B9',1);
insert into Ghe values('g22','B10',1);
insert into Ghe values('g23','B11',1);
insert into Ghe values('g24','B12',1);
insert into Ghe values('g25','C1',1);
insert into Ghe values('g26','C2',1);
insert into Ghe values('g27','C3',1);
insert into Ghe values('g28','C4',1);
insert into Ghe values('g29','C5',1);
insert into Ghe values('g30','C6',1);
insert into Ghe values('g31','C7',1);
insert into Ghe values('g32','C8',1);
insert into Ghe values('g33','C9',1);
insert into Ghe values('g34','C10',1);
insert into Ghe values('g35','C11',1);
insert into Ghe values('g36','C12',1);
insert into Ghe values('g37','D1',1);
insert into Ghe values('g38','D2',1);
insert into Ghe values('g39','D3',1);
insert into Ghe values('g40','D4',1);
insert into Ghe values('g41','D5',1);
insert into Ghe values('g42','D6',1);
insert into Ghe values('g43','D7',1);
insert into Ghe values('g44','D8',1);
insert into Ghe values('g45','D9',1);
insert into Ghe values('g46','D10',1);
insert into Ghe values('g47','D11',1);
insert into Ghe values('g48','D12',1);
insert into Ghe values('g49','E1',2);
insert into Ghe values('g50','E2',2);
insert into Ghe values('g51','E3',2);
insert into Ghe values('g52','E4',2);
insert into Ghe values('g53','E5',2);
insert into Ghe values('g54','E6',2);
insert into Ghe values('g55','E7',2);
insert into Ghe values('g56','E8',2);
insert into Ghe values('g57','E9',2);
insert into Ghe values('g58','E10',2);
insert into Ghe values('g59','E11',2);
insert into Ghe values('g60','E12',2);
insert into Ghe values('g61','F1',2);
insert into Ghe values('g62','F2',2);
insert into Ghe values('g63','F3',2);
insert into Ghe values('g64','F4',2);
insert into Ghe values('g65','F5',2);
insert into Ghe values('g66','F6',2);
insert into Ghe values('g67','F7',2);
insert into Ghe values('g68','F8',2);
insert into Ghe values('g69','F9',2);
insert into Ghe values('g70','F10',2);
insert into Ghe values('g71','F11',2);
insert into Ghe values('g72','F12',2);
insert into Ghe values('g73','G1',2);
insert into Ghe values('g74','G2',2);
insert into Ghe values('g75','G3',2);
insert into Ghe values('g76','G4',2);
insert into Ghe values('g77','G5',2);
insert into Ghe values('g78','G6',2);
insert into Ghe values('g79','G7',2);
insert into Ghe values('g80','G8',2);
insert into Ghe values('g81','G9',2);
insert into Ghe values('g82','G10',2);
insert into Ghe values('g83','G11',2);
insert into Ghe values('g84','G12',2);
insert into Ghe values('g85','H1',2);
insert into Ghe values('g86','H2',2);
insert into Ghe values('g87','H3',2);
insert into Ghe values('g88','H4',2);
insert into Ghe values('g89','H5',2);
insert into Ghe values('g90','H6',2);
insert into Ghe values('g91','H7',2);
insert into Ghe values('g92','H8',2);
insert into Ghe values('g93','H9',2);
insert into Ghe values('g94','H10',2);
insert into Ghe values('g95','H11',2);
insert into Ghe values('g96','H12',2);
insert into Ghe values('g97','J1',3);
insert into Ghe values('g98','J2',3);
insert into Ghe values('g99','J3',3);
insert into Ghe values('g100','J4',3);
insert into Ghe values('g101','J5',3);
insert into Ghe values('g102','J6',3);
insert into Ghe values('g103','J7',3);
insert into Ghe values('g104','J8',3);
insert into Ghe values('g105','J9',3);
insert into Ghe values('g106','J10',3);
insert into Ghe values('g107','J11',3);
insert into Ghe values('g108','J12',3);
insert into Ghe values('g109','J13',3);
insert into Ghe values('g110','J14',3);

-- chi tiết ghế

-- vé

-- lịch làm việc

-- topping

-- chi tiết topping