USE WEBDT
GO
CREATE TABLE LOAISP
(
	MALOAI CHAR(10) PRIMARY KEY,
	TENLOAI NVARCHAR(50),
)
CREATE TABLE NHASANXUAT
(
	MANSX CHAR(10) PRIMARY KEY,
	TENNSX NVARCHAR(50),
	LOGO NVARCHAR(100),
)
CREATE TABLE SANPHAM
(
	MASANPHAM CHAR(10) PRIMARY KEY,
	TENSANPHAM NVARCHAR(50),
	HINHANH NVARCHAR(100),
	CHITIET NVARCHAR(500),
	SOLUONGTON INT,
	GIABAN INT,
	NGAYCAPNHAT DATETIME,
	MALOAI CHAR(10),
	MANSX CHAR(10),
)

ALTER TABLE SANPHAM ADD CONSTRAINT FK_SP_LOAI FOREIGN KEY(MALOAI) REFERENCES LOAISP(MALOAI)
ALTER TABLE SANPHAM ADD CONSTRAINT FK_SP_NSX FOREIGN KEY(MANSX) REFERENCES NHASANXUAT(MANSX)


CREATE TABLE KHACHHANG
(
	MAKHACH INT IDENTITY(1,1),
	TENKHACH NVARCHAR(30),
	NGAYSINH DATETIME,
	GIOITINH NVARCHAR(10),
	DIENTHOAI CHAR(11),
	TAIKHOAN NVARCHAR(30),
	EMAIL NVARCHAR(100),
	DIACHI NVARCHAR(100),
	CONSTRAINT PK_KH PRIMARY KEY(MAKHACH),
)

CREATE TABLE DONHANG
(
	MADONHANG INT IDENTITY(1,1),
	NGAYGIAO DATETIME,
	NGAYDAT DATETIME,
	DATHANHTOAN BIT,
	TINHTRANGGIAOHANG BIT,
	MAKH INT,
	CONSTRAINT PK_DH PRIMARY KEY(MADONHANG),
)
ALTER TABLE DONHANG ADD CONSTRAINT FK_DH_KH FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKHACH)

CREATE TABLE CHITIETDONHANG
(
	MADON INT,
	MASP CHAR(10),
	SOLUONG INT,
	DONGIA INT,
	CONSTRAINT PK_CTDH PRIMARY KEY(MADON,MASP),
)
ALTER TABLE CHITIETDONHANG ADD CONSTRAINT FK_CTDH_MD FOREIGN KEY(MADON) REFERENCES DONHANG(MADONHANG)
ALTER TABLE CHITIETDONHANG ADD CONSTRAINT FK_CTDH_SP FOREIGN KEY(MASP) REFERENCES SANPHAM(MASANPHAM)


----INSERT
INSERT INTO LOAISP
VALUES('001',N'Điện thoại')

select * from NHASANXUAT
INSERT INTO NHASANXUAT
VALUES('001',N'Iphone',N'logo-iphone-220x48.png')
INSERT INTO NHASANXUAT
VALUES('002',N'Samsung',N'samsungnew-220x48-1.png')
INSERT INTO NHASANXUAT
VALUES('003',N'Oppo',N'OPPO42-b_5.jpg')
INSERT INTO NHASANXUAT
VALUES('004',N'Itel',N'Itel42-b_54.jpg')
INSERT INTO NHASANXUAT
VALUES('005',N'Masster',N'Masstel42-b_0.png')
INSERT INTO NHASANXUAT
VALUES('006',N'Mobell',N'Mobell42-b_19.jpg')
INSERT INTO NHASANXUAT
VALUES('007',N'Nokia',N'Nokia42-b_21.jpg')
INSERT INTO NHASANXUAT
VALUES('008',N'Realme',N'Realme42-b_37.png')
INSERT INTO NHASANXUAT
VALUES('009',N'Vivo',N'vivo-logo-220-220x48-3.png')
INSERT INTO NHASANXUAT
VALUES('010',N'Xiaomi',N'logo-xiaomi-220x48-5.png')






SELECT * FROM SANPHAM

