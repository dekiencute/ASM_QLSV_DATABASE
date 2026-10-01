CREATE DATABASE QLSV;
USE QLSV;
CREATE TABLE `Khoa` (
  `ma_khoa` int PRIMARY KEY NOT NULL,
  `ten_khoa` varchar(100) UNIQUE NOT NULL
);

CREATE TABLE `Lop` (
  `ma_lop` int PRIMARY KEY NOT NULL,
  `ten_lop` varchar(50) UNIQUE NOT NULL,
  `nam_hoc` int NOT NULL,
  `ma_khoa` int NOT NULL
);

CREATE TABLE `SinhVien` (
  `ma_sinh_vien` int PRIMARY KEY NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `ngay_sinh` date NOT NULL,
  `gioi_tinh` varchar(10) NOT NULL,
  `email` varchar(100) UNIQUE,
  `ma_lop` int NOT NULL
);

CREATE TABLE `MonHoc` (
  `ma_mon` int PRIMARY KEY NOT NULL,
  `ten_mon` varchar(100) UNIQUE NOT NULL,
  `so_tin_chi` int NOT NULL
);

CREATE TABLE `GiangVien` (
  `ma_giang_vien` int PRIMARY KEY NOT NULL,
  `ho_ten` varchar(100) NOT NULL,
  `email` varchar(100) UNIQUE,
  `so_dien_thoai` varchar(15) UNIQUE
);

CREATE TABLE `HocKy` (
  `ma_hoc_ky` int PRIMARY KEY NOT NULL,
  `ten_hoc_ky` varchar(50) UNIQUE NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL
);

CREATE TABLE `Diem` (
  `ma_sinh_vien` int NOT NULL,
  `ma_mon` int NOT NULL,
  `ma_hoc_ky` int NOT NULL,
  `ma_giang_vien` int NOT NULL,
  `diem` decimal(4,2) NOT NULL,
  PRIMARY KEY (`ma_sinh_vien`, `ma_mon`, `ma_hoc_ky`)
);

ALTER TABLE `Lop` ADD FOREIGN KEY (`ma_khoa`) REFERENCES `Khoa` (`ma_khoa`);

ALTER TABLE `SinhVien` ADD FOREIGN KEY (`ma_lop`) REFERENCES `Lop` (`ma_lop`);

ALTER TABLE `Diem` ADD FOREIGN KEY (`ma_sinh_vien`) REFERENCES `SinhVien` (`ma_sinh_vien`);

ALTER TABLE `Diem` ADD FOREIGN KEY (`ma_mon`) REFERENCES `MonHoc` (`ma_mon`);

ALTER TABLE `Diem` ADD FOREIGN KEY (`ma_hoc_ky`) REFERENCES `HocKy` (`ma_hoc_ky`);

ALTER TABLE `Diem` ADD FOREIGN KEY (`ma_giang_vien`) REFERENCES `GiangVien` (`ma_giang_vien`);




INSERT INTO Khoa (ma_khoa, ten_khoa) VALUES
(1, 'Công nghệ thông tin'),
(2, 'Quản trị kinh doanh'),
(3, 'Tài chính - Ngân hàng'),
(4, 'Ngôn ngữ Anh'),
(5, 'Lập Trình Game'),
(6, 'Quản Trị Du Lịch'),
(7, 'Ngôn ngữ Trung'),
(8, 'Ngôn ngũ Nga'),
(9, 'Kinh doanh quốc tế'),
(10, 'Ngôn ngữ Pháp');


INSERT INTO Lop (ma_lop, ten_lop, nam_hoc, ma_khoa) VALUES
(101, 'CNTT01', 2024, 1),
(102, 'CNTT02', 2024, 1),
(103, 'CNTT03', 2025, 1),
(201, 'QTKD01', 2024, 2),
(301, 'TCNH01', 2024, 3),
(401, 'NNA01', 2025, 4),
(501, 'LTG01', 2025, 5),
(601, 'QTDL01', 2024, 6),
(701, 'NNT01', 2024, 7),
(702, 'NNT02', 2025, 7),
(801, 'NNN01', 2024, 8);


