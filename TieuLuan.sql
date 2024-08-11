--1. TAO BANG NHAN VIEN
CREATE TABLE NhanVien
(
    MaNV VARCHAR2(10),
    HoTenNV NVARCHAR2(150),
    NgaySinh DATE,
    GioiTinh INT CHECK (GioiTinh = 0 OR GioiTinh = 1),
    DiaChi NVARCHAR2(200),
    SDT VARCHAR2(20),
    Email VARCHAR2(150),
    CONSTRAINT PK_NV_MaNV PRIMARY KEY (MaNV)
)
--2. TAO BANG KHACH HANG
CREATE TABLE KhachHang
( 
    MaKH VARCHAR2(10),
    HoTenKH NVARCHAR2(150),
    GioiTinh INT CHECK (GioiTinh = 0 OR GioiTinh = 1),-- 0: nu || 1: nam
    DiaChi NVARCHAR2(200),
    SDT VARCHAR2(20),
    Email VARCHAR2(150),
    CONSTRAINT PK_KH_MaKH PRIMARY KEY (MaKH)
)
--3. TAO BANG NHA CUNG CAP
CREATE TABLE NhaCungCap
( 
    MaNCC VARCHAR2(10),
    TenNCC NVARCHAR2(150),
    DiaChi NVARCHAR2(200),
    SDT VARCHAR2(20),
    CONSTRAINT PK_NCC_MaNCC PRIMARY KEY (MaNCC)
)
--4. TAO BANG MATHANG
CREATE TABLE MatHang
( 
    MaMH VARCHAR2(10),
    TenMH NVARCHAR2(150),
    MaLoaiHang VARCHAR2(10),
    QuyCach NVARCHAR2(30),
    SLTon INT,
    DgBan FLOAT,
    CONSTRAINT PK_MH_MaMH PRIMARY KEY (MaMH),
    CONSTRAINT FK_MH_MaLH FOREIGN KEY (MaLoaiHang) REFERENCES LoaiHang(MaLoaiHang)
)
-- 5. TAO BANG LOAI HANG
CREATE TABLE LoaiHang
( 
    MaLoaiHang VARCHAR2(10),
    TenLoaiHang NVARCHAR2(200),
    GhiChu NVARCHAR2(150),
    CONSTRAINT PK_MLH_MaLoaiHang PRIMARY KEY (MaLoaiHang)
) 
 -- 6. TAO BANG DON DAT HANG
 CREATE TABLE DonDatHang
(
    MaDH VARCHAR2(10),
    MaKH VARCHAR2(10),
    MaNV VARCHAR2(10),
    NgayDH DATE,
    NgayNhan DATE,
    SLDat INT,
    PTTT NVARCHAR2(50),
    CONSTRAINT PK_DDH_MaDH PRIMARY KEY (MaDH),
    CONSTRAINT FK_KH_MaKH FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    CONSTRAINT FK_NV_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
--drop table DonDatHang
-- 7. TAO BANG CHI TIET DON DAT HANG
 CREATE TABLE CTDonDatHang
(
    MaDH VARCHAR2(10),
    MaMH VARCHAR2(10),
    DGBan FLOAT,
    CONSTRAINT PK_CTDDH_MaDH_MaMH PRIMARY KEY (MaDH,MaMH),
    CONSTRAINT FK_DDH_MaDH FOREIGN KEY (MaDH) REFERENCES DonDatHang(MaDH),
    CONSTRAINT FK_MH_MaMH FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
)
drop table CTDonDatHang
--8. TAO BANG PHIEU NHAP
 CREATE TABLE PhieuNhap
(
    SoPN VARCHAR2(10),
    MaNV VARCHAR2(10),
    MaNCC VARCHAR2(10),
    DgNhap FLOAT,
    NgayNhap DATE,
    CONSTRAINT PK_PN_SoPN PRIMARY KEY (SoPN),
    CONSTRAINT FK_PN_NV_MaNV FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV),
    CONSTRAINT FK_PN_NCC_MaNCC FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
)
--drop table PhieuNhap
-- 9. TAO BANG CHI TIET PHIEU NHAP
CREATE TABLE CTPhieuNhap
( 
   SoPN VARCHAR2(10),
   MaMH VARCHAR2(10),
   SL INT,
   CONSTRAINT PK_CTPN PRIMARY KEY (SoPN,MaMH),
   CONSTRAINT FK_CTPN_PN_SoPN FOREIGN KEY (SoPN) REFERENCES PhieuNhap(SoPN),
   CONSTRAINT FK_CTPN_MH_MaMH FOREIGN KEY (MaMH) REFERENCES MatHang(MaMH)
)  
drop table CTPhieuNhap
------------------------------------------- INSERT DATA ------------------------------------------------
--1. INSERT NHANVIEN
INSERT INTO NhanVien VALUES ('NV01','Nguy?n Th? Châu',TO_DATE('23/12/1999','DD/MM/YYYY'),0,
                            N'S? 56/87 Bà Tri?u,P3,Q3,TP.HCM','0989878745','nguyenchau546@gmail.com');
INSERT INTO NhanVien VALUES ('NV02','Chu Th? Hoa',TO_DATE('02/01/1998','DD/MM/YYYY'),0,
                           'S? 90 Võ V?n Hát,P.T?ng Nh?n Phú A,Q9,TP.Th? ??c','0989878745','chuthihoa878@gmail.com');
INSERT INTO NhanVien VALUES ('NV03','Lê ??c Liêm',TO_DATE('09/08/1987','DD/MM/YYYY'),1,
                           'S? 87 Tr?n H?ng ??o, P. Nguy?n C? Trinh, Q.1, TP.HCM','0878765556','leduclien8787@gmail.com');
INSERT INTO NhanVien VALUES ('NV04','Võ Ng?c Th?o',TO_DATE('10/11/1997','DD/MM/YYYY'),0,
                           'S? 02 Lê ??i Hành, P. Minh Khai, Q. H?ng Bàng, Tp. HCM','0989878745','vongocthao1997@gmail.com');
INSERT INTO NhanVien VALUES ('NV05','Lê V?n Hùng',TO_DATE('06/07/2000','DD/MM/YYYY'),1,
                           'S? 80 Lê L?i - TP.HCM','0989987875','levanhung1989@gmail.com');
INSERT INTO NhanVien VALUES ('NV06','T? Quang D?ng',TO_DATE('14/05/2001','DD/MM/YYYY'),1,
                           'S? 9A Tr?n Phú, P. Cái Kh?, Q.6, TP.HCM','0988890512','taquandung@gmail.com');
INSERT INTO NhanVien VALUES ('NV07','Lê V?n H?i',TO_DATE('20/09/1995','DD/MM/YYYY'),1,
                           'S? 14 Lý Thái T?, P.2, TP.HCM','0989123445','levanhai123@gmail.com');
INSERT INTO NhanVien VALUES ('NV08','Tr?n Di?m Trang',TO_DATE('02/08/1993','DD/MM/YYYY'),0,
                           'S? 40 Nguy?n Trãi, P. Tr?n Phú, TP.HCM','0934389879','trandiemtrang145@gmail.com');
INSERT INTO NhanVien VALUES ('NV09','??ng Ph??ng Dung',TO_DATE('03/04/1990','DD/MM/YYYY'),0,
                           'S? 117 Tôn ??c Th?ng,P8,Q1,TP.HCM','0988775232','dangphuongdung156@gmail.com');
INSERT INTO NhanVien VALUES ('NV10','Tr?n Ng?c Ngà',TO_DATE('16/06/1994','DD/MM/YYYY'),0,
                           'S? 58 Nguy?n T?t Thành, P. T? An, TP.HCM','0985783451','tranngocnga987@gmail.com');
