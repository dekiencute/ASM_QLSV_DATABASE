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