INSERT INTO SinhVien 
(ma_sinh_vien, ho_ten, ngay_sinh, gioi_tinh, email, ma_lop) VALUES
(1001, 'Nguyen Van An', '2006-03-15', 'Nam', 'an.nguyen@example.com', 101),
(1002, 'Tran Thi Binh', '2006-07-21', 'Nu', 'binh.tran@example.com', 101),
(1003, 'Le Hoang Cuong', '2006-11-02', 'Nam', 'cuong.le@example.com', 102),
(1004, 'Pham Minh Chau', '2006-05-18', 'Nu', 'chau.pham@example.com', 102),
(1005, 'Do Quang Huy', '2007-01-10', 'Nam', 'huy.do@example.com', 103),
(1006, 'Nguyen Thu Ha', '2007-09-25', 'Nu', 'ha.nguyen@example.com', 103),
(1007, 'Vu Duc Long', '2006-12-12', 'Nam', 'long.vu@example.com', 201),
(1008, 'Hoang Ngoc Mai', '2006-04-30', 'Nu', 'mai.hoang@example.com', 201),
(1009, 'Bui Thanh Nam', '2006-08-14', 'Nam', 'nam.bui@example.com', 301),
(1010, 'Pham Yen Nhi', '2007-02-20', 'Nu', 'nhi.pham@example.com', 401);


INSERT INTO MonHoc (ma_mon, ten_mon, so_tin_chi) VALUES
(1, 'Co so du lieu', 3),
(2, 'Lap trinh Java', 3),
(3, 'Lap trinh Web', 3),
(4, 'Mang may tinh', 3),
(5, 'Cau truc du lieu va giai thuat', 4),
(6, 'Quan tri hoc', 3),
(7, 'Marketing can ban', 3),
(8, 'Tai chinh doanh nghiep', 3),
(9, 'Kinh te hoc', 3),
(10, 'Triet Hoc Mac Lenin', 4);

INSERT INTO GiangVien 
(ma_giang_vien, ho_ten, email, so_dien_thoai) VALUES
(1, 'Nguyen Van Thanh', 'thanh.nguyen@example.com', '0901000001'),
(2, 'Tran Minh Duc', 'duc.tran@example.com', '0901000002'),
(3, 'Le Thi Huong', 'huong.le@example.com', '0901000003'),
(4, 'Pham Quoc Bao', 'bao.pham@example.com', '0901000004'),
(5, 'Hoang Thu Trang', 'trang.hoang@example.com', '0901000005'),
(6, 'Nguyen Thi Lan','lan.nguyen@example.com', '0901000006'),
(7, 'Pham Minh Quan', 'quan.pham@example.com', '0901000007'),
(8, 'Tran Hoai Nam', 'nam.tran@example.com', '0901000008'),
(9, 'Le Ngoc Anh', 'anh.le@example.com', '0901000009'),
 (10, 'Do Thi Hoa', 'hoa.do@example.com', '0901000010');
 
INSERT INTO HocKy 
(ma_hoc_ky, ten_hoc_ky, ngay_bat_dau, ngay_ket_thuc) VALUES
(1, 'Hoc ky 1 2025-2026', '2025-09-01', '2026-01-15'),
(2, 'Hoc ky 2 2025-2026', '2026-02-01', '2026-06-15'),
(3, 'Hoc ky 3 2025-2026', '2026-06-20', '2026-08-15');


INSERT INTO Diem 
(ma_sinh_vien, ma_mon, ma_hoc_ky, ma_giang_vien, diem) VALUES
-- SV 1
(1001, 1, 1, 1, 8.5),
(1001, 2, 1, 2, 7.5),
(1001, 3, 2, 3, 9.0),
(1001, 4, 2, 4, 8.0),

-- SV 2
(1002, 1, 1, 1, 9.0),
(1002, 2, 1, 2, 8.5),
(1002, 3, 2, 3, 8.0),
(1002, 4, 2, 4, 7.5),

-- SV 3
(1003, 1, 1, 1, 6.5),
(1003, 2, 1, 2, 7.0),
(1003, 3, 2, 3, 7.5),
(1003, 4, 2, 4, 6.0),

-- SV 4
(1004, 1, 1, 1, 8.0),
(1004, 2, 1, 2, 9.0),
(1004, 3, 2, 3, 8.5),
(1004, 4, 2, 4, 8.0),

-- SV 5
(1005, 1, 1, 1, 7.0),
(1005, 2, 1, 2, 6.5),
(1005, 3, 2, 3, 7.0),

-- SV 6
(1006, 1, 1, 1, 9.5),
(1006, 2, 1, 2, 8.5),
(1006, 3, 2, 3, 9.0),

-- SV 7
(1007, 6, 1, 3, 8.0),
(1007, 7, 2, 4, 7.5),

-- SV 8
(1008, 6, 1, 3, 9.0),
(1008, 7, 2, 8, 8.5),

-- SV 9
(1009, 8, 1, 5, 7.5),

-- SV 10
(1010, 6, 1, 3, 8.5),
(1010, 7, 2, 5, 9.0);