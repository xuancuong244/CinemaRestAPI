create database RapPhim
use RapPhim
create table chuc_vu
(
    ma_cv  varchar(5) primary key,
    ten_cv nvarchar(150)
);

create table nhan_vien
(
    ma_nv     varchar(5) primary key,
    ho_ten    nvarchar(150),
	email	  varchar(30) unique,
    gioi_tinh bit,
    mat_khau  varchar(10),
    ngay_sinh DATE,
    so_dt     varchar(10),
    ma_cv     varchar(5),
    CONSTRAINT fk_nv_cv FOREIGN key (ma_cv) REFERENCES chuc_vu (ma_cv)
);

create table khach_hang
(
    ma_KH     int identity (1,1) primary key,
    ten_KH    nvarchar(150),
    mat_khau  varchar(10),
    email     varchar(30) unique,
    so_DT     varchar(10),
    dia_chi   nvarchar(500),
    gioi_tinh bit,
    id_FB     nvarchar(150),
    hinh_FB   nvarchar(150)
);


create table chi_nhanh
(
    ma_cn   varchar(5) primary key,
    ten_cn  nvarchar(150),
    dia_chi nvarchar(500),
    so_dt   varchar(10)
);

create table lich_lam_viec
(
    id_llv             int identity (1,1) primary key,
    ngay_lam           Date,
    thoi_gian_bat_dau  time,
    thoi_gian_ket_thuc time,
    luong_co_ban       float,
    ma_nv              varchar(5),
    ma_cn              varchar(5),
    CONSTRAINT fk_llv_nv FOREIGN key (ma_nv) REFERENCES nhan_vien (ma_nv),
    CONSTRAINT fk_llv_cn FOREIGN key (ma_cn) REFERENCES chi_nhanh (ma_cn)
);
create table csvc
(
    ma_CSVC  varchar(5) primary key,
    ten_CSVC nvarchar(150),
    hinh     nvarchar(150)
);

create table topping
(
    ma_topping       varchar(5) primary key,
    ten_topping      nvarchar(150),
    so_luong_dang_co int,
    gia              float,
    hinh             nvarchar(150)
);
create table loai_ghe
(
    ma_loai  int primary key,
    ten_loai nvarchar(150),
    phu_thu  float
);
create table ghe
(
    ma_ghe  varchar(5) primary key,
    ten_ghe varchar(5),
    ma_loai int,
    CONSTRAINT fk_ghe_loaighe foreign key (ma_loai) references loai_ghe (ma_loai)
);
create table the_loai
(
    ma_the_loai  varchar(5) primary key,
    ten_the_loai nvarchar(150)
);

create table phim
(
    ma_phim         varchar(5) primary key,
    ten_phim        nvarchar(500),
    dien_vien       nvarchar(500),
    namsx           int,
    hinh            nvarchar(500),
    dao_dien        nvarchar(500),
    quoc_gia        nvarchar(500),
    thoi_luong      nvarchar(500),
    mo_ta           nvarchar(1550),
    trailer         nvarchar(150),
    trang_thai      nvarchar(150),
    ngay_khoi_chieu date
);
create table chi_tiet_phim
(
    ma_phim     varchar(5),
    ma_the_loai varchar(5),
    primary key (ma_phim, ma_the_loai),
    constraint fk_ctphim_phim foreign key (ma_phim) references phim (ma_phim) on delete cascade,
    constraint fk_ctphim_theloai foreign key (ma_the_loai) references the_loai (ma_the_loai)
);
create table ngay_chieu
(
    stt         int identity (1,1) primary key,
    ngay        date,
    gio_bat_dau time
);
create table phong_chieu
(
    ma_phong  varchar(5) primary key,
    ten_phong nvarchar(150),
    ma_cn     varchar(5),
    constraint fk_pc_cn foreign key (ma_cn) references chi_nhanh (ma_cn)
);
create table chi_tiet_ghe
(
    ma_ctghe int primary key,
    ma_phong varchar(5),
    ma_ghe   varchar(5),
    constraint fk_ctghe_phong foreign key (ma_phong) references phong_chieu (ma_phong),
    constraint fk_ctghe_ghe foreign key (ma_ghe) references ghe (ma_ghe)
);
create table ct_csvc
(
    ma_csvc  varchar(5),
    ma_phong varchar(5),
    so_luong int,
    primary key (ma_csvc, ma_phong),
    constraint fk_ctcsvc_phong foreign key (ma_phong) references phong_chieu (ma_phong),
    constraint fk_ctcsvc_csvc foreign key (ma_csvc) references CSVC (ma_csvc)
);
create table xuat_chieu
(
    stt            int identity (1,1) primary key,
    gia_xuat_chieu float,
    ma_ngay_chieu           int,
    ma_phong       varchar(5),
    ma_phim        varchar(5),
    foreign key (ma_ngay_chieu) references ngay_chieu (stt),
    constraint fk_xuatchieu_phong foreign key (ma_phong) references phong_chieu (ma_phong),
    constraint fk_xuatchieu_phim foreign key (ma_phim) references phim (ma_phim) on delete cascade
);
create table ve
(
    id_ve       int identity (1,1) primary key,
    tong_gia_ve float,
    thue_vat    float,
    ma_kh       int,
    ma_ctghe    int,
    stt_xc      int,
    constraint fk_ve_khachhang foreign key (ma_kh) references khach_hang (ma_kh) on delete cascade,
    constraint fk_ve_ctghe foreign key (ma_ctghe) references chi_tiet_ghe (ma_ctghe)
);
create table chi_tiet_topping
(
    id_ve        int,
    ma_topping   varchar(5),
    so_luong_mua int,
    primary key (id_ve, ma_topping),
    constraint fk_ctTopping_Topping foreign key (ma_topping) references topping (ma_topping) on delete cascade,
    constraint fk_ctTopping_Ve foreign key (id_ve) references ve (id_ve) on delete cascade
);

-- Chức vụ
insert into chuc_vu
values ('CV1', N'Quản trị');
insert into chuc_vu
values ('CV2', N'Nhân viên');
insert into chuc_vu
values ('CV3', N'Khách hàng');

-- Chi nhánh
insert into chi_nhanh
values ('CN1', N'TP.HCM', N'645 Quang Trung, Phường 11, Gò Vấp, TP Hồ Chí Minh, Việt Nam', '0123456789');
insert into chi_nhanh
values ('CN2', N'Hà Nội', N'8 Đê La Thành, Giảng Võ, Ba Đình, Hà Nội, Việt Nam', '0234567891');
insert into chi_nhanh
values ('CN3', N'Cần Thơ', N'21 Đ.3 tháng 2, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', '0346517892');
insert into chi_nhanh
values ('CN4', N'Đà Nẵng', N'10 Nại Nam, Hòa Cường Bắc, Hài Châu, Đà Nẵng, Việt Nam', '0282413567');
insert into chi_nhanh
values ('CN5', N'Khánh Hòa', N'231 Lê Hồng Phong, Phước Tân, Nha Trang, Khánh Hòa, Việt Nam', '0907845613');

-- Cơ sở vật chất (giành cho nvql phòng chiếu)
insert into CSVC
values ('VC1', N'Máy chiếu', 'vc1.png');
insert into CSVC
values ('VC2', 'Camera', 'vc2.png');
insert into CSVC
values ('VC3', N'Máy lạnh', 'vc3.png');
insert into CSVC
values ('VC4', N'Cảm biến báo khói ', 'vc4.png');
insert into CSVC
values ('VC5', N'Bình xịt chữa cháy', 'vc5.png');

-- Khách hàng
insert into khach_hang
values (N'Nguyễn Thị Thư', '12345678', 'thunt123@gmail.com', '0875963214', N'Thuận An, Bình Dương', 0, null, null);
insert into khach_hang
values (N'Lê Minh Hoàng', '12345678', 'hoangle54@gmail.com', '0320394978', N'Bình Lợi, TP HCM', 1, null, null);
insert into khach_hang
values (N'Phan Huỳnh Tuấn Kiệt', '12345678', 'kiett328@gmail.com', '0908664177', N'Dĩ An, Bình Dương', 1, null, null);
insert into khach_hang
values (N'Nguyễn Xuân Cường', '12345678', 'cuongnx244@gmail.com', '0369475443', N'Bình Thạnh, TP HCM', 1, null,
        null);
insert into khach_hang
values (N'Nguyễn Văn Khánh', '12345678', 'kytan011103@gmail.com', '0342881452', N'Bình Thạnh, TP HCM', 1, null, null);

-- Nhân viên
insert into nhan_vien
values ('NV01', N'Nguyễn Xuân Cường', 'xuancuong2442003@gmail.com', 1, '123', '2003-01-01', '0123456778', 'CV1');
insert into nhan_vien
values ('NV02', N'Phan Huỳnh Tuấn Kiệt', 'kiet@gmail.com',1, '123', '2002-01-01', '0169912464', 'CV1');
insert into nhan_vien
values ('NV03', N'Nguyễn Văn Khánh', 'khanh@gmail.com',1, '123', '2003-01-01', '0245613789', 'CV2');
insert into nhan_vien
values ('NV04', N'Hồ Thanh Kiệt', 'kietho@gmail.com',1, '123', '2003-01-01', '0907845612', 'CV2');
insert into nhan_vien
values ('NV05', N'Nguyễn Trung Hiếu', 'hieu@gmail.com',1, '123', '2003-01-01', '0378945612', 'CV2');
insert into nhan_vien
values ('NV06', N'Nguyễn Thị Minh Anh', 'anh@gmail.com',0, '123', '2003-01-01', '0987654321', 'CV2');
insert into nhan_vien
values ('NV07', N'Bùi Thị Thu Hương', 'huong@gmail.com',0, '123', '2003-01-01', '0145623789', 'CV2');
insert into nhan_vien
values ('NV08', N'Lê Thị Thảo', 'thao@gmail.com',0, '123', '2003-01-01', '0234567891', 'CV2');