SET DATEFORMAT DMY
INSERT INTO SANPHAM
VALUES('IP01',N'Iphone 11',N'iphone-11-(50).jpg',N'Apple đã chính thức trình làng bộ 3 siêu phẩm iPhone 11, trong đó phiên bản iPhone 11 64GB có mức giá rẻ nhất nhưng vẫn được nâng cấp mạnh mẽ như iPhone Xr ra mắt trước đó.',NULL,11500000,'01/01/2021','001','001')
INSERT INTO SANPHAM
VALUES('IP02',N'Iphone 12',N'iphone-12-(16).jpg',N'Trong những tháng cuối năm 2020, Apple đã chính thức giới thiệu đến người dùng cũng như iFan thế hệ iPhone 12 series mới với hàng loạt tính năng bứt phá, thiết kế được lột xác hoàn toàn, hiệu năng đầy mạnh mẽ và một trong số đó chính là iPhone 12 64GB.',NULL,15900000,'01/06/2021','001','001')
INSERT INTO SANPHAM
VALUES('IP03',N'Iphone 12 Mini',N'iphone-12-mini-do-600x600.jpeg',N'Apple giới thiệu đến người dùng 4 phiên bản iPhone mới trong sự kiện Hi, Speed! ngày 14/10, trong đó có điện thoại iPhone 12 mini 256 GB, đây là sản phẩm hỗ trợ 5G có thiết kế nhỏ nhất, nhẹ nhất, mỏng nhất trên thế giới cho đến thời điểm hiện tại (10/2020).',NULL,14900000,'01/06/2020','001','001')
INSERT INTO SANPHAM
VALUES('IP04',N'Iphone 13',N'iphone-13-(16).jpg',N'Trong khi sức hút đến từ bộ 4 phiên bản iPhone 12 vẫn chưa nguội đi, thì hãng điện thoại Apple đã mang đến cho người dùng một siêu phẩm mới iPhone 13 với nhiều cải tiến thú vị sẽ mang lại những trải nghiệm hấp dẫn nhất cho người dùng.',NULL,19200000,'01/06/2022','001','001')
INSERT INTO SANPHAM
VALUES('IP05',N'Iphone 13 Mini',N'iphone-13-mini-xanh-la-thumb-600x600.jpg',N'iPhone 13 mini được Apple ra mắt với hàng loạt nâng cấp về cấu hình và các tính năng hữu ích, lại có thiết kế vừa vặn. Chiếc điện thoại này hứa hẹn là một thiết bị hoàn hảo hướng tới những khách hàng thích sự nhỏ gọn nhưng vẫn giữ được sự mạnh mẽ bên trong.',NULL,18700000,'01/06/2021','001','001')
INSERT INTO SANPHAM
VALUES('IP06',N'Iphone 13 Pro',N'iphone-13-pro-(16).jpg',N'Mỗi lần ra mắt phiên bản mới là mỗi lần iPhone chiếm sóng trên khắp các mặt trận và lần này cái tên khiến vô số người "sục sôi" là iPhone 13 Pro, chiếc điện thoại thông minh vẫn giữ nguyên thiết kế cao cấp, cụm 3 camera được nâng cấp, cấu hình mạnh mẽ cùng thời lượng pin lớn ấn tượng. ',NULL,24900000,'01/06/2022','001','001')
INSERT INTO SANPHAM
VALUES('IP07',N'Iphone 13 Promax',N'iphone-13-pro-max-(20).jpg',N'Điện thoại iPhone 13 Pro Max 128 GB - siêu phẩm được mong chờ nhất ở nửa cuối năm 2021 đến từ Apple. Máy có thiết kế không mấy đột phá khi so với người tiền nhiệm, bên trong đây vẫn là một sản phẩm có màn hình siêu đẹp, tần số quét được nâng cấp lên 120 Hz mượt mà, cảm biến camera có kích thước lớn hơn, cùng hiệu năng mạnh mẽ với sức mạnh đến từ Apple A15 Bionic, sẵn sàng cùng bạn chinh phục mọi thử thách.',NULL,28300000,'01/06/2021','001','001')
INSERT INTO SANPHAM
VALUES('IP08',N'Iphone SE2020',N'iphone-se-2020-trang-600x600-600x600.jpg',N'iPhone SE 128GB (2020) cũng đã được cho ra mắt làm thỏa mãn triệu tín đồ Táo khuyết. Máy sở hữu thiết kế siêu nhỏ gọn như iPhone 8, chip A13 Bionic cho hiệu năng khủng như iPhone 11, nhưng iPhone SE 2020 lại có một mức giá tốt đến bất ngờ.',NULL,9200000,'01/06/2020','001','001')
INSERT INTO SANPHAM
VALUES('IP09',N'Iphone SE2022',N'iphone-se-white-600x600.jpg',N'iPhone SE 128GB (2020) cũng đã được cho ra mắt làm thỏa mãn triệu tín đồ Táo khuyết. Máy sở hữu thiết kế siêu nhỏ gọn như iPhone 8, chip A13 Bionic cho hiệu năng khủng như iPhone 11, nhưng iPhone SE 2020 lại có một mức giá tốt đến bất ngờ.',NULL,11800000,'01/06/2022','001','001')

