USE main1811;



INSERT INTO `chinhanh` (`MaCN`, `Ten`, `Sonha`, `Duong`, `Quanhuyen`, `Tinhtp`) VALUES
('BD001', 'T2E CMT8', '78', 'Cách Mạng Tháng 8', 'Thành phố Thủ Dầu 1', 'Bình Dương'),
('BD002', 'T2E Dĩ An', '22', 'đường M', 'thành phố Dĩ An', 'Bình Dương'),
('DN001', 'T2E Nguyễn Văn Linh', '99A', 'Nguyễn Văn Linh', 'Quận Hải Châu', 'Đà Nẵng'),
('HCM001', 'T2E Nguyễn Thị Minh Khai', '189', 'Nguyễn Thị Minh Khai', 'Quận 1', 'HCM'),
('HCM002', 'T2E Võ Thị Sáu', '78', 'Võ Thị Sáu', 'Quận 1', 'HCM'),
('HCM003', 'T2E Trần Não', '58B', 'Trần Não', 'Quận 2', 'HCM'),
('HCM004', 'T2E Khánh Hội', '245', 'Khánh Hội', 'Quận 4', 'HCM'),
('HCM005', 'T2E An Dương Vương', '135', 'An Dương Vương', 'Quận 5', 'HCM'),
('HCM006', 'T2E Bà Hom', '63', 'Bà Hom', 'Quận 6', 'HCM'),
('HCM007', 'T2E Nguyễn Khắc Viện', '25', 'Nguyễn Khắc Viện', 'Quận 7', 'HCM'),
('HCM008', 'T2E Xa Lộ Hà Nội', '76A', 'Xa Lộ Hà Nội', 'Quận 9', 'HCM'),
('HCM009', 'T2E Nguyễn Chí Thanh', '282', 'Nguyễn Chí Thanh', 'Quận 10', 'HCM'),
('HCM010', 'T2E Trường Chinh', '187', 'Trường Chinh', 'Quận 12', 'HCM'),
('HCM011', 'T2E Tô Ký', '55', 'Tô Ký', 'Quận 12', 'HCM'),
('HCM012', 'T2E Cộng Hòa', '105', 'Cộng Hòa', 'Quận Tân Bình', 'HCM'),
('HCM013', 'T2E Quang Trung ', '651', 'Quang Trung', 'Quận Gò Vấp', 'HCM'),
('HCM014', 'T2E Tô Ngọc Vân', '485', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM'),
('HCM015', 'T2E Tô Ký 2', '30/13', 'Tô Ký', 'Huyện Hóc Môn', 'HCM'),
('HN001', 'T2E Lê Văn Lương', '145', 'Lê Văn Lương', 'Quận Thanh Xuân', 'Hà Nội'),
('HN002', 'T2E Cầu Giấy', '299', 'Cầu Giấy', 'Quận Cầu Giấy', 'Hà Nội'),
('HN003', 'T2E Nguyễn Lương Bằng', '187', 'Nguyễn Lương Bằng', 'Quận Đống Đa', 'Hà Nội'),
('HN004', 'T2E TimeCity', '458', 'Minh Khai', 'Quận Hai Bà Trưng', 'Hà Nội');


INSERT INTO `giaotrinh` (`MaGT`, `Ten`, `Namxuatban`) VALUES
('KN001_GT01', 'Tài liệu độc quyền', 2021),
('KN002_GT01', 'Tài liệu độc quyền', 2021),
('KN003_GT01', 'Tài liệu độc quyền', 2021),
('KN004_GT01', 'Tài liệu độc quyền', 2021),
('OT001_GT01', 'Grammar In Use', 2015),
('OT001_GT02', 'Cambridge Grammar for IELTS', 2018),
('OT002_GT01', 'Cambridge Grammar for IELTS', 2018),
('OT002_GT02', 'Basic Vocabulary in Use', 2019),
('OT002_GT03', 'Destination B1 – B2', 2016),
('OT003_GT01', 'Vocabulary in use Intermediate', 2020),
('OT003_GT02', 'The Cambridge Official Guide to IELTS', 2019),
('OT003_GT03', 'Cambridge Practice Test for IELTS', 2018),
('OT004_GT01', 'How to crack the IELTS Speaking Test', 2020),
('OT004_GT02', 'Cambridge Practice Test Plus', 2017),
('OT005_GT01', 'Developing Skills for the TOEIC Test', 2015),
('OT005_GT02', 'TOEIC PDF Economy TOEIC 1000', 2018),
('OT006_GT01', 'Big Step Toeic', 2019),
('OT006_GT02', 'Pronunciation in American English', 2019),
('OT007_GT01', 'TOEIC Analyst', 2016),
('OT007_GT02', 'Economy Toeic 1000 volume', 2019),
('TN001_GT01', 'Solution', 2019),
('TN001_GT02', 'Tài liệu độc quyền', 2021),
('TNH001_GT01', 'My Little Island', 2018),
('TNH001_GT02', 'Family and Friends', 2020),
('TNH002_GT01', 'Amazing Science', 2019),
('TNH002_GT02', 'Family and Friends', 2020);


INSERT INTO `hocvien` (`MaHV`, `Ho`, `Tendem`, `Ten`, `Gioitinh`, `Email`, `Namsinh`, `Sonha`, `Duong`, `Quanhuyen`, `Tinhtp`, `Sodienthoai`) VALUES
('1021000', 'Lê', 'Văn', 'Nam', 'male', 'loc_le@gmail.com', 2000, '70', 'Trống Đồng', 'Quận 10', 'TPHCM', NULL),
('1021010', 'Hà', 'Văn', 'Nam', 'male', 'loc_le11@gmail.com', 2010, '70', 'Lý thường kiệt', 'Quận 10', 'TPHCM', NULL),
('1254741', 'Lê', 'Trần Hoàng', 'Khang', 'male', 'khang.le2k8@gmail.com', 2008, '34B', 'Lý Thường Kiệt', 'Quận 10', 'TPHCM', NULL),
('1311004', 'Trần', 'Hoàng', 'Dương', 'male', 'duongtran@gmail.com', 2011, '150', 'Âu Cơ', 'Quận 11', 'HCM', NULL),
('1312451', 'Hồ', 'Thanh', 'Hiền', 'female', 'hienthanh@gmail.com', 2010, '361', 'Lý Thường Kiệt', 'Quận 10', 'HCM', NULL),
('1412667', 'Đinh', 'Gia', 'Bảo', 'male', 'giabao2k7@gmail.com', 2007, '321', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM', NULL),
('1514001', 'Tiêu', 'Phi', 'Hoàng', 'male', 'hoang.tieu_phi@gmail.com', 2013, '20', 'Lạc Long Quân', 'Quận 11', 'HCM', NULL),
('1514002', 'Tiêu', 'Phi', 'Hùng', 'male', 'hung.tieu_phi@gmail.com', 2013, '20', 'Lạc Long Quân', 'Quận 11', 'HCM', NULL),
('1514226', 'Đỗ', 'Gia', 'Minh', 'male', 'minh.do0201@hcmut.edu.vn', 1996, '42/8B', 'ấp Mới 2 xã Trung Chánh', 'Huyện Hóc Môn', 'HCM', NULL),
('1611000', 'Vương', 'Phương', 'Linh', 'female', 'linh.vuong_1212@hcmut.edu.vn', 1998, '65', 'Trường Chinh', 'Quận 10', 'HCM', NULL),
('1611204', 'Đinh', 'Gia', 'Bảo', 'male', 'bao.dinh_1900@hcmut.edu.vn', 1995, '180', 'Lý Thường Kiệt', 'Quận 10', 'HCM', NULL),
('1611314', 'Hồ', 'Nguyễn Ngọc', 'Ánh', 'male', 'anh.nguyen_baby@hcmut.edu.vn', 1998, '111', 'Thanh Xuân', 'Quận Thanh Xuân', 'Hà Nội', NULL),
('1612224', 'Trần', 'Phương', 'Thảo', 'female', 'thaophuong@gmail.com', 1995, '149', 'Nguyễn Thái Học', 'Quận Ba Đình', 'Hà Nội', NULL),
('1623445', 'Vũ', 'Lê Hoàng', 'Tuấn', 'male', 'tuan.vu_le12@hcmut.edu.vn', 1998, '32', 'Âu Cơ', 'Quận 11', 'HCM', NULL),
('1623558', 'Lý', 'Thanh', 'Thanh', 'female', 'thanh.ly_thanh@hcmut.edu.vn', 1998, '52', 'Phạm Văn Đồng', 'Quận 9', 'HCM', NULL),
('1710512', 'Võ', 'Đình', 'Tùng', 'male', 'tung.vo_dinh@hcmut.edu.vn', 1999, '66', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM', NULL),
('1711314', 'Trần', 'Lê', 'Trinh', 'female', 'trinh.tran_1912@hcmut.edu.vn', 1998, '12/4A', 'ấp Mới 2 xã Trung Chánh', 'Huyện Hóc Môn', 'HCM', NULL),
('1712005', 'Trần', 'Thị', 'My', 'female', 'my.tran_mymy@hcmut.edu.vn', 1999, '12/10S', 'ấp Chánh 1 xã Tân Xuân', 'Huyện Hóc Môn', 'HCM', NULL),
('1810227', 'Ngô', 'Văn', 'Linh', 'male', 'linh.ngo203@hcmut.edu.vn', 2004, '32', 'Nguyễn Thái Học', 'Quận Ba Đình', 'Hà Nội', NULL),
('1810333', 'Hoàng', 'Văn Thanh', 'Hùng', 'male', 'hung.hoang@hcmut.edu.vn', 2002, '101', 'Âu Cơ', 'Quận 11', 'HCM', NULL),
('1811314', 'Ngô', 'Nguyễn Hoàng', 'Khanh', 'female', 'Khanh.ngonguyen@hcmut.edu.vn', 2002, '152', 'Phạm Văn Đồng', 'Quận Thủ Đức', 'HCM', NULL),
('1820566', 'Nguyễn', 'Lê Xuân', 'Yến', 'female', 'yen.lebaby@gmail.com', 2008, '25/6B', 'ấp Mới 2 xã Trung Chánh', 'Huyện Hóc Môn', 'HCM', NULL),
('1845621', 'Hồ', 'Đình', 'Trình', 'male', 'trinh.ho_22@hcmut.edu.vn', 1998, '152', 'Lý Thường Kiệt', 'Quận 10', 'HCM', NULL),
('1910448', 'Lê', 'Bình', 'An', 'male', 'an.le2k4@gmail.com', 2004, '20A', 'đường M', 'Quận Thủ Đức', 'HCM', NULL),
('1910666', 'Trần', 'Trung', 'Tuấn', 'male', 'tuan.traniubo@hcmut.edu.vn', 2001, '287', 'Ô Chợ Dừa', 'Quận Hai Bà Trưng', 'Hà Nội', NULL),
('1911314', 'Lê', 'Hoàng', 'Linh', 'male', 'linh.nguyen0201@hcmut.edu.vn', 2001, '50', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM', NULL),
('1911704', 'Nguyễn', 'Thủy', 'Ngọc', 'female', 'ngoc.nguyen1711@hcmut.edu.vn', 2001, '127', 'Lạc Long Quân', 'Quận 11', 'HCM', NULL),
('1911837', 'Chung', 'Đông', 'Phong', 'male', 'phong.chungdopo@hcmut.edu.vn', 2001, '187', 'Phạm Văn Đồng', 'Quận 9', 'HCM', NULL),
('1911900', 'Đinh', 'Gia', 'Quang', 'male', 'quang.dinhleaktb@hcmut.edu.vn', 2000, '52A', 'Phạm Văn Đồng', 'Quận Thủ Đức', 'HCM', NULL),
('1912123', 'Lê', 'Trần Hoàng', 'Thịnh', 'male', 'thinh.lebkuhcm@hcmut.edu.vn', 2001, '34B', 'Lý Thường Kiệt', 'Quận 10', 'HCM', NULL),
('1912140', 'Lê', 'Nguyễn Bảo', 'Linh', 'female', 'linh.le_nguyen@hcmut.edu.vn', 2001, '12', 'Thanh Xuân', 'Quận Thanh Xuân', 'Hà Nội', NULL),
('1912190', 'Nguyễn', 'Mai', 'Thy', 'female', 'thy.nguyen_cloudy@hcmut.edu.vn', 2001, '24/5R', 'ấp Mới 1 xã Tân Xuân', 'Huyện Hóc Môn', 'HCM', NULL),
('1912322', 'Hà', 'Minh', 'Mẫn', 'male', 'man.hahaha@gmail.com', 2012, '156', 'Nguyễn Thị Minh Khai', 'Quận 10', 'HCM', NULL),
('1915888', 'Tiêu', 'Thanh Ngọc', 'Lệ', 'female', 'le.tieu_thanh@hcmut.edu.vn', 2001, '63', 'Lạc Long Quân', 'Quận 11', 'HCM', NULL),
('2011314', 'Lê', 'Nguyễn Hoàng', 'Minh', 'male', 'minh.nguyen0201@hcmut.edu.vn', 2002, '152', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM', NULL),
('2012222', 'Hoàng', 'Văn', 'Tình', 'male', 'tinh.hoang1208@hcmut.edu.vn', 2002, '125', 'Lý Thường Kiệt', 'Quận 10', 'HCM', NULL),
('2013666', 'Lê', 'Nguyễn Bảo', 'Ngọc', 'female', 'ngoc.le_nguyen@hcmut.edu.vn', 2003, '12', 'Tô Ngọc Vân', 'Quận Thủ Đức', 'HCM', NULL),
('2016555', 'Hoàng', 'Thị Lệ', 'Trân', 'female', 'tran.hoang@hcmut.edu.vn', 2000, '201', 'Cộng Hòa', 'Quận 10', 'HCM', NULL),
('2111314', 'Huỳnh', 'Nguyễn Hoàng', 'Hinh', 'male', 'hinh.huynh1214@hcmut.edu.vn', 1999, '36', 'Nguyễn Thái Học', 'Quận Ba Đình', 'Hà Nội', NULL);


INSERT INTO `khoahoc` (`MaKH`, `Ten`, `Hocphi`, `Noidung`, `Thoiluong`, `Trangthai`, `Gioihansiso`, `Yeucautrinhdo`) VALUES
('KN001', 'Anh Ngữ Ứng Dụng English Hub', 10000000, 'Giá trị cốt lõi của English Hub là giáo trình cân bằng 4 kỹ năng Anh ngữ với kết quả học tập rõ ràng thông qua các bài học chủ đề thú vị và ngôn ngữ được trình bày bằng video đậm chất \"giải trí\".', 12, 'opening', 30, 0.0),
('KN002', 'Tiếng Anh Kinh Doanh', 7000000, 'Thiết kế phù hợp với yêu cầu của lĩnh vực kinh doanh để người học giao tiếp Anh ngữ thật tự tin và chuyên nghiệp, hỗ trợ tốt nhất cho công việc.', 10, 'opening', 20, 0.0),
('KN003', 'Anh Ngữ Giao Tiếp iTALK', 8000000, 'Mọi hoạt động trong từng buổi học thúc đẩy học viên luyện kỹ năng giao tiếp tự tin và hiệu quả ngay tại lớp\r\n\r\n', 10, 'opening', 20, 0.0),
('KN004', 'Anh Ngữ Cấp Tốc Cho Người \"Mất Gốc\"', 5000000, 'Xây dựng nền tảng tiếng Anh, cải thiện 4 kỹ năng từ cơ bản đến nâng cao trong thời gian ngắn với hiệu quả tối ưu.', 6, 'opening', 10, 0.0),
('OT001', 'Ôn Thi IELTS 6.0', 9000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 12, 'opening', 25, 5.0),
('OT002', 'Ôn Thi IELTS 6.5', 10000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 15, 'closed', 25, 5.0),
('OT003', 'Ôn Thi IELTS 7.0', 10000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 12, 'opening', 25, 6.0),
('OT004', 'Ôn Thi IELTS 8.0', 15000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 18, 'closed', 25, 7.0),
('OT005', 'Ôn Thi TOEIC 600', 7000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 12, 'opening', 20, 4.0),
('OT006', 'Ôn Thi TOEIC 700', 7500000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 12, 'opening', 20, 5.0),
('OT007', 'Ôn Thi TOEIC 800', 9000000, 'Đề thi thử miễn phí, đội ngũ giảng viên chuyên môn cao và tận tình mang lại hiệu quả tốt nhất cho học viên.', 15, 'closed', 15, 7.0),
('TN001', 'Anh Ngữ Thiếu Niên YOUNG LEADER', 12000000, 'Chương trình cho thiếu niên từ 11 đến 15 tuổi nhằm giúp học viên giao tiếp tiếng anh lưu loát, rèn luyện kỹ năng học tập, tự tin theo học chương trình tiếng anh ở bậc phổ thông cơ sở và đạt điểm cao trong các kỳ thi quốc tế.', 15, 'closed', 20, 0.0),
('TNH001', 'Anh Ngữ Mẫu Giáo SMARTKID', 10000000, 'Chương trình cho trẻ từ 4 đến 6 tuổi giúp tạo nền tảng anh ngữ vững chắc cho bé.', 18, 'opening', 25, 0.0),
('TNH002', 'Anh Ngữ Thiếu Nhi SUPERKID', 10000000, 'Hình thành và phát triển ngôn ngữ như bản năng kết hợp với bồi dưỡng cho chương trình tiếng anh trên lớp.', 15, 'opening', 20, 0.0),
('TNH003', 'Tiếng Anh Hè', 5000000, 'Với phương pháp học thông qua khám phá, cùng với sự hỗ trợ của công nghệ hiện đại, nội dung học đầy màu sắc và hoạt động thực hành đầy hứng khởi, con hiểu thêm về bản thân và mở khóa những vượt trội bên trong con.', 9, 'opening', 30, 0.0);

INSERT INTO `khoakynang` (`Phanloai`, `MaKH`) VALUES
('Tiếng Anh Giao Tiếp', 'KN001'),
('Tiếng Anh Doanh Nghiệp', 'KN002'),
('Tiếng Anh Giao Tiếp', 'KN003'),
('Tiếng Anh Cơ Bản', 'KN004');

INSERT INTO `khoaonthi` (`Muctieu`, `Loaichungchi`, `MaKH`) VALUES
('6.0', 'IELTS', 'OT001'),
('6.5', 'IELTS', 'OT002'),
('7.0', 'IELTS', 'OT003'),
('8.0', 'IELTS', 'OT004'),
('600', 'TOEIC', 'OT005'),
('700', 'TOEIC', 'OT006'),
('800', 'TOEIC', 'OT007');

INSERT INTO `khoathieunhi` (`MaKH`) VALUES
('TNH001'),
('TNH002'),
('TNH003');

INSERT INTO `khoathieunien` (`MaKH`) VALUES
('TN001');

INSERT INTO `kynangsong_ktnien` (`Kynangsong`, `MaKH`) VALUES
('MC tập sự', 'TN001'),
('Tìm hiểu pháp luật', 'TN001');

INSERT INTO `kynang_kkn` (`Kynang`, `MaKH`) VALUES
('Nghe', 'KN001'),
('Nghe', 'KN002'),
('Nghe', 'KN003'),
('Nghe', 'KN004'),
('Nói', 'KN001'),
('Nói', 'KN002'),
('Nói', 'KN003'),
('Nói', 'KN004'),
('Viết', 'KN001'),
('Viết', 'KN004'),
('Đọc', 'KN001'),
('Đọc', 'KN004');

INSERT INTO `lophoc` (`MaLH`, `Ngaybatdau`, `Ngayketthuc`, `Siso`, `MaCN`, `MaKH`) VALUES
('KN001_L01', '2021-09-27 15:00:00', '2021-12-19 15:00:00', 7, 'HN001', 'KN001'),
('KN001_L02', '2020-09-27 15:00:00', '2020-12-19 15:00:00', 5, 'BD001', 'KN001'),
('KN002_L05', '2021-11-08 15:00:00', '2022-01-17 15:00:00', 1, 'HCM015', 'KN002'),
('KN003_L03', '2021-09-27 15:00:00', '2021-12-05 15:00:00', 5, 'HCM015', 'KN003'),
('KN004_L01', '2020-11-01 15:00:00', '2020-12-12 15:00:00', 9, 'HCM010', 'KN004'),
('OT001_L01', '2021-09-27 15:00:00', '2021-12-19 15:00:00', 7, 'HCM009', 'OT001'),
('OT001_L02', '2021-09-27 15:00:00', '2021-12-19 15:00:00', 9, 'HCM009', 'OT001'),
('OT002_L01', '2020-09-13 15:00:00', '2020-12-26 15:00:00', 5, 'BD001', 'OT002'),
('OT002_L02', '2020-09-13 15:00:00', '2020-12-26 15:00:00', 5, 'BD001', 'OT002'),
('OT003_L01', '2021-11-08 15:00:00', '2022-01-30 15:00:00', 2, 'HCM009', 'OT003'),
('OT003_L02', '2021-11-08 15:00:00', '2022-01-30 15:00:00', 5, 'HCM009', 'OT003'),
('OT003_L03', '2021-11-08 15:00:00', '2022-01-30 15:00:00', 0, 'HCM009', 'OT003'),
('OT004_L05', '2021-11-08 15:00:00', '2022-03-14 15:00:00', 0, 'HCM009', 'OT004'),
('TN001_L05', '2021-11-08 15:00:00', '2022-02-21 15:00:00', 0, 'HCM014', 'TN001'),
('TNH001_L01', '2021-08-23 15:00:00', '2021-12-26 15:00:00', 10, 'HCM014', 'TNH001'),
('TNH001_L02', '2020-08-23 15:00:00', '2020-12-26 15:00:00', 5, 'BD001', 'TNH001'),
('TNH002_L05', '2021-11-08 15:00:00', '2022-02-21 15:00:00', 0, 'HN002', 'TNH002');

INSERT INTO `ngoaikhoa_ktnhi` (`Ngoaikhoa`, `MaKH`) VALUES
('Bé làm ngôi sao', 'TNH002'),
('Bé vào bếp', 'TNH001'),
('Ngày hội trồng cây', 'TNH002'),
('Tham quan bảo tàng', 'TNH002'),
('Tham quan thảo cầm viên', 'TNH001'),
('Thi tài hội họa', 'TNH003'),
('Thử tài làm gốm', 'TNH003'),
('Đêm trại gắn kết', 'TNH003');

INSERT INTO `nhanvien` (`MaNV`, `Ho`, `Tendem`, `Ten`, `Namsinh`, `Gioitinh`, `Email`, `Sodienthoai`) VALUES
('GV001', 'Nguyễn', 'Huyền', 'Trang', 1992, 'female', 'trang.nguyen_huyen@gmail.com', 945112451),
('GV002', 'Lê', 'Thanh', 'Vân', 1993, 'female', 'van.le_thanh@gmail.com', 984123546),
('GV003', 'Nguyễn', 'Ngọc Bảo', 'Duy', 1989, 'male', 'duy.nguyennb@gmail.com', 935142178),
('GV004', 'Mai', 'Hoàng', 'Trâm', 1988, 'female', 'tram_bao@gmail.com', 954152588),
('GV005', 'Hồ', 'Trần Ngọc', 'Nguyên', 1989, 'male', 'nguyen_ho.ngoc@gmail.com', 984213157),
('QL001', 'Nguyễn', 'Thành', 'Nhân', 1979, 'male', 'nhannguyen_thanh@gmail.com', NULL),
('QL002', 'Nguyễn', 'Thanh', 'Tùng', 1985, 'male', 'tung_nguyen_thanh@gmail.com', NULL),
('QL003', 'Trần', 'Thanh', 'Tâm', 1988, 'female', 'tam_thanhtran@gmail.com', NULL),
('TG001', 'Bùi', 'Công Anh', 'Tùng', 1997, 'male', 'tung_bui@gmail.com', 954215132),
('TG002', 'Huỳnh', 'Tường', 'Vy', 1996, 'female', 'vy_huynhhuynh@gmail.com', 378454652),
('TG003', 'Nguyễn', 'Trần Hoàng', 'Huy', 1998, 'male', 'huy_hoang@gmail.com', 964512157),
('TG004', 'Văn', 'Hồ Thu', 'Nguyệt', 2001, 'female', 'vanhotn@gmail.com', 985264631);

INSERT INTO `phuhuynh` (`TenPH`, `Namsinh`, `Gioitinh`, `Email`, `Quanhe`, `MaHV`, `Sodienthoai`) VALUES
('Hà Ngọc Nguyệt', 1980, 'female', 'nguyetha@gmail.com', 'Mẹ', '1312451', 372418357),
('Hà Đức Chinh', 1983, 'male', 'chinhha@gmail.com', 'Cha', '1912322', 984513147),
('Lê Hoàng Dương', 1959, 'male', 'duong_le@gmail.com', 'Cha', '1254741', 903567541),
('Lê Hoàng Dương', 1959, 'male', 'duong_le@gmail.com', 'Cha', '1912123', 903567541),
('Lê Thanh Trúc', 1970, 'female', 'truc_thanhle@gmail.com', 'Mẹ', '1820566', 965412011),
('Lê Văn Việt', 1969, 'male', 'viet_le@gmail.com', 'Cha', '1910448', 902031154),
('Ngô Quang Khải', 1979, 'male', 'khai_ngoquang@gmail.com', 'Chú', '1810227', 372564123),
('Nguyễn Thanh Ngọc', 1989, 'female', 'ngoc_thanhthanh@gmail.com', 'Cô', '2012222', 965471452),
('Nguyễn Thanh Sơn', 1965, 'male', 'thanhsonnguyen@gmail.com', 'Cậu', '1911704', 965412457),
('Đinh Gia Quang', 1990, 'male', 'quang_dinh@gmail.com', 'Chú', '1412667', 905241245);

INSERT INTO `quanlygiaoduc` (`MaNV`) VALUES
('QL001'),
('QL002'),
('QL003');

INSERT INTO `sudung` (`MaGT`, `MaKH`) VALUES
('KN001_GT01', 'KN001'),
('KN002_GT01', 'KN002'),
('KN003_GT01', 'KN003'),
('KN004_GT01', 'KN004'),
('OT001_GT01', 'OT001'),
('OT001_GT02', 'OT001'),
('OT002_GT01', 'OT002'),
('OT002_GT02', 'OT002'),
('OT002_GT03', 'OT002'),
('OT003_GT01', 'OT003'),
('OT003_GT02', 'OT003'),
('OT003_GT03', 'OT003'),
('OT004_GT01', 'OT004'),
('OT004_GT02', 'OT004'),
('OT005_GT01', 'OT005'),
('OT005_GT02', 'OT005'),
('OT006_GT01', 'OT006'),
('OT007_GT01', 'OT007'),
('OT007_GT02', 'OT007'),
('TN001_GT01', 'TN001'),
('TN001_GT02', 'TN001'),
('TNH001_GT01', 'TNH001'),
('TNH001_GT02', 'TNH001'),
('TNH002_GT01', 'TNH002'),
('TNH002_GT02', 'TNH002');

INSERT INTO `tacgia_gt` (`Tacgia`, `MaGT`) VALUES
('Cambridge', 'OT001_GT02'),
('Cambridge', 'OT002_GT01'),
('Cambridge', 'OT002_GT02'),
('Cambridge', 'OT003_GT01'),
('Cambridge', 'OT003_GT02'),
('Cambridge', 'OT003_GT03'),
('Cambridge', 'OT004_GT01'),
('Cambridge', 'OT004_GT02'),
('Cambridge', 'OT005_GT01'),
('Cambridge', 'OT005_GT02'),
('Cambridge', 'OT006_GT01'),
('Cambridge', 'OT006_GT02'),
('Cambridge', 'OT007_GT01'),
('Cambridge', 'OT007_GT02'),
('Cambridge', 'TN001_GT01'),
('Cambridge', 'TNH001_GT01'),
('Cambridge', 'TNH001_GT02'),
('Cambridge', 'TNH002_GT01'),
('Cambridge', 'TNH002_GT02'),
('Malcolm Mann', 'OT002_GT03'),
('Nhóm giáo viên T2E', 'KN001_GT01'),
('Nhóm giáo viên T2E', 'KN002_GT01'),
('Nhóm giáo viên T2E', 'KN003_GT01'),
('Nhóm giáo viên T2E', 'KN004_GT01'),
('Nhóm giáo viên T2E', 'TN001_GT02'),
('Raymond Murphy', 'OT001_GT01');

INSERT INTO `thoikhoabieu_lh` (`Ngay`, `Giobatdau`, `Gioketthuc`, `MaLH`) VALUES
('2', 3, 5, 'OT003_L03'),
('2', 7, 9, 'OT003_L01'),
('2', 10, 12, 'OT003_L02'),
('2', 17, 19, 'KN001_L02'),
('2', 17, 19, 'OT001_L01'),
('2', 17, 19, 'OT002_L01'),
('2', 17, 19, 'OT002_L02'),
('2', 17, 19, 'TNH001_L01'),
('2', 17, 19, 'TNH001_L02'),
('3', 3, 5, 'OT004_L05'),
('3', 5, 7, 'KN002_L05'),
('3', 7, 9, 'TNH002_L05'),
('3', 10, 12, 'TN001_L05'),
('3', 17, 19, 'KN001_L01'),
('4', 3, 5, 'OT003_L03'),
('4', 7, 9, 'OT003_L01'),
('4', 10, 12, 'OT003_L02'),
('4', 17, 19, 'KN001_L02'),
('4', 17, 19, 'OT001_L01'),
('4', 17, 19, 'OT002_L01'),
('4', 17, 19, 'OT002_L02'),
('4', 17, 19, 'TNH001_L01'),
('4', 17, 19, 'TNH001_L02'),
('5', 3, 5, 'OT004_L05'),
('5', 5, 7, 'KN002_L05'),
('5', 7, 9, 'TNH002_L05'),
('5', 10, 12, 'TN001_L05'),
('5', 17, 19, 'KN001_L01'),
('6', 3, 5, 'OT003_L03'),
('6', 7, 9, 'OT003_L01'),
('6', 10, 12, 'OT003_L02'),
('6', 17, 19, 'KN001_L02'),
('6', 17, 19, 'OT001_L01'),
('6', 17, 19, 'OT002_L01'),
('6', 17, 19, 'OT002_L02'),
('6', 17, 19, 'TNH001_L01'),
('6', 17, 19, 'TNH001_L02'),
('7', 1, 4, 'KN004_L01'),
('7', 3, 5, 'OT004_L05'),
('7', 5, 7, 'KN002_L05'),
('7', 7, 9, 'TNH002_L05'),
('7', 7, 10, 'KN003_L03'),
('7', 7, 10, 'OT001_L02'),
('7', 10, 12, 'TN001_L05'),
('7', 17, 19, 'KN001_L01'),
('8', 1, 4, 'KN004_L01'),
('8', 7, 10, 'KN003_L03'),
('8', 7, 10, 'OT001_L02');

INSERT INTO `trogiang` (`Kinhnghiem`, `MaNV`) VALUES
(12, 'TG001'),
(10, 'TG002'),
(18, 'TG003'),
(15, 'TG004');

INSERT INTO `uudai_kh` (`Uudai`, `MaKH`) VALUES
('Bộ tài liệu độc quyền', 'KN002'),
('Bộ tài liệu độc quyền', 'KN004'),
('Bộ đề ôn thi độc quyền', 'OT001'),
('Bộ đề ôn thi độc quyền', 'OT002'),
('Bộ đề ôn thi độc quyền', 'OT003'),
('Bộ đề ôn thi độc quyền', 'OT004'),
('Bộ đề ôn thi độc quyền', 'OT005'),
('Bộ đề ôn thi độc quyền', 'OT006'),
('Bộ đề ôn thi độc quyền', 'OT007'),
('Combo phim hoạt hình tiếng anh ', 'TNH001'),
('Combo phim hoạt hình tiếng anh ', 'TNH002'),
('Miễn phí 2 tháng Nextflix', 'KN001'),
('Tặng 2 bộ đồng phục hè', 'TNH003'),
('Tặng 2 vé xem phim CGV', 'TN001'),
('Tặng 2 vé đến khu vui chơi thiếu nhi', 'TNH001'),
('Tặng 2 vé đến khu vui chơi thiếu nhi', 'TNH002'),
('Tặng 2 vé đến khu vui chơi thiếu nhi', 'TNH003'),
('Tặng ly sứ lưu niệm', 'TNH003');

INSERT INTO `giaovien` (`Kinhnghiem`, `MaNV`) VALUES
(7, 'GV001'),
(8, 'GV002'),
(10, 'GV003'),
(6, 'GV004'),
(8, 'GV005');

INSERT INTO `congtac_gv` (`GVmaNV`, `MaCN`) VALUES
('GV001', 'HCM009'),
('GV002', 'HCM010'),
('GV003', 'HCM009'),
('GV004', 'HCM014'),
('GV005', 'HN001');

INSERT INTO `congtac_tg` (`TGmaNV`, `MaCN`) VALUES
('TG001', 'HCM009'),
('TG002', 'HCM010'),
('TG003', 'HCM014'),
('TG004', 'HN001');

INSERT INTO `dangky`(`Ngaydangky`, `MaLH`, `MaHV`) VALUES 
('2021-09-22 00:00:00','TNH001_L01','1911837'),
('2021-09-26 00:00:00','TNH001_L01','1623558'),
('2021-09-22 00:00:00','OT001_L01','1912322'),
('2021-09-28 00:00:00','OT001_L01','1912123'),
('2021-09-28 00:00:00','OT001_L01','1845621'),
('2021-09-24 00:00:00','OT001_L01','1611204'),
('2021-09-23 00:00:00','OT001_L01','1611000'),
('2021-09-24 00:00:00','OT001_L01','1312451'),
('2021-09-28 00:00:00','OT001_L01','1254741'),
('2021-09-26 00:00:00','OT001_L02','1021000'),
('2021-09-29 00:00:00','OT001_L02','2012222'),
('2021-09-27 00:00:00','OT001_L02','1915888'),
('2021-09-25 00:00:00','OT001_L02','1911704'),
('2021-09-24 00:00:00','OT001_L02','1810333'),
('2021-09-25 00:00:00','OT001_L02','1623445'),
('2021-09-22 00:00:00','OT001_L02','1514002'),
('2021-09-26 00:00:00','OT001_L02','1514001'),
('2021-09-25 00:00:00','OT001_L02','1311004'),
('2021-09-28 00:00:00','KN001_L01','2111314'),
('2021-09-29 00:00:00','KN001_L01','1810227'),
('2021-09-30 00:00:00','KN001_L01','1612224'),
('2021-09-29 00:00:00','KN001_L01','1910666'),
('2021-09-30 00:00:00','KN003_L03','1912190'),
('2021-09-26 00:00:00','KN003_L03','1820566'),
('2021-09-27 00:00:00','KN003_L03','1712005'),
('2021-09-20 00:00:00','KN003_L03','1711314'),
('2021-09-24 00:00:00','KN003_L03','1514226'),
('2021-09-29 00:00:00','KN001_L01','2016555'),
('2021-09-30 00:00:00','KN001_L01','1912140'),
('2021-09-22 00:00:00','KN001_L01','1611314'),
('2021-09-29 00:00:00','TNH001_L01','2013666'),
('2021-09-26 00:00:00','TNH001_L01','2011314'),
('2021-09-20 00:00:00','TNH001_L01','1911900'),
('2021-09-20 00:00:00','TNH001_L01','1911314'),
('2021-09-29 00:00:00','TNH001_L01','1910448'),
('2021-09-21 00:00:00','TNH001_L01','1811314'),
('2021-09-21 00:00:00','TNH001_L01','1710512'),
('2021-09-21 00:00:00','TNH001_L01','1412667');

INSERT INTO `danhgia_kh` (`Ten`, `Noidung`, `MaKH`) VALUES
('Hoàng Văn Phi', 'Khóa học này giúp cho con tôi có điểm số tốt hơn trên trường và tự tin hơn trong cuộc sống.', 'TN001'),
('Lê Thanh Trúc', 'Ôn thi ở đây rất vui vì các thầy cô tạo được tinh thần thoải mái, kiên nhẫn giảng dạy những điểm tôi không hiểu. Tôi đã đạt kết quả cao hơn mong đợi.', 'OT001'),
('Lê Trần Hoàng Thịnh', 'Sau khi học khóa học này, em thấy kỹ năng thuyết trình và nói trước đám đông khi dùng ngoại ngữ của mình được cải thiện nhiều. Các bạn hòa đồng và thầy cô cũng thân thiện.', 'KN003'),
('Lê Văn Đông', 'Khóa học giúp tôi tự tin hơn trong giao tiếp hằng ngày, giúp tôi tiếp xúc với người nước ngoài không còn bị ấp úng.', 'KN001'),
('Ngô Anh Đức', 'Các thầy cô chỉ dạy rất kỹ, chương trình sát với đề thi thật nên ôn tập đạt hiệu quả cao.', 'OT006'),
('Ngô Hoàng Giang', 'Ôn thi ở đây rất hiệu quả, tôi đã đạt được mục tiêu mình đề ra trong thời gian ngắn, đã có đủ điều kiện anh văn để tốt nghiệp.', 'OT005'),
('Ngô Thanh Vân', 'Khóa học này giúp con tôi có một mùa hè vui vẻ và bổ ích, tránh được việc bé lướt web quá nhiều và giúp bé cải thiện khả năng giao tiếp bằng tiếng anh.', 'TNH003'),
('Nguyễn Bảo Ninh', 'Tôi đã cho con học khóa học này và cảm thấy rất đúng đắn, con tôi đã có một mùa hè bổ ích.', 'TNH003'),
('Nguyễn Phi Hùng', 'Khóa học giúp em lấy lại căn bản môn tiếng anh, các thầy cô rất tận tình và giảng bài cũng dễ hiểu.', 'KN004'),
('Nguyễn Thanh Huyền', 'Con tôi rất thích học khóa này, các thầy cô tận tình và dạy dễ hiểu nên bé tiếp thu nhanh.', 'TNH002'),
('Đinh Gia Quang', 'Ban đầu em gặp khó khăn trong việc nghe nói tiếng anh, nhờ có khóa học này mà em đã tự tin hơn nhiều', 'KN004');

INSERT INTO `dieuchinh_kh` (`MaKH`, `QLGDmaNV`) VALUES
('KN001', 'QL001'),
('KN002', 'QL001'),
('KN003', 'QL001'),
('KN004', 'QL001'),
('OT001', 'QL002'),
('OT002', 'QL002'),
('OT003', 'QL002'),
('OT004', 'QL002'),
('OT005', 'QL002'),
('OT006', 'QL002'),
('OT007', 'QL002'),
('TN001', 'QL003'),
('TNH001', 'QL003'),
('TNH002', 'QL003'),
('TNH003', 'QL003');

INSERT INTO `dieuchinh_lh` (`MaLH`, `QLGDmaNV`) VALUES
('KN001_L01', 'QL001'),
('KN001_L02', 'QL001'),
('KN003_L03', 'QL001'),
('KN004_L01', 'QL001'),
('OT001_L01', 'QL002'),
('OT001_L02', 'QL002'),
('OT002_L01', 'QL002'),
('OT002_L02', 'QL002'),
('TNH001_L01', 'QL003'),
('TNH001_L02', 'QL003');

INSERT INTO `doituong_kh` (`Doituong`, `MaKH`) VALUES
('Doanh nhân', 'KN002'),
('Học sinh muốn trau dồi anh văn', 'TN001'),
('Người có nhu cầu ôn thi IELTS', 'OT001'),
('Người có nhu cầu ôn thi IELTS', 'OT002'),
('Người có nhu cầu ôn thi IELTS', 'OT003'),
('Người có nhu cầu ôn thi IELTS', 'OT004'),
('Người có nhu cầu ôn thi TOEIC', 'OT005'),
('Người có nhu cầu ôn thi TOEIC', 'OT006'),
('Người có nhu cầu ôn thi TOEIC', 'OT007'),
('Người mất căn bản tiếng anh', 'KN004'),
('Người muốn trau dồi tiếng anh', 'KN001'),
('Người thụ động', 'KN003'),
('Người yếu nghe nói', 'KN003'),
('Nhân viên văn phòng', 'KN002'),
('Thiếu niên khoảng 11 - 15 tuổi', 'TN001'),
('Trẻ cần làm quen với tiếng anh', 'TNH001'),
('Trẻ mẫu giáo', 'TNH001'),
('Trẻ thích hoạt động ngoại khóa', 'TNH002'),
('Trẻ thích hoạt động ngoại khóa', 'TNH003'),
('Trẻ trong độ tuổi tiểu học', 'TNH002');

INSERT INTO `giangday` (`MaLH`, `maNV`) VALUES
('KN001_L01', 'GV001'),
('KN001_L02', 'GV001'),
('KN003_L03', 'GV002'),
('KN004_L01', 'GV002'),
('OT001_L01', 'GV003'),
('OT001_L02', 'GV003'),
('OT002_L01', 'GV004'),
('OT002_L02', 'GV004'),
('TNH001_L01', 'GV005'),
('TNH001_L02', 'GV005');

INSERT INTO `hotro` (`MaLH`, `maNV`) VALUES
('KN001_L01', 'TG001'),
('KN003_L03', 'TG002'),
('OT001_L01', 'TG003'),
('OT001_L02', 'TG003'),
('TNH001_L01', 'TG004');

INSERT INTO `trinhdo_gv` (`trinhdo`, `GVmaNV`) VALUES
('Cử nhân Kinh doanh Quốc tế', 'GV002'),
('Cử nhân ngôn ngữ anh', 'GV003'),
('Cử nhân sư phạm anh', 'GV004'),
('Thạc sĩ Ngôn ngữ học', 'GV001'),
('Thạc sĩ Ngôn ngữ học', 'GV002'),
('Thạc sĩ Ngôn ngữ học', 'GV005');