-- Ngày chiếu
insert into ngay_chieu
values ('2023-10-12', '13:00:00');
insert into ngay_chieu
values ('2023-10-12', '14:00:00');
insert into ngay_chieu
values ('2023-10-12', '15:00:00');
insert into ngay_chieu
values ('2023-10-12', '16:00:00');
insert into ngay_chieu
values ('2023-10-12', '17:00:00');
insert into ngay_chieu
values ('2023-10-12', '18:00:00');
insert into ngay_chieu
values ('2023-10-12', '19:00:00');
insert into ngay_chieu
values ('2023-10-12', '20:00:00');
insert into ngay_chieu
values ('2023-10-12', '21:00:00');
insert into ngay_chieu
values ('2023-10-12', '22:00:00');
insert into ngay_chieu
values ('2023-10-12', '23:00:00');
insert into ngay_chieu
values ('2023-10-13', '13:30:00');
insert into ngay_chieu
values ('2023-10-13', '14:30:00');
insert into ngay_chieu
values ('2023-10-13', '15:30:00');
insert into ngay_chieu
values ('2023-10-13', '16:00:00');
insert into ngay_chieu
values ('2023-10-13', '17:45:00');
insert into ngay_chieu
values ('2023-10-13', '18:00:00');
insert into ngay_chieu
values ('2023-10-13', '19:30:00');
insert into ngay_chieu
values ('2023-10-13', '20:15:00');
insert into ngay_chieu
values ('2023-10-13', '21:00:00');
insert into ngay_chieu
values ('2023-10-13', '22:00:00');
insert into ngay_chieu
values ('2023-10-13', '23:00:00');
insert into ngay_chieu
values ('2023-10-14', '13:00:00');
insert into ngay_chieu
values ('2023-10-14', '14:00:00');
insert into ngay_chieu
values ('2023-10-14', '15:00:00');
insert into ngay_chieu
values ('2023-10-14', '16:00:00');
insert into ngay_chieu
values ('2023-10-14', '17:00:00');
insert into ngay_chieu
values ('2023-10-14', '18:00:00');
insert into ngay_chieu
values ('2023-10-14', '19:00:00');
insert into ngay_chieu
values ('2023-10-14', '20:00:00');
insert into ngay_chieu
values ('2023-10-14', '21:00:00');
insert into ngay_chieu
values ('2023-10-14', '22:00:00');
insert into ngay_chieu
values ('2023-10-14', '23:00:00');
insert into ngay_chieu
values ('2022-10-15', '13:00:00');
insert into ngay_chieu
values ('2022-10-15', '14:00:00');
insert into ngay_chieu
values ('2022-10-15', '15:00:00');
insert into ngay_chieu
values ('2022-10-15', '16:00:00');
insert into ngay_chieu
values ('2022-10-15', '17:00:00');
insert into ngay_chieu
values ('2022-10-15', '18:00:00');
insert into ngay_chieu
values ('2022-10-15', '19:00:00');
insert into ngay_chieu
values ('2022-10-15', '20:00:00');
insert into ngay_chieu
values ('2022-10-15', '21:00:00');

-- Thể loại
insert into the_loai
values ('LP01', 'Hành động');
insert into the_loai
values ('LP02', 'Hài');
insert into the_loai
values ('LP03', 'Hoạt hình');
insert into the_loai
values ('LP04', 'Tình cảm');
insert into the_loai
values ('LP05', 'Kinh dị');
insert into the_loai
values ('LP06', N'Phiêu Lưu');
insert into the_loai
values ('LP07', N'Tâm Lý');
insert into the_loai
values ('LP08', N'Hồi Hộp');
insert into the_loai
values ('LP09', N'Tội Phạm');
-- Phim
INSERT INTO phim
VALUES ('MP01', N'Biệt Đội Đánh Thuê 4', 'Jason Statham, Sylvester Stallone, Megan Fox', 2023, 'MP01.jpg',
        'Scott Waugh', N'Mỹ', '103 phút',
        N'Biệt Đội Đánh Thuê, bao gồm các chiến binh kỳ cựu và tân binh, đang đối mặt với nhiệm vụ nguy hiểm: ngăn chặn Suharato Rahmat, một tên buôn vũ khí nguy hiểm, khỏi giao kíp nổ hạt nhân cho Ocelot, một kẻ độc ác đe dọa thế giới. Hành trình từ một nhà máy vũ khí cũ ở Qadhafi đến con thuyền Jantara sẽ hé lộ những bí mật và sự thật đáng kinh ngạc về Ocelot.',
        'https://www.youtube.com/embed/TQpve2zTDSQ','DC','2023-09-22');
INSERT INTO phim
VALUES ('MP02', N'Ác Quỷ Ma Sơ 2', 'Taissa Farmiga, Bonnie Aarons, Storm Reid, Jonas Bloquet, Anna Popplewell', 2023,
        'MP02.jpg', 'Michael Chaves', N'Mỹ', '110 phút',
        N'Valak trở lại với "Ác Quỷ Ma Sơ 2". Đây sẽ là phần hậu truyện của Ác Quỷ Ma Sơ và đồng thời là phần phim thứ chín thuộc Vũ trụ The Conjuring. Lấy bối cảnh nước Pháp năm 1956, cùng cái chết bí ẩn của một linh mục, một giai thoại đáng sợ và ám ảnh sẽ mở ra. Phần phim tiếp tục xoay quanh nhân vật chính - Sơ Irene - do Taissa Farmiga thủ vai.',
        'https://www.youtube.com/embed/otM2V_g8Kqo','DC','2023-09-08');
INSERT INTO phim
VALUES ('MP03', N'Người Dơi Bắt Đầu',
        'Christian Bale, Michael Caine, Liam Neeson, Katie Holmes, Cillian Murphy, Ken Wanatabe, Gary Oldman', 2023,
        'MP03.png', 'Christopher Nolan', N'Mỹ', '140 phút',
        N'Người Dơi Bắt Đầu là phần đầu tiên trong trilogy thành công bậc nhất hai thập niên đầu thế kỷ 21, xoay quanh câu chuyện về nhân vật siêu anh hùng lẫy lừng vũ trụ DC - Bruce Wayne/ Batman. Phần phim đầu sẽ cùng khán giả lật mở những bí mật trong quá khứ của nhân vật đình đám này: Từ nỗi sợ của Bruce Wayne với loài dơi đến cái chết của cha mẹ anh, hành trình trở thành Batman chống lại những ác nhân hoành hành tại thành phố tội ác Gotham.',
        'https://www.youtube.com/embed/DB18OGB-ABM','DC','2023-09-27');
INSERT INTO phim
VALUES ('MP04', N'PAW Patrol: Phim Siêu Đẳng', 'Kim Roberts, Chris Rock, Saint West, Nylan Parthipan, Christian Corrao',
        2023, 'MP04.png', 'Cal Brunker', N'Mỹ', '93 phút',
        N'Một mảnh thiên thạch kỳ diệu đã rơi xuống Thành Phố Phiêu Lưu, mang đến siêu năng lực cho những chú cún PAW Patrol và biến chúng thành Những Chú Cún Quyền Năng.',
        'https://www.youtube.com/embed/6rVUn7TKHS4','DC','2023-09-29');
INSERT INTO phim
VALUES ('MP05', N'Giao Lộ 8675', 'Isaac, Rocker Nguyễn, La Thành, Emma Lê, Lợi Trần, Ngọc Hồ', 2023, 'MP05.png',
        'Tân DS', N'Việt Nam', '107 phút',
        N'Bộ phim xoay quanh câu chuyện về các bạn trẻ dù xuất hiện tại những bối cảnh khác nhau và đối mặt vấn đề riêng, tất cả cùng có chung một điểm là những người trẻ đang đứng trước những ''ngọn núi" phải chinh phục của chính mình.',
        'https://www.youtube.com/embed/RqFV-tHeNeg','SC','2023-10-06');
INSERT INTO phim
VALUES ('MP06', N'Nhân Duyên Tiền Đình', 'Woo Hyeon, Ko A-sung, Yim Si-wan, Yeom Hye-ran, Jung Woo-Sung', 2023,
        'MP06.jpg', 'Lee Han', N'Hàn Quốc', '118 phút',
        N'Chuyện phim xoay quanh nhân vật Chi-ho (Yoo Hae-jin) - nhà nghiên cứu bánh snack với khả năng nếm vị xuất chúng, nhưng lại ngờ nghệch với mọi thứ xung quanh. Chi-ho là một người hướng nội điển hình, thích ở một mình và sống như một cái máy được lập trình sẵn mà không hề mắc lỗi dù chỉ một giây. Trong lúc phải đi trả nợ thay cho người anh trai nghiện cờ bạc (Cha In-pyo), Chi-ho tình cờ gặp gỡ “nhân viên đòi nợ” Il-young - người phụ nữ hướng ngoại, luôn suy nghĩ tích cực về cuộc sống dù đang ở trong hoàn cảnh khó khăn của một bà mẹ đơn thân.',
        'https://www.youtube.com/embed/jsGOuqU6SBQ','SC','2023-09-15');
INSERT INTO phim
VALUES ('MP07', N'Đất Rừng Phương Nam',
        'Hồng Ánh, Huỳnh Hạo Khang, Mai Tài Phến, Công Ninh, Hứa Vĩ Văn, Tuyền Mập, Tuấn Trần.', 2023, 'MP07.jpg',
        'Nguyễn Quang Dũng', N'Việt Nam', '100 phút',
        N'Đất Rừng Phương Nam phiên bản điện ảnh được kế thừa và phát triển từ tiểu thuyết cùng tên của nhà văn Đoàn Giỏi và tác phẩm truyền hình nổi tiếng “Đất Phương Nam” của đạo diễn Nguyễn Vinh Sơn. Bộ phim kể về hành trình phiêu lưu của An - một cậu bé chẳng may mất mẹ trên đường đi tìm cha. Cùng với An, khán giả sẽ trải nghiệm sự trù phú của thiên nhiên và nét đẹp văn hoá đặc sắc của vùng đất Nam Kì Lục Tỉnh, sự hào hiệp của những người nông dân bám đất bám rừng và tinh thần yêu nước kháng Pháp đầu thế kỉ 20. Bên cạnh đó, tình cảm gia đình, tình bạn, tình người, tình thầy trò, tình yêu nước là những cung bậc cảm xúc sâu sắc sẽ đọng lại qua mỗi bước chân của An và đồng bạn.',
        'https://www.youtube.com/embed/yrMDJduy4wI','DC','2023-10-20');
INSERT INTO phim
VALUES ('MP08', N'Kẻ Kiến Tạo',
        'John David Washington, Gemma Chan, Ken Watanabe, Sturgill Simpson, Madeleine Yuna Voyles', 2023, 'MP08.jpg',
        'Gareth Edwards', N'Mỹ', '133 phút',
        N'Trong tương lai, thế giới xảy ra một cuộc chiến tranh kéo dài giữa loài người và trí tuệ nhân tạo (AI). Joshua (John David Washington) - 1 cựu đặc vụ lì lợm, được thuê để giết “The Creator” - kẻ được xem là đầu não của AI và đã tạo ra 1 loại vũ khí bí ẩn đủ mạnh để kết thúc cuộc chiến và quét sạch nhân loại.',
        'https://www.youtube.com/embed/Aognln5uNwA','SC','2023-09-29');
INSERT INTO phim
VALUES ('MP09', N'Thảm Họa Mưa Axit', 'Guillaume Canet, Laetitia Dosch, Patience Munchenbach', 2023, 'MP09.jpg',
        'Just Philippot', N'Mỹ', '101 phút',
        N'Giữa một đợt nắng nóng bất thường, thì mây mưa giống như làn gió xua tan oi bức. Nhưng những đám mây kỳ lạ trên bầu trời nước Pháp lại đem tới cho con người sự huỷ diệt và chết chóc. Hàng loạt trận mưa axit đổ xuống, đốt cháy mạng sống của vạn vật dưới mặt đất. Trước sự huỷ diệt tàn bạo của thiên nhiên, một cô gái 15 tuổi phải cùng với cha mẹ mình tìm cách chạy trốn khỏi những cơn mưa axit.',
        'https://www.youtube.com/embed/7pFH2HffdKA','SC','2023-09-29');