--2. INSERT KHACHHANG
INSERT INTO KhachHang VALUES ('KH01',N'Châu Ng?c Th?o Mai',0,N'	S? 12 Tr?n H?ng ??o, P. Tân Phú, TX. ??ng Xoài, T. Bình Ph??c','0199876598','chaungocthaomai874@gmail.com');
INSERT INTO KhachHang VALUES ('KH02',N'Mai Công Lý',1,N'S? 262 Quang Trung, Ph??ng 5, Thành ph? Cà Mau, Cà Mau','0199876598','maicongly123@gmail.com');
INSERT INTO KhachHang VALUES ('KH03',N'Võ V?n S?n',1,N'S? 58 Nguy?n T?t Thành, P. T? An, TP. Buôn Ma Thu?t, T.??k L?k','0976554561','vovanson@gmail.com');
INSERT INTO KhachHang VALUES ('KH04',N'Nguy?n V?n H?u',1,N'S? 161, Ph?m V?n Thu?n - Tân Ti?n - Biên Hoà - ??ng Nai','0546787667','nguyenvanhau@gmail.com');
INSERT INTO KhachHang VALUES ('KH05',N'Mai Xuân Tr??ng',1,N'04 Lý Thái T?- TP. pleiku - Gia Lai','0866799877','maixuantruong675@gmail.com');
INSERT INTO KhachHang VALUES ('KH06',N'Lê Ng?c Trang',0,N'S? 28 Phan Chu Trinh, P. Minh Khai, TP. Hà Giang, T. Hà Giang','0863345551','lengoctrang110@gmail.com');
INSERT INTO KhachHang VALUES ('KH07',N'Nguy?n Qu?nh Châu',0,N'S? 4 Nguy?n Thi?p, TP. Hà T?nh, T. Hà T?nh','0121288811','nguyenquynhchau123@gmail.com');
INSERT INTO KhachHang VALUES ('KH08',N'Tr?n ??c Cung',1,N'Tr?n H?ng ??o, TP. Hòa Bình, Hòa Bình','0121213332','tranduccung0999@gmail.com');
INSERT INTO KhachHang VALUES ('KH09',N'Tr?n Tuy?t Ng?c',0,N'S? 80 Tr?n Phú, P. L?c Th?, TP. Nha Trang, Khánh Hòa','0899121112','trantuyetngoc8799@gmail.com');
INSERT INTO KhachHang VALUES ('KH10',N'??ng Chu Th??ng',0,N'S? 198 Phan Chu Trinh, TP. Kon Tum, T. Kon Tum','0128121178','dangchuthung0124@gmail.com');
--3. INSERT NHACUNGCAP
INSERT INTO NhaCungCap VALUES ('NCC01',N'Công Ty TNHH Th??ng M?i Thi?t B? ?i?n Kim Nguyên',N'41/70/4 H??ng L? 80B, ?p 5, X. ?ông Th?nh, H. Hóc Môn, Tp. H? Chí Minh, Vi?t Nam','0903164839');
INSERT INTO NhaCungCap VALUES ('NCC02',N'Công Ty TNHH Thi?t B? ?i?n Ti?n ??t',N'354/89/31 Phan V?n Tr?,P. 11, Q. Bình Th?nh, Tp. H? Chí Minh, Vi?t Nam','0918671515');
INSERT INTO NhaCungCap VALUES ('NCC03',N'Công Ty CP Phân Ph?i Bi?n Th? Và Thi?t B? ?i?n Mi?n B?c',N'41 Yên Xá, Xã Tân Tri?u, Huy?n Thanh Trì, Hà N?i, Vi?t Nam','0987181511');
INSERT INTO NhaCungCap VALUES ('NCC04',N'Công Ty C? Ph?n C? Khí ?i?n Long Giang',N'28 Ngô Th? Nh?m, Qu?n Hai Bà Tr?ng, Hà N?i, Vi?t Nam','(024)22106045');
INSERT INTO NhaCungCap VALUES ('NCC05',N'Công Ty TNHH TONY GOLDEN BEES',N'T? 1, ?p 3, X.Long Th?, H.Nh?n Tr?ch, ??ng Nai, Vi?t Nam','0973884049');
INSERT INTO NhaCungCap VALUES ('NCC06',N'Công Ty TNHH M?t Thành Viên ??u T? Xây D?ng Th??ng M?i ??ng Khôi',N'298 Tô Ký, Xã Th?i Tam Thôn, Huy?n Hóc Môn, Tp. H? Chí Minh, Vi?t Nam','(028)6282 8399');
INSERT INTO NhaCungCap VALUES ('NCC07',N'Công Ty TNHH S?n Xu?t Th??ng M?i ??t Bình',N'44 ???ng S? 50, KP. 9, P. ân T?o, Q.Bình Tân, Tp.H? Chí Minh, Vi?t Nam','0972562721');
INSERT INTO NhaCungCap VALUES ('NCC08',N'Công Ty TNHH Thi?t B? Công Nghi?p Ph?m Gia Phát',N'T? 9, ?p Tân Thành, X.B?c S?n, H.Tr?ng Bom, ??ng Nai, Vi?t Nam',' 0979148816');
INSERT INTO NhaCungCap VALUES ('NCC09',N'Công Ty TNHH K? Thu?t ?i?n ??i Quang',N'S? 31 ???ng S? 4, Khu Nhà ? V?nh L?c, ?p 6C, X.V?nh L?c A, H.Bình Chánh, Tp. H? Chí Minh, Vi?t Nam','0933172028');
INSERT INTO NhaCungCap VALUES ('NCC10',N'Công Ty TNHH Th??ng M?i K? Thu?t H?u Duy',N'141 ???ng Phú Châu, KP.1, P.Tam Bình, TP.Th? ??c, Tp. H? Chí Minh, Vi?t Nam','0901059191');
-- 4. INSERT LOAIHANG
INSERT INTO LoaiHang VALUES ('TV','TiVi',null);
INSERT INTO LoaiHang VALUES ('TL',N'T? l?nh',null);
INSERT INTO LoaiHang VALUES ('MG',N'Máy gi?t',null);
INSERT INTO LoaiHang VALUES ('MNN',N'Máy n??c nóng',null);
INSERT INTO LoaiHang VALUES ('ML',N'Máy l?nh',null);
INSERT INTO LoaiHang VALUES ('RB','Rotbot hút b?i',null);
INSERT INTO LoaiHang VALUES ('NC01','N?i c?m',null);
INSERT INTO LoaiHang VALUES ('NC02','N?i chiên',null);
INSERT INTO LoaiHang VALUES ('BG','B?p ga',null);
INSERT INTO LoaiHang VALUES ('DT','?i?n tho?i',null);
-- 5. INSERT MATHANG
INSERT INTO MatHang VALUES ('MH01',N'Google Tivi Xiaomi A 32 inch L32M8-P2SEA','TV','cái',10,3.590000);
INSERT INTO MatHang VALUES ('MH02',N'Smart Tivi QLED 4K 55 inch Samsung QA55Q65A ','TV','cái',9,10990000);
INSERT INTO MatHang VALUES ('MH03',N'T? l?nh Toshiba Inverter 180 lít GR-B22VU UKG','TL','cái',5,4790000);
INSERT INTO MatHang VALUES ('MH04',N'T? l?nh Aqua 130 lít AQR-T150FA(BS)','TL','cái',2,4590000);
INSERT INTO MatHang VALUES ('MH05',N'Máy gi?t Aqua 8.8 KG AQW-FR88GT.BK','MG','cái',15,5990000);
INSERT INTO MatHang VALUES ('MH06',N'Máy gi?t Casper 7.5 kg WT-75NG1','MG','cái',9,3690000);
INSERT INTO MatHang VALUES ('MH07',N'Máy n??c nóng tr?c ti?p Casper 4500W EN-45TH11','MNN','cái',20,990000);
INSERT INTO MatHang VALUES ('MH08',N'Máy n??c nóng gián ti?p Ferroli 20 lít 2500W MIDO SQ','MNN','cái',19,2090000);
INSERT INTO MatHang VALUES ('MH09',N'Máy l?nh TCL Inverter 1 HP TAC-10CSD/XAB1I','ML','cái',5,5990000);
INSERT INTO MatHang VALUES ('MH10',N'N?i c?m cao t?n Toshiba 1.8 lít RC-18IX1PV','NC01','cái',21,2690000);
-- 6. INSERT ?ONATHANG
INSERT INTO DonDatHang VALUES('DH01','KH09','NV02',TO_DATE('11/11/2023','DD/MM/YYYY'),TO_DATE('15/11/2023','DD/MM/YYYY'),1,N'Ti?n m?t');
INSERT INTO DonDatHang VALUES('DH02','KH01','NV03',TO_DATE('12/11/2023','DD/MM/YYYY'),TO_DATE('16/11/2023','DD/MM/YYYY'),2,N'Chuy?n kho?n');
INSERT INTO DonDatHang VALUES('DH03','KH06','NV05',TO_DATE('14/11/2023','DD/MM/YYYY'),TO_DATE('19/11/2023','DD/MM/YYYY'),1,N'Ti?n m?t');
INSERT INTO DonDatHang VALUES('DH04','KH10','NV07',TO_DATE('15/11/2023','DD/MM/YYYY'),TO_DATE('20/11/2023','DD/MM/YYYY'),1,N'Chuy?n kho?n');
INSERT INTO DonDatHang VALUES('DH05','KH02','NV04',TO_DATE('16/11/2023','DD/MM/YYYY'),TO_DATE('24/11/2023','DD/MM/YYYY'),2,N'Chuy?n kho?n');
INSERT INTO DonDatHang VALUES('DH06','KH07','NV01',TO_DATE('17/11/2023','DD/MM/YYYY'),TO_DATE('25/11/2023','DD/MM/YYYY'),1,N'Chuy?n kho?n');
INSERT INTO DonDatHang VALUES('DH07','KH01','NV01',TO_DATE('20/11/2023','DD/MM/YYYY'),TO_DATE('27/11/2023','DD/MM/YYYY'),2,N'Chuy?n kho?n');
INSERT INTO DonDatHang VALUES('DH08','KH03','NV05',TO_DATE('21/11/2023','DD/MM/YYYY'),TO_DATE('28/11/2023','DD/MM/YYYY'),1,N'Ti?n m?t');
INSERT INTO DonDatHang VALUES('DH09','KH04','NV03',TO_DATE('22/11/2023','DD/MM/YYYY'),TO_DATE('01/12/2023','DD/MM/YYYY'),2,N'Ti?n m?t');
INSERT INTO DonDatHang VALUES('DH10','KH05','NV02',TO_DATE('23/11/2023','DD/MM/YYYY'),TO_DATE('20/12/2023','DD/MM/YYYY'),1,N'Ti?n m?t');