-- samsung
select * from SANPHAM
INSERT INTO SANPHAM
VALUES('SS01',N'Samsung Galaxy S22',N'Galaxy-S22-Black-600x600.jpg',N'Samsung Galaxy S22 ra mắt với diện mạo vô cùng tinh tế và trẻ trung, mang trong mình thiết kế phẳng theo xu hướng thịnh hành, màn hình 120 Hz mượt mà, cụm camera AI 50 MP và bộ xử lý đến từ Qualcomm.',NULL,17900000,'01/01/2021','001','002')

INSERT INTO SANPHAM
VALUES('SS02',N'Samsung Galaxy S22+',N'Galaxy-S22-Plus-White-600x600.jpg',N'Samsung Galaxy S22+ 5G 128GB được Samsung cho ra mắt với với ngoại hình không có quá nhiều thay đổi nhưng được nâng cấp đáng kể về thông số cấu hình bên trong và thời gian sử dụng, chắc hẳn sẽ mang lại những trải nghiệm thú vị dành cho bạn.',NULL,21900000,'01/01/2021','001','002')
INSERT INTO SANPHAM
VALUES('SS03',N'Samsung Galaxy A13',N'samsung-galaxy-a13-4g-(2).jpg',N'Nhằm mang trải nghiệm tốt hơn trên dòng sản phẩm giá rẻ, Samsung cho ra mắt Galaxy A13 4G với một hiệu năng ổn định, camera chụp ảnh sắc nét và viên pin khủng đáp ứng nhu cầu sử dụng cả ngày cho bạn cùng một mức giá trang bị cực kỳ phải chăng.',NULL,4200000,'01/01/2020','001','002')
INSERT INTO SANPHAM
VALUES('SS04',N'Samsung Galaxy A23',N'samsung-galaxy-a23-(4).jpg',N'Samsung Galaxy A23 4GB sở hữu bộ thông số kỹ thuật khá ấn tượng trong phân khúc, máy có một hiệu năng ổn định, cụm 4 camera thông minh cùng một diện mạo trẻ trung phù hợp cho mọi đối tượng người dùng.',NULL,5200000,'01/01/2020','001','002')
INSERT INTO SANPHAM
VALUES('SS05',N'Samsung Galaxy A52s',N'samsung-galaxy-a52s-5g-violet-600x600.jpg',N'Samsung đã chính thức giới thiệu chiếc điện thoại Galaxy A52s 5G đến người dùng, đây phiên bản nâng cấp của Galaxy A52 5G ra mắt cách đây không lâu, với ngoại hình không đổi nhưng được nâng cấp đáng kể về thông số cấu hình bên trong.',NULL,11200000,'01/01/2021','001','002')
INSERT INTO SANPHAM
VALUES('SS06',N'Samsung Galaxy A73',N'samsung-galaxy-a73-(2).jpg',N'Samsung Galaxy A73 5G 128GB được xem là sản phẩm nổi bật nhất dòng Galaxy A 2022 mới ra mắt, máy trang bị bộ thông số kỹ thuật ấn tượng về phần hiệu năng, chất lượng màn hình và nổi bật nhất trong số đó là camera khi nó đem lại bức ảnh có độ phân giải lên đến 108 MP.',NULL,10790000,'01/01/2022','001','002')
INSERT INTO SANPHAM
VALUES('SS07',N'Samsung Galaxy M53',N'samsung-galaxy-m53-(2).jpg',N'Có lẽ 2022 là một năm bùng nổ của nhà Samsung, khi hãng liên tục trình làng nhiều sản phẩm có cấu hình mạnh mẽ cùng một mức giá bán hợp lý trên thị trường smartphone tầm trung và giá rẻ, tiêu biểu trong số đó có Samsung Galaxy M53 được xem là cái tên được cộng đồng người dùng tích cực quan tâm và săn đón kể cả khi chưa ra mắt.',NULL,11790000,'01/01/2022','001','002')

SELECT * FROM NHASANXUAT
select * from SANPHAM
INSERT INTO SANPHAM
VALUES('OP01',N'Opppo A55',N'oppo-a55-4g-thumb-new-600x600.jpg',N'',null,4490000,'05/06/2021','001','003')

INSERT INTO SANPHAM
VALUES('OP01',N'Opppo A55',N'oppo-a55-4g-thumb-new-600x600.jpg',N'OPPO cho ra mắt OPPO A55 4G chiếc smartphone giá rẻ tầm trung có thiết kế đẹp mắt, cấu hình khá ổn, cụm camera chất lượng và dung lượng pin ấn tượng, mang đến một lựa chọn trải nghiệm thú vị vừa túi tiền cho người tiêu dùng.',null,4490000,'05/06/2021','001','003')
INSERT INTO SANPHAM
VALUES('OP02',N'Opppo A57',N'oppo-a57-xanh-thumb-1-600x600.jpg',N'Điện thoại OPPO A57 64GB vừa mới ra mắt đã tạo ấn tượng tích cực với cộng đồng yêu công nghệ. Sở hữu cho mình một thiết kế trẻ trung, hiệu năng mượt mà đáp ứng tốt nhu cầu cơ bản hằng ngày.',null,4490000,'05/06/2021','001','003')
INSERT INTO SANPHAM
VALUES('OP03',N'Opppo A76',N'oppo-a76-4g.jpg',N'OPPO A76 4G ra mắt với thiết kế trẻ trung, hiệu năng ổn định, màn hình 90 Hz mượt mà cùng viên pin trâu cho thời gian sử dụng lâu dài phù hợp cho mọi đối tượng người dùng.',null,5990000,'05/06/2022','001','003')
INSERT INTO SANPHAM
VALUES('OP04',N'Opppo A95',N'oppo-a95-4g-bac-2-600x600.jpg',N'Bên cạnh phiên bản 5G, OPPO còn bổ sung phiên bản OPPO A95 4G với giá thành phải chăng tập trung vào thiết kế năng động, sạc nhanh và hiệu năng đa nhiệm ấn tượng sẽ giúp cho cuộc sống của bạn thêm phần hấp dẫn, ngập tràn niềm vui.',null,6490000,'05/06/2022','001','003')
INSERT INTO SANPHAM
VALUES('OP05',N'Opppo A96',N'oppo-a96-den-thumb-1-600x600.jpg',N'OPPO A96 là cái tên được nhắc đến khá nhiều trên các diễn đàn công nghệ hiện nay, nhờ sở hữu một ngoại hình hết sức bắt mắt cùng hàng loạt các thông số ấn tượng trong phân khúc giá như hiệu năng cao, camera chụp ảnh sắc nét.',null,6690000,'05/06/2021','001','003')
INSERT INTO SANPHAM
VALUES('OP06',N'Opppo Find X5',N'oppo-find-x5-pro.jpg',N'OPPO Find X5 Pro 5G có lẽ là cái tên sáng giá được xướng tên trong danh sách điện thoại có thiết kế ấn tượng trong năm 2022. Máy được hãng cho ra mắt với một diện mạo độc lạ chưa từng có, cùng với đó là những nâng cấp về chất lượng ở camera nhờ sự hợp tác với nhà sản xuất máy ảnh Hasselblad. ',null,30990000,'05/06/2022','001','003')
INSERT INTO SANPHAM
VALUES('OP07',N'Opppo Reno 6',N'oppo-reno6-(8).jpg',N'Sau khi ra mắt OPPO Reno5 chưa lâu thì OPPO lại cho ra mẫu smartphone mới mang tên OPPO Reno6 với hàng loạt cải tiến mới về ngoại hình bên ngoài lẫn hiệu năng bên trong, mang đến trải nghiệm vượt bật cho người dùng.',null,11290000,'05/06/2021','001','003')
INSERT INTO SANPHAM
VALUES('OP08',N'Opppo Reno 7',N'oppo-reno7-z-(4).jpg',N'OPPO đã trình làng mẫu Reno7 Z 5G với thiết kế OPPO Glow độc quyền, camera mang hiệu ứng như máy DSLR chuyên nghiệp cùng viền sáng kép, máy có một cấu hình mạnh mẽ và đạt chứng nhận xếp hạng A về độ mượt.',null,9490000,'05/01/2022','001','003')
INSERT INTO SANPHAM
VALUES('OP09',N'Opppo Reno 8',N'oppo-reno8-4g-thumb-vang-600x600.jpg',N'OPPO Reno8 cho ra mắt với mức giá bán cực kỳ phải chăng, máy sẽ được trang bị bên trong bộ camera chất lượng và hiệu năng mạnh mẽ trong tầm giá. Đây quả thực là một chiến binh đáng gờm được OPPO tung ra nhằm cạnh tranh trực tiếp với nhiều sản phẩm phân khúc tầm trung.',null,8990000,'05/06/2022','001','003')