INSERT INTO phim
VALUES ('MP10', N'Án Mạng Ở Venice', 'Kenneth Branagh, Michelle Yeoh, Jamie Dornan, Tina Fey, Jude Hill', 2023,
        'MP10.jpg', 'Kenneth Branagh', N'Mỹ', '103 phút',
        N'Dựa trên tiểu thuyết Halloween Party của nhà văn Agatha Christie, hành trình phá án của thám tử Hercule Poirot tiếp tục được đưa lên màn ảnh rộng.',
        'https://www.youtube.com/embed/maw2FnYE_a0','SC','2023-09-14');
INSERT INTO phim
VALUES ('MP11', N'Ánh Dương Sau Hoàng Hôn', 'Zee Pruk Panich, NuNew Chawarin Perdpiriyawong', 2023, 'MP11.jpg',
        'Aod Bhandit Thongdee', N'Thái Lan', '105 phút',
        N'Nhân duyên trời định giữa 2 con người xa lạ được khởi nguồn từ lời nguyền gia tộc buộc Quý nam Phra Ploeng (Zee Pruk Panich) phải ghép tử vi kịp thời với tri kỷ của mình là Saeng Rawee (NuNew Chawarin Perdpiriyawong) nếu không muốn kiếp nạn đại hung sẽ ứng nghiệm vào năm 25 tuổi.',
        'https://www.youtube.com/embed/pY_DSSkgAK0','SC','2023-07-20');
INSERT INTO phim
VALUES ('MP12', N'Kumanthong: Quỷ Linh Nhi',
        'Thanachat Tullayachat, Savika Chaiyadej, Denkhun Ngamnet, Panisara Rikulsurakan', 2023, 'MP12.png',
        'Thitipan Raksasat', N'Thái Lan', '87 phút',
        N'Ging đưa con trai đi nghỉ mát ở căn nhà gỗ nằm giữa rừng cây. Tuy nhiên, cậu bé đã bị bắt cóc vào lúc nửa đêm. Sau bao nỗ lực tìm kiếm, manh mối duy nhất của vụ án đều hướng về người đàn ông tên In, làm nghề mai táng ở đền thờ. Quá tuyệt vọng, Ging đành nhờ cậy thầy đồng địa phương thực hiện nghi lễ hiến tế giữa rừng để tìm tung tích con trai. Những bí ẩn trong ngôi nhà ven rừng dần lộ ra, những cơn ác mộng máu me và hàng loạt cái chết đột ngột ập tới, liệu Ging có đang vướng vào một âm mưu tà ám. Và rằng con trai cô có thật sự đang mất tích?',
        'https://www.youtube.com/embed/XC3ftnZ1WYk','DC','2023-10-06');
INSERT INTO phim
VALUES ('MP13', N'Live - Phát Trực Tiếp', 'Quốc Khánh, Ngọc Phước, Ngân 98', 2023, 'MP13.png', 'Khương Ngọc',
        N'Việt Nam', '91 phút',
        N'“Live - #PhátTrựcTiếp” lựa chọn hai câu chuyện: MUKBANG và REVIEW để lột tả một cách rõ nét được hiện thực của cuộc sống, sự trần trụi của xã hội hiện đại, công nghệ 4.0 đã khiến con người làm đủ mọi cách để nổi tiếng, kể cả hành hạ bản thân mình nhằm nhận được sự tung hô, hào nhoáng bằng những lời khen tặng với dòng text vô thưởng, vô phạt, kiếm tiền bằng “tặng hoa”.',
        'https://www.youtube.com/embed/3r_MJiI9Hr8','DC','2023-09-22');
INSERT INTO phim
VALUES ('MP14', N'Mộng Du', 'Lee Sun Kyun, Jung Yu Mi, Kim Gook Hee', 2023, 'MP14.png', 'Jason Yu', N'Hàn Quốc',
        '94 phút',
        N'Được Bong Joon Ho nhận xét là “phim kinh dị độc đáo nhất của thập kỷ", ngôi vương phòng vé Hàn Quốc - MỘNG DU xoay quanh chuỗi sự kiện ma quái quấy rối giấc ngủ của một cặp vợ chồng trẻ. “Nó" sẽ thức tỉnh lúc nửa đêm.',
        'https://www.youtube.com/embed/WvffHiNHS8Q','SC','2023-10-06');
INSERT INTO phim
VALUES ('MP15', N'Leo Da Vinci: Truy Tìm Kho Báu', 'Johnny Yong Bosch, Cherami Leigh, Bryce Papenbrook', 2023,
        'MP15.jpg', 'Sergio Manfio', N'Ý-Ba Lan', '85 phút',
        N'Cuộc sống trôi qua một cách yên bình ở Vinci: Leonardo đang vật lộn với những phát minh đáng kinh ngạc của mình, Lorenzo giúp đỡ anh ấy và Gioconda quan sát chúng một cách chế giễu. Trở về sau chuyến đi đến hồ, những người bạn của chúng tôi gặp phải một bất ngờ không mong muốn: ngôi nhà và cánh đồng của Gioconda đã bốc cháy một cách bí ẩn. Gioconda phải được giúp đỡ! Giải pháp dường như đã sẵn sàng khi có sự xuất hiện của một người kể chuyện kỳ ​​lạ nói về một kho báu ẩn giấu. Và thế là bắt đầu một cuộc phiêu lưu tuyệt vời!',
        'https://www.youtube.com/embed/7MpYLU3f0OU','DB','2018-01-11');