--7.INSERT CTDONDATHANG
INSERT INTO CTDonDatHang VALUES('DH01','MH08',2090000);
INSERT INTO CTDonDatHang VALUES('DH02','MH04',4000000);
INSERT INTO CTDonDatHang VALUES('DH03','MH03',1000000);
INSERT INTO CTDonDatHang VALUES('DH04','MH09',3999000);
INSERT INTO CTDonDatHang VALUES('DH06','MH05',1200000);
INSERT INTO CTDonDatHang VALUES('DH03','MH01',7622000);
INSERT INTO CTDonDatHang VALUES('DH02','MH02',4202020);
INSERT INTO CTDonDatHang VALUES('DH03','MH07',6003000);
INSERT INTO CTDonDatHang VALUES('DH01','MH03',7023000);
INSERT INTO CTDonDatHang VALUES('DH07','MH04',9100000);
-- 8. INSERT PHIEUNHAP
INSERT INTO PhieuNhap VALUES('PN001','NV01','NCC01',2500000,TO_DATE('13/10/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN002','NV02','NCC02',5500000,TO_DATE('19/10/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN003','NV04','NCC03',7600000,TO_DATE('11/10/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN004','NV03','NCC03',8900000,TO_DATE('14/10/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN005','NV02','NCC01',9100000,TO_DATE('11/11/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN006','NV01','NCC06',10000000,TO_DATE('14/11/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN007','NV02','NCC07',1200000,TO_DATE('01/12/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN008','NV04','NCC04',28500000,TO_DATE('13/03/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN009','NV03','NCC03',31500000,TO_DATE('3/09/2023','DD/MM/YYYY'));
INSERT INTO PhieuNhap VALUES('PN010','NV01','NCC02',1400000,TO_DATE('12/10/2023','DD/MM/YYYY'));

-- 9. INSERT CTPHIEUNHAP
INSERT INTO CTPhieuNhap VALUES('PN002','MH04',5);
INSERT INTO CTPhieuNhap VALUES('PN003','MH01',12);
INSERT INTO CTPhieuNhap VALUES('PN001','MH02',7);
INSERT INTO CTPhieuNhap VALUES('PN005','MH06',9);
INSERT INTO CTPhieuNhap VALUES('PN006','MH07',4);
INSERT INTO CTPhieuNhap VALUES('PN003','MH03',6);
INSERT INTO CTPhieuNhap VALUES('PN005','MH05',11);
INSERT INTO CTPhieuNhap VALUES('PN007','MH02',10);
INSERT INTO CTPhieuNhap VALUES('PN009','MH09',20);
INSERT INTO CTPhieuNhap VALUES('PN010','MH10',9);



------------------------------------------- VIEW -----------------------------------------------------------

---1.(view) cho biet NV co doanh so ban hang cao nhat trong  6 tháng cuoi nam 2023.
        CREATE VIEW NVDoanhSoCao AS
        SELECT NV.MaNV, HoTenNV, SUM(DDH.SLDat * MH.DgBan) AS DoanhSo
        FROM NhanVien NV INNER JOIN DonDatHang DDH ON DDH.MaNV = NV.MaNV
                         INNER JOIN CTDonDatHang CTDDH ON CTDDH.MaDH= DDH.MaDH
                         INNER JOIN MatHang MH ON MH.MaMH = CTDDH.MaMH
        WHERE
          (EXTRACT(MONTH FROM NgayDH) BETWEEN '6' AND '12') AND(EXTRACT (YEAR FROM NgayDH) = 2023) AND (ROWNUM <= 3)
        GROUP BY  NV.MaNV, HoTenNV
        ORDER BY DoanhSo ASC;
        -- Thuc thi 
        SELECT * FROM NVDoanhSoCao;
        -- Xoa VIEW
        DROP VIEW NVDoanhSoCao;

--2. T?o khung nhìn (view) cho biet mat hang ban cham nhat trong nam 2023, thong tin gom: MaMH, TenMH, So luong ban ?uoc.
        CREATE VIEW MatHangBanChamNhat AS
        SELECT MH.MaMH, TenMH, SUM(DDH.SLDat) AS SoLuongBanDuoc
        FROM MatHang MH INNER JOIN CTDonDatHang CTDDH ON CTDDH.MaMH = MH.MaMH
                        INNER JOIN DonDatHang DDH ON DDH.MaDH = CTDDH.MaDH
        WHERE 
            (EXTRACT (YEAR FROM NgayDH) = 2023) AND (ROWNUM <= 3)
        GROUP BY MH.MaMH, TenMH
        ORDER BY SoLuongBanDuoc ASC;
        -- Thuc thi
        SELECT * FROM MatHangBanChamNhat;
        -- Xoa VIEW
        DROP VIEW MatHangBanChamNhat;

-- 3. Tao khung nhin (view) cho biet khach hang có ho là  Le
        CREATE VIEW KHHoLe AS
        SELECT *
        FROM KhachHang
        WHERE  HoTenKH LIKE '%Lê%';
        -- Thuc thi
        SELECT * FROM KHHoLe;
        -- Xoa VIEW
        DROP VIEW KHHoLe;

-- 4. Tao khung nhin (view) cho biet nhap hang cua nhà cung cap nao la nhieu nhat, thong tin gom: MaNCC, TenNCC, SoPN, So luong nh?p.
        CREATE VIEW NCCNhapNhieuNhat AS
        SELECT NCC.MaNCC, TenNCC, SUM(CTPN.SL) AS SoLuongNhap
        FROM NhaCungCap NCC INNER JOIN PhieuNhap PN ON PN.MaNCC = NCC.MaNCC
                INNER JOIN CTPhieuNhap CTPN ON CTPN.SoPN = PN.SoPN
        WHERE ROWNUM <= 3
        GROUP BY NCC.MaNCC , TenNCC
        ORDER BY SoLuongNhap DESC;
        -- Thuc thi
        SELECT * FROM NCCNhapNhieuNhat;
        -- Xoa VIEW
        DROP VIEW NCCNhapNhieuNhat;

-- 5. Tao khung nhin (view) cho biet MaNV, HoTenNV chua ban duoc mat hang nao trong 6 thang cuoi nam 2023.
    CREATE VIEW NVChuaBanHang AS
    SELECT NV.MaNV, HoTenNV
    FROM
      NhanVien NV
    WHERE
      NV.MaNV NOT IN 
    (
        SELECT DDH.MaNV
        FROM DonDatHang DDH
        INNER JOIN CTDonDatHang CTDDH ON CTDDH.MaDH = DDH.MaDH
        WHERE
          (EXTRACT(MONTH FROM NgayDH) BETWEEN '6' AND '12') AND(EXTRACT (YEAR FROM NgayDH) = 2023)
    );
    --Thuc thi
    SELECT * FROM NVChuaBanHang;
    -- Xoa VIEW
    DROP VIEW NVChuaBanHang;

------------------------------------------- PROCEDURE -----------------------------------------------------------

--1.Viet thu tuc thuc hien yeu cau sau: In thông tin don dat hàng có trong bang don dat hàng.
--Voi tham so truyen vào là MaDH. Thông tin g?m: MaDH, MaMH,MaNV, SLDat, DgBan, PTTTT
        CREATE OR REPLACE PROCEDURE InThongTin_DDH ( p_madh IN VARCHAR2)
        AS
            CURSOR cur_madh IS
                SELECT DDH.MaDH, MaMH, MaNV, SLDat, DgBan, PTTT
                FROM DonDatHang DDH JOIN CTDonDatHang CTDDH ON DDH.MaDH = CTDDH.MaDH
                WHERE DDH.MaDH = p_madh;
                v_MaDH DonDatHang.MaDH%type;
                v_MaMH CTDonDatHang.MaMH%type;
                v_MaNV DonDatHang.MaNV%type;
                v_SLDat DonDatHang.SLDat%type;
                v_DgBan CTDonDatHang.DgBan%type;
                v_PTTT DonDatHang.PTTT%type;
        BEGIN 
        OPEN cur_madh; 
        LOOP
                FETCH cur_madh INTO v_MaDH,v_MaMH,v_MaNV,v_SLDat,v_DgBan,v_PTTT;
                EXIT WHEN cur_madh%NOTFOUND;
               DBMS_OUTPUT.PUT_LINE('-------------- KET QUA ------------------');
               DBMS_OUTPUT.PUT_LINE('Ma don hang: ' ||v_MaDH);
               DBMS_OUTPUT.PUT_LINE('Ma khach hang: ' || v_MaMH);
               DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || v_MaNV);
               DBMS_OUTPUT.PUT_LINE('So luong dat: ' || v_SLDat);
               DBMS_OUTPUT.PUT_LINE('Don gia ban: ' || v_DgBan);
               DBMS_OUTPUT.PUT_LINE('Phuong thuc thanh toan: ' || v_PTTT);
               DBMS_OUTPUT.PUT_LINE('-----------------------------------------');
            END LOOP; 
            CLOSE cur_madh;
            END;
        
        -- Thuc thi
        SET SERVEROUTPUT ON;
        EXECUTE InThongTin_DDH('DH01');
        --Xoa
        drop procedure InThongTin_DDH;
        

--2. Voi tham so vao la thang, nam, thu tuc in thong tin tat ca don hang duoc dat trong thang nam do.
--thong tin gom:MaDH, NgayDH, NgayNhan, SLDat,tong tien.
        CREATE PROCEDURE THONGTINDDH(p_month int, p_year int)
        as 
        cursor ddt_curs is select DonDatHang.MaDH,NgayDH,NgayNhan,SLDat,sum (SLDat*DgBan)as TongTien
        FROM DonDatHang join CTDonDatHang on DonDatHang.MaDH=CTDonDatHang.MaDH 
        where extract (month from NgayDH)=p_month and extract (year from NgayDH)=p_year 
        group by DonDatHang.MaDH,NgayDH,NgayNhan,SLDat order by TongTien asc;
        v_ddt_mamh DonDatHang.MaDH%type;
        v_ddt_nn DonDatHang.NgayDH%type;
        v_ddt_ng DonDatHang.NgayNhan%type;
        v_ddt_sld DonDatHang.SLDat%type;
        v_ddt_tt float;
        begin open ddt_curs; 
        loop
            fetch ddt_curs into v_ddt_mamh,v_ddt_nn,v_ddt_ng,v_ddt_sld,v_ddt_tt;
            exit when ddt_curs%notfound;
            DBMS_OUTPUT.put_line('Ma Dat Hang: '||v_ddt_mamh);
            DBMS_OUTPUT.put_line('Ngay Dat Hang: '||v_ddt_nn);
            DBMS_OUTPUT.put_line('Ngay Giao Hang: '||v_ddt_ng);
            DBMS_OUTPUT.put_line('So luong dat: '||v_ddt_sld);
            DBMS_OUTPUT.put_line('Tong Tien: '||v_ddt_tt);
            DBMS_OUTPUT.put_line('********************');
            end loop;
        close ddt_curs; 
        end THONGTINDDH;
        
        --thuc thi
        SET SERVEROUTPUT ON;
        EXECUTE THONGTINDDH(11,2023);
        --xoa
        drop procedure THONGTINDDH;
        
        
--3.Tao thu tuc nhan vào tham so MaMH. Thu tuc in thong tin tat ca san pham 
--neu so luong ton duoi 5 thì GhiChu san pham “Sap het hang”.Thong tin gom: MaMH, MaLoaiHang,TenMH,SLTon, QuyCach, GhiChu.
        CREATE OR REPLACE PROCEDURE InThongTinMH ( ma_mh IN VARCHAR2)
        AS CURSOR c_mh IS
            SELECT MaMH, LoaiHang.MaLoaiHang,TenMH,SLTon, QuyCach, GhiChu
            FROM MatHang join LoaiHang on MatHang.MaLoaiHang = LoaiHang.MaLoaiHang 
            WHERE MaMH = ma_mh;
          mh_rec c_mh%ROWTYPE;
        BEGIN
          OPEN c_mh;
          LOOP
            FETCH c_mh INTO mh_rec;
            EXIT WHEN c_mh%NOTFOUND;
            IF mh_rec.slton <= 5 THEN
              mh_rec.ghichu := 'Sap het hang';
            ELSE mh_rec.ghichu := '';
            END IF;
            DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || mh_rec.mamh);
            DBMS_OUTPUT.PUT_LINE('Ma loai hang: ' || mh_rec.maloaihang);
            DBMS_OUTPUT.PUT_LINE('Ten mat hang: ' || mh_rec.tenmh);
            DBMS_OUTPUT.PUT_LINE('So luong ton: ' || mh_rec.slton);
            DBMS_OUTPUT.PUT_LINE('Quy cach: ' || mh_rec.quycach);
            DBMS_OUTPUT.PUT_LINE('Ghi chu: ' || mh_rec.ghichu);
          END LOOP;
          CLOSE c_mh;
        END;
        
        --thuc thi
        SET SERVEROUTPUT ON;
        BEGIN
          InThongTinMH('MH09');
        END;
        -- xoa
        drop procedure InThongTinMH;

--4.Tao thu tuc nhan tham so vao la MaNV, thang. Thu tuc in danh sach thong ke so luong mat hang ma nhan vien da ban hang trong cung thang. 
--Thong tin bao gom: STT, MaMH, TenMH, SL, DVT và Thành tien
        CREATE OR REPLACE PROCEDURE ThongKeNVBH(p_MaNV IN VARCHAR2,p_Thang IN NUMBER)
        AS CURSOR cur_NVBH IS
                SELECT CTDDH.MaMH, MH.TenMH,DDH.MaDH,SUM(DDH.SLDat) AS SoLuong, MH.QuyCach, SUM(DDH.SLDat * CTDDH.DgBan) AS ThanhTien
                FROM CTDonDatHang CTDDH JOIN DonDatHang DDH ON CTDDH.MaDH = DDH.MaDH JOIN MatHang MH ON CTDDH.MaMH = MH.MaMH
                WHERE DDH.MaNV = p_MaNV AND EXTRACT(MONTH FROM DDH.NgayDH) = p_Thang
                GROUP BY CTDDH.MaMH, MH.TenMH, DDH.MaDH, MH.QuyCach;
                v_MaMH MatHang.MaMH%type;
                v_TenMH MatHang.TenMH%type;
                v_MaDH DonDatHang.MaDH%type;
                v_SL DonDatHang.SLDat%type;
                v_QuyCach MatHang.QuyCach%type;
                v_ThanhTien FLOAT;
        BEGIN OPEN cur_NVBH;
            LOOP FETCH cur_NVBH INTO  v_MaMH, v_TenMH,v_MaDH, v_SL, v_QuyCach, v_ThanhTien;
                EXIT WHEN cur_NVBH%NOTFOUND;
                DBMS_OUTPUT.put_line('STT '|| cur_NVBH%rowcount);
                DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || v_MaMH);
                DBMS_OUTPUT.PUT_LINE('Ten mat hang: ' || v_TenMH);
                DBMS_OUTPUT.PUT_LINE('Ma don hang: ' || v_MaDH);
                DBMS_OUTPUT.PUT_LINE('So luong: ' || v_SL);
                DBMS_OUTPUT.PUT_LINE('Don vi tinh: ' || v_QuyCach);
                DBMS_OUTPUT.PUT_LINE('Thanh tien: ' || v_ThanhTien);
                DBMS_OUTPUT.PUT_LINE('------------------------------');
            END LOOP;
            CLOSE cur_NVBH; 
            END;
        
        --Thuc thi
        SET SERVEROUTPUT ON;
        EXECUTE ThongKeNVBH('NV01','11');
        --Xoa
        drop procedure ThongKeNVBH;

--5. Tao thu tuc voi tham so truyen vao la n. 
--In thong tin các don dat hang co gia tri lon hon hoac bang n.
        CREATE OR REPLACE PROCEDURE GTDH (n INT)
        AS CURSOR ord_curs IS
            SELECT DDH.MaDH, CTDDH.MaMH, DDH.MaNV, SUM(DDH.SLDat * CTDDH.DgBan) as ThanhTien, DDH.PTTT
            FROM DonDatHang DDH JOIN CTDonDatHang CTDDH ON DDH.MaDH = CTDDH.MaDH
            GROUP BY DDH.MaDH, CTDDH.MaMH, DDH.MaNV,DDH.PTTT
            HAVING SUM(DDH.SLDat * CTDDH.DgBan) >= n
            ORDER BY ThanhTien ASC;
            v_MaDH DonDatHang.MaDH%TYPE;
            v_MaMH CTDonDatHang.MaMH%TYPE;
            v_MaNV DonDatHang.MaNV%TYPE;
            v_ThanhTien FLOAT;
            v_PTTT DonDatHang.PTTT%TYPE;
        BEGIN OPEN ord_curs;
            LOOP FETCH ord_curs INTO v_MaDH, v_MaMH, v_MaNV,v_ThanhTien, v_PTTT;
                EXIT WHEN ord_curs%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('STT '|| ord_curs%rowcount);
                DBMS_OUTPUT.PUT_LINE('Ma don hang: ' || v_MaDH);
                DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || v_MaMH);
                DBMS_OUTPUT.PUT_LINE('Ma nhan vien: ' || v_MaNV);
                DBMS_OUTPUT.PUT_LINE('Thanh tien: ' || v_ThanhTien);
                DBMS_OUTPUT.PUT_LINE('Phuong thuc thanh toan: ' || v_PTTT);
                DBMS_OUTPUT.PUT_LINE('--------------------------------');
            END LOOP; 
            CLOSE ord_curs; 
            END GTDH;
        -- Thuc thi
        SET SERVEROUTPUT ON;
        EXECUTE GTDH('100000');
        --xoa
        drop procedure GTDH;


------------------------------------------- FUNCTION -----------------------------------------------------------

-- 1. Viet function F1 co tham so la MaKH. Ham tra ve danh sach cac don hang mà khach hang da dat.
--Thong tin gom: MaDH, MaKH, NgayDH, NgayNhan, TongTien.
        CREATE OR REPLACE FUNCTION F1(
        in_MaKH IN DonDatHang.MaKH%TYPE)
        RETURN SYS_REFCURSOR
        AS
        c_f1 SYS_REFCURSOR;
        BEGIN
        OPEN c_f1 FOR
        SELECT DonDatHang.MaDH,MaKH,NgayDH,NgayNhan,sum (SLDat*DgBan)as TongTien 
        FROM DonDatHang join CTDonDatHang on DonDatHang.MaDH=CTDonDatHang.MaDH
        WHERE MaKH = in_MaKH
        group by DonDatHang.MaDH,MaKH,NgayDH,NgayNhan
        ORDER BY NgayDH, TongTien;
        RETURN c_f1;
        END;
        
        -----thuc thi
        SET SERVEROUTPUT ON;
        DECLARE
        c_f1 SYS_REFCURSOR;
        l_madh DonDatHang.MaDH%TYPE;
        l_makh DonDatHang.MaKH%TYPE;
        l_nd DonDatHang.NgayDH%TYPE;
        l_nn DonDatHang.NgayNhan%TYPE;
        l_tt float;
        BEGIN c_f1 := F1('KH09');
        LOOP FETCH c_f1 INTO l_madh,l_makh, l_nd,l_nn, l_tt;
        EXIT WHEN c_f1%notfound;
        dbms_output.put_line('Ma Dat Hang: '||l_madh);
        dbms_output.put_line('Ma Khach Hang: '||l_makh);
        dbms_output.put_line('Ngay Dat Hang: '||l_nd);
        dbms_output.put_line('Ngay Nhan Hang: '||l_nn);
        dbms_output.put_line('Tong tien : '||l_tt);
        dbms_output.put_line('~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
        END LOOP; 
        CLOSE c_f1;
        END;
        
        --xoa
        drop function F1

--2.Viet fuction F2 có tham so truyen vào la ma mat hang (MaMH).
-- Hàm tra ve so luong san pham con ton kho. Thong tin bao gom: STT, MaMH, TenMH, MaNCC, so luong ton kho.
        CREATE OR REPLACE FUNCTION F2 (in_MaMH IN MatHang.MaMH%TYPE) 
        RETURN SYS_REFCURSOR
        AS c_f2 SYS_REFCURSOR;
        BEGIN OPEN c_f2 FOR
            SELECT MH.MaMH, TenMH, NCC.MaNCC, SLTon
            FROM MatHang MH JOIN CTPhieuNhap CTPN ON MH.MaMH = CTPN.MaMH
                            JOIN PhieuNhap PN ON PN.SoPN = CTPN.SoPN
                            JOIN NhaCungCap NCC ON NCC.MaNCC = PN.MaNCC
            WHERE MH.MaMH = in_MaMH;
            RETURN c_f2;
        END;
        -- Thuc thi 
        SET SERVEROUTPUT ON;
        DECLARE
          c_f2 SYS_REFCURSOR;
          f_MaMH MatHang.MaMH%TYPE;
          f_TenMH MatHang.TenMH%TYPE;
          f_MaNCC NhaCungCap.MaNCC%TYPE;
          f_SLTon MatHang.SLTon%TYPE;
        BEGIN c_f2 := F2('MH01');
         LOOP FETCH c_f2 INTO  f_MaMH, f_TenMH, f_MaNCC, f_SLTon;
            EXIT WHEN c_f2%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('------------------------------- ');
                DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || f_MaMH);
                DBMS_OUTPUT.PUT_LINE('Ten mat hang: ' || f_TenMH);
                DBMS_OUTPUT.PUT_LINE('Ma nha cung cap: ' || f_MaNCC);
                DBMS_OUTPUT.PUT_LINE('So luong ton: ' || f_SLTon);
                DBMS_OUTPUT.PUT_LINE('--------------------------------');
          END LOOP; 
          CLOSE c_f2; 
          END;
          
          --xoa
        drop function F2;

--3.Viet Function F3 co tham so la MAMH. Ham tra ve so luong san pham do da ban duoc trong thang 11 nam 2023.
CREATE OR REPLACE FUNCTION F3 (
  ma_mh MatHang.MaMH%Type)
RETURN NUMBER
AS
  dt_batdau date;
  dt_ketthuc date;
  sl_mua NUMBER;
BEGIN
  dt_batdau := TO_DATE('01-11-2023', 'DD/MM/YYYY');
  dt_ketthuc := TO_DATE('30-11-2023', 'DD/MM/YYYY');
  SELECT SUM(SLDat)
  INTO sl_mua FROM DonDatHang join CTDonDatHang on DonDatHang.MaDH=CTDonDatHang.MaDH
  WHERE
    MaMH = ma_mh
    AND NgayDH BETWEEN dt_batdau AND dt_ketthuc;
  RETURN sl_mua;
END;

--thuc thi
SET SERVEROUTPUT ON;
DECLARE
  sl_mua NUMBER;
BEGIN
  sl_mua := F3('MH04');
  DBMS_OUTPUT.PUT_LINE('So luong san pham nay da ban trong thang 11 nam 2023 la: ' || sl_mua);
END;

--xoa
drop function F3;

--4.Viet function voi khoi lenh nhap MaLoai tu ban phim. Phan loai cac mat hang theo loai mat hang. 
--Thuc thi va in thong tin ham F4 bao gom: MaMH,MaLoaiHang, TenMat,NgayNhap. voi tham so vào là các mã loai vua nhap.
        CREATE OR REPLACE FUNCTION F4( in_MLH IN LoaiHang.MaLoaiHang%TYPE) 
        RETURN SYS_REFCURSOR
        AS c_f4 SYS_REFCURSOR;
        BEGIN OPEN c_f4 FOR
            SELECT MH.MaMH, LH.MaLoaiHang, TenLoaiHang, TenMH, NgayNhap
            FROM MatHang MH 
                    JOIN LoaiHang LH ON MH.MaLoaiHang = LH.MaLoaiHang
                    JOIN CTPhieuNhap CTPN ON CTPN.MaMH = MH.MaMH
                    JOIN PhieuNhap PN ON PN.SoPN = CTPN.SoPN
            WHERE LH.MaLoaiHang = in_MLH;
          RETURN c_f4;
        END;
        -- Thuc thi 
        SET SERVEROUTPUT ON;
        DECLARE 
        c_f4 SYS_REFCURSOR;
            f_MaMH MatHang.MaMH%TYPE; 
            f_MaLoaiHang LoaiHang.MaLoaiHang%TYPE;
            f_TenLoaiHang LoaiHang.TenLoaiHang%TYPE;
            f_TenMH MatHang.TenMH%TYPE;
            f_NgayNhap PhieuNhap.NgayNhap%TYPE;
        BEGIN c_f4 := F4('TL');
          LOOP 
          FETCH c_f4 
          INTO f_MaMH, f_MaLoaiHang, f_TenLoaiHang, f_TenMH,f_NgayNhap;
            EXIT WHEN c_f4%NOTFOUND;
                DBMS_OUTPUT.put_line('STT '|| c_f4%rowcount);
                DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || f_MaMH);
                DBMS_OUTPUT.PUT_LINE('Ma loai hang: ' || f_MaLoaiHang);
                DBMS_OUTPUT.PUT_LINE('Ten loai hang: ' || f_TenLoaiHang);
                DBMS_OUTPUT.PUT_LINE('Ten mat hang: ' || f_TenMH);
                DBMS_OUTPUT.PUT_LINE('Ngay nhap hang: ' || f_NgayNhap);
                DBMS_OUTPUT.PUT_LINE('--------------------------------');
          END LOOP;
          CLOSE c_f4; 
          END;
-- xoa
drop function F4

--5. Viet Function F5 nhan vao tham so la MaPN. Tra ve ten NCC da cung cap san pham cua phieu nhap do.
CREATE OR REPLACE FUNCTION F5
(  so_pn PhieuNhap.SoPN%Type )
RETURN NVARCHAR2
AS ten_ncc NhaCungCap.TenNCC%Type;
BEGIN
  SELECT TenNCC INTO ten_ncc
  FROM PhieuNhap join NhaCungCap on PhieuNhap.MaNCC=NhaCungCap.MaNCC
  WHERE SoPN = so_pn;
  RETURN ten_ncc;
END;

--thuc thi
SET SERVEROUTPUT ON;
DECLARE
  ten_ncc NhaCungCap.TenNCC%Type;
BEGIN
  ten_ncc := F5('PN006');
  DBMS_OUTPUT.PUT_LINE('Nha cung cap cua phieu nhap la: ' || ten_ncc);
END;
--xoa
drop function F5;

------------------------------------------- PACKAGE -----------------------------------------------------------

--1.Tao Package co ten MH_Tim nhan vào 1 tham so la ma mat hang.
--Ham so tra ve 1 neu SLTon > 0 trong bang MatHang và nguoc lai se tra ve 0.
        CREATE OR REPLACE PACKAGE MH_Tim AS
         FUNCTION KTSLTon(f_MaMH IN MatHang.MaMH%TYPE) RETURN NUMBER;
        END MH_Tim;
        --Body
        CREATE OR REPLACE PACKAGE BODY MH_Tim AS
          FUNCTION KTSLTon(f_MaMH IN MatHang.MaMH%TYPE) RETURN NUMBER
          IS v_SLTon NUMBER;
          BEGIN
            SELECT SLTon INTO v_SLTon
            FROM MatHang
            WHERE MaMH = f_MaMH;
            IF v_SLTon > 0 THEN RETURN 1;
            ELSE RETURN 0;
            END IF;
            EXCEPTION WHEN NO_DATA_FOUND THEN
              RETURN 0;
            END KTSLTon;
        END MH_Tim;
        -- Thuc thi 
        SET SERVEROUTPUT ON;
        DECLARE
            v_Result NUMBER;
        BEGIN
          v_Result := MH_Tim.KTSLTon('MH01');
          IF v_Result = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Mat hang con hang trong kho');
          ELSE
            DBMS_OUTPUT.PUT_LINE('Mat hang hien nay dang HET HANG. Dang duoc cap nhap');
          END IF;
        END;
        --xoa
        DROP PACKAGE MH_Tim;
--2.Tao Package ten MH_Count nhan 1 tham so vao la ma mat hang. 1 tham so ra la tong so luong SLDat. 
--Thu tuc in thong tin chi tiet so luong dat nhu: stt, MaMH, MaKH, TenKH, DiaChi, SLDat.
        CREATE OR REPLACE PACKAGE MH_Count AS
          PROCEDURE GetSLDatByMaMH(p_MaMH VARCHAR2, p_SL OUT INT);
        END MH_Count;
        CREATE OR REPLACE PACKAGE BODY MH_Count AS
        PROCEDURE GetSLDatByMaMH(p_MaMH VARCHAR2, p_SL OUT INT) IS
            CURSOR c_MH_Count IS SELECT 
            ROWNUM AS stt, CTDDH.MaMH, KH.MaKH, HoTenKH, DiaChi, DDH.SLDat
            FROM DonDatHang DDH JOIN KhachHang KH ON DDH.MaKH = KH.MaKH JOIN CTDonDatHang CTDDH ON CTDDH.MaDH = DDH.MaDH
            WHERE CTDDH.MaMH = p_MaMH;
            v_SL INT := 0;
          BEGIN FOR rec IN c_MH_Count LOOP
              DBMS_OUTPUT.PUT_LINE('STT: ' || rec.stt || ', Ma mat hang: ' || rec.MaMH || ', Ma khach hang: ' || rec.MaKH || ',
              Ten khach hang: ' || rec.HoTenKH || ', Dia chi: ' || rec.DiaChi || ', So luong dat: ' || rec.SLDat);
              DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------');
              v_SL := v_SL + rec.SLDat;
            END LOOP;
            p_SL := v_SL;
          END GetSLDatByMaMH;
        END MH_Count;
        -- Thuc thi 
        DECLARE
          TotalSL INT;
        BEGIN
          MH_Count.GetSLDatByMaMH('MH03', TotalSL);
          DBMS_OUTPUT.PUT_LINE('Tong so luong SLDat: ' || TotalSL);
        END;
        --xoa
        DROP PACKAGE MH_Count;
        
--3. Tao Packages co ten BaoCaoDS nhan vao tham so la thang và nam tra ve doanh so ban hang
--trong khoang thoi gian do. Thu tuc in thong tin chi tiet: MaDH,MaMH, SLDat, TongTien.
        CREATE OR REPLACE PACKAGE BaoCaoDS AS
          FUNCTION TinhDoanhSo(thang IN number, nam in number) RETURN NUMBER;
          PROCEDURE InThongTinChiTiet(thang IN number, nam in number);
        END BaoCaoDS;
        ----
        CREATE OR REPLACE PACKAGE BODY BaoCaoDS AS
          FUNCTION TinhDoanhSo(thang IN number, nam in number) RETURN NUMBER AS TongTien NUMBER;
          BEGIN
            SELECT SUM(SLDat * DGBan) INTO TongTien
              FROM DonDatHang join CTDonDatHang on DonDatHang.MaDH=CTDonDatHang.MaDH
              WHERE EXTRACT(MONTH FROM NGAYDH) = thang AND EXTRACT(year FROM NGAYDH)=nam;
            RETURN TongTien;
          END TinhDoanhSo;
          PROCEDURE InThongTinChiTiet(thang IN number, nam in number) AS
            CURSOR ct_dh IS
              SELECT DonDatHang.MaDH,MaMH, SLDat, SUM(SLDat * DGBan) AS TongTien
                FROM DonDatHang join CTDonDatHang on DonDatHang.MaDH=CTDonDatHang.MaDH
                WHERE EXTRACT(MONTH FROM NGAYDH) = thang AND EXTRACT(year FROM NGAYDH)=nam
                GROUP BY DonDatHang.MaDH,MaMH, SLDat;
            BEGIN FOR r IN ct_dh LOOP
              DBMS_OUTPUT.PUT_LINE('STT: ' || ct_dh%Rowcount);
                DBMS_OUTPUT.PUT_LINE('Ma don hang: ' || r.MaDH);
                DBMS_OUTPUT.PUT_LINE('Ma mat hang: ' || r.MaMH);
                DBMS_OUTPUT.PUT_LINE('So luong: ' || r.SLDat);
                DBMS_OUTPUT.PUT_LINE('Tong tien: ' || r.TongTien);
                DBMS_OUTPUT.PUT_LINE('----------------------');
              END LOOP;
            END InThongTinChiTiet;
        END BaoCaoDS;
        --thuc thi
        SET SERVEROUTPUT ON;
        DECLARE
          DoanhSo NUMBER;
        BEGIN
          DoanhSo := BaoCaoDS.TinhDoanhSo(11,2023);
          BaoCaoDS.InThongTinChiTiet(11,2023);
        END;
        --xoa
        DROP PACKAGE BaoCaoDS;

---4.Tao Packages co ten KHTiemNang tra ve danh sach khach hang co so luong don dat hang lon hon bang 2.
--Thu tuc in thong tin chi tiet: MaKH, HoTenKH, SoDH.
        CREATE OR REPLACE PACKAGE KHTiemNang AS
            TYPE KHTiemNangCursor IS REF CURSOR;
            PROCEDURE InThongTinChiTiet;
            FUNCTION LayDanhSachKHTiemNang RETURN KHTiemNangCursor;
        END KHTiemNang;
        
    CREATE OR REPLACE PACKAGE BODY KHTiemNang AS
        PROCEDURE InThongTinChiTiet IS
                v_cursor KHTiemNangCursor;
                v_MaKH KhachHang.MaKH%TYPE;
                v_TenKH KhachHang.HoTenKH%TYPE;
                v_SoDH number;
            BEGIN OPEN v_cursor FOR SELECT kh.MaKH, kh.HoTenKH, COUNT(dh.MaDH) AS SoDH
                    FROM KhachHang kh
                    JOIN DonDatHang dh ON kh.MaKH = dh.MaKH
                    GROUP BY kh.MaKH, kh.HoTenKH, dh.MaKH
                    HAVING COUNT(dh.MaDH) >= 2;
                LOOP FETCH v_cursor INTO v_MaKH, v_TenKH, v_SoDH;
                    EXIT WHEN v_cursor%NOTFOUND;
                    DBMS_OUTPUT.PUT_LINE('MaKH: ' || v_MaKH || ', TenKH: ' || v_TenKH || ', SoDH: ' || v_SoDH);
                END LOOP; CLOSE v_cursor;
                END InThongTinChiTiet;
        FUNCTION LayDanhSachKHTiemNang RETURN KHTiemNangCursor IS v_cursor KHTiemNangCursor;
               BEGIN OPEN v_cursor FOR SELECT kh.MaKH, kh.HoTenKH, COUNT(dh.MaDH) AS SoDH
                FROM KhachHang kh
                JOIN DonDatHang dh ON kh.MaKH = dh.MaKH
                GROUP BY kh.MaKH, kh.HoTenKH, dh.MaKH
                HAVING COUNT(dh.MaDH) >= 2; RETURN v_cursor;
            END LayDanhSachKHTiemNang;
        END KHTiemNang;
        
        --thuc thi
        SET SERVEROUTPUT ON;
        DECLARE
            v_cursor KHTiemNang.KHTiemNangCursor;
            v_MaKH KhachHang.MaKH%TYPE;
            v_TenKH KhachHang.HoTenKH%TYPE;
            v_SoDH number;
        BEGIN
            v_cursor := KHTiemNang.LayDanhSachKHTiemNang;
            LOOP
                FETCH v_cursor INTO v_MaKH, v_TenKH, v_SoDH;
                EXIT WHEN v_cursor%NOTFOUND;
                DBMS_OUTPUT.PUT_LINE('MaKH: ' || v_MaKH || ', TenKH: ' || v_TenKH || ', SoDH: ' || v_SoDH);
            END LOOP;
        END;
        --xoa
        DROP PACKAGE KHTiemNang;


------------------------------------------- TRIGGER -----------------------------------------------------------

--1.Viet Trigger thuc hien rang buoc sau Ngay nhan hang phai lon hon ngay dat hang trong bang don dat hang.
        CREATE OR REPLACE TRIGGER KTNgayNhan
        AFTER UPDATE OR INSERT ON DonDatHang
        FOR EACH ROW
        BEGIN
          IF (:new.NgayNhan <= :NEW.NgayDH) THEN
            RAISE_APPLICATION_ERROR(-20002, N'Ngay nhan hang phai lon hon ngay dat hang.');
          END IF;
        END;
        -- Thuc thi loi
        UPDATE DonDatHang
        SET NgayNhan = TO_DATE('01/11/2023','DD/MM/YYYY')
        WHERE MaDH = 'DH10';
             -- Thuc thi hop le
            UPDATE DonDatHang
            SET NgayNhan = TO_DATE('01/12/2023','DD/MM/YYYY')
            WHERE MaDH = 'DH10';
        
        -- Xoa cau lenh
        DROP TRIGGER KTNgayNhan;

--2. Viet Trigger khong duoc phep thay doi don dat hang vao ngay 1 hang thang
        CREATE OR REPLACE TRIGGER YCTD_DDH
        BEFORE UPDATE ON DonDatHang
        FOR EACH ROW
        DECLARE
          NgayHienTai DATE;
        BEGIN
          NgayHienTai:=Sysdate;
          IF To_char(NgayHienTai,'DD') = '01' THEN
            RAISE_APPLICATION_ERROR(-20001, 'Khong duoc phep thay doi don dat hang vao ngay 1 hang thang.');
          END IF;
        END ;
        
        --thuc thi
        UPDATE DonDatHang
            SET PTTT= 'Chuyen khoan'
            WHERE MaDH = 'DH10';
       -- Xoa cau lenh
        DROP TRIGGER YCTD_DDH;
   
--3. Tao mot Trigger cho bang NhaCungCap de tu ?ong xoa PhieuNhap khi xoa NhaCungCap cua PhieuNhap do.
CREATE OR REPLACE TRIGGER Xoa_NCC_PN
AFTER DELETE ON NhaCungCap
FOR EACH ROW
BEGIN
  DELETE FROM PhieuNhap
  WHERE MaNCC = :OLD.MaNCC;
END;

---Thuc thi
DELETE FROM NhaCungCap
WHERE MaNCC = 'NCC04';
-- Xoa cau lenh
 DROP TRIGGER Xoa_NCC_PN;   
        
--4.Viet cau trigger thuc hien rang buoc so luong ton khong ?uoc phep nho h?n 0
        CREATE OR REPLACE TRIGGER Check_SLTon
        BEFORE INSERT OR UPDATE ON MatHang
        FOR EACH ROW
        BEGIN
          IF :NEW.SLTon < 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'So luong ton trong kho khong duoc nho hon 0');
          END IF;
        END Check_SLTon;
        
        --thucthiloi
        Update MatHang
        Set SLTon = -1
        Where MaMH = 'MH10';
        --thucthihople
         Update MatHang
        Set SLTon = 10
        Where MaMH = 'MH10';
        
-- Xoa cau lenh
 DROP TRIGGER Check_SLTon; 
        
--5.Viet trigger instead of update cho bang NhaCungCap. Kiem tra xem ten NCC co khac voi ten NCC cu khong. 
--Neu khong, thi bo qua cap nhat.
--Neu khac thi cap nhat thong tin nha cung cap voi thong tin moi.
    CREATE OR REPLACE VIEW View_NhaCungCap AS
    SELECT MaNCC, TenNCC,DiaChi,SDT
    FROM NhaCungCap;
    CREATE OR REPLACE TRIGGER Trg_InsteadOfUpdate_NhaCungCap
        INSTEAD OF UPDATE ON View_NhaCungCap
        FOR EACH ROW
    BEGIN
        IF :NEW.TenNCC != :OLD.TenNCC THEN
            UPDATE NhaCungCap
            SET TenNCC = :NEW.TenNCC,
                DiaChi = :NEW.DiaChi,
                SDT = :NEW.SDT
            WHERE MaNCC = :NEW.MaNCC;
        END IF;
    END;

--thucthi
update NhaCungCap
set TenNCC=N'Công Ty TNHH GOLDEN BEES'
where MaNCC='NCC05';
--xoa
drop trigger Trg_InsteadOfUpdate_NhaCungCap;

--6. Viet mot compound trigger cho tb DonDatHang.
--Truoc khi xoa mot ?on hang, kiem tra xem ngay nhan hang co sau hom nay khong. Neu khong, thi khong cho phep xoa.
CREATE OR REPLACE TRIGGER KT_DDH
FOR DELETE ON DonDatHang
COMPOUND TRIGGER
  BEFORE EACH ROW IS
  BEGIN
    IF :OLD.NgayNhan IS NOT NULL AND :OLD.NgayNhan >= SYSDATE THEN
      RAISE_APPLICATION_ERROR(-20001, 'Khong the xoa don hang vi hang chua duoc giao.');
    END IF;
  END BEFORE EACH ROW;
  AFTER STATEMENT IS
  BEGIN
    NULL;
  END AFTER STATEMENT;
END KT_DDH;

--thuc thi loi
DELETE FROM DonDatHang
WHERE MaDH = 'DH08';
--thuc thi hop le
DELETE FROM DonDatHang
WHERE MaDH = 'DH10';
--xoa
drop trigger KT_DDH;

------------------------------------------- ROLE, USER -----------------------------------------------------------

--Tao role "admin" voi quyen CREATE SESSION, CREATE TABLE, va CREATE VIEW
CREATE ROLE ADMIN;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW TO admin;

--DROP ROLE ADMIN;

--Tao role "NVBH"
CREATE ROLE NVBH;
GRANT SELECT, INSERT, UPDATE, DELETE ON MatHang TO NVBH;
GRANT SELECT, INSERT, UPDATE, DELETE ON LoaiHang TO NVBH;
GRANT SELECT, INSERT, UPDATE, DELETE ON DonDatHang TO NVBH;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTDonDatHang TO NVBH;
 
  --DROP ROLE NVBH;
 
 --Tao role "KETOAN"
CREATE ROLE KETOAN;
GRANT SELECT, INSERT, UPDATE, DELETE ON DonDatHang TO KETOAN;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTDonDatHang TO KETOAN;
GRANT SELECT, INSERT, UPDATE, DELETE ON PhieuNhap TO KETOAN;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTPhieuNhap TO KETOAN;
 
  --DROP ROLE KETOAN;
 
-- Tao role "QUANLY"
CREATE ROLE QUANLY;
GRANT SELECT, INSERT, UPDATE ON KHACHHANG TO QUANLY;
GRANT SELECT, INSERT, UPDATE, DELETE ON DonDatHang TO QUANLY;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTDonDatHang TO QUANLY;
GRANT SELECT, INSERT, UPDATE, DELETE ON PhieuNhap TO QUANLY;
GRANT SELECT, INSERT, UPDATE, DELETE ON CTPhieuNhap TO QUANLY;
GRANT SELECT, INSERT, UPDATE, DELETE ON MatHang TO QUANLY;
 
--- TaO ROLE "KHACHHANG"
CREATE ROLE KHACHHANG;
GRANT SELECT ON MatHang TO KHACHHANG;
 
 
-- Tao user "admin" voi Mat Khau "admin123"
CREATE USER ADMIN123
  IDENTIFIED BY admin123;
 
 
-- Tao user "user1" voi Mat Khau "user123"
CREATE USER USERNV01
  IDENTIFIED BY user123;
 
-- Tao user "user2" voi Mat Khau "user223"
CREATE USER USERNV02
  IDENTIFIED BY user223;
 
 -- Tao user "user3" voi Mat Khau "user1234"
CREATE USER USERNV03
  IDENTIFIED BY user1234;
 
 -- Tao user "user4" voi Mat Khau "user2234"
CREATE USER USERNV04
  IDENTIFIED BY user2234;
  
 -- Tao user "user5" voi Mat Khau "guest223"
CREATE USER USERKH01
  IDENTIFIED BY guest223;
  
 -- Tao user "user6" voi Mat Khau "guest123" 
CREATE USER USERKH02
  IDENTIFIED BY guest123;

 
-- Cap role  cho user
GRANT ADMIN TO ADMIN123;
GRANT NVBH TO USERNV01, USERNV02;
GRANT KETOAN TO USERNV03;
GRANT QUANLY TO USERNV04;
GRANT KHACHHANG TO USERKH01,USERKH02;