INSERT INTO SANPHAM
VALUES('XI',N'',N'.jpg',N'',null,10000000,'01/01/2021','001','010')

INSERT INTO SANPHAM
VALUES('XI01',N'Xiaomi 11 Lite 5 NE',N'xiaomi-11-lite-5g-ne-(10).jpg',N'Xiaomi 11 Lite 5G NE một phiên bản có ngoại hình rất giống với Xiaomi Mi 11 Lite được ra mắt trước đây. Chiếc smartphone này của Xiaomi mang trong mình một hiệu năng ổn định, thiết kế sang trọng và màn hình lớn đáp ứng tốt các tác vụ hằng ngày của bạn một cách dễ dàng.',null,8900000,'01/01/2021','001','010')
INSERT INTO SANPHAM
VALUES('XI02',N'Xiaomi 11T',N'xiaomi-11t-(10).jpg',N'Xiaomi 11T 5G 128GB đầy nổi bật với thiết kế vô cùng trẻ trung, màn hình AMOLED, bộ 3 camera sắc nét và viên pin lớn đây sẽ là mẫu smartphone của Xiaomi thỏa mãn mọi nhu cầu giải trí, làm việc và là niềm đam mê sáng tạo của bạn. ',null,9990000,'01/01/2022','001','010')
INSERT INTO SANPHAM
VALUES('XI03',N'Xiaomi 11T Pro 5G',N'xiaomi-11t-pro-5g-8gb-thumb-600x600.jpeg',N'Điện thoại Xiaomi 11T Pro 5G 8GB sử dụng con chip Snapdragon 888 mạnh mẽ, camera chính 108 MP, hỗ trợ sạc nhanh 120 W, màn hình rộng với tốc độ làm tươi lên đến 120 Hz, tận hưởng trải nghiệm tuyệt vời trong từng khoảnh khắc.',null,13990000,'01/01/2022','001','010')
INSERT INTO SANPHAM
VALUES('XI04',N'Xiaomi 12 Series',N'xiaomi-mi-12-(2).jpg',N'Điện thoại Xiaomi đang dần khẳng định chỗ đứng của mình trong phân khúc flagship bằng việc ra mắt Xiaomi 12 với bộ thông số ấn tượng, máy có một thiết kế gọn gàng, hiệu năng mạnh mẽ, màn hình hiển thị chi tiết cùng khả năng chụp ảnh sắc nét nhờ trang bị ống kính đến từ Sony.',null,15900000,'01/01/2022','001','010')
INSERT INTO SANPHAM
VALUES('XI05',N'Xiaomi Note 10 Pro',N'xiaomi-redmi-note-10-pro-(6).jpg',N'Kế thừa và nâng cấp từ thế hệ trước, Xiaomi đã cho ra mắt điện thoại Xiaomi Redmi Note 10 Pro (8GB/128GB) sở hữu một thiết kế cao cấp, sang trọng bên cạnh cấu hình vô cùng mạnh mẽ, hứa hẹn mang đến sự cạnh tranh lớn trong phân khúc smartphone tầm trung.',null,7490000,'01/01/2021','001','010')



select * from KHACHHANG
select * from DONHANG
SELECT * FROM CHITIETDONHANG