-- chi tiết phim
INSERT INTO chi_tiet_phim
VALUES ('MP01', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP01', 'LP06');
INSERT INTO chi_tiet_phim
VALUES ('MP02', 'LP05');
INSERT INTO chi_tiet_phim
VALUES ('MP03', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP04', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP04', 'LP06');
INSERT INTO chi_tiet_phim
VALUES ('MP05', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP05', 'LP02');
INSERT INTO chi_tiet_phim
VALUES ('MP06', 'LP02');
INSERT INTO chi_tiet_phim
VALUES ('MP07', 'LP07');
INSERT INTO chi_tiet_phim
VALUES ('MP08', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP08', 'LP06');
INSERT INTO chi_tiet_phim
VALUES ('MP09', 'LP01');
INSERT INTO chi_tiet_phim
VALUES ('MP09', 'LP08');
INSERT INTO chi_tiet_phim
VALUES ('MP10', 'LP07');
INSERT INTO chi_tiet_phim
VALUES ('MP10', 'LP09');
INSERT INTO chi_tiet_phim
VALUES ('MP11', 'LP04');
INSERT INTO chi_tiet_phim
VALUES ('MP11', 'LP05');
INSERT INTO chi_tiet_phim
VALUES ('MP12', 'LP05');
INSERT INTO chi_tiet_phim
VALUES ('MP13', 'LP05');
INSERT INTO chi_tiet_phim
VALUES ('MP13', 'LP07');
INSERT INTO chi_tiet_phim
VALUES ('MP14', 'LP05');
INSERT INTO chi_tiet_phim
VALUES ('MP14', 'LP07');
INSERT INTO chi_tiet_phim
VALUES ('MP15', 'LP03');
INSERT INTO chi_tiet_phim
VALUES ('MP15', 'LP06');

-- phòng chiếu
INSERT INTO phong_chieu
VALUES ('PC01', 'Phòng 1', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC02', 'Phòng 2', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC03', 'Phòng 3', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC04', 'Phòng 4', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC05', 'Phòng 5', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC06', 'Phòng 6', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC07', 'Phòng 7', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC08', 'Phòng 8', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC09', 'Phòng 9', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC10', 'Phòng 10', 'CN1');
INSERT INTO phong_chieu
VALUES ('PC11', 'Phòng 1', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC12', 'Phòng 2', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC13', 'Phòng 3', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC14', 'Phòng 4', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC15', 'Phòng 5', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC16', 'Phòng 6', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC17', 'Phòng 7', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC18', 'Phòng 8', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC19', 'Phòng 9', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC20', 'Phòng 10', 'CN2');
INSERT INTO phong_chieu
VALUES ('PC21', 'Phòng 1', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC22', 'Phòng 2', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC23', 'Phòng 3', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC24', 'Phòng 4', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC25', 'Phòng 5', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC26', 'Phòng 6', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC27', 'Phòng 7', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC28', 'Phòng 8', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC29', 'Phòng 9', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC30', 'Phòng 10', 'CN3');
INSERT INTO phong_chieu
VALUES ('PC31', 'Phòng 1', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC32', 'Phòng 2', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC33', 'Phòng 3', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC34', 'Phòng 4', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC35', 'Phòng 5', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC36', 'Phòng 6', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC37', 'Phòng 7', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC38', 'Phòng 8', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC39', 'Phòng 9', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC40', 'Phòng 10', 'CN4');
INSERT INTO phong_chieu
VALUES ('PC41', 'Phòng 1', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC42', 'Phòng 2', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC43', 'Phòng 3', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC44', 'Phòng 4', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC45', 'Phòng 5', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC46', 'Phòng 6', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC47', 'Phòng 7', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC48', 'Phòng 8', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC49', 'Phòng 9', 'CN5');
INSERT INTO phong_chieu
VALUES ('PC50', 'Phòng 10', 'CN5');

-- CT-CSVC
INSERT INTO ct_csvc
VALUES ('VC1', 'PC01', 1);
INSERT INTO ct_csvc
VALUES ('VC2', 'PC01', 6);
INSERT INTO ct_csvc
VALUES ('VC3', 'PC01', 2);
INSERT INTO ct_csvc
VALUES ('VC4', 'PC01', 1);
INSERT INTO ct_csvc
VALUES ('VC5', 'PC01', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC02', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC02', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC02', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC02', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC02', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC03', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC03', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC03', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC03', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC03', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC04', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC04', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC04', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC04', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC04', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC05', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC05', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC05', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC05', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC05', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC06', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC06', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC06', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC06', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC06', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC07', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC07', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC07', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC07', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC07', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC08', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC08', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC08', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC08', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC08', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC09', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC09', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC09', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC09', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC09', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC10', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC10', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC10', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC10', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC10', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC11', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC11', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC11', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC11', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC11', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC12', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC12', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC12', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC12', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC12', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC13', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC13', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC13', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC13', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC13', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC14', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC14', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC14', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC14', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC14', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC15', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC15', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC15', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC15', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC15', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC16', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC16', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC16', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC16', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC16', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC17', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC17', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC17', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC17', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC17', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC18', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC18', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC18', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC18', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC18', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC19', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC19', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC19', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC19', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC19', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC20', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC20', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC20', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC20', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC20', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC21', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC21', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC21', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC21', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC21', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC22', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC22', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC22', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC22', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC22', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC23', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC23', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC23', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC23', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC23', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC24', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC24', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC24', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC24', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC24', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC25', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC25', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC25', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC25', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC25', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC26', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC26', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC26', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC26', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC26', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC27', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC27', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC27', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC27', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC27', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC28', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC28', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC28', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC28', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC28', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC29', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC29', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC29', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC29', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC29', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC30', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC30', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC30', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC30', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC30', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC31', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC31', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC31', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC31', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC31', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC32', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC32', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC32', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC32', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC32', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC33', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC33', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC33', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC33', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC33', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC34', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC34', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC34', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC34', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC34', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC35', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC35', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC35', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC35', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC35', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC36', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC36', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC36', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC36', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC36', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC37', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC37', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC37', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC37', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC37', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC38', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC38', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC38', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC38', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC38', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC39', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC39', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC39', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC39', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC39', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC40', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC40', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC40', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC40', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC40', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC41', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC41', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC41', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC41', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC41', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC42', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC42', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC42', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC42', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC42', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC43', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC43', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC43', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC43', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC43', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC44', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC44', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC44', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC44', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC44', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC45', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC45', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC45', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC45', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC45', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC46', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC46', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC46', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC46', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC46', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC47', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC47', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC47', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC47', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC47', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC48', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC48', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC48', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC48', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC48', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC49', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC49', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC49', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC49', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC49', 1);
INSERT INTO CT_CSVC
VALUES ('VC1', 'PC50', 1);
INSERT INTO CT_CSVC
VALUES ('VC2', 'PC50', 6);
INSERT INTO CT_CSVC
VALUES ('VC3', 'PC50', 2);
INSERT INTO CT_CSVC
VALUES ('VC4', 'PC50', 1);
INSERT INTO CT_CSVC
VALUES ('VC5', 'PC50', 1);


-- Xuất chiếu
insert into xuat_chieu
values (55000, 1, 'PC01', 'MP01');
insert into xuat_chieu
values (80000, 2, 'PC02', 'MP02');
insert into xuat_chieu
values (65000, 3, 'PC03', 'MP03');
insert into xuat_chieu
values (70000, 4, 'PC04', 'MP04');
insert into xuat_chieu
values (65000, 5, 'PC05', 'MP05');
insert into xuat_chieu
values (65000, 6, 'PC06', 'MP06');
insert into xuat_chieu
values (65000, 7, 'PC07', 'MP07');
insert into xuat_chieu
values (65000, 8, 'PC08', 'MP08');
insert into xuat_chieu
values (65000, 9, 'PC09', 'MP09');
insert into xuat_chieu
values (65000, 10, 'PC10', 'MP10');
insert into xuat_chieu
values (70000, 11, 'PC11', 'MP11');
insert into xuat_chieu
values (70000, 12, 'PC05', 'MP01');
insert into xuat_chieu
values (70000, 13, 'PC06', 'MP02');
insert into xuat_chieu
values (70000, 14, 'PC07', 'MP03');
insert into xuat_chieu
values (70000, 15, 'PC08', 'MP04');
insert into xuat_chieu
values (70000, 16, 'PC09', 'MP05');
insert into xuat_chieu
values (70000, 17, 'PC10', 'MP06');
insert into xuat_chieu
values (65000, 18, 'PC11', 'MP07');
insert into xuat_chieu
values (65000, 19, 'PC12', 'MP08');
insert into xuat_chieu
values (65000, 20, 'PC13', 'MP09');
insert into xuat_chieu
values (65000, 21, 'PC14', 'MP10');
insert into xuat_chieu
values (65000, 22, 'PC15', 'MP11');
insert into xuat_chieu
values (80000, 23, 'PC01', 'MP01');
insert into xuat_chieu
values (80000, 24, 'PC02', 'MP02');
insert into xuat_chieu
values (80000, 25, 'PC03', 'MP03');
insert into xuat_chieu
values (80000, 26, 'PC04', 'MP04');
insert into xuat_chieu
values (80000, 27, 'PC05', 'MP05');
insert into xuat_chieu
values (80000, 28, 'PC06', 'MP06');
insert into xuat_chieu
values (80000, 29, 'PC07', 'MP07');
insert into xuat_chieu
values (80000, 30, 'PC08', 'MP08');
insert into xuat_chieu
values (80000, 31, 'PC09', 'MP09');
insert into xuat_chieu
values (80000, 32, 'PC10', 'MP10');
insert into xuat_chieu
values (80000, 33, 'PC11', 'MP11');
insert into xuat_chieu
values (55000, 34, 'PC07', 'MP01');
insert into xuat_chieu
values (55000, 35, 'PC08', 'MP02');
insert into xuat_chieu
values (55000, 36, 'PC09', 'MP03');
insert into xuat_chieu
values (55000, 37, 'PC10', 'MP04');
insert into xuat_chieu
values (55000, 38, 'PC11', 'MP05');
insert into xuat_chieu
values (55000, 39, 'PC12', 'MP06');
insert into xuat_chieu
values (55000, 40, 'PC13', 'MP07');
insert into xuat_chieu
values (55000, 41, 'PC14', 'MP08');
insert into xuat_chieu
values (55000, 42, 'PC15', 'MP09');

-- Loại ghế
insert into loai_ghe
values (1, N'Thường', 45000);
insert into loai_ghe
values (2, N'Đôi', 60000);
insert into loai_ghe
values (3, N'Vip', 75000);

-- Ghế
insert into Ghe
values ('g1', 'A1', 1);
insert into Ghe
values ('g2', 'A2', 1);
insert into Ghe
values ('g3', 'A3', 1);
insert into Ghe
values ('g4', 'A4', 1);
insert into Ghe
values ('g5', 'A5', 1);
insert into Ghe
values ('g6', 'A6', 1);
insert into Ghe
values ('g7', 'A7', 1);
insert into Ghe
values ('g8', 'A8', 1);
insert into Ghe
values ('g9', 'A9', 1);
insert into Ghe
values ('g10', 'A10', 1);
insert into Ghe
values ('g11', 'A11', 1);
insert into Ghe
values ('g12', 'A12', 1);
insert into Ghe
values ('g13', 'B1', 1);
insert into Ghe
values ('g14', 'B2', 1);
insert into Ghe
values ('g15', 'B3', 1);
insert into Ghe
values ('g16', 'B4', 1);
insert into Ghe
values ('g17', 'B5', 1);
insert into Ghe
values ('g18', 'B6', 1);
insert into Ghe
values ('g19', 'B7', 1);
insert into Ghe
values ('g20', 'B8', 1);
insert into Ghe
values ('g21', 'B9', 1);
insert into Ghe
values ('g22', 'B10', 1);
insert into Ghe
values ('g23', 'B11', 1);
insert into Ghe
values ('g24', 'B12', 1);
insert into Ghe
values ('g25', 'C1', 1);
insert into Ghe
values ('g26', 'C2', 1);
insert into Ghe
values ('g27', 'C3', 1);
insert into Ghe
values ('g28', 'C4', 1);
insert into Ghe
values ('g29', 'C5', 1);
insert into Ghe
values ('g30', 'C6', 1);
insert into Ghe
values ('g31', 'C7', 1);
insert into Ghe
values ('g32', 'C8', 1);
insert into Ghe
values ('g33', 'C9', 1);
insert into Ghe
values ('g34', 'C10', 1);
insert into Ghe
values ('g35', 'C11', 1);
insert into Ghe
values ('g36', 'C12', 1);
insert into Ghe
values ('g37', 'D1', 1);
insert into Ghe
values ('g38', 'D2', 1);
insert into Ghe
values ('g39', 'D3', 1);
insert into Ghe
values ('g40', 'D4', 1);
insert into Ghe
values ('g41', 'D5', 1);
insert into Ghe
values ('g42', 'D6', 1);
insert into Ghe
values ('g43', 'D7', 1);
insert into Ghe
values ('g44', 'D8', 1);
insert into Ghe
values ('g45', 'D9', 1);
insert into Ghe
values ('g46', 'D10', 1);
insert into Ghe
values ('g47', 'D11', 1);
insert into Ghe
values ('g48', 'D12', 1);
insert into Ghe
values ('g49', 'E1', 2);
insert into Ghe
values ('g50', 'E2', 2);
insert into Ghe
values ('g51', 'E3', 2);
insert into Ghe
values ('g52', 'E4', 2);
insert into Ghe
values ('g53', 'E5', 2);
insert into Ghe
values ('g54', 'E6', 2);
insert into Ghe
values ('g55', 'E7', 2);
insert into Ghe
values ('g56', 'E8', 2);
insert into Ghe
values ('g57', 'E9', 2);
insert into Ghe
values ('g58', 'E10', 2);
insert into Ghe
values ('g59', 'E11', 2);
insert into Ghe
values ('g60', 'E12', 2);
insert into Ghe
values ('g61', 'F1', 2);
insert into Ghe
values ('g62', 'F2', 2);
insert into Ghe
values ('g63', 'F3', 2);
insert into Ghe
values ('g64', 'F4', 2);
insert into Ghe
values ('g65', 'F5', 2);
insert into Ghe
values ('g66', 'F6', 2);
insert into Ghe
values ('g67', 'F7', 2);
insert into Ghe
values ('g68', 'F8', 2);
insert into Ghe
values ('g69', 'F9', 2);
insert into Ghe
values ('g70', 'F10', 2);
insert into Ghe
values ('g71', 'F11', 2);
insert into Ghe
values ('g72', 'F12', 2);
insert into Ghe
values ('g73', 'G1', 2);
insert into Ghe
values ('g74', 'G2', 2);
insert into Ghe
values ('g75', 'G3', 2);
insert into Ghe
values ('g76', 'G4', 2);
insert into Ghe
values ('g77', 'G5', 2);
insert into Ghe
values ('g78', 'G6', 2);
insert into Ghe
values ('g79', 'G7', 2);
insert into Ghe
values ('g80', 'G8', 2);
insert into Ghe
values ('g81', 'G9', 2);
insert into Ghe
values ('g82', 'G10', 2);
insert into Ghe
values ('g83', 'G11', 2);
insert into Ghe
values ('g84', 'G12', 2);
insert into Ghe
values ('g85', 'H1', 2);
insert into Ghe
values ('g86', 'H2', 2);
insert into Ghe
values ('g87', 'H3', 2);
insert into Ghe
values ('g88', 'H4', 2);
insert into Ghe
values ('g89', 'H5', 2);
insert into Ghe
values ('g90', 'H6', 2);
insert into Ghe
values ('g91', 'H7', 2);
insert into Ghe
values ('g92', 'H8', 2);
insert into Ghe
values ('g93', 'H9', 2);
insert into Ghe
values ('g94', 'H10', 2);
insert into Ghe
values ('g95', 'H11', 2);
insert into Ghe
values ('g96', 'H12', 2);
insert into Ghe
values ('g97', 'J1', 3);
insert into Ghe
values ('g98', 'J2', 3);
insert into Ghe
values ('g99', 'J3', 3);
insert into Ghe
values ('g100', 'J4', 3);
insert into Ghe
values ('g101', 'J5', 3);
insert into Ghe
values ('g102', 'J6', 3);
insert into Ghe
values ('g103', 'J7', 3);
insert into Ghe
values ('g104', 'J8', 3);
insert into Ghe
values ('g105', 'J9', 3);
insert into Ghe
values ('g106', 'J10', 3);
insert into Ghe
values ('g107', 'J11', 3);
insert into Ghe
values ('g108', 'J12', 3);
insert into Ghe
values ('g109', 'J13', 3);
insert into Ghe
values ('g110', 'J14', 3);

-- chi tiết ghế
INSERT INTO chi_tiet_ghe
VALUES (1, 'PC01', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (2, 'PC01', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (3, 'PC01', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (4, 'PC01', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (5, 'PC01', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (6, 'PC01', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (7, 'PC01', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (8, 'PC01', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (9, 'PC01', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (10, 'PC01', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (11, 'PC01', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (12, 'PC01', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (13, 'PC01', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (14, 'PC01', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (15, 'PC01', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (16, 'PC01', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (17, 'PC01', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (18, 'PC01', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (19, 'PC01', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (20, 'PC01', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (21, 'PC01', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (22, 'PC01', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (23, 'PC01', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (24, 'PC01', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (25, 'PC01', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (26, 'PC01', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (27, 'PC01', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (28, 'PC01', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (29, 'PC01', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (30, 'PC01', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (31, 'PC01', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (32, 'PC01', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (33, 'PC01', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (34, 'PC01', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (35, 'PC01', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (36, 'PC01', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (37, 'PC01', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (38, 'PC01', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (39, 'PC01', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (40, 'PC01', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (41, 'PC01', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (42, 'PC01', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (43, 'PC01', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (44, 'PC01', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (45, 'PC01', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (46, 'PC01', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (47, 'PC01', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (48, 'PC01', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (49, 'PC01', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (50, 'PC01', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (51, 'PC01', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (52, 'PC01', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (53, 'PC01', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (54, 'PC01', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (55, 'PC01', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (56, 'PC01', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (57, 'PC01', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (58, 'PC01', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (59, 'PC01', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (60, 'PC01', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (61, 'PC01', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (62, 'PC01', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (63, 'PC01', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (64, 'PC01', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (65, 'PC01', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (66, 'PC01', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (67, 'PC01', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (68, 'PC01', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (69, 'PC01', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (70, 'PC01', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (71, 'PC01', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (72, 'PC01', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (73, 'PC01', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (74, 'PC01', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (75, 'PC01', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (76, 'PC01', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (77, 'PC01', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (78, 'PC01', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (79, 'PC01', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (80, 'PC01', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (81, 'PC01', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (82, 'PC01', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (83, 'PC01', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (84, 'PC01', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (85, 'PC01', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (86, 'PC01', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (87, 'PC01', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (88, 'PC01', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (89, 'PC01', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (90, 'PC01', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (91, 'PC01', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (92, 'PC01', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (93, 'PC01', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (94, 'PC01', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (95, 'PC01', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (96, 'PC01', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (97, 'PC02', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (98, 'PC02', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (99, 'PC02', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (100, 'PC02', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (101, 'PC02', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (102, 'PC02', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (103, 'PC02', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (104, 'PC02', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (105, 'PC02', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (106, 'PC02', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (107, 'PC02', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (108, 'PC02', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (109, 'PC02', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (110, 'PC02', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (111, 'PC02', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (112, 'PC02', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (113, 'PC02', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (114, 'PC02', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (115, 'PC02', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (116, 'PC02', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (117, 'PC02', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (118, 'PC02', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (119, 'PC02', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (120, 'PC02', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (121, 'PC02', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (122, 'PC02', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (123, 'PC02', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (124, 'PC02', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (125, 'PC02', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (126, 'PC02', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (127, 'PC02', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (128, 'PC02', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (129, 'PC02', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (130, 'PC02', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (131, 'PC02', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (132, 'PC02', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (133, 'PC02', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (134, 'PC02', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (135, 'PC02', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (136, 'PC02', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (137, 'PC02', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (138, 'PC02', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (139, 'PC02', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (140, 'PC02', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (141, 'PC02', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (142, 'PC02', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (143, 'PC02', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (144, 'PC02', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (145, 'PC02', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (146, 'PC02', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (147, 'PC02', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (148, 'PC02', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (149, 'PC02', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (150, 'PC02', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (151, 'PC02', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (152, 'PC02', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (153, 'PC02', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (154, 'PC02', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (155, 'PC02', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (156, 'PC02', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (157, 'PC02', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (158, 'PC02', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (159, 'PC02', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (160, 'PC02', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (161, 'PC02', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (162, 'PC02', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (163, 'PC02', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (164, 'PC02', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (165, 'PC02', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (166, 'PC02', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (167, 'PC02', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (168, 'PC02', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (169, 'PC02', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (170, 'PC02', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (171, 'PC02', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (172, 'PC02', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (173, 'PC02', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (174, 'PC02', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (175, 'PC02', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (176, 'PC02', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (177, 'PC02', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (178, 'PC02', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (179, 'PC02', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (180, 'PC02', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (181, 'PC02', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (182, 'PC02', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (183, 'PC02', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (184, 'PC02', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (185, 'PC02', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (186, 'PC02', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (187, 'PC02', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (188, 'PC02', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (189, 'PC02', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (190, 'PC02', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (191, 'PC02', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (192, 'PC02', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (193, 'PC03', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (194, 'PC03', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (195, 'PC03', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (196, 'PC03', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (197, 'PC03', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (198, 'PC03', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (199, 'PC03', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (200, 'PC03', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (201, 'PC03', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (202, 'PC03', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (203, 'PC03', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (204, 'PC03', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (205, 'PC03', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (206, 'PC03', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (207, 'PC03', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (208, 'PC03', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (209, 'PC03', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (210, 'PC03', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (211, 'PC03', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (212, 'PC03', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (213, 'PC03', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (214, 'PC03', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (215, 'PC03', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (216, 'PC03', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (217, 'PC03', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (218, 'PC03', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (219, 'PC03', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (220, 'PC03', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (221, 'PC03', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (222, 'PC03', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (223, 'PC03', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (224, 'PC03', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (225, 'PC03', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (226, 'PC03', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (227, 'PC03', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (228, 'PC03', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (229, 'PC03', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (230, 'PC03', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (231, 'PC03', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (232, 'PC03', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (233, 'PC03', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (234, 'PC03', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (235, 'PC03', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (236, 'PC03', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (237, 'PC03', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (238, 'PC03', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (239, 'PC03', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (240, 'PC03', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (241, 'PC03', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (242, 'PC03', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (243, 'PC03', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (244, 'PC03', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (245, 'PC03', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (246, 'PC03', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (247, 'PC03', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (248, 'PC03', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (249, 'PC03', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (250, 'PC03', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (251, 'PC03', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (252, 'PC03', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (253, 'PC03', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (254, 'PC03', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (255, 'PC03', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (256, 'PC03', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (257, 'PC03', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (258, 'PC03', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (259, 'PC03', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (260, 'PC03', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (261, 'PC03', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (262, 'PC03', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (263, 'PC03', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (264, 'PC03', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (265, 'PC03', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (266, 'PC03', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (267, 'PC03', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (268, 'PC03', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (269, 'PC03', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (270, 'PC03', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (271, 'PC03', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (272, 'PC03', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (273, 'PC03', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (274, 'PC03', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (275, 'PC03', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (276, 'PC03', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (277, 'PC03', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (278, 'PC03', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (279, 'PC03', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (280, 'PC03', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (281, 'PC03', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (282, 'PC03', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (283, 'PC03', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (284, 'PC03', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (285, 'PC03', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (286, 'PC03', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (287, 'PC03', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (288, 'PC03', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (289, 'PC04', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (290, 'PC04', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (291, 'PC04', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (292, 'PC04', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (293, 'PC04', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (294, 'PC04', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (295, 'PC04', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (296, 'PC04', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (297, 'PC04', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (298, 'PC04', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (299, 'PC04', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (300, 'PC04', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (301, 'PC04', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (302, 'PC04', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (303, 'PC04', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (304, 'PC04', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (305, 'PC04', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (306, 'PC04', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (307, 'PC04', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (308, 'PC04', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (309, 'PC04', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (310, 'PC04', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (311, 'PC04', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (312, 'PC04', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (313, 'PC04', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (314, 'PC04', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (315, 'PC04', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (316, 'PC04', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (317, 'PC04', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (318, 'PC04', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (319, 'PC04', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (320, 'PC04', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (321, 'PC04', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (322, 'PC04', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (323, 'PC04', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (324, 'PC04', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (325, 'PC04', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (326, 'PC04', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (327, 'PC04', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (328, 'PC04', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (329, 'PC04', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (330, 'PC04', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (331, 'PC04', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (332, 'PC04', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (333, 'PC04', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (334, 'PC04', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (335, 'PC04', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (336, 'PC04', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (337, 'PC04', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (338, 'PC04', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (339, 'PC04', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (340, 'PC04', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (341, 'PC04', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (342, 'PC04', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (343, 'PC04', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (344, 'PC04', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (345, 'PC04', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (346, 'PC04', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (347, 'PC04', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (348, 'PC04', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (349, 'PC04', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (350, 'PC04', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (351, 'PC04', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (352, 'PC04', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (353, 'PC04', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (354, 'PC04', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (355, 'PC04', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (356, 'PC04', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (357, 'PC04', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (358, 'PC04', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (359, 'PC04', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (360, 'PC04', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (361, 'PC04', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (362, 'PC04', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (363, 'PC04', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (364, 'PC04', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (365, 'PC04', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (366, 'PC04', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (367, 'PC04', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (368, 'PC04', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (369, 'PC04', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (370, 'PC04', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (371, 'PC04', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (372, 'PC04', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (373, 'PC04', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (374, 'PC04', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (375, 'PC04', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (376, 'PC04', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (377, 'PC04', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (378, 'PC04', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (379, 'PC04', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (380, 'PC04', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (381, 'PC04', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (382, 'PC04', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (383, 'PC04', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (384, 'PC04', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (385, 'PC05', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (386, 'PC05', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (387, 'PC05', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (388, 'PC05', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (389, 'PC05', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (390, 'PC05', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (391, 'PC05', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (392, 'PC05', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (393, 'PC05', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (394, 'PC05', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (395, 'PC05', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (396, 'PC05', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (397, 'PC05', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (398, 'PC05', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (399, 'PC05', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (400, 'PC05', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (401, 'PC05', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (402, 'PC05', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (403, 'PC05', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (404, 'PC05', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (405, 'PC05', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (406, 'PC05', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (407, 'PC05', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (408, 'PC05', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (409, 'PC05', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (410, 'PC05', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (411, 'PC05', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (412, 'PC05', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (413, 'PC05', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (414, 'PC05', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (415, 'PC05', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (416, 'PC05', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (417, 'PC05', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (418, 'PC05', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (419, 'PC05', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (420, 'PC05', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (421, 'PC05', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (422, 'PC05', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (423, 'PC05', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (424, 'PC05', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (425, 'PC05', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (426, 'PC05', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (427, 'PC05', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (428, 'PC05', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (429, 'PC05', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (430, 'PC05', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (431, 'PC05', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (432, 'PC05', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (433, 'PC05', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (434, 'PC05', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (435, 'PC05', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (436, 'PC05', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (437, 'PC05', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (438, 'PC05', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (439, 'PC05', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (440, 'PC05', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (441, 'PC05', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (442, 'PC05', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (443, 'PC05', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (444, 'PC05', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (445, 'PC05', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (446, 'PC05', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (447, 'PC05', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (448, 'PC05', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (449, 'PC05', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (450, 'PC05', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (451, 'PC05', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (452, 'PC05', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (453, 'PC05', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (454, 'PC05', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (455, 'PC05', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (456, 'PC05', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (457, 'PC05', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (458, 'PC05', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (459, 'PC05', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (460, 'PC05', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (461, 'PC05', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (462, 'PC05', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (463, 'PC05', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (464, 'PC05', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (465, 'PC05', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (466, 'PC05', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (467, 'PC05', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (468, 'PC05', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (469, 'PC05', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (470, 'PC05', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (471, 'PC05', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (472, 'PC05', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (473, 'PC05', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (474, 'PC05', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (475, 'PC05', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (476, 'PC05', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (477, 'PC05', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (478, 'PC05', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (479, 'PC05', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (480, 'PC05', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (481, 'PC06', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (482, 'PC06', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (483, 'PC06', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (484, 'PC06', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (485, 'PC06', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (486, 'PC06', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (487, 'PC06', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (488, 'PC06', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (489, 'PC06', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (490, 'PC06', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (491, 'PC06', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (492, 'PC06', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (493, 'PC06', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (494, 'PC06', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (495, 'PC06', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (496, 'PC06', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (497, 'PC06', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (498, 'PC06', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (499, 'PC06', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (500, 'PC06', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (501, 'PC06', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (502, 'PC06', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (503, 'PC06', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (504, 'PC06', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (505, 'PC06', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (506, 'PC06', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (507, 'PC06', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (508, 'PC06', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (509, 'PC06', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (510, 'PC06', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (511, 'PC06', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (512, 'PC06', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (513, 'PC06', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (514, 'PC06', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (515, 'PC06', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (516, 'PC06', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (517, 'PC06', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (518, 'PC06', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (519, 'PC06', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (520, 'PC06', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (521, 'PC06', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (522, 'PC06', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (523, 'PC06', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (524, 'PC06', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (525, 'PC06', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (526, 'PC06', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (527, 'PC06', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (528, 'PC06', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (529, 'PC06', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (530, 'PC06', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (531, 'PC06', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (532, 'PC06', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (533, 'PC06', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (534, 'PC06', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (535, 'PC06', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (536, 'PC06', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (537, 'PC06', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (538, 'PC06', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (539, 'PC06', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (540, 'PC06', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (541, 'PC06', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (542, 'PC06', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (543, 'PC06', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (544, 'PC06', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (545, 'PC06', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (546, 'PC06', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (547, 'PC06', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (548, 'PC06', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (549, 'PC06', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (550, 'PC06', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (551, 'PC06', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (552, 'PC06', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (553, 'PC06', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (554, 'PC06', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (555, 'PC06', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (556, 'PC06', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (557, 'PC06', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (558, 'PC06', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (559, 'PC06', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (560, 'PC06', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (561, 'PC06', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (562, 'PC06', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (563, 'PC06', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (564, 'PC06', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (565, 'PC06', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (566, 'PC06', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (567, 'PC06', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (568, 'PC06', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (569, 'PC06', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (570, 'PC06', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (571, 'PC06', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (572, 'PC06', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (573, 'PC06', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (574, 'PC06', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (575, 'PC06', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (576, 'PC06', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (577, 'PC06', 'g97');
INSERT INTO chi_tiet_ghe
VALUES (578, 'PC06', 'g98');
INSERT INTO chi_tiet_ghe
VALUES (579, 'PC06', 'g99');
INSERT INTO chi_tiet_ghe
VALUES (580, 'PC06', 'g100');
INSERT INTO chi_tiet_ghe
VALUES (581, 'PC06', 'g101');
INSERT INTO chi_tiet_ghe
VALUES (582, 'PC06', 'g102');
INSERT INTO chi_tiet_ghe
VALUES (583, 'PC06', 'g103');
INSERT INTO chi_tiet_ghe
VALUES (584, 'PC06', 'g104');
INSERT INTO chi_tiet_ghe
VALUES (585, 'PC06', 'g105');
INSERT INTO chi_tiet_ghe
VALUES (586, 'PC06', 'g106');
INSERT INTO chi_tiet_ghe
VALUES (587, 'PC06', 'g107');
INSERT INTO chi_tiet_ghe
VALUES (588, 'PC06', 'g108');
INSERT INTO chi_tiet_ghe
VALUES (589, 'PC06', 'g109');
INSERT INTO chi_tiet_ghe
VALUES (590, 'PC06', 'g110');
INSERT INTO chi_tiet_ghe
VALUES (591, 'PC07', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (592, 'PC07', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (593, 'PC07', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (594, 'PC07', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (595, 'PC07', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (596, 'PC07', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (597, 'PC07', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (598, 'PC07', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (599, 'PC07', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (600, 'PC07', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (601, 'PC07', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (602, 'PC07', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (603, 'PC07', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (604, 'PC07', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (605, 'PC07', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (606, 'PC07', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (607, 'PC07', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (608, 'PC07', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (609, 'PC07', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (610, 'PC07', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (611, 'PC07', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (612, 'PC07', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (613, 'PC07', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (614, 'PC07', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (615, 'PC07', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (616, 'PC07', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (617, 'PC07', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (618, 'PC07', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (619, 'PC07', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (620, 'PC07', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (621, 'PC07', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (622, 'PC07', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (623, 'PC07', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (624, 'PC07', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (625, 'PC07', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (626, 'PC07', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (627, 'PC07', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (628, 'PC07', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (629, 'PC07', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (630, 'PC07', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (631, 'PC07', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (632, 'PC07', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (633, 'PC07', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (634, 'PC07', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (635, 'PC07', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (636, 'PC07', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (637, 'PC07', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (638, 'PC07', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (639, 'PC07', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (640, 'PC07', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (641, 'PC07', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (642, 'PC07', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (643, 'PC07', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (644, 'PC07', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (645, 'PC07', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (646, 'PC07', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (647, 'PC07', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (648, 'PC07', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (649, 'PC07', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (650, 'PC07', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (651, 'PC07', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (652, 'PC07', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (653, 'PC07', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (654, 'PC07', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (655, 'PC07', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (656, 'PC07', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (657, 'PC07', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (658, 'PC07', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (659, 'PC07', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (660, 'PC07', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (661, 'PC07', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (662, 'PC07', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (663, 'PC07', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (664, 'PC07', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (665, 'PC07', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (666, 'PC07', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (667, 'PC07', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (668, 'PC07', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (669, 'PC07', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (670, 'PC07', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (671, 'PC07', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (672, 'PC07', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (673, 'PC07', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (674, 'PC07', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (675, 'PC07', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (676, 'PC07', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (677, 'PC07', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (678, 'PC07', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (679, 'PC07', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (680, 'PC07', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (681, 'PC07', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (682, 'PC07', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (683, 'PC07', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (684, 'PC07', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (685, 'PC07', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (686, 'PC07', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (687, 'PC07', 'g97');
INSERT INTO chi_tiet_ghe
VALUES (688, 'PC07', 'g98');
INSERT INTO chi_tiet_ghe
VALUES (689, 'PC07', 'g99');
INSERT INTO chi_tiet_ghe
VALUES (690, 'PC07', 'g100');
INSERT INTO chi_tiet_ghe
VALUES (691, 'PC07', 'g101');
INSERT INTO chi_tiet_ghe
VALUES (692, 'PC07', 'g102');
INSERT INTO chi_tiet_ghe
VALUES (693, 'PC07', 'g103');
INSERT INTO chi_tiet_ghe
VALUES (694, 'PC07', 'g104');
INSERT INTO chi_tiet_ghe
VALUES (695, 'PC07', 'g105');
INSERT INTO chi_tiet_ghe
VALUES (696, 'PC07', 'g106');
INSERT INTO chi_tiet_ghe
VALUES (697, 'PC07', 'g107');
INSERT INTO chi_tiet_ghe
VALUES (698, 'PC07', 'g108');
INSERT INTO chi_tiet_ghe
VALUES (699, 'PC07', 'g109');
INSERT INTO chi_tiet_ghe
VALUES (700, 'PC07', 'g110');
INSERT INTO chi_tiet_ghe
VALUES (701, 'PC08', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (702, 'PC08', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (703, 'PC08', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (704, 'PC08', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (705, 'PC08', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (706, 'PC08', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (707, 'PC08', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (708, 'PC08', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (709, 'PC08', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (710, 'PC08', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (711, 'PC08', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (712, 'PC08', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (713, 'PC08', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (714, 'PC08', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (715, 'PC08', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (716, 'PC08', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (717, 'PC08', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (718, 'PC08', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (719, 'PC08', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (720, 'PC08', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (721, 'PC08', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (722, 'PC08', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (723, 'PC08', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (724, 'PC08', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (725, 'PC08', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (726, 'PC08', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (727, 'PC08', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (728, 'PC08', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (729, 'PC08', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (730, 'PC08', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (731, 'PC08', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (732, 'PC08', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (733, 'PC08', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (734, 'PC08', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (735, 'PC08', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (736, 'PC08', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (737, 'PC08', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (738, 'PC08', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (739, 'PC08', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (740, 'PC08', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (741, 'PC08', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (742, 'PC08', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (743, 'PC08', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (744, 'PC08', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (745, 'PC08', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (746, 'PC08', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (747, 'PC08', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (748, 'PC08', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (749, 'PC08', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (750, 'PC08', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (751, 'PC08', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (752, 'PC08', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (753, 'PC08', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (754, 'PC08', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (755, 'PC08', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (756, 'PC08', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (757, 'PC08', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (758, 'PC08', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (759, 'PC08', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (760, 'PC08', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (761, 'PC08', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (762, 'PC08', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (763, 'PC08', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (764, 'PC08', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (765, 'PC08', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (766, 'PC08', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (767, 'PC08', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (768, 'PC08', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (769, 'PC08', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (770, 'PC08', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (771, 'PC08', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (772, 'PC08', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (773, 'PC08', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (774, 'PC08', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (775, 'PC08', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (776, 'PC08', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (777, 'PC08', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (778, 'PC08', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (779, 'PC08', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (780, 'PC08', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (781, 'PC08', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (782, 'PC08', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (783, 'PC08', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (784, 'PC08', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (785, 'PC08', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (786, 'PC08', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (787, 'PC08', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (788, 'PC08', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (789, 'PC08', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (790, 'PC08', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (791, 'PC08', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (792, 'PC08', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (793, 'PC08', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (794, 'PC08', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (795, 'PC08', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (796, 'PC08', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (797, 'PC08', 'g97');
INSERT INTO chi_tiet_ghe
VALUES (798, 'PC08', 'g98');
INSERT INTO chi_tiet_ghe
VALUES (799, 'PC08', 'g99');
INSERT INTO chi_tiet_ghe
VALUES (800, 'PC08', 'g100');
INSERT INTO chi_tiet_ghe
VALUES (801, 'PC08', 'g101');
INSERT INTO chi_tiet_ghe
VALUES (802, 'PC08', 'g102');
INSERT INTO chi_tiet_ghe
VALUES (803, 'PC08', 'g103');
INSERT INTO chi_tiet_ghe
VALUES (804, 'PC08', 'g104');
INSERT INTO chi_tiet_ghe
VALUES (805, 'PC08', 'g105');
INSERT INTO chi_tiet_ghe
VALUES (806, 'PC08', 'g106');
INSERT INTO chi_tiet_ghe
VALUES (807, 'PC08', 'g107');
INSERT INTO chi_tiet_ghe
VALUES (808, 'PC08', 'g108');
INSERT INTO chi_tiet_ghe
VALUES (809, 'PC08', 'g109');
INSERT INTO chi_tiet_ghe
VALUES (810, 'PC08', 'g110');
INSERT INTO chi_tiet_ghe
VALUES (811, 'PC09', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (812, 'PC09', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (813, 'PC09', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (814, 'PC09', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (815, 'PC09', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (816, 'PC09', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (817, 'PC09', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (818, 'PC09', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (819, 'PC09', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (820, 'PC09', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (821, 'PC09', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (822, 'PC09', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (823, 'PC09', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (824, 'PC09', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (825, 'PC09', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (826, 'PC09', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (827, 'PC09', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (828, 'PC09', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (829, 'PC09', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (830, 'PC09', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (831, 'PC09', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (832, 'PC09', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (833, 'PC09', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (834, 'PC09', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (835, 'PC09', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (836, 'PC09', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (837, 'PC09', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (838, 'PC09', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (839, 'PC09', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (840, 'PC09', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (841, 'PC09', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (842, 'PC09', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (843, 'PC09', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (844, 'PC09', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (845, 'PC09', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (846, 'PC09', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (847, 'PC09', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (848, 'PC09', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (849, 'PC09', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (850, 'PC09', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (851, 'PC09', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (852, 'PC09', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (853, 'PC09', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (854, 'PC09', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (855, 'PC09', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (856, 'PC09', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (857, 'PC09', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (858, 'PC09', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (859, 'PC09', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (860, 'PC09', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (861, 'PC09', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (862, 'PC09', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (863, 'PC09', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (864, 'PC09', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (865, 'PC09', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (866, 'PC09', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (867, 'PC09', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (868, 'PC09', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (869, 'PC09', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (870, 'PC09', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (871, 'PC09', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (872, 'PC09', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (873, 'PC09', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (874, 'PC09', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (875, 'PC09', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (876, 'PC09', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (877, 'PC09', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (878, 'PC09', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (879, 'PC09', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (880, 'PC09', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (881, 'PC09', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (882, 'PC09', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (883, 'PC09', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (884, 'PC09', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (885, 'PC09', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (886, 'PC09', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (887, 'PC09', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (888, 'PC09', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (889, 'PC09', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (890, 'PC09', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (891, 'PC09', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (892, 'PC09', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (893, 'PC09', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (894, 'PC09', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (895, 'PC09', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (896, 'PC09', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (897, 'PC09', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (898, 'PC09', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (899, 'PC09', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (900, 'PC09', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (901, 'PC09', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (902, 'PC09', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (903, 'PC09', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (904, 'PC09', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (905, 'PC09', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (906, 'PC09', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (907, 'PC09', 'g97');
INSERT INTO chi_tiet_ghe
VALUES (908, 'PC09', 'g98');
INSERT INTO chi_tiet_ghe
VALUES (909, 'PC09', 'g99');
INSERT INTO chi_tiet_ghe
VALUES (910, 'PC09', 'g100');
INSERT INTO chi_tiet_ghe
VALUES (911, 'PC09', 'g101');
INSERT INTO chi_tiet_ghe
VALUES (912, 'PC09', 'g102');
INSERT INTO chi_tiet_ghe
VALUES (913, 'PC09', 'g103');
INSERT INTO chi_tiet_ghe
VALUES (914, 'PC09', 'g104');
INSERT INTO chi_tiet_ghe
VALUES (915, 'PC09', 'g105');
INSERT INTO chi_tiet_ghe
VALUES (916, 'PC09', 'g106');
INSERT INTO chi_tiet_ghe
VALUES (917, 'PC09', 'g107');
INSERT INTO chi_tiet_ghe
VALUES (918, 'PC09', 'g108');
INSERT INTO chi_tiet_ghe
VALUES (919, 'PC09', 'g109');
INSERT INTO chi_tiet_ghe
VALUES (920, 'PC09', 'g110');
INSERT INTO chi_tiet_ghe
VALUES (921, 'PC10', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (922, 'PC10', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (923, 'PC10', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (924, 'PC10', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (925, 'PC10', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (926, 'PC10', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (927, 'PC10', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (928, 'PC10', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (929, 'PC10', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (930, 'PC10', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (931, 'PC10', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (932, 'PC10', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (933, 'PC10', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (934, 'PC10', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (935, 'PC10', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (936, 'PC10', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (937, 'PC10', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (938, 'PC10', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (939, 'PC10', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (940, 'PC10', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (941, 'PC10', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (942, 'PC10', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (943, 'PC10', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (944, 'PC10', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (945, 'PC10', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (946, 'PC10', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (947, 'PC10', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (948, 'PC10', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (949, 'PC10', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (950, 'PC10', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (951, 'PC10', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (952, 'PC10', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (953, 'PC10', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (954, 'PC10', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (955, 'PC10', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (956, 'PC10', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (957, 'PC10', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (958, 'PC10', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (959, 'PC10', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (960, 'PC10', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (961, 'PC10', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (962, 'PC10', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (963, 'PC10', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (964, 'PC10', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (965, 'PC10', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (966, 'PC10', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (967, 'PC10', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (968, 'PC10', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (969, 'PC10', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (970, 'PC10', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (971, 'PC10', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (972, 'PC10', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (973, 'PC10', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (974, 'PC10', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (975, 'PC10', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (976, 'PC10', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (977, 'PC10', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (978, 'PC10', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (979, 'PC10', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (980, 'PC10', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (981, 'PC10', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (982, 'PC10', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (983, 'PC10', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (984, 'PC10', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (985, 'PC10', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (986, 'PC10', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (987, 'PC10', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (988, 'PC10', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (989, 'PC10', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (990, 'PC10', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (991, 'PC10', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (992, 'PC10', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (993, 'PC10', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (994, 'PC10', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (995, 'PC10', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (996, 'PC10', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (997, 'PC10', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (998, 'PC10', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (999, 'PC10', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (1000, 'PC10', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (1001, 'PC10', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (1002, 'PC10', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (1003, 'PC10', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (1004, 'PC10', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (1005, 'PC10', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (1006, 'PC10', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (1007, 'PC10', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (1008, 'PC10', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (1009, 'PC10', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (1010, 'PC10', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (1011, 'PC10', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (1012, 'PC10', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (1013, 'PC10', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (1014, 'PC10', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (1015, 'PC10', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (1016, 'PC10', 'g96');
INSERT INTO chi_tiet_ghe
VALUES (1017, 'PC10', 'g97');
INSERT INTO chi_tiet_ghe
VALUES (1018, 'PC10', 'g98');
INSERT INTO chi_tiet_ghe
VALUES (1019, 'PC10', 'g99');
INSERT INTO chi_tiet_ghe
VALUES (1020, 'PC10', 'g100');
INSERT INTO chi_tiet_ghe
VALUES (1021, 'PC10', 'g101');
INSERT INTO chi_tiet_ghe
VALUES (1022, 'PC10', 'g102');
INSERT INTO chi_tiet_ghe
VALUES (1023, 'PC10', 'g103');
INSERT INTO chi_tiet_ghe
VALUES (1024, 'PC10', 'g104');
INSERT INTO chi_tiet_ghe
VALUES (1025, 'PC10', 'g105');
INSERT INTO chi_tiet_ghe
VALUES (1026, 'PC10', 'g106');
INSERT INTO chi_tiet_ghe
VALUES (1027, 'PC10', 'g107');
INSERT INTO chi_tiet_ghe
VALUES (1028, 'PC10', 'g108');
INSERT INTO chi_tiet_ghe
VALUES (1029, 'PC10', 'g109');
INSERT INTO chi_tiet_ghe
VALUES (1030, 'PC10', 'g110');

INSERT INTO chi_tiet_ghe
VALUES (1031, 'PC11', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (1032, 'PC11', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (1033, 'PC11', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (1034, 'PC11', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (1035, 'PC11', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (1036, 'PC11', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (1037, 'PC11', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (1038, 'PC11', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (1039, 'PC11', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (1040, 'PC11', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (1041, 'PC11', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (1042, 'PC11', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (1043, 'PC11', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (1044, 'PC11', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (1045, 'PC11', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (1046, 'PC11', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (1047, 'PC11', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (1048, 'PC11', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (1049, 'PC11', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (1050, 'PC11', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (1051, 'PC11', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (1052, 'PC11', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (1053, 'PC11', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (1054, 'PC11', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (1055, 'PC11', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (1056, 'PC11', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (1057, 'PC11', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (1058, 'PC11', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (1059, 'PC11', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (1060, 'PC11', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (1061, 'PC11', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (1062, 'PC11', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (1063, 'PC11', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (1064, 'PC11', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (1065, 'PC11', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (1066, 'PC11', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (1067, 'PC11', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (1068, 'PC11', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (1069, 'PC11', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (1070, 'PC11', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (1071, 'PC11', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (1072, 'PC11', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (1073, 'PC11', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (1074, 'PC11', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (1075, 'PC11', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (1076, 'PC11', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (1077, 'PC11', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (1078, 'PC11', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (1079, 'PC11', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (1080, 'PC11', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (1081, 'PC11', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (1082, 'PC11', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (1083, 'PC11', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (1084, 'PC11', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (1085, 'PC11', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (1086, 'PC11', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (1087, 'PC11', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (1088, 'PC11', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (1089, 'PC11', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (1090, 'PC11', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (1091, 'PC11', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (1092, 'PC11', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (1093, 'PC11', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (1094, 'PC11', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (1095, 'PC11', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (1096, 'PC11', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (1097, 'PC11', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (1098, 'PC11', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (1099, 'PC11', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (1100, 'PC11', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (1101, 'PC11', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (1102, 'PC11', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (1103, 'PC11', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (1104, 'PC11', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (1105, 'PC11', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (1106, 'PC11', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (1107, 'PC11', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (1108, 'PC11', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (1109, 'PC11', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (1110, 'PC11', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (1111, 'PC11', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (1112, 'PC11', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (1113, 'PC11', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (1114, 'PC11', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (1115, 'PC11', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (1116, 'PC11', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (1117, 'PC11', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (1118, 'PC11', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (1119, 'PC11', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (1120, 'PC11', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (1121, 'PC11', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (1122, 'PC11', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (1123, 'PC11', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (1124, 'PC11', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (1125, 'PC11', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (1126, 'PC11', 'g96');

INSERT INTO chi_tiet_ghe
VALUES (1127, 'PC12', 'g1');
INSERT INTO chi_tiet_ghe
VALUES (1128, 'PC12', 'g2');
INSERT INTO chi_tiet_ghe
VALUES (1129, 'PC12', 'g3');
INSERT INTO chi_tiet_ghe
VALUES (1130, 'PC12', 'g4');
INSERT INTO chi_tiet_ghe
VALUES (1131, 'PC12', 'g5');
INSERT INTO chi_tiet_ghe
VALUES (1132, 'PC12', 'g6');
INSERT INTO chi_tiet_ghe
VALUES (1133, 'PC12', 'g7');
INSERT INTO chi_tiet_ghe
VALUES (1134, 'PC12', 'g8');
INSERT INTO chi_tiet_ghe
VALUES (1135, 'PC12', 'g9');
INSERT INTO chi_tiet_ghe
VALUES (1136, 'PC12', 'g10');
INSERT INTO chi_tiet_ghe
VALUES (1137, 'PC12', 'g11');
INSERT INTO chi_tiet_ghe
VALUES (1138, 'PC12', 'g12');
INSERT INTO chi_tiet_ghe
VALUES (1139, 'PC12', 'g13');
INSERT INTO chi_tiet_ghe
VALUES (1140, 'PC12', 'g14');
INSERT INTO chi_tiet_ghe
VALUES (1141, 'PC12', 'g15');
INSERT INTO chi_tiet_ghe
VALUES (1142, 'PC12', 'g16');
INSERT INTO chi_tiet_ghe
VALUES (1143, 'PC12', 'g17');
INSERT INTO chi_tiet_ghe
VALUES (1144, 'PC12', 'g18');
INSERT INTO chi_tiet_ghe
VALUES (1145, 'PC12', 'g19');
INSERT INTO chi_tiet_ghe
VALUES (1146, 'PC12', 'g20');
INSERT INTO chi_tiet_ghe
VALUES (1147, 'PC12', 'g21');
INSERT INTO chi_tiet_ghe
VALUES (1148, 'PC12', 'g22');
INSERT INTO chi_tiet_ghe
VALUES (1149, 'PC12', 'g23');
INSERT INTO chi_tiet_ghe
VALUES (1150, 'PC12', 'g24');
INSERT INTO chi_tiet_ghe
VALUES (1151, 'PC12', 'g25');
INSERT INTO chi_tiet_ghe
VALUES (1152, 'PC12', 'g26');
INSERT INTO chi_tiet_ghe
VALUES (1153, 'PC12', 'g27');
INSERT INTO chi_tiet_ghe
VALUES (1154, 'PC12', 'g28');
INSERT INTO chi_tiet_ghe
VALUES (1155, 'PC12', 'g29');
INSERT INTO chi_tiet_ghe
VALUES (1156, 'PC12', 'g30');
INSERT INTO chi_tiet_ghe
VALUES (1157, 'PC12', 'g31');
INSERT INTO chi_tiet_ghe
VALUES (1158, 'PC12', 'g32');
INSERT INTO chi_tiet_ghe
VALUES (1159, 'PC12', 'g33');
INSERT INTO chi_tiet_ghe
VALUES (1160, 'PC12', 'g34');
INSERT INTO chi_tiet_ghe
VALUES (1161, 'PC12', 'g35');
INSERT INTO chi_tiet_ghe
VALUES (1162, 'PC12', 'g36');
INSERT INTO chi_tiet_ghe
VALUES (1163, 'PC12', 'g37');
INSERT INTO chi_tiet_ghe
VALUES (1164, 'PC12', 'g38');
INSERT INTO chi_tiet_ghe
VALUES (1165, 'PC12', 'g39');
INSERT INTO chi_tiet_ghe
VALUES (1166, 'PC12', 'g40');
INSERT INTO chi_tiet_ghe
VALUES (1167, 'PC12', 'g41');
INSERT INTO chi_tiet_ghe
VALUES (1168, 'PC12', 'g42');
INSERT INTO chi_tiet_ghe
VALUES (1169, 'PC12', 'g43');
INSERT INTO chi_tiet_ghe
VALUES (1170, 'PC12', 'g44');
INSERT INTO chi_tiet_ghe
VALUES (1171, 'PC12', 'g45');
INSERT INTO chi_tiet_ghe
VALUES (1172, 'PC12', 'g46');
INSERT INTO chi_tiet_ghe
VALUES (1173, 'PC12', 'g47');
INSERT INTO chi_tiet_ghe
VALUES (1174, 'PC12', 'g48');
INSERT INTO chi_tiet_ghe
VALUES (1175, 'PC12', 'g49');
INSERT INTO chi_tiet_ghe
VALUES (1176, 'PC12', 'g50');
INSERT INTO chi_tiet_ghe
VALUES (1177, 'PC12', 'g51');
INSERT INTO chi_tiet_ghe
VALUES (1178, 'PC12', 'g52');
INSERT INTO chi_tiet_ghe
VALUES (1179, 'PC12', 'g53');
INSERT INTO chi_tiet_ghe
VALUES (1180, 'PC12', 'g54');
INSERT INTO chi_tiet_ghe
VALUES (1181, 'PC12', 'g55');
INSERT INTO chi_tiet_ghe
VALUES (1182, 'PC12', 'g56');
INSERT INTO chi_tiet_ghe
VALUES (1183, 'PC12', 'g57');
INSERT INTO chi_tiet_ghe
VALUES (1184, 'PC12', 'g58');
INSERT INTO chi_tiet_ghe
VALUES (1185, 'PC12', 'g59');
INSERT INTO chi_tiet_ghe
VALUES (1186, 'PC12', 'g60');
INSERT INTO chi_tiet_ghe
VALUES (1187, 'PC12', 'g61');
INSERT INTO chi_tiet_ghe
VALUES (1188, 'PC12', 'g62');
INSERT INTO chi_tiet_ghe
VALUES (1189, 'PC12', 'g63');
INSERT INTO chi_tiet_ghe
VALUES (1190, 'PC12', 'g64');
INSERT INTO chi_tiet_ghe
VALUES (1191, 'PC12', 'g65');
INSERT INTO chi_tiet_ghe
VALUES (1192, 'PC12', 'g66');
INSERT INTO chi_tiet_ghe
VALUES (1193, 'PC12', 'g67');
INSERT INTO chi_tiet_ghe
VALUES (1194, 'PC12', 'g68');
INSERT INTO chi_tiet_ghe
VALUES (1195, 'PC12', 'g69');
INSERT INTO chi_tiet_ghe
VALUES (1196, 'PC12', 'g70');
INSERT INTO chi_tiet_ghe
VALUES (1197, 'PC12', 'g71');
INSERT INTO chi_tiet_ghe
VALUES (1198, 'PC12', 'g72');
INSERT INTO chi_tiet_ghe
VALUES (1199, 'PC12', 'g73');
INSERT INTO chi_tiet_ghe
VALUES (1200, 'PC12', 'g74');
INSERT INTO chi_tiet_ghe
VALUES (1201, 'PC12', 'g75');
INSERT INTO chi_tiet_ghe
VALUES (1202, 'PC12', 'g76');
INSERT INTO chi_tiet_ghe
VALUES (1203, 'PC12', 'g77');
INSERT INTO chi_tiet_ghe
VALUES (1204, 'PC12', 'g78');
INSERT INTO chi_tiet_ghe
VALUES (1205, 'PC12', 'g79');
INSERT INTO chi_tiet_ghe
VALUES (1206, 'PC12', 'g80');
INSERT INTO chi_tiet_ghe
VALUES (1207, 'PC12', 'g81');
INSERT INTO chi_tiet_ghe
VALUES (1208, 'PC12', 'g82');
INSERT INTO chi_tiet_ghe
VALUES (1209, 'PC12', 'g83');
INSERT INTO chi_tiet_ghe
VALUES (1210, 'PC12', 'g84');
INSERT INTO chi_tiet_ghe
VALUES (1211, 'PC12', 'g85');
INSERT INTO chi_tiet_ghe
VALUES (1212, 'PC12', 'g86');
INSERT INTO chi_tiet_ghe
VALUES (1213, 'PC12', 'g87');
INSERT INTO chi_tiet_ghe
VALUES (1214, 'PC12', 'g88');
INSERT INTO chi_tiet_ghe
VALUES (1215, 'PC12', 'g89');
INSERT INTO chi_tiet_ghe
VALUES (1216, 'PC12', 'g90');
INSERT INTO chi_tiet_ghe
VALUES (1217, 'PC12', 'g91');
INSERT INTO chi_tiet_ghe
VALUES (1218, 'PC12', 'g92');
INSERT INTO chi_tiet_ghe
VALUES (1219, 'PC12', 'g93');
INSERT INTO chi_tiet_ghe
VALUES (1220, 'PC12', 'g94');
INSERT INTO chi_tiet_ghe
VALUES (1221, 'PC12', 'g95');
INSERT INTO chi_tiet_ghe
VALUES (1222, 'PC12', 'g96');

-- vé


-- lịch làm việc
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV01', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV02', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV03', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV04', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV05', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '10:00:00', '18:00:00', 25000, 'NV06', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '18:00:00', '23:59:59', 25000, 'NV07', 'CN1');
insert into lich_lam_viec
values ('2023-10-02', '18:00:00', '23:59:59', 25000, 'NV08', 'CN1');
-- insert into lich_lam_viec (NgayLam,ThoiGianBatDau,ThoiGianKetThuc,LuongCoBan,MaNV,MaCN) values('2023-10-02','18:00:00','23:59:59',25000,'NV09','CN1');
-- insert into lich_lam_viec (NgayLam,ThoiGianBatDau,ThoiGianKetThuc,LuongCoBan,MaNV,MaCN) values('2023-10-02','18:00:00','23:59:59',25000,'NV10','CN1');
-- insert into lich_lam_viec (NgayLam,ThoiGianBatDau,ThoiGianKetThuc,LuongCoBan,MaNV,MaCN) values('2023-10-02','18:00:00','23:59:59',25000,'NV11','CN1');
-- insert into lich_lam_viec (NgayLam,ThoiGianBatDau,ThoiGianKetThuc,LuongCoBan,MaNV,MaCN) values('2023-10-02','18:00:00','23:59:59',25000,'NV12','CN1');

-- topping
insert into Topping
values ('TP01', N'Bắp rang bơ', 20, 60000, 'tp01.jpg');
insert into Topping
values ('TP02', N'Coca Cola', 50, 39000, 'tp02.jpg');
insert into Topping
values ('TP03', N'Sting', 70, 39000, 'tp03.jpg');
insert into Topping
values ('TP04', N'Snack', 33, 40000, 'tp04.jpg');

-- chi tiết topping
insert into chi_tiet_topping
values (1, 'TP01', 1);
insert into chi_tiet_topping
values (2, 'TP01', 2);


select p.ma_phim, p.ten_phim, ph.ten_phong, nc.ngay, nc.gio_bat_dau, cn.ten_cn, g.ten_ghe, xc.gia_xuat_chieu
from phim p 
join xuat_chieu xc on p.ma_phim = xc.ma_phim
join phong_chieu ph on ph.ma_phong = xc.ma_phong
join ngay_chieu nc on nc.stt = xc.ma_ngay_chieu
join chi_nhanh cn on cn.ma_cn = ph.ma_cn
join chi_tiet_ghe ctg on ctg.ma_phong = ph.ma_phong
join ghe g on g.ma_ghe = ctg.ma_ghe

select * from ngay_chieu

select * from xuat_chieu