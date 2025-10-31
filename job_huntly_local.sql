-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: mysql
-- Thời gian đã tạo: Th10 31, 2025 lúc 10:40 AM
-- Phiên bản máy phục vụ: 9.2.0
-- Phiên bản PHP: 8.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `job_huntly_local`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `applications`
--

CREATE TABLE `applications` (
  `user_id` int NOT NULL,
  `job_id` int NOT NULL,
  `cv` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `attempt_count` int NOT NULL DEFAULT '1',
  `last_user_action_at` datetime DEFAULT NULL,
  `phone_number` varchar(200) DEFAULT NULL,
  `candidate_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `applications`
--

INSERT INTO `applications` (`user_id`, `job_id`, `cv`, `email`, `status`, `attempt_count`, `last_user_action_at`, `phone_number`, `candidate_name`) VALUES
(2, 1, 'cv_candidate1_java.pdf', 'candidate1@gmail.com', 'PENDING', 1, '2025-10-29 13:38:26', '0912345678', 'Nguyễn Văn A'),
(2, 4, 'cv_candidate1_frontend.pdf', 'candidate1@gmail.com', 'REVIEWING', 1, '2025-10-29 13:38:26', '0912345678', 'Nguyễn Văn A'),
(3, 2, 'cv_candidate2_marketing.pdf', 'candidate2@gmail.com', 'SHORTLISTED', 2, '2025-10-29 13:38:26', '0923456789', 'Trần Thị B'),
(3, 3, 'cv_candidate2_accounting.pdf', 'candidate2@gmail.com', 'PENDING', 1, '2025-10-29 13:38:26', '0923456789', 'Trần Thị B'),
(6, 1, 'cv_candidate3_java.pdf', 'candidate3@gmail.com', 'REJECTED', 1, '2025-10-24 13:38:26', '0956789012', 'Ngô Văn E'),
(6, 7, 'cv_candidate3_teacher.pdf', 'candidate3@gmail.com', 'INTERVIEWING', 1, '2025-10-29 13:38:26', '0956789012', 'Ngô Văn E'),
(7, 5, 'cv_candidate4_sales.pdf', 'candidate4@gmail.com', 'PENDING', 1, '2025-10-29 13:38:26', '0967890123', 'Đặng Thị F'),
(7, 9, 'cv_candidate4_design.pdf', 'candidate4@gmail.com', 'REVIEWING', 1, '2025-10-29 13:38:26', '0967890123', 'Đặng Thị F'),
(10, 6, 'cv_candidate5_logistics.pdf', 'candidate5@gmail.com', 'SHORTLISTED', 2, '2025-10-29 13:38:26', '0990123456', 'Phan Văn I'),
(10, 10, 'cv_candidate5_engineer.pdf', 'candidate5@gmail.com', 'PENDING', 1, '2025-10-29 13:38:26', '0990123456', 'Phan Văn I');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `awards`
--

CREATE TABLE `awards` (
  `award_id` int NOT NULL,
  `name` varchar(200) DEFAULT NULL,
  `issuer` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `profile_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `awards`
--

INSERT INTO `awards` (`award_id`, `name`, `issuer`, `date`, `description`, `profile_id`) VALUES
(1, 'Best Developer of the Quarter', 'TechViet Solutions', '2022-03-31', 'Lập trình viên xuất sắc nhất quý 1/2022', 1),
(2, 'Marketing Campaign Excellence', 'ABC Marketing', '2022-12-20', 'Chiến dịch marketing xuất sắc năm 2022', 2),
(3, 'Outstanding Teacher Award', 'English Center Plus', '2021-12-15', 'Giáo viên xuất sắc năm 2021', 3),
(4, 'Creative Design Award', 'Creative Studio', '2023-06-10', 'Thiết kế sáng tạo nhất năm 2023', 4),
(5, 'Production Excellence Award', 'Samsung Vietnam', '2019-11-30', 'Xuất sắc trong quản lý sản xuất', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `candidate_profile`
--

CREATE TABLE `candidate_profile` (
  `user_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `gender` enum('Male','Female','Other') DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `about_me` text,
  `personal_link` varchar(200) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `candidate_profile`
--

INSERT INTO `candidate_profile` (`user_id`, `profile_id`, `gender`, `avatar`, `about_me`, `personal_link`, `date_of_birth`, `title`) VALUES
(14, 1, 'Male', '', '', '', '2004-12-05', 'Student'),
(2, 2, 'Male', 'avatar_candidate1.jpg', 'Lập trình viên Java với 3 năm kinh nghiệm, đam mê công nghệ', NULL, '1998-03-15', 'Java Developer'),
(3, 3, 'Female', 'avatar_candidate2.jpg', 'Chuyên viên Marketing với kinh nghiệm Digital Marketing', NULL, '1999-07-20', 'Digital Marketing Specialist'),
(6, 4, 'Male', 'avatar_candidate3.jpg', 'Giáo viên tiếng Anh nhiệt huyết, IELTS 7.5', NULL, '1997-05-10', 'English Teacher'),
(7, 5, 'Female', 'avatar_candidate4.jpg', 'Nhà thiết kế đồ họa sáng tạo, yêu thích thời trang', NULL, '2000-11-25', 'Graphic Designer'),
(10, 6, 'Male', 'avatar_candidate5.jpg', 'Kỹ sư sản xuất với 5 năm kinh nghiệm', NULL, '1995-09-08', 'Production Engineer'),
(12, 7, 'Other', '', '', '', NULL, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `candidate_skill`
--

CREATE TABLE `candidate_skill` (
  `candidate_skill_id` int NOT NULL,
  `skill_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `level_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `candidate_skill`
--

INSERT INTO `candidate_skill` (`candidate_skill_id`, `skill_id`, `profile_id`, `level_id`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 3),
(3, 1, 2, 7),
(4, 3, 2, 6),
(5, 4, 2, 5),
(6, 21, 3, 7),
(7, 8, 3, 6),
(8, 17, 3, 5),
(9, 17, 4, 6),
(10, 18, 4, 4),
(11, 3, 5, 5),
(12, 1, 5, 3),
(13, 6, 5, 2),
(14, 9, 6, 5),
(15, 10, 6, 6),
(16, 8, 6, 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `cate_id` int NOT NULL,
  `cate_name` varchar(200) DEFAULT NULL,
  `parent_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`cate_id`, `cate_name`, `parent_id`) VALUES
(1, 'Công nghệ thông tin', NULL),
(2, 'Kế toán - Kiểm toán', NULL),
(3, 'Nhân sự', NULL),
(4, 'Marketing', NULL),
(5, 'Kinh doanh - Bán hàng', NULL),
(6, 'Giáo dục - Đào tạo', NULL),
(7, 'Logistics - Xuất nhập khẩu', NULL),
(8, 'Thiết kế - Sáng tạo', NULL),
(9, 'Y tế - Chăm sóc sức khỏe', NULL),
(10, 'Sản xuất - Vận hành', NULL),
(11, 'Lập trình phần mềm', 1),
(12, 'Quản trị hệ thống', 1),
(13, 'An ninh mạng', 1),
(14, 'Phân tích dữ liệu', 1),
(15, 'Kế toán tổng hợp', 2),
(16, 'Kế toán thuế', 2),
(17, 'Kiểm toán nội bộ', 2),
(18, 'Tuyển dụng', 3),
(19, 'Đào tạo & Phát triển', 3),
(20, 'Chính sách & Lương thưởng', 3),
(21, 'Digital Marketing', 4),
(22, 'Content Marketing', 4),
(23, 'Nghiên cứu thị trường', 4),
(24, 'Bán hàng trực tiếp', 5),
(25, 'Kinh doanh B2B', 5),
(26, 'Chăm sóc khách hàng', 5),
(27, 'Giảng dạy', 6),
(28, 'Tư vấn giáo dục', 6),
(29, 'Quản lý đào tạo', 6),
(30, 'Quản lý kho', 7),
(31, 'Vận tải quốc tế', 7),
(32, 'Khai báo hải quan', 7),
(33, 'Thiết kế đồ họa', 8),
(34, 'Thiết kế UI/UX', 8),
(35, 'Thiết kế nội thất', 8),
(36, 'Điều dưỡng', 9),
(37, 'Bác sĩ', 9),
(38, 'Dược sĩ', 9),
(39, 'Quản lý sản xuất', 10),
(40, 'Kỹ thuật vận hành máy', 10),
(41, 'Bảo trì thiết bị', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `certificates`
--

CREATE TABLE `certificates` (
  `cer_id` int NOT NULL,
  `cer_name` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `issuer` varchar(200) DEFAULT NULL,
  `profile_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `certificates`
--

INSERT INTO `certificates` (`cer_id`, `cer_name`, `date`, `description`, `issuer`, `profile_id`) VALUES
(1, 'Oracle Certified Java Programmer', '2021-06-15', 'Chứng chỉ lập trình Java chuyên nghiệp', 'Oracle', 1),
(2, 'Google Digital Marketing Certificate', '2022-03-20', 'Chứng chỉ Digital Marketing của Google', 'Google', 2),
(3, 'IELTS Academic 7.5', '2020-11-10', 'Chứng chỉ tiếng Anh IELTS', 'IDP', 3),
(4, 'Adobe Certified Professional', '2023-01-15', 'Chứng chỉ chuyên gia Adobe Photoshop', 'Adobe', 4),
(5, 'Lean Six Sigma Green Belt', '2019-08-20', 'Chứng chỉ quản lý sản xuất tinh gọn', 'ASQ', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `companies`
--

CREATE TABLE `companies` (
  `company_id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_name` varchar(200) NOT NULL,
  `description` text,
  `email` varchar(200) NOT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `location_city` varchar(100) DEFAULT NULL,
  `location_country` varchar(100) DEFAULT NULL,
  `founded_year` year DEFAULT NULL,
  `quantity_employee` int DEFAULT NULL,
  `status` enum('active','inactive','banned') DEFAULT 'inactive',
  `is_pro_company` tinyint(1) DEFAULT '0',
  `followers_count` int DEFAULT '0',
  `jobs_count` int DEFAULT '0',
  `facebook_url` varchar(255) DEFAULT NULL,
  `twitter_url` varchar(255) DEFAULT NULL,
  `linkedin_url` varchar(255) DEFAULT NULL,
  `map_embed_url` text,
  `avatar` varchar(255) DEFAULT NULL,
  `avatar_cover` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `vip_until` datetime DEFAULT NULL,
  `is_vip` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `companies`
--

INSERT INTO `companies` (`company_id`, `user_id`, `company_name`, `description`, `email`, `phone_number`, `website`, `address`, `location_city`, `location_country`, `founded_year`, `quantity_employee`, `status`, `is_pro_company`, `followers_count`, `jobs_count`, `facebook_url`, `twitter_url`, `linkedin_url`, `map_embed_url`, `avatar`, `avatar_cover`, `created_at`, `updated_at`, `vip_until`, `is_vip`) VALUES
(1, 4, 'AI Tech', 'Công ty công nghệ chuyên AI', 'contact@aitech.com', '0123456789', 'https://aitech.com', '12 Lý Thường Kiệt', 'Hồ Chí Minh', 'Phú Hòa Đông', '2018', 80, 'active', 1, 2, 1, 'https://facebook.com/aitech', NULL, 'https://linkedin.com/company/aitech', 'https://www.google.com/maps/embed/v1/place?key=AIzaSyCVgO8KzHQ8iKcfqXgrMnUIGlD-piWiPpo&q=123%20Silicon%20Valley%2C%20California%2C%20USA&zoom=15&language=vi', 'https://mir-s3-cdn-cf.behance.net/user/276/d87edf482640497.5e306b1f7af1c.jpg', 'https://www.shutterstock.com/image-vector/synthwave-vaporwave-retrowave-cyber-background-600nw-1457569313.jpg', '2025-10-28 15:01:54', '2025-10-30 16:20:56', '2026-01-01 14:30:00', 1),
(2, 8, 'ERP Việt Nam', 'Công ty phần mềm ERP', 'info@erpvn.com', '0909888777', 'https://erpvn.com', '45 Nguyễn Huệ', 'Hà Nội', 'Tây Hồ', '2015', 150, 'active', 0, 2, 2, NULL, NULL, NULL, NULL, 'erp_avatar.png', 'erp_cover.png', '2025-10-29 15:01:54', '2025-10-31 08:00:37', NULL, 0),
(3, 9, 'Fashion Hub', 'Công ty thiết kế thời trang', 'contact@fashionhub.com', '0988111222', 'https://fashionhub.com', '89 Hai Bà Trưng', 'Đà Nẵng', 'Hội An', '2020', 60, 'active', 1, 2, 3, NULL, NULL, NULL, NULL, 'fashion_avatar.png', 'fashion_cover.png', '2025-10-30 15:01:54', '2025-10-31 08:00:43', NULL, 0),
(4, 5, 'Global Logistics', 'Công ty logistics quốc tế', 'support@globallogistics.com', '0933444555', 'https://globallogistics.com', '123 Trần Hưng Đạo', 'Hải Phòng', 'Chí Linh', '2010', 300, 'active', 0, 2, 2, NULL, NULL, NULL, NULL, 'log_avatar.png', 'log_cover.png', '2025-10-27 15:01:54', '2025-10-31 08:00:50', NULL, 0),
(5, 15, 'E-Learning VN', 'Công ty giáo dục trực tuyến', 'info@elearning.vn', '0944666777', 'https://elearning.vn', '78 Cách Mạng Tháng 8', 'Cần Thơ', 'Ninh Kiều', '2017', 40, 'active', 0, 2, 2, NULL, NULL, NULL, NULL, 'edu_avatar.png', 'edu_cover.png', '2025-10-31 15:01:54', '2025-10-31 08:00:56', NULL, 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_categories`
--

CREATE TABLE `company_categories` (
  `company_id` int NOT NULL,
  `cate_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `company_categories`
--

INSERT INTO `company_categories` (`company_id`, `cate_id`) VALUES
(1, 11),
(2, 11),
(2, 12),
(1, 13),
(5, 27),
(5, 28),
(4, 30),
(4, 31),
(3, 33),
(3, 35);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `company_subscriptions`
--

CREATE TABLE `company_subscriptions` (
  `subscription_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `package_id` bigint NOT NULL,
  `status` enum('ACTIVE','EXPIRED','CANCELLED') NOT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `latest_payment_id` bigint DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `company_subscriptions`
--

INSERT INTO `company_subscriptions` (`subscription_id`, `company_id`, `package_id`, `status`, `start_at`, `end_at`, `latest_payment_id`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'ACTIVE', '2025-01-01 14:30:00', '2026-01-01 14:30:00', 1, '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(2, 2, 2, 'ACTIVE', '2025-01-05 09:15:00', '2025-04-05 09:15:00', 2, '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(3, 3, 1, 'ACTIVE', '2025-01-10 16:45:00', '2025-02-10 16:45:00', 3, '2025-10-29 13:40:52', '2025-10-29 13:40:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cv_template`
--

CREATE TABLE `cv_template` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `html_url` varchar(500) NOT NULL,
  `preview_image_url` varchar(500) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `cv_template`
--

INSERT INTO `cv_template` (`id`, `name`, `html_url`, `preview_image_url`, `created_at`, `updated_at`) VALUES
(1, 'Modern Professional', 'https://templates.jobhuntly.com/cv/modern-professional.html', 'https://templates.jobhuntly.com/previews/modern-professional.jpg', '2025-10-29 13:40:41', '2025-10-29 13:40:41'),
(2, 'Creative Designer', 'https://templates.jobhuntly.com/cv/creative-designer.html', 'https://templates.jobhuntly.com/previews/creative-designer.jpg', '2025-10-29 13:40:41', '2025-10-29 13:40:41'),
(3, 'Tech Minimalist', 'https://templates.jobhuntly.com/cv/tech-minimalist.html', 'https://templates.jobhuntly.com/previews/tech-minimalist.jpg', '2025-10-29 13:40:41', '2025-10-29 13:40:41'),
(4, 'Executive Classic', 'https://templates.jobhuntly.com/cv/executive-classic.html', 'https://templates.jobhuntly.com/previews/executive-classic.jpg', '2025-10-29 13:40:41', '2025-10-29 13:40:41'),
(5, 'Fresh Graduate', 'https://templates.jobhuntly.com/cv/fresh-graduate.html', 'https://templates.jobhuntly.com/previews/fresh-graduate.jpg', '2025-10-29 13:40:41', '2025-10-29 13:40:41'),
(6, 'Modern Professional', 'https://templates.jobhuntly.com/cv/modern-professional.html', 'https://templates.jobhuntly.com/previews/modern-professional.jpg', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(7, 'Creative Designer', 'https://templates.jobhuntly.com/cv/creative-designer.html', 'https://templates.jobhuntly.com/previews/creative-designer.jpg', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(8, 'Tech Minimalist', 'https://templates.jobhuntly.com/cv/tech-minimalist.html', 'https://templates.jobhuntly.com/previews/tech-minimalist.jpg', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(9, 'Executive Classic', 'https://templates.jobhuntly.com/cv/executive-classic.html', 'https://templates.jobhuntly.com/previews/executive-classic.jpg', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(10, 'Fresh Graduate', 'https://templates.jobhuntly.com/cv/fresh-graduate.html', 'https://templates.jobhuntly.com/previews/fresh-graduate.jpg', '2025-10-29 13:40:52', '2025-10-29 13:40:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `edu`
--

CREATE TABLE `edu` (
  `edu_id` int NOT NULL,
  `school_name` varchar(200) DEFAULT NULL,
  `degree` varchar(200) DEFAULT NULL,
  `duration` varchar(200) DEFAULT NULL,
  `majors` varchar(200) DEFAULT NULL,
  `profile_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `edu`
--

INSERT INTO `edu` (`edu_id`, `school_name`, `degree`, `duration`, `majors`, `profile_id`) VALUES
(1, 'Đại học Bách Khoa Hà Nội', 'Cử nhân', '2016-2020', 'Khoa học máy tính', 1),
(2, 'Đại học Kinh tế TP.HCM', 'Cử nhân', '2017-2021', 'Marketing', 2),
(3, 'Đại học Ngoại ngữ Hà Nội', 'Cử nhân', '2015-2019', 'Sư phạm tiếng Anh', 3),
(4, 'Đại học Mỹ thuật TP.HCM', 'Cử nhân', '2018-2022', 'Thiết kế đồ họa', 4),
(5, 'Đại học Bách Khoa TP.HCM', 'Kỹ sư', '2013-2017', 'Cơ khí', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `follows`
--

CREATE TABLE `follows` (
  `follow_id` int NOT NULL,
  `user_id` int NOT NULL,
  `company_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `follows`
--

INSERT INTO `follows` (`follow_id`, `user_id`, `company_id`, `created_at`) VALUES
(1, 2, 1, '2025-10-29 13:38:10'),
(2, 2, 2, '2025-10-29 13:38:10'),
(3, 3, 1, '2025-10-29 13:38:10'),
(4, 3, 3, '2025-10-29 13:38:10'),
(5, 6, 2, '2025-10-29 13:38:10'),
(6, 6, 5, '2025-10-29 13:38:10'),
(7, 7, 3, '2025-10-29 13:38:10'),
(8, 7, 4, '2025-10-29 13:38:10'),
(9, 10, 4, '2025-10-29 13:38:10'),
(10, 10, 5, '2025-10-29 13:38:10'),
(11, 12, 5, '2025-10-30 07:01:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `interviews`
--

CREATE TABLE `interviews` (
  `interview_id` int NOT NULL,
  `job_id` int NOT NULL,
  `company_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  `scheduled_at` datetime NOT NULL,
  `duration_minutes` int NOT NULL DEFAULT '60',
  `status` enum('PENDING','ACCEPTED','DECLINED','COMPLETED','CANCELLED') DEFAULT 'PENDING',
  `meeting_url` varchar(500) DEFAULT NULL,
  `gcal_event_id` varchar(128) DEFAULT NULL,
  `reminder_sent` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `meeting_room` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `interviews`
--

INSERT INTO `interviews` (`interview_id`, `job_id`, `company_id`, `candidate_id`, `scheduled_at`, `duration_minutes`, `status`, `meeting_url`, `gcal_event_id`, `reminder_sent`, `created_at`, `updated_at`, `meeting_room`) VALUES
(1, 2, 2, 3, '2025-10-30 23:40:52', 60, 'PENDING', 'https://meet.google.com/abc-defg-hij', NULL, 0, '2025-10-29 13:40:52', '2025-10-29 13:40:52', 'Phòng họp A - Tầng 3'),
(2, 1, 1, 2, '2025-11-01 03:40:52', 90, 'ACCEPTED', 'https://zoom.us/j/123456789', NULL, 0, '2025-10-29 13:40:52', '2025-10-29 13:40:52', 'Online - Zoom'),
(3, 7, 5, 6, '2025-11-01 22:40:52', 45, 'PENDING', NULL, NULL, 0, '2025-10-29 13:40:52', '2025-10-29 13:40:52', 'Phòng HR - Tầng 2'),
(4, 5, 3, 7, '2025-11-04 04:40:52', 60, 'PENDING', 'https://teams.microsoft.com/xyz123', NULL, 0, '2025-10-29 13:40:52', '2025-10-29 13:40:52', 'Online - MS Teams');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `jobs`
--

CREATE TABLE `jobs` (
  `job_id` int NOT NULL,
  `company_id` int NOT NULL,
  `title` varchar(200) NOT NULL,
  `date_post` date DEFAULT NULL,
  `description` text,
  `expired_date` date DEFAULT NULL,
  `salary_min` bigint DEFAULT NULL,
  `salary_max` bigint DEFAULT NULL,
  `salary_type` tinyint NOT NULL DEFAULT '0',
  `requirements` text,
  `benefits` text,
  `location` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `jobs`
--

INSERT INTO `jobs` (`job_id`, `company_id`, `title`, `date_post`, `description`, `expired_date`, `salary_min`, `salary_max`, `salary_type`, `requirements`, `benefits`, `location`, `status`) VALUES
(1, 1, 'Lập trình viên Java', '2025-08-01', 'Phát triển phần mềm Java', '2025-11-11', 15000000, 25000000, 0, 'Có kinh nghiệm 2 năm Java', 'Bảo hiểm, thưởng dự án', 'Thành phố Hà Nội', 'inactive'),
(2, 2, 'Chuyên viên Marketing', '2025-08-02', 'Triển khai chiến dịch marketing', '2025-12-19', 12000000, 20000000, 0, 'Hiểu biết về Digital Marketing', 'Lương tháng 13', 'TP.HCM', 'inactive'),
(3, 2, 'Kế toán tổng hợp', '2025-08-03', 'Hạch toán và lập báo cáo tài chính', '2025-11-12', 10000000, 15000000, 0, 'Tốt nghiệp chuyên ngành kế toán', 'Bảo hiểm đầy đủ', 'TP.HCM', 'inactive'),
(4, 3, 'Frontend Developer', '2025-08-04', 'Xây dựng giao diện web', '2025-12-13', 14000000, 22000000, 0, 'Thành thạo ReactJS', 'Làm việc hybrid', 'Đà Nẵng', 'inactive'),
(5, 3, 'Nhân viên kinh doanh thời trang', '2025-08-05', 'Bán hàng và chăm sóc khách', '2026-01-23', 8000000, 15000000, 0, 'Kỹ năng giao tiếp tốt', 'Hoa hồng hấp dẫn', 'Đà Nẵng', 'inactive'),
(6, 4, 'Nhân viên xuất nhập khẩu', '2025-08-06', 'Làm chứng từ hải quan', '2026-01-28', 12000000, 18000000, 0, 'Có kinh nghiệm logistics', 'Bảo hiểm sức khỏe', 'Hải Phòng', 'inactive'),
(7, 5, 'Giáo viên tiếng Anh online', '2025-08-07', 'Dạy tiếng Anh cho học viên trực tuyến', '2025-12-31', 10000000, 16000000, 0, 'IELTS 7.0 trở lên', 'Linh hoạt thời gian', 'TP.HCM', 'inactive'),
(8, 5, 'Điều dưỡng viên', '2025-08-08', 'Chăm sóc bệnh nhân', '2026-01-31', 9000000, 13000000, 0, 'Tốt nghiệp điều dưỡng', 'Phụ cấp ca đêm', 'TP.HCM', 'inactive'),
(9, 3, 'Nhà thiết kế đồ họa', '2025-08-09', 'Thiết kế ấn phẩm truyền thông', '2026-03-31', 11000000, 17000000, 0, 'Thành thạo Photoshop', 'Môi trường sáng tạo', 'Đà Nẵng', 'inactive'),
(10, 4, 'Kỹ sư sản xuất', '2025-08-10', 'Quản lý dây chuyền sản xuất', '2026-02-28', 15000000, 22000000, 0, 'Kinh nghiệm 3 năm sản xuất', 'Thưởng KPI', 'Hải Phòng', 'inactive');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_category`
--

CREATE TABLE `job_category` (
  `job_id` int NOT NULL,
  `cate_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `job_category`
--

INSERT INTO `job_category` (`job_id`, `cate_id`) VALUES
(1, 11),
(4, 11),
(3, 15),
(2, 21),
(5, 24),
(7, 27),
(6, 30),
(6, 32),
(9, 33),
(8, 36),
(10, 39);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_level`
--

CREATE TABLE `job_level` (
  `level_id` int NOT NULL,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `job_level`
--

INSERT INTO `job_level` (`level_id`, `job_id`) VALUES
(5, 1),
(4, 2),
(3, 3),
(5, 4),
(2, 5),
(4, 6),
(5, 7),
(3, 8),
(4, 9),
(8, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_skill`
--

CREATE TABLE `job_skill` (
  `skill_id` int NOT NULL,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `job_work_type`
--

CREATE TABLE `job_work_type` (
  `job_id` int NOT NULL,
  `work_type_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `job_work_type`
--

INSERT INTO `job_work_type` (`job_id`, `work_type_id`) VALUES
(1, 1),
(3, 1),
(5, 1),
(6, 1),
(8, 1),
(10, 1),
(7, 2),
(2, 3),
(4, 3),
(9, 3),
(1, 4),
(2, 4),
(3, 4),
(4, 4),
(5, 4),
(6, 4),
(8, 4),
(9, 4),
(10, 4),
(7, 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `levels`
--

CREATE TABLE `levels` (
  `level_id` int NOT NULL,
  `level_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `levels`
--

INSERT INTO `levels` (`level_id`, `level_name`) VALUES
(1, 'Intern'),
(2, 'Fresher'),
(3, 'Junior'),
(4, 'Associate'),
(5, 'Mid-level'),
(6, 'Lead'),
(7, 'Manager'),
(8, 'Senior'),
(9, 'Director'),
(10, 'Executive');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `location_city`
--

CREATE TABLE `location_city` (
  `city_id` int NOT NULL,
  `city_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `location_city`
--

INSERT INTO `location_city` (`city_id`, `city_name`) VALUES
(1, 'Tuyên Quang'),
(2, 'Cao Bằng'),
(3, 'Lai Châu'),
(4, 'Lào Cai'),
(5, 'Thái Nguyên'),
(6, 'Điện Biên'),
(7, 'Lạng Sơn'),
(8, 'Sơn La'),
(9, 'Phú Thọ'),
(10, 'Bắc Ninh'),
(11, 'Quảng Ninh'),
(12, 'Hà Nội'),
(13, 'Hải Phòng'),
(14, 'Hưng Yên'),
(15, 'Ninh Bình'),
(16, 'Thanh Hóa'),
(17, 'Nghệ An'),
(18, 'Hà Tĩnh'),
(19, 'Quảng Trị'),
(20, 'Huế'),
(21, 'Đà Nẵng'),
(22, 'Quảng Ngãi'),
(23, 'Gia Lai'),
(24, 'Đắk Lắk'),
(25, 'Khánh Hòa'),
(26, 'Lâm Đồng'),
(27, 'Đồng Nai'),
(28, 'Tây Ninh'),
(29, 'Hồ Chí Minh'),
(30, 'Đồng Tháp'),
(31, 'An Giang'),
(32, 'Vĩnh Long'),
(33, 'Cần Thơ'),
(34, 'Cà Mau');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `location_ward`
--

CREATE TABLE `location_ward` (
  `ward_id` int NOT NULL,
  `ward_name` varchar(200) DEFAULT NULL,
  `city_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `location_ward`
--

INSERT INTO `location_ward` (`ward_id`, `ward_name`, `city_id`) VALUES
(1, 'Ba Đình', 12),
(2, 'Ngọc Hà', 12),
(3, 'Giảng Võ', 12),
(4, 'Hoàn Kiếm', 12),
(5, 'Cửa Nam', 12),
(6, 'Phú Thượng', 12),
(7, 'Hồng Hà', 12),
(8, 'Tây Hồ', 12),
(9, 'Bồ Đề', 12),
(10, 'Việt Hưng', 12),
(11, 'Phúc Lợi', 12),
(12, 'Long Biên', 12),
(13, 'Nghĩa Đô', 12),
(14, 'Cầu Giấy', 12),
(15, 'Yên Hòa', 12),
(16, 'Ô Chợ Dừa', 12),
(17, 'Láng', 12),
(18, 'Văn Miếu - Quốc Tử Giám', 12),
(19, 'Kim Liên', 12),
(20, 'Đống Đa', 12),
(21, 'Hai Bà Trưng', 12),
(22, 'Vĩnh Tuy', 12),
(23, 'Bạch Mai', 12),
(24, 'Vĩnh Hưng', 12),
(25, 'Định Công', 12),
(26, 'Tương Mai', 12),
(27, 'Lĩnh Nam', 12),
(28, 'Hoàng Mai', 12),
(29, 'Hoàng Liệt', 12),
(30, 'Yên Sở', 12),
(31, 'Phương Liệt', 12),
(32, 'Khương Đình', 12),
(33, 'Thanh Xuân', 12),
(34, 'Từ Liêm', 12),
(35, 'Thượng Cát', 12),
(36, 'Đông Ngạc', 12),
(37, 'Xuân Đỉnh', 12),
(38, 'Tây Tựu', 12),
(39, 'Phú Diễn', 12),
(40, 'Xuân Phương', 12),
(41, 'Tây Mỗ', 12),
(42, 'Đại Mỗ', 12),
(43, 'Thanh Liệt', 12),
(44, 'Kiến Hưng', 12),
(45, 'Hà Đông', 12),
(46, 'Yên Nghĩa', 12),
(47, 'Phú Lương', 12),
(48, 'Sơn Tây', 12),
(49, 'Tùng Thiện', 12),
(50, 'Dương Nội', 12),
(51, 'Chương Mỹ', 12),
(52, 'Sóc Sơn', 12),
(53, 'Kim Anh', 12),
(54, 'Trung Giã', 12),
(55, 'Đa Phúc', 12),
(56, 'Nội Bài', 12),
(57, 'Đông Anh', 12),
(58, 'Phúc Thịnh', 12),
(59, 'Thư Lâm', 12),
(60, 'Thiên Lộc', 12),
(61, 'Vĩnh Thanh', 12),
(62, 'Phù Đổng', 12),
(63, 'Thuận An', 12),
(64, 'Gia Lâm', 12),
(65, 'Bát Tràng', 12),
(66, 'Thanh Trì', 12),
(67, 'Đại Thanh', 12),
(68, 'Ngọc Hồi', 12),
(69, 'Nam Phù', 12),
(70, 'Yên Xuân', 12),
(71, 'Quang Minh', 12),
(72, 'Yên Lãng', 12),
(73, 'Tiến Thắng', 12),
(74, 'Mê Linh', 12),
(75, 'Đoài Phương', 12),
(76, 'Quảng Oai', 12),
(77, 'Cổ Đô', 12),
(78, 'Minh Châu', 12),
(79, 'Vật Lại', 12),
(80, 'Bất Bạt', 12),
(81, 'Suối Hai', 12),
(82, 'Ba Vì', 12),
(83, 'Yên Bài', 12),
(84, 'Phúc Thọ', 12),
(85, 'Phúc Lộc', 12),
(86, 'Hát Môn', 12),
(87, 'Đan Phượng', 12),
(88, 'Liên Minh', 12),
(89, 'Ô Diên', 12),
(90, 'Hoài Đức', 12),
(91, 'Dương Hòa', 12),
(92, 'Sơn Đồng', 12),
(93, 'An Khánh', 12),
(94, 'Quốc Oai', 12),
(95, 'Kiều Phú', 12),
(96, 'Hưng Đạo', 12),
(97, 'Phú Cát', 12),
(98, 'Thạch Thất', 12),
(99, 'Hạ Bằng', 12),
(100, 'Hòa Lạc', 12),
(101, 'Tây Phương', 12),
(102, 'Phú Nghĩa', 12),
(103, 'Xuân Mai', 12),
(104, 'Quảng Bị', 12),
(105, 'Trần Phú', 12),
(106, 'Hòa Phú', 12),
(107, 'Thanh Oai', 12),
(108, 'Bình Minh', 12),
(109, 'Tam Hưng', 12),
(110, 'Dân Hòa', 12),
(111, 'Thường Tín', 12),
(112, 'Hồng Vân', 12),
(113, 'Thượng Phúc', 12),
(114, 'Chương Dương', 12),
(115, 'Phú Xuyên', 12),
(116, 'Phượng Dực', 12),
(117, 'Chuyên Mỹ', 12),
(118, 'Đại Xuyên', 12),
(119, 'Vân Đình', 12),
(120, 'Ứng Thiên', 12),
(121, 'Ứng Hòa', 12),
(122, 'Hòa Xá', 12),
(123, 'Mỹ Đức', 12),
(124, 'Phúc Sơn', 12),
(125, 'Hồng Sơn', 12),
(126, 'Hương Sơn', 12),
(127, 'Thục Phán', 2),
(128, 'Nùng Trí Cao', 2),
(129, 'Tân Giang', 2),
(130, 'Bảo Lâm', 2),
(131, 'Lý Bôn', 2),
(132, 'Nam Quang', 2),
(133, 'Quảng Lâm', 2),
(134, 'Yên Thổ', 2),
(135, 'Bảo Lạc', 2),
(136, 'Cốc Pàng', 2),
(137, 'Cô Ba', 2),
(138, 'Khánh Xuân', 2),
(139, 'Xuân Trường', 2),
(140, 'Hưng Đạo', 2),
(141, 'Huy Giáp', 2),
(142, 'Sơn Lộ', 2),
(143, 'Thông Nông', 2),
(144, 'Cần Yên', 2),
(145, 'Thanh Long', 2),
(146, 'Trường Hà', 2),
(147, 'Lũng Nặm', 2),
(148, 'Tổng Cọt', 2),
(149, 'Hà Quảng', 2),
(150, 'Trà Lĩnh', 2),
(151, 'Quang Hán', 2),
(152, 'Quang Trung', 2),
(153, 'Trùng Khánh', 2),
(154, 'Đình Phong', 2),
(155, 'Đàm Thủy', 2),
(156, 'Đoài Dương', 2),
(157, 'Lý Quốc', 2),
(158, 'Quang Long', 2),
(159, 'Hạ Lang', 2),
(160, 'Vinh Quý', 2),
(161, 'Quảng Uyên', 2),
(162, 'Độc Lập', 2),
(163, 'Hạnh Phúc', 2),
(164, 'Bế Văn Đàn', 2),
(165, 'Phục Hòa', 2),
(166, 'Hòa An', 2),
(167, 'Nam Tuấn', 2),
(168, 'Nguyễn Huệ', 2),
(169, 'Bạch Đằng', 2),
(170, 'Nguyên Bình', 2),
(171, 'Tĩnh Túc', 2),
(172, 'Ca Thành', 2),
(173, 'Minh Tâm', 2),
(174, 'Phan Thanh', 2),
(175, 'Tam Kim', 2),
(176, 'Thành Công', 2),
(177, 'Đông Khê', 2),
(178, 'Canh Tân', 2),
(179, 'Kim Đồng', 2),
(180, 'Minh Khai', 2),
(181, 'Thạch An', 2),
(182, 'Đức Long', 2),
(183, 'Hà Giang 2', 1),
(184, 'Hà Giang 1', 1),
(185, 'Nông Tiến', 1),
(186, 'Minh Xuân', 1),
(187, 'Mỹ Lâm', 1),
(188, 'An Tường', 1),
(189, 'Bình Thuận', 1),
(190, 'Ngọc Đường', 1),
(191, 'Phú Linh', 1),
(192, 'Lũng Cú', 1),
(193, 'Đồng Văn', 1),
(194, 'Sà Phìn', 1),
(195, 'Phó Bảng', 1),
(196, 'Lũng Phìn', 1),
(197, 'Mèo Vạc', 1),
(198, 'Sơn Vĩ', 1),
(199, 'Sủng Máng', 1),
(200, 'Khâu Vai', 1),
(201, 'Tát Ngà', 1),
(202, 'Niêm Sơn', 1),
(203, 'Yên Minh', 1),
(204, 'Thắng Mố', 1),
(205, 'Bạch Đích', 1),
(206, 'Mậu Duệ', 1),
(207, 'Ngọc Long', 1),
(208, 'Đường Thượng', 1),
(209, 'Du Già', 1),
(210, 'Quản Bạ', 1),
(211, 'Cán Tỷ', 1),
(212, 'Nghĩa Thuận', 1),
(213, 'Tùng Vài', 1),
(214, 'Lùng Tám', 1),
(215, 'Vị Xuyên', 1),
(216, 'Minh Tân', 1),
(217, 'Thuận Hòa', 1),
(218, 'Tùng Bá', 1),
(219, 'Thanh Thủy', 1),
(220, 'Lao Chải', 1),
(221, 'Cao Bồ', 1),
(222, 'Thượng Sơn', 1),
(223, 'Việt Lâm', 1),
(224, 'Linh Hồ', 1),
(225, 'Bạch Ngọc', 1),
(226, 'Minh Sơn', 1),
(227, 'Giáp Trung', 1),
(228, 'Bắc Mê', 1),
(229, 'Minh Ngọc', 1),
(230, 'Yên Cường', 1),
(231, 'Đường Hồng', 1),
(232, 'Hoàng Su Phì', 1),
(233, 'Bản Máy', 1),
(234, 'Thàng Tín', 1),
(235, 'Tân Tiến', 1),
(236, 'Pờ Ly Ngài', 1),
(237, 'Nậm Dịch', 1),
(238, 'Hồ Thầu', 1),
(239, 'Thông Nguyên', 1),
(240, 'Pà Vầy Sủ', 1),
(241, 'Xín Mần', 1),
(242, 'Trung Thịnh', 1),
(243, 'Nấm Dẩn', 1),
(244, 'Quảng Nguyên', 1),
(245, 'Khuôn Lùng', 1),
(246, 'Bắc Quang', 1),
(247, 'Vĩnh Tuy', 1),
(248, 'Đồng Tâm', 1),
(249, 'Tân Quang', 1),
(250, 'Bằng Hành', 1),
(251, 'Liên Hiệp', 1),
(252, 'Hùng An', 1),
(253, 'Đồng Yên', 1),
(254, 'Tiên Nguyên', 1),
(255, 'Yên Thành', 1),
(256, 'Quang Bình', 1),
(257, 'Tân Trịnh', 1),
(258, 'Bằng Lang', 1),
(259, 'Xuân Giang', 1),
(260, 'Tiên Yên', 1),
(261, 'Nà Hang', 1),
(262, 'Thượng Nông', 1),
(263, 'Côn Lôn', 1),
(264, 'Yên Hoa', 1),
(265, 'Hồng Thái', 1),
(266, 'Lâm Bình', 1),
(267, 'Thượng Lâm', 1),
(268, 'Chiêm Hóa', 1),
(269, 'Bình An', 1),
(270, 'Minh Quang', 1),
(271, 'Trung Hà', 1),
(272, 'Tân Mỹ', 1),
(273, 'Yên Lập', 1),
(274, 'Tân An', 1),
(275, 'Kiên Đài', 1),
(276, 'Kim Bình', 1),
(277, 'Hòa An', 1),
(278, 'Tri Phú', 1),
(279, 'Yên Nguyên', 1),
(280, 'Hàm Yên', 1),
(281, 'Bạch Xa', 1),
(282, 'Phù Lưu', 1),
(283, 'Yên Phú', 1),
(284, 'Bình Xa', 1),
(285, 'Thái Sơn', 1),
(286, 'Thái Hòa', 1),
(287, 'Hùng Đức', 1),
(288, 'Lực Hành', 1),
(289, 'Kiến Thiết', 1),
(290, 'Xuân Vân', 1),
(291, 'Hùng Lợi', 1),
(292, 'Trung Sơn', 1),
(293, 'Tân Long', 1),
(294, 'Yên Sơn', 1),
(295, 'Thái Bình', 1),
(296, 'Nhữ Khê', 1),
(297, 'Sơn Dương', 1),
(298, 'Tân Trào', 1),
(299, 'Bình Ca', 1),
(300, 'Minh Thanh', 1),
(301, 'Đông Thọ', 1),
(302, 'Tân Thanh', 1),
(303, 'Hồng Sơn', 1),
(304, 'Phú Lương', 1),
(305, 'Sơn Thủy', 1),
(306, 'Trường Sinh', 1),
(307, 'Điện Biên Phủ', 6),
(308, 'Mường Lay', 6),
(309, 'Mường Thanh', 6),
(310, 'Sín Thầu', 6),
(311, 'Mường Nhé', 6),
(312, 'Nậm Kè', 6),
(313, 'Mường Toong', 6),
(314, 'Quảng Lâm', 6),
(315, 'Mường Chà', 6),
(316, 'Nà Hỳ', 6),
(317, 'Na Sang', 6),
(318, 'Chà Tở', 6),
(319, 'Nà Bủng', 6),
(320, 'Mường Tùng', 6),
(321, 'Pa Ham', 6),
(322, 'Nậm Nèn', 6),
(323, 'Si Pa Phìn', 6),
(324, 'Mường Pồn', 6),
(325, 'Na Son', 6),
(326, 'Xa Dung', 6),
(327, 'Mường Luân', 6),
(328, 'Tủa Chùa', 6),
(329, 'Tủa Thàng', 6),
(330, 'Sín Chải', 6),
(331, 'Sính Phình', 6),
(332, 'Sáng Nhè', 6),
(333, 'Tuần Giáo', 6),
(334, 'Mường Ảng', 6),
(335, 'Pú Nhung', 6),
(336, 'Mường Mùn', 6),
(337, 'Chiềng Sinh', 6),
(338, 'Quài Tở', 6),
(339, 'Búng Lao', 6),
(340, 'Mường Lạn', 6),
(341, 'Nà Tấu', 6),
(342, 'Mường Phăng', 6),
(343, 'Thanh Nưa', 6),
(344, 'Thanh Yên', 6),
(345, 'Thanh An', 6),
(346, 'Sam Mứn', 6),
(347, 'Núa Ngam', 6),
(348, 'Mường Nhà', 6),
(349, 'Pu Nhi', 6),
(350, 'Phình Giàng', 6),
(351, 'Tìa Dình', 6),
(352, 'Đoàn Kết', 3),
(353, 'Tân Phong', 3),
(354, 'Bình Lư', 3),
(355, 'Sin Suối Hồ', 3),
(356, 'Tả Lèng', 3),
(357, 'Bản Bo', 3),
(358, 'Khun Há', 3),
(359, 'Bum Tở', 3),
(360, 'Nậm Hàng', 3),
(361, 'Thu Lũm', 3),
(362, 'Pa Ủ', 3),
(363, 'Mường Tè', 3),
(364, 'Mù Cả', 3),
(365, 'Hua Bum', 3),
(366, 'Tà Tổng', 3),
(367, 'Bum Nưa', 3),
(368, 'Mường Mô', 3),
(369, 'Sìn Hồ', 3),
(370, 'Lê Lợi', 3),
(371, 'Pa Tần', 3),
(372, 'Hồng Thu', 3),
(373, 'Nậm Tăm', 3),
(374, 'Tủa Sín Chải', 3),
(375, 'Pu Sam Cáp', 3),
(376, 'Nậm Mạ', 3),
(377, 'Nậm Cuổi', 3),
(378, 'Phong Thổ', 3),
(379, 'Sì Lở Lầu', 3),
(380, 'Dào San', 3),
(381, 'Khổng Lào', 3),
(382, 'Than Uyên', 3),
(383, 'Tân Uyên', 3),
(384, 'Mường Khoa', 3),
(385, 'Nậm Sỏ', 3),
(386, 'Pắc Ta', 3),
(387, 'Mường Than', 3),
(388, 'Mường Kim', 3),
(389, 'Khoen On', 3),
(390, 'Tô Hiệu', 8),
(391, 'Chiềng An', 8),
(392, 'Chiềng Cơi', 8),
(393, 'Chiềng Sinh', 8),
(394, 'Mộc Sơn', 8),
(395, 'Mộc Châu', 8),
(396, 'Thảo Nguyên', 8),
(397, 'Vân Sơn', 8),
(398, 'Mường Chiên', 8),
(399, 'Mường Giôn', 8),
(400, 'Quỳnh Nhai', 8),
(401, 'Mường Sại', 8),
(402, 'Thuận Châu', 8),
(403, 'Bình Thuận', 8),
(404, 'Mường É', 8),
(405, 'Chiềng La', 8),
(406, 'Mường Khiêng', 8),
(407, 'Mường Bám', 8),
(408, 'Long Hẹ', 8),
(409, 'Co Mạ', 8),
(410, 'Nậm Lầu', 8),
(411, 'Muổi Nọi', 8),
(412, 'Mường La', 8),
(413, 'Chiềng Lao', 8),
(414, 'Ngọc Chiến', 8),
(415, 'Mường Bú', 8),
(416, 'Chiềng Hoa', 8),
(417, 'Bắc Yên', 8),
(418, 'Xím Vàng', 8),
(419, 'Tà Xùa', 8),
(420, 'Pắc Ngà', 8),
(421, 'Tạ Khoa', 8),
(422, 'Chiềng Sại', 8),
(423, 'Suối Tọ', 8),
(424, 'Mường Cơi', 8),
(425, 'Phù Yên', 8),
(426, 'Gia Phù', 8),
(427, 'Mường Bang', 8),
(428, 'Tường Hạ', 8),
(429, 'Kim Bon', 8),
(430, 'Tân Phong', 8),
(431, 'Chiềng Sơn', 8),
(432, 'Tân Yên', 8),
(433, 'Đoàn Kết', 8),
(434, 'Song Khủa', 8),
(435, 'Tô Múa', 8),
(436, 'Lóng Sập', 8),
(437, 'Vân Hồ', 8),
(438, 'Xuân Nha', 8),
(439, 'Yên Châu', 8),
(440, 'Chiềng Hặc', 8),
(441, 'Yên Sơn', 8),
(442, 'Lóng Phiêng', 8),
(443, 'Phiêng Khoài', 8),
(444, 'Mai Sơn', 8),
(445, 'Chiềng Sung', 8),
(446, 'Mường Chanh', 8),
(447, 'Chiềng Mung', 8),
(448, 'Chiềng Mai', 8),
(449, 'Tà Hộc', 8),
(450, 'Phiêng Cằm', 8),
(451, 'Phiêng Pằn', 8),
(452, 'Sông Mã', 8),
(453, 'Bó Sinh', 8),
(454, 'Mường Lầm', 8),
(455, 'Nậm Ty', 8),
(456, 'Chiềng Sơ', 8),
(457, 'Chiềng Khoong', 8),
(458, 'Huổi Một', 8),
(459, 'Mường Hung', 8),
(460, 'Chiềng Khương', 8),
(461, 'Púng Bánh', 8),
(462, 'Sốp Cộp', 8),
(463, 'Mường Lèo', 8),
(464, 'Mường Lạn', 8),
(465, 'Lào Cai', 4),
(466, 'Cam Đường', 4),
(467, 'Sa Pa', 4),
(468, 'Yên Bái', 4),
(469, 'Nam Cường', 4),
(470, 'Văn Phú', 4),
(471, 'Nghĩa Lộ', 4),
(472, 'Âu Lâu', 4),
(473, 'Trung Tâm', 4),
(474, 'Cầu Thia', 4),
(475, 'Hợp Thành', 4),
(476, 'Bát Xát', 4),
(477, 'A Mú Sung', 4),
(478, 'Trịnh Tường', 4),
(479, 'Y Tý', 4),
(480, 'Dền Sáng', 4),
(481, 'Bản Xèo', 4),
(482, 'Mường Hum', 4),
(483, 'Cốc San', 4),
(484, 'Pha Long', 4),
(485, 'Mường Khương', 4),
(486, 'Cao Sơn', 4),
(487, 'Bản Lầu', 4),
(488, 'Si Ma Cai', 4),
(489, 'Sín Chéng', 4),
(490, 'Bắc Hà', 4),
(491, 'Tả Củ Tỷ', 4),
(492, 'Lùng Phình', 4),
(493, 'Bản Liền', 4),
(494, 'Bảo Nhai', 4),
(495, 'Cốc Lầu', 4),
(496, 'Phong Hải', 4),
(497, 'Bảo Thắng', 4),
(498, 'Tằng Loỏng', 4),
(499, 'Gia Phú', 4),
(500, 'Xuân Quang', 4),
(501, 'Bảo Yên', 4),
(502, 'Nghĩa Đô', 4),
(503, 'Xuân Hòa', 4),
(504, 'Thượng Hà', 4),
(505, 'Bảo Hà', 4),
(506, 'Phúc Khánh', 4),
(507, 'Ngũ Chỉ Sơn', 4),
(508, 'Tả Phìn', 4),
(509, 'Tả Van', 4),
(510, 'Mường Bo', 4),
(511, 'Bản Hồ', 4),
(512, 'Võ Lao', 4),
(513, 'Nậm Chày', 4),
(514, 'Văn Bàn', 4),
(515, 'Nậm Xé', 4),
(516, 'Chiềng Ken', 4),
(517, 'Khánh Yên', 4),
(518, 'Dương Quỳ', 4),
(519, 'Minh Lương', 4),
(520, 'Lục Yên', 4),
(521, 'Lâm Thượng', 4),
(522, 'Tân Lĩnh', 4),
(523, 'Khánh Hòa', 4),
(524, 'Mường Lai', 4),
(525, 'Phúc Lợi', 4),
(526, 'Mậu A', 4),
(527, 'Lâm Giang', 4),
(528, 'Châu Quế', 4),
(529, 'Đông Cuông', 4),
(530, 'Phong Dụ Hạ', 4),
(531, 'Phong Dụ Thượng', 4),
(532, 'Tân Hợp', 4),
(533, 'Xuân Ái', 4),
(534, 'Mỏ Vàng', 4),
(535, 'Mù Cang Chải', 4),
(536, 'Nậm Có', 4),
(537, 'Khao Mang', 4),
(538, 'Lao Chải', 4),
(539, 'Chế Tạo', 4),
(540, 'Púng Luông', 4),
(541, 'Trấn Yên', 4),
(542, 'Quy Mông', 4),
(543, 'Lương Thịnh', 4),
(544, 'Việt Hồng', 4),
(545, 'Hưng Khánh', 4),
(546, 'Hạnh Phúc', 4),
(547, 'Tà Xi Láng', 4),
(548, 'Trạm Tấu', 4),
(549, 'Phình Hồ', 4),
(550, 'Tú Lệ', 4),
(551, 'Gia Hội', 4),
(552, 'Sơn Lương', 4),
(553, 'Liên Sơn', 4),
(554, 'Văn Chấn', 4),
(555, 'Cát Thịnh', 4),
(556, 'Chấn Thịnh', 4),
(557, 'Thượng Bằng La', 4),
(558, 'Nghĩa Tâm', 4),
(559, 'Yên Bình', 4),
(560, 'Thác Bà', 4),
(561, 'Cảm Nhân', 4),
(562, 'Yên Thành', 4),
(563, 'Bảo Ái', 4),
(564, 'Đức Xuân', 5),
(565, 'Bắc Kạn', 5),
(566, 'Phan Đình Phùng', 5),
(567, 'Quyết Thắng', 5),
(568, 'Gia Sàng', 5),
(569, 'Quan Triều', 5),
(570, 'Tích Lương', 5),
(571, 'Sông Công', 5),
(572, 'Bách Quang', 5),
(573, 'Bá Xuyên', 5),
(574, 'Linh Sơn', 5),
(575, 'Phúc Thuận', 5),
(576, 'Phổ Yên', 5),
(577, 'Vạn Xuân', 5),
(578, 'Trung Thành', 5),
(579, 'Phong Quang', 5),
(580, 'Bằng Thành', 5),
(581, 'Cao Minh', 5),
(582, 'Nghiên Loan', 5),
(583, 'Phúc Lộc', 5),
(584, 'Ba Bể', 5),
(585, 'Chợ Rã', 5),
(586, 'Thượng Minh', 5),
(587, 'Đồng Phúc', 5),
(588, 'Nà Phặc', 5),
(589, 'Bằng Vân', 5),
(590, 'Ngân Sơn', 5),
(591, 'Thượng Quan', 5),
(592, 'Hiệp Lực', 5),
(593, 'Phủ Thông', 5),
(594, 'Vĩnh Thông', 5),
(595, 'Cẩm Giàng', 5),
(596, 'Mỹ Thái', 5),
(597, 'Bạch Thông', 5),
(598, 'Chợ Đồn', 5),
(599, 'Nam Cường', 5),
(600, 'Quảng Bạch', 5),
(601, 'Yên Thịnh', 5),
(602, 'Nghĩa Tá', 5),
(603, 'Yên Phong', 5),
(604, 'Chợ Mới', 5),
(605, 'Thanh Mai', 5),
(606, 'Tân Kỳ', 5),
(607, 'Thanh Thịnh', 5),
(608, 'Yên Bình', 5),
(609, 'Văn Lang', 5),
(610, 'Cường Lợi', 5),
(611, 'Na Rì', 5),
(612, 'Trần Phú', 5),
(613, 'Côn Minh', 5),
(614, 'Xuân Dương', 5),
(615, 'Đại Phúc', 5),
(616, 'Tân Cương', 5),
(617, 'Lam Vỹ', 5),
(618, 'Kim Phượng', 5),
(619, 'Phượng Tiến', 5),
(620, 'Định Hóa', 5),
(621, 'Trung Hội', 5),
(622, 'Bình Yên', 5),
(623, 'Phú Đình', 5),
(624, 'Bình Thành', 5),
(625, 'Phú Lương', 5),
(626, 'Yên Trạch', 5),
(627, 'Hợp Thành', 5),
(628, 'Vô Tranh', 5),
(629, 'Trại Cau', 5),
(630, 'Văn Lăng', 5),
(631, 'Quang Sơn', 5),
(632, 'Văn Hán', 5),
(633, 'Đồng Hỷ', 5),
(634, 'Nam Hòa', 5),
(635, 'Võ Nhai', 5),
(636, 'Sảng Mộc', 5),
(637, 'Nghinh Tường', 5),
(638, 'Thần Sa', 5),
(639, 'La Hiên', 5),
(640, 'Tràng Xá', 5),
(641, 'Dân Tiến', 5),
(642, 'Phú Xuyên', 5),
(643, 'Đức Lương', 5),
(644, 'Phú Lạc', 5),
(645, 'Phú Thịnh', 5),
(646, 'An Khánh', 5),
(647, 'La Bằng', 5),
(648, 'Đại Từ', 5),
(649, 'Vạn Phú', 5),
(650, 'Quân Chu', 5),
(651, 'Thành Công', 5),
(652, 'Phú Bình', 5),
(653, 'Tân Khánh', 5),
(654, 'Tân Thành', 5),
(655, 'Điềm Thụy', 5),
(656, 'Kha Sơn', 5),
(657, 'Đông Kinh', 7),
(658, 'Lương Văn Tri', 7),
(659, 'Tam Thanh', 7),
(660, 'Kỳ Lừa', 7),
(661, 'Đoàn Kết', 7),
(662, 'Quốc Khánh', 7),
(663, 'Tân Tiến', 7),
(664, 'Kháng Chiến', 7),
(665, 'Thất Khê', 7),
(666, 'Tràng Định', 7),
(667, 'Quốc Việt', 7),
(668, 'Hoa Thám', 7),
(669, 'Quý Hòa', 7),
(670, 'Hồng Phong', 7),
(671, 'Kim Bôi', 7),
(672, 'Thiện Hòa', 7),
(673, 'Thiện Thuật', 7),
(674, 'Thiện Long', 7),
(675, 'Bình Gia', 7),
(676, 'Tân Văn', 7),
(677, 'Na Sầm', 7),
(678, 'Thụy Hùng', 7),
(679, 'Hội Hoan', 7),
(680, 'Văn Lãng', 7),
(681, 'Hoàng Văn Thụ', 7),
(682, 'Đồng Đăng', 7),
(683, 'Ba Sơn', 7),
(684, 'Cao Lộc', 7),
(685, 'Công Sơn', 7),
(686, 'Văn Quan', 7),
(687, 'Điềm He', 7),
(688, 'Khánh Khê', 7),
(689, 'Yên Phúc', 7),
(690, 'Tri Lễ', 7),
(691, 'Tân Đoàn', 7),
(692, 'Bắc Sơn', 7),
(693, 'Tân Tri', 7),
(694, 'Hưng Vũ', 7),
(695, 'Vũ Lễ', 7),
(696, 'Vũ Lăng', 7),
(697, 'Nhất Hòa', 7),
(698, 'Hữu Lũng', 7),
(699, 'Yên Bình', 7),
(700, 'Hữu Liên', 7),
(701, 'Vân Nham', 7),
(702, 'Cai Kinh', 7),
(703, 'Thiện Tân', 7),
(704, 'Tân Thành', 7),
(705, 'Tuấn Sơn', 7),
(706, 'Chi Lăng', 7),
(707, 'Bằng Mạc', 7),
(708, 'Chiến Thắng', 7),
(709, 'Nhân Lý', 7),
(710, 'Vạn Linh', 7),
(711, 'Quan Sơn', 7),
(712, 'Na Dương', 7),
(713, 'Lộc Bình', 7),
(714, 'Mẫu Sơn', 7),
(715, 'Khuất Xá', 7),
(716, 'Thống Nhất', 7),
(717, 'Lợi Bác', 7),
(718, 'Xuân Dương', 7),
(719, 'Đình Lập', 7),
(720, 'Thái Bình', 7),
(721, 'Kiên Mộc', 7),
(722, 'Châu Sơn', 7),
(723, 'Hà Tu', 11),
(724, 'Cao Xanh', 11),
(725, 'Việt Hưng', 11),
(726, 'Bãi Cháy', 11),
(727, 'Hà Lầm', 11),
(728, 'Hồng Gai', 11),
(729, 'Hạ Long', 11),
(730, 'Tuần Châu', 11),
(731, 'Móng Cái 2', 11),
(732, 'Móng Cái 1', 11),
(733, 'Móng Cái 3', 11),
(734, 'Mông Dương', 11),
(735, 'Quang Hanh', 11),
(736, 'Cửa Ông', 11),
(737, 'Cẩm Phả', 11),
(738, 'Uông Bí', 11),
(739, 'Vàng Danh', 11),
(740, 'Yên Tử', 11),
(741, 'Hoành Bồ', 11),
(742, 'Mạo Khê', 11),
(743, 'Bình Khê', 11),
(744, 'An Sinh', 11),
(745, 'Đông Triều', 11),
(746, 'Hoàng Quế', 11),
(747, 'Quảng Yên', 11),
(748, 'Đông Mai', 11),
(749, 'Hiệp Hòa', 11),
(750, 'Hà An', 11),
(751, 'Liên Hòa', 11),
(752, 'Phong Cốc', 11),
(753, 'Hải Sơn', 11),
(754, 'Hải Ninh', 11),
(755, 'Vĩnh Thực', 11),
(756, 'Hải Hòa', 11),
(757, 'Bình Liêu', 11),
(758, 'Hoành Mô', 11),
(759, 'Lục Hồn', 11),
(760, 'Tiên Yên', 11),
(761, 'Điền Xá', 11),
(762, 'Đông Ngũ', 11),
(763, 'Hải Lạng', 11),
(764, 'Đầm Hà', 11),
(765, 'Quảng Tân', 11),
(766, 'Quảng Hà', 11),
(767, 'Quảng Đức', 11),
(768, 'Đường Hoa', 11),
(769, 'Cái Chiên', 11),
(770, 'Ba Chẽ', 11),
(771, 'Kỳ Thượng', 11),
(772, 'Lương Minh', 11),
(773, 'Quảng La', 11),
(774, 'Thống Nhất', 11),
(775, 'Vân Đồn', 11),
(776, 'Cô Tô', 11),
(777, 'Bắc Giang', 10),
(778, 'Đa Mai', 10),
(779, 'Chũ', 10),
(780, 'Phượng Sơn', 10),
(781, 'Yên Dũng', 10),
(782, 'Tân An', 10),
(783, 'Tiền Phong', 10),
(784, 'Tân Tiến', 10),
(785, 'Cảnh Thụy', 10),
(786, 'Tự Lạn', 10),
(787, 'Việt Yên', 10),
(788, 'Nếnh', 10),
(789, 'Vân Hà', 10),
(790, 'Vũ Ninh', 10),
(791, 'Kinh Bắc', 10),
(792, 'Võ Cường', 10),
(793, 'Quế Võ', 10),
(794, 'Nhân Hòa', 10),
(795, 'Phương Liễu', 10),
(796, 'Nam Sơn', 10),
(797, 'Bồng Lai', 10),
(798, 'Đào Viên', 10),
(799, 'Hạp Lĩnh', 10),
(800, 'Từ Sơn', 10),
(801, 'Tam Sơn', 10),
(802, 'Phù Khê', 10),
(803, 'Đồng Nguyên', 10),
(804, 'Thuận Thành', 10),
(805, 'Mão Điền', 10),
(806, 'Trí Quả', 10),
(807, 'Trạm Lộ', 10),
(808, 'Song Liễu', 10),
(809, 'Ninh Xá', 10),
(810, 'Xuân Lương', 10),
(811, 'Tam Tiến', 10),
(812, 'Đồng Kỳ', 10),
(813, 'Yên Thế', 10),
(814, 'Bố Hạ', 10),
(815, 'Nhã Nam', 10),
(816, 'Phúc Hòa', 10),
(817, 'Quang Trung', 10),
(818, 'Tân Yên', 10),
(819, 'Ngọc Thiện', 10),
(820, 'Lạng Giang', 10),
(821, 'Tiên Lục', 10),
(822, 'Kép', 10),
(823, 'Tân Dĩnh', 10),
(824, 'Lục Nam', 10),
(825, 'Đông Phú', 10),
(826, 'Bảo Đài', 10),
(827, 'Nghĩa Phương', 10),
(828, 'Trường Sơn', 10),
(829, 'Lục Sơn', 10),
(830, 'Bắc Lũng', 10),
(831, 'Cẩm Lý', 10),
(832, 'Tân Sơn', 10),
(833, 'Sa Lý', 10),
(834, 'Biên Sơn', 10),
(835, 'Sơn Hải', 10),
(836, 'Kiên Lao', 10),
(837, 'Biển Động', 10),
(838, 'Lục Ngạn', 10),
(839, 'Đèo Gia', 10),
(840, 'Nam Dương', 10),
(841, 'Sơn Động', 10),
(842, 'Tây Yên Tử', 10),
(843, 'Vân Sơn', 10),
(844, 'Đại Sơn', 10),
(845, 'Yên Định', 10),
(846, 'An Lạc', 10),
(847, 'Tuấn Đạo', 10),
(848, 'Dương Hưu', 10),
(849, 'Đồng Việt', 10),
(850, 'Hoàng Vân', 10),
(851, 'Hiệp Hòa', 10),
(852, 'Hợp Thịnh', 10),
(853, 'Xuân Cẩm', 10),
(854, 'Yên Phong', 10),
(855, 'Tam Giang', 10),
(856, 'Yên Trung', 10),
(857, 'Tam Đa', 10),
(858, 'Văn Môn', 10),
(859, 'Phù Lãng', 10),
(860, 'Chi Lăng', 10),
(861, 'Tiên Du', 10),
(862, 'Liên Bão', 10),
(863, 'Đại Đồng', 10),
(864, 'Tân Chi', 10),
(865, 'Phật Tích', 10),
(866, 'Gia Bình', 10),
(867, 'Cao Đức', 10),
(868, 'Đại Lai', 10),
(869, 'Nhân Thắng', 10),
(870, 'Đông Cứu', 10),
(871, 'Lương Tài', 10),
(872, 'Trung Kênh', 10),
(873, 'Trung Chính', 10),
(874, 'Lâm Thao', 10),
(875, 'Tân Hòa', 9),
(876, 'Hòa Bình', 9),
(877, 'Thống Nhất', 9),
(878, 'Kỳ Sơn', 9),
(879, 'Nông Trang', 9),
(880, 'Việt Trì', 9),
(881, 'Thanh Miếu', 9),
(882, 'Vân Phú', 9),
(883, 'Phú Thọ', 9),
(884, 'Âu Cơ', 9),
(885, 'Phong Châu', 9),
(886, 'Vĩnh Yên', 9),
(887, 'Vĩnh Phúc', 9),
(888, 'Phúc Yên', 9),
(889, 'Xuân Hòa', 9),
(890, 'Đà Bắc', 9),
(891, 'Đức Nhàn', 9),
(892, 'Tân Pheo', 9),
(893, 'Quy Đức', 9),
(894, 'Cao Sơn', 9),
(895, 'Tiền Phong', 9),
(896, 'Thịnh Minh', 9),
(897, 'Lương Sơn', 9),
(898, 'Liên Sơn', 9),
(899, 'Nật Sơn', 9),
(900, 'Mường Động', 9),
(901, 'Cao Dương', 9),
(902, 'Hợp Kim', 9),
(903, 'Dũng Tiến', 9),
(904, 'Cao Phong', 9),
(905, 'Thung Nai', 9),
(906, 'Mường Thàng', 9),
(907, 'Tân Lạc', 9),
(908, 'Mường Hoa', 9),
(909, 'Vân Sơn', 9),
(910, 'Mường Bi', 9),
(911, 'Toàn Thắng', 9),
(912, 'Mai Châu', 9),
(913, 'Tân Mai', 9),
(914, 'Pà Cò', 9),
(915, 'Bao La', 9),
(916, 'Mai Hạ', 9),
(917, 'Lạc Sơn', 9),
(918, 'Mường Vang', 9),
(919, 'Nhân Nghĩa', 9),
(920, 'Thượng Cốc', 9),
(921, 'Yên Phú', 9),
(922, 'Quyết Thắng', 9),
(923, 'Ngọc Sơn', 9),
(924, 'Đại Đồng', 9),
(925, 'Yên Thủy', 9),
(926, 'Lạc Lương', 9),
(927, 'Yên Trị', 9),
(928, 'Lạc Thủy', 9),
(929, 'An Nghĩa', 9),
(930, 'An Bình', 9),
(931, 'Đoan Hùng', 9),
(932, 'Bằng Luân', 9),
(933, 'Chí Đám', 9),
(934, 'Tây Cốc', 9),
(935, 'Chân Mộng', 9),
(936, 'Hạ Hòa', 9),
(937, 'Đan Thượng', 9),
(938, 'Hiền Lương', 9),
(939, 'Yên Kỳ', 9),
(940, 'Văn Lang', 9),
(941, 'Vĩnh Chân', 9),
(942, 'Thanh Ba', 9),
(943, 'Quảng Yên', 9),
(944, 'Hoàng Cương', 9),
(945, 'Đông Thành', 9),
(946, 'Chí Tiên', 9),
(947, 'Liên Minh', 9),
(948, 'Phù Ninh', 9),
(949, 'Phú Mỹ', 9),
(950, 'Trạm Thản', 9),
(951, 'Dân Chủ', 9),
(952, 'Bình Phú', 9),
(953, 'Yên Lập', 9),
(954, 'Sơn Lương', 9),
(955, 'Xuân Viên', 9),
(956, 'Trung Sơn', 9),
(957, 'Thượng Long', 9),
(958, 'Minh Hòa', 9),
(959, 'Cẩm Khê', 9),
(960, 'Tiên Lương', 9),
(961, 'Vân Bán', 9),
(962, 'Phú Khê', 9),
(963, 'Hùng Việt', 9),
(964, 'Đồng Lương', 9),
(965, 'Tam Nông', 9),
(966, 'Hiền Quan', 9),
(967, 'Vạn Xuân', 9),
(968, 'Thọ Văn', 9),
(969, 'Lâm Thao', 9),
(970, 'Xuân Lũng', 9),
(971, 'Hy Cương', 9),
(972, 'Phùng Nguyên', 9),
(973, 'Bản Nguyên', 9),
(974, 'Thanh Sơn', 9),
(975, 'Thu Cúc', 9),
(976, 'Lai Đồng', 9),
(977, 'Tân Sơn', 9),
(978, 'Võ Miếu', 9),
(979, 'Xuân Đài', 9),
(980, 'Minh Đài', 9),
(981, 'Văn Miếu', 9),
(982, 'Cự Đồng', 9),
(983, 'Long Cốc', 9),
(984, 'Hương Cần', 9),
(985, 'Khả Cửu', 9),
(986, 'Yên Sơn', 9),
(987, 'Đào Xá', 9),
(988, 'Thanh Thủy', 9),
(989, 'Tu Vũ', 9),
(990, 'Lập Thạch', 9),
(991, 'Hợp Lý', 9),
(992, 'Yên Lãng', 9),
(993, 'Hải Lựu', 9),
(994, 'Thái Hòa', 9),
(995, 'Liên Hòa', 9),
(996, 'Tam Sơn', 9),
(997, 'Tiên Lữ', 9),
(998, 'Sông Lô', 9),
(999, 'Sơn Đông', 9),
(1000, 'Tam Dương', 9),
(1001, 'Tam Dương Bắc', 9),
(1002, 'Hoàng An', 9),
(1003, 'Hội Thịnh', 9),
(1004, 'Tam Đảo', 9),
(1005, 'Đạo Trù', 9),
(1006, 'Đại Đình', 9),
(1007, 'Bình Nguyên', 9),
(1008, 'Bình Tuyền', 9),
(1009, 'Bình Xuyên', 9),
(1010, 'Xuân Lãng', 9),
(1011, 'Yên Lạc', 9),
(1012, 'Tề Lỗ', 9),
(1013, 'Tam Hồng', 9),
(1014, 'Nguyệt Đức', 9),
(1015, 'Liên Châu', 9),
(1016, 'Vĩnh Tường', 9),
(1017, 'Vĩnh An', 9),
(1018, 'Vĩnh Hưng', 9),
(1019, 'Vĩnh Thành', 9),
(1020, 'Thổ Tang', 9),
(1021, 'Vĩnh Phú', 9),
(1022, 'Thành Đông', 13),
(1023, 'Hải Dương', 13),
(1024, 'Lê Thanh Nghị', 13),
(1025, 'Tân Hưng', 13),
(1026, 'Việt Hòa', 13),
(1027, 'Chí Linh', 13),
(1028, 'Chu Văn An', 13),
(1029, 'Nguyễn Trãi', 13),
(1030, 'Trần Hưng Đạo', 13),
(1031, 'Trần Nhân Tông', 13),
(1032, 'Lê Đại Hành', 13),
(1033, 'Ái Quốc', 13),
(1034, 'Kinh Môn', 13),
(1035, 'Bắc An Phụ', 13),
(1036, 'Nhị Chiểu', 13),
(1037, 'Phạm Sư Mạnh', 13),
(1038, 'Trần Liễu', 13),
(1039, 'Nguyễn Đại Năng', 13),
(1040, 'Nam Đồng', 13),
(1041, 'Tứ Minh', 13),
(1042, 'Thạch Khôi', 13),
(1043, 'Hồng Bàng', 13),
(1044, 'Ngô Quyền', 13),
(1045, 'Gia Viên', 13),
(1046, 'Lê Chân', 13),
(1047, 'An Biên', 13),
(1048, 'Đông Hải', 13),
(1049, 'Hải An', 13),
(1050, 'Kiến An', 13),
(1051, 'Phù Liễn', 13),
(1052, 'Đồ Sơn', 13),
(1053, 'Bạch Đằng', 13),
(1054, 'Lưu Kiếm', 13),
(1055, 'Lê Ích Mộc', 13),
(1056, 'Hòa Bình', 13),
(1057, 'Nam Triệu', 13),
(1058, 'Thiên Hương', 13),
(1059, 'Thủy Nguyên', 13),
(1060, 'An Dương', 13),
(1061, 'An Phong', 13),
(1062, 'Hồng An', 13),
(1063, 'An Hải', 13),
(1064, 'Hưng Đạo', 13),
(1065, 'Dương Kinh', 13),
(1066, 'Nam Đồ Sơn', 13),
(1067, 'Nam Sách', 13),
(1068, 'Hợp Tiến', 13),
(1069, 'Trần Phú', 13),
(1070, 'Thái Tân', 13),
(1071, 'An Phú', 13),
(1072, 'Nam An Phụ', 13),
(1073, 'Phú Thái', 13),
(1074, 'Lai Khê', 13),
(1075, 'An Thành', 13),
(1076, 'Kim Thành', 13),
(1077, 'Thanh Hà', 13),
(1078, 'Hà Bắc', 13),
(1079, 'Hà Nam', 13),
(1080, 'Hà Tây', 13),
(1081, 'Hà Đông', 13),
(1082, 'Cẩm Giang', 13),
(1083, 'Cẩm Giàng', 13),
(1084, 'Tuệ Tĩnh', 13),
(1085, 'Mao Điền', 13),
(1086, 'Kẻ Sặt', 13),
(1087, 'Bình Giang', 13),
(1088, 'Đường An', 13),
(1089, 'Thượng Hồng', 13),
(1090, 'Gia Lộc', 13),
(1091, 'Yết Kiêu', 13),
(1092, 'Gia Phúc', 13),
(1093, 'Trường Tân', 13),
(1094, 'Tứ Kỳ', 13),
(1095, 'Đại Sơn', 13),
(1096, 'Tân Kỳ', 13),
(1097, 'Chí Minh', 13),
(1098, 'Lạc Phượng', 13),
(1099, 'Nguyên Giáp', 13),
(1100, 'Vĩnh Lại', 13),
(1101, 'Tân An', 13),
(1102, 'Ninh Giang', 13),
(1103, 'Hồng Châu', 13),
(1104, 'Khúc Thừa Dụ', 13),
(1105, 'Thanh Miện', 13),
(1106, 'Nguyễn Lương Bằng', 13),
(1107, 'Bắc Thanh Miện', 13),
(1108, 'Hải Hưng', 13),
(1109, 'Nam Thanh Miện', 13),
(1110, 'Việt Khê', 13),
(1111, 'An Lão', 13),
(1112, 'An Trường', 13),
(1113, 'An Quang', 13),
(1114, 'An Khánh', 13),
(1115, 'An Hưng', 13),
(1116, 'Kiến Thụy', 13),
(1117, 'Nghi Dương', 13),
(1118, 'Kiến Minh', 13),
(1119, 'Kiến Hưng', 13),
(1120, 'Kiến Hải', 13),
(1121, 'Tiên Lãng', 13),
(1122, 'Quyết Thắng', 13),
(1123, 'Tân Minh', 13),
(1124, 'Tiên Minh', 13),
(1125, 'Chấn Hưng', 13),
(1126, 'Hùng Thắng', 13),
(1127, 'Vĩnh Bảo', 13),
(1128, 'Vĩnh Thịnh', 13),
(1129, 'Vĩnh Thuận', 13),
(1130, 'Vĩnh Hòa', 13),
(1131, 'Vĩnh Hải', 13),
(1132, 'Vĩnh Am', 13),
(1133, 'Nguyễn Bỉnh Khiêm', 13),
(1134, 'Cát Hải', 13),
(1135, 'Bạch Long Vĩ', 13),
(1136, 'Hàm Rồng', 16),
(1137, 'Hạc Thành', 16),
(1138, 'Bỉm Sơn', 16),
(1139, 'Quang Trung', 16),
(1140, 'Đông Tiến', 16),
(1141, 'Nguyệt Viên', 16),
(1142, 'Đông Sơn', 16),
(1143, 'Đông Quang', 16),
(1144, 'Nam Sầm Sơn', 16),
(1145, 'Quảng Phú', 16),
(1146, 'Sầm Sơn', 16),
(1147, 'Tĩnh Gia', 16),
(1148, 'Ngọc Sơn', 16),
(1149, 'Tân Dân', 16),
(1150, 'Hải Lĩnh', 16),
(1151, 'Đào Duy Từ', 16),
(1152, 'Trúc Lâm', 16),
(1153, 'Hải Bình', 16),
(1154, 'Nghi Sơn', 16),
(1155, 'Mường Lát', 16),
(1156, 'Tam Chung', 16),
(1157, 'Mường Lý', 16),
(1158, 'Trung Lý', 16),
(1159, 'Quang Chiểu', 16),
(1160, 'Pù Nhi', 16),
(1161, 'Nhi Sơn', 16),
(1162, 'Mường Chanh', 16),
(1163, 'Hồi Xuân', 16),
(1164, 'Trung Thành', 16),
(1165, 'Trung Sơn', 16),
(1166, 'Phú Lệ', 16),
(1167, 'Phú Xuân', 16),
(1168, 'Hiền Kiệt', 16),
(1169, 'Nam Xuân', 16),
(1170, 'Thiên Phủ', 16),
(1171, 'Bá Thước', 16),
(1172, 'Điền Quang', 16),
(1173, 'Điền Lư', 16),
(1174, 'Quý Lương', 16),
(1175, 'Pù Luông', 16),
(1176, 'Cổ Lũng', 16),
(1177, 'Văn Nho', 16),
(1178, 'Thiết Ống', 16),
(1179, 'Trung Hạ', 16),
(1180, 'Tam Thanh', 16),
(1181, 'Sơn Thủy', 16),
(1182, 'Na Mèo', 16),
(1183, 'Quan Sơn', 16),
(1184, 'Tam Lư', 16),
(1185, 'Sơn Điện', 16),
(1186, 'Mường Mìn', 16),
(1187, 'Yên Khương', 16),
(1188, 'Yên Thắng', 16),
(1189, 'Giao An', 16),
(1190, 'Văn Phú', 16),
(1191, 'Linh Sơn', 16),
(1192, 'Đồng Lương', 16),
(1193, 'Ngọc Lặc', 16),
(1194, 'Thạch Lập', 16),
(1195, 'Ngọc Liên', 16),
(1196, 'Nguyệt Ấn', 16),
(1197, 'Kiên Thọ', 16),
(1198, 'Minh Sơn', 16),
(1199, 'Cẩm Thủy', 16),
(1200, 'Cẩm Thạch', 16),
(1201, 'Cẩm Tú', 16),
(1202, 'Cẩm Vân', 16),
(1203, 'Cẩm Tân', 16),
(1204, 'Kim Tân', 16),
(1205, 'Vân Du', 16),
(1206, 'Thạch Quảng', 16),
(1207, 'Thạch Bình', 16),
(1208, 'Thành Vinh', 16),
(1209, 'Ngọc Trạo', 16),
(1210, 'Hà Trung', 16),
(1211, 'Hà Long', 16),
(1212, 'Hoạt Giang', 16),
(1213, 'Lĩnh Toại', 16),
(1214, 'Tống Sơn', 16),
(1215, 'Vĩnh Lộc', 16),
(1216, 'Tây Đô', 16),
(1217, 'Biện Thượng', 16),
(1218, 'Yên Phú', 16),
(1219, 'Quý Lộc', 16),
(1220, 'Yên Trường', 16),
(1221, 'Yên Ninh', 16),
(1222, 'Định Hòa', 16),
(1223, 'Định Tân', 16),
(1224, 'Yên Định', 16),
(1225, 'Thọ Xuân', 16),
(1226, 'Thọ Long', 16),
(1227, 'Xuân Hòa', 16),
(1228, 'Lam Sơn', 16),
(1229, 'Sao Vàng', 16),
(1230, 'Thọ Lập', 16),
(1231, 'Xuân Tín', 16),
(1232, 'Xuân Lập', 16),
(1233, 'Bát Mọt', 16),
(1234, 'Yên Nhân', 16),
(1235, 'Vạn Xuân', 16),
(1236, 'Lương Sơn', 16),
(1237, 'Luận Thành', 16),
(1238, 'Thắng Lộc', 16),
(1239, 'Thường Xuân', 16),
(1240, 'Xuân Chinh', 16),
(1241, 'Tân Thành', 16),
(1242, 'Triệu Sơn', 16),
(1243, 'Thọ Bình', 16),
(1244, 'Hợp Tiến', 16),
(1245, 'Tân Ninh', 16),
(1246, 'Đồng Tiến', 16),
(1247, 'Thọ Ngọc', 16),
(1248, 'Thọ Phú', 16),
(1249, 'An Nông', 16),
(1250, 'Thiệu Hóa', 16),
(1251, 'Thiệu Tiến', 16),
(1252, 'Thiệu Quang', 16),
(1253, 'Thiệu Toán', 16),
(1254, 'Thiệu Trung', 16),
(1255, 'Hoằng Hóa', 16),
(1256, 'Hoằng Giang', 16),
(1257, 'Hoằng Phú', 16),
(1258, 'Hoằng Sơn', 16),
(1259, 'Hoằng Lộc', 16),
(1260, 'Hoằng Châu', 16),
(1261, 'Hoằng Tiến', 16),
(1262, 'Hoằng Thanh', 16),
(1263, 'Hậu Lộc', 16),
(1264, 'Triệu Lộc', 16),
(1265, 'Đông Thành', 16),
(1266, 'Hoa Lộc', 16),
(1267, 'Vạn Lộc', 16),
(1268, 'Nga Sơn', 16),
(1269, 'Tân Tiến', 16),
(1270, 'Nga Thắng', 16),
(1271, 'Hồ Vương', 16),
(1272, 'Nga An', 16),
(1273, 'Ba Đình', 16),
(1274, 'Như Xuân', 16),
(1275, 'Xuân Bình', 16),
(1276, 'Hóa Quỳ', 16),
(1277, 'Thanh Phong', 16),
(1278, 'Thanh Quân', 16),
(1279, 'Thượng Ninh', 16),
(1280, 'Như Thanh', 16),
(1281, 'Xuân Du', 16),
(1282, 'Mậu Lâm', 16),
(1283, 'Xuân Thái', 16),
(1284, 'Yên Thọ', 16),
(1285, 'Thanh Kỳ', 16),
(1286, 'Nông Cống', 16),
(1287, 'Trung Chính', 16),
(1288, 'Thắng Lợi', 16),
(1289, 'Thăng Bình', 16),
(1290, 'Trường Văn', 16),
(1291, 'Tượng Lĩnh', 16),
(1292, 'Công Chính', 16),
(1293, 'Lưu Vệ', 16),
(1294, 'Quảng Yên', 16),
(1295, 'Quảng Chính', 16),
(1296, 'Quảng Ngọc', 16),
(1297, 'Quảng Ninh', 16),
(1298, 'Quảng Bình', 16),
(1299, 'Tiên Trang', 16),
(1300, 'Các Sơn', 16),
(1301, 'Trường Lâm', 16),
(1302, 'Hải Vân', 21),
(1303, 'Liên Chiểu', 21),
(1304, 'Hòa Khánh', 21),
(1305, 'Thanh Khê', 21),
(1306, 'Hải Châu', 21),
(1307, 'Hòa Cường', 21),
(1308, 'Cẩm Lệ', 21),
(1309, 'Sơn Trà', 21),
(1310, 'An Hải', 21),
(1311, 'Ngũ Hành Sơn', 21),
(1312, 'An Khê', 21),
(1313, 'Hòa Xuân', 21),
(1314, 'Bàn Thạch', 21),
(1315, 'Tam Kỳ', 21),
(1316, 'Hương Trà', 21),
(1317, 'Quảng Phú', 21),
(1318, 'Hội An Tây', 21),
(1319, 'Hội An', 21),
(1320, 'Hội An Đông', 21),
(1321, 'Điện Bàn', 21),
(1322, 'Điện Bàn Bắc', 21),
(1323, 'An Thắng', 21),
(1324, 'Điện Bàn Đông', 21),
(1325, 'Bà Nà', 21),
(1326, 'Hòa Vang', 21),
(1327, 'Hòa Tiến', 21),
(1328, 'Chiên Đàn', 21),
(1329, 'Tây Hồ', 21),
(1330, 'Phú Ninh', 21),
(1331, 'Tân Hiệp', 21),
(1332, 'Hùng Sơn', 21),
(1333, 'Tây Giang', 21),
(1334, 'Avương', 21),
(1335, 'Đông Giang', 21),
(1336, 'Sông Kôn', 21),
(1337, 'Sông Vàng', 21),
(1338, 'Bến Hiên', 21),
(1339, 'Đại Lộc', 21),
(1340, 'Thượng Đức', 21),
(1341, 'Hà Nha', 21),
(1342, 'Vu Gia', 21),
(1343, 'Phú Thuận', 21),
(1344, 'Điện Bàn Tây', 21),
(1345, 'Gò Nổi', 21),
(1346, 'Nam Phước', 21),
(1347, 'Thu Bồn', 21),
(1348, 'Duy Xuyên', 21),
(1349, 'Duy Nghĩa', 21),
(1350, 'Quế Sơn', 21),
(1351, 'Xuân Phú', 21),
(1352, 'Nông Sơn', 21),
(1353, 'Quế Sơn Trung', 21),
(1354, 'Quế Phước', 21),
(1355, 'Thạnh Mỹ', 21),
(1356, 'La Êê', 21),
(1357, 'La Dêê', 21),
(1358, 'Nam Giang', 21),
(1359, 'Bến Giằng', 21),
(1360, 'Đắc Pring', 21),
(1361, 'Khâm Đức', 21),
(1362, 'Phước Hiệp', 21),
(1363, 'Phước Năng', 21),
(1364, 'Phước Chánh', 21),
(1365, 'Phước Thành', 21),
(1366, 'Việt An', 21),
(1367, 'Phước Trà', 21),
(1368, 'Hiệp Đức', 21),
(1369, 'Thăng Bình', 21),
(1370, 'Thăng An', 21),
(1371, 'Đồng Dương', 21),
(1372, 'Thăng Phú', 21),
(1373, 'Thăng Trường', 21),
(1374, 'Thăng Điền', 21),
(1375, 'Tiên Phước', 21),
(1376, 'Sơn Cẩm Hà', 21),
(1377, 'Lãnh Ngọc', 21),
(1378, 'Thạnh Bình', 21),
(1379, 'Trà My', 21),
(1380, 'Trà Liên', 21),
(1381, 'Trà Đốc', 21),
(1382, 'Trà Tân', 21),
(1383, 'Trà Giáp', 21),
(1384, 'Trà Leng', 21),
(1385, 'Trà Tập', 21),
(1386, 'Nam Trà My', 21),
(1387, 'Trà Linh', 21),
(1388, 'Trà Vân', 21),
(1389, 'Núi Thành', 21),
(1390, 'Tam Xuân', 21),
(1391, 'Đức Phú', 21),
(1392, 'Tam Anh', 21),
(1393, 'Tam Hải', 21),
(1394, 'Tam Mỹ', 21),
(1395, 'Hoàng Sa', 21),
(1396, 'Phú Xuân', 20),
(1397, 'Kim Long', 20),
(1398, 'Vỹ Dạ', 20),
(1399, 'Thuận Hóa', 20),
(1400, 'Hương An', 20),
(1401, 'Thủy Xuân', 20),
(1402, 'An Cựu', 20),
(1403, 'Phong Điền', 20),
(1404, 'Phong Phú', 20),
(1405, 'Phong Dinh', 20),
(1406, 'Phong Thái', 20),
(1407, 'Phong Quảng', 20),
(1408, 'Thuận An', 20),
(1409, 'Dương Nỗ', 20),
(1410, 'Mỹ Thượng', 20),
(1411, 'Phú Bài', 20),
(1412, 'Thanh Thủy', 20),
(1413, 'Hương Thủy', 20),
(1414, 'Hương Trà', 20),
(1415, 'Hóa Châu', 20),
(1416, 'Kim Trà', 20),
(1417, 'Quảng Điền', 20),
(1418, 'Đan Điền', 20),
(1419, 'Phú Hồ', 20),
(1420, 'Phú Vang', 20),
(1421, 'Phú Vinh', 20),
(1422, 'Bình Điền', 20),
(1423, 'A Lưới 2', 20),
(1424, 'A Lưới 5', 20),
(1425, 'A Lưới 1', 20),
(1426, 'A Lưới 3', 20),
(1427, 'A Lưới 4', 20),
(1428, 'Phú Lộc', 20),
(1429, 'Vinh Lộc', 20),
(1430, 'Hưng Lộc', 20),
(1431, 'Chân Mây - Lăng Cô', 20),
(1432, 'Lộc An', 20),
(1433, 'Khe Tre', 20),
(1434, 'Nam Đông', 20),
(1435, 'Long Quảng', 20),
(1436, 'Bắc Nha Trang', 25),
(1437, 'Nha Trang', 25),
(1438, 'Tây Nha Trang', 25),
(1439, 'Nam Nha Trang', 25),
(1440, 'Bắc Cam Ranh', 25),
(1441, 'Cam Ranh', 25),
(1442, 'Ba Ngòi', 25),
(1443, 'Cam Linh', 25),
(1444, 'Ninh Hòa', 25),
(1445, 'Đông Ninh Hòa', 25),
(1446, 'Hòa Thắng', 25),
(1447, 'Đô Vinh', 25),
(1448, 'Bảo An', 25),
(1449, 'Phan Rang', 25),
(1450, 'Đông Hải', 25),
(1451, 'Ninh Chử', 25),
(1452, 'Cam Hiệp', 25),
(1453, 'Cam Lâm', 25),
(1454, 'Cam An', 25),
(1455, 'Nam Cam Ranh', 25),
(1456, 'Vạn Ninh', 25),
(1457, 'Tu Bông', 25),
(1458, 'Đại Lãnh', 25),
(1459, 'Vạn Thắng', 25),
(1460, 'Vạn Hưng', 25),
(1461, 'Bắc Ninh Hòa', 25),
(1462, 'Tây Ninh Hòa', 25),
(1463, 'Hòa Trí', 25),
(1464, 'Tân Định', 25),
(1465, 'Nam Ninh Hòa', 25),
(1466, 'Khánh Vĩnh', 25),
(1467, 'Trung Khánh Vĩnh', 25),
(1468, 'Bắc Khánh Vĩnh', 25),
(1469, 'Tây Khánh Vĩnh', 25),
(1470, 'Nam Khánh Vĩnh', 25),
(1471, 'Diên Khánh', 25),
(1472, 'Diên Điền', 25),
(1473, 'Diên Lâm', 25),
(1474, 'Diên Thọ', 25),
(1475, 'Diên Lạc', 25),
(1476, 'Suối Hiệp', 25),
(1477, 'Suối Dầu', 25),
(1478, 'Khánh Sơn', 25),
(1479, 'Tây Khánh Sơn', 25),
(1480, 'Đông Khánh Sơn', 25),
(1481, 'Bác Ái Tây', 25),
(1482, 'Bác Ái', 25),
(1483, 'Bác Ái Đông', 25),
(1484, 'Ninh Sơn', 25),
(1485, 'Lâm Sơn', 25),
(1486, 'Mỹ Sơn', 25),
(1487, 'Anh Dũng', 25),
(1488, 'Công Hải', 25),
(1489, 'Vĩnh Hải', 25),
(1490, 'Thuận Bắc', 25),
(1491, 'Ninh Hải', 25),
(1492, 'Xuân Hải', 25),
(1493, 'Ninh Phước', 25),
(1494, 'Phước Hậu', 25),
(1495, 'Phước Dinh', 25),
(1496, 'Phước Hữu', 25),
(1497, 'Thuận Nam', 25),
(1498, 'Phước Hà', 25),
(1499, 'Cà Ná', 25),
(1500, 'Trường Sa', 25),
(1501, 'Mũi Né', 26),
(1502, 'Phú Thủy', 26),
(1503, 'Hàm Thắng', 26),
(1504, 'Phan Thiết', 26),
(1505, 'Tiến Thành', 26),
(1506, 'Bình Thuận', 26),
(1507, 'Phước Hội', 26),
(1508, 'La Gi', 26),
(1509, 'Bắc Gia Nghĩa', 26),
(1510, 'Nam Gia Nghĩa', 26),
(1511, 'Đông Gia Nghĩa', 26),
(1512, 'Lâm Viên - Đà Lạt', 26),
(1513, 'Xuân Hương - Đà Lạt', 26),
(1514, 'Cam Ly - Đà Lạt', 26),
(1515, 'Xuân Trường - Đà Lạt', 26),
(1516, '2 Bảo Lộc', 26),
(1517, '1 Bảo Lộc', 26),
(1518, 'B\'Lao', 26),
(1519, '3 Bảo Lộc', 26),
(1520, 'Lang Biang - Đà Lạt', 26),
(1521, 'Tuyên Quang', 26),
(1522, 'Liên Hương', 26),
(1523, 'Phan Rí Cửa', 26),
(1524, 'Tuy Phong', 26),
(1525, 'Vĩnh Hảo', 26),
(1526, 'Bắc Bình', 26),
(1527, 'Phan Sơn', 26),
(1528, 'Hải Ninh', 26),
(1529, 'Sông Lũy', 26),
(1530, 'Lương Sơn', 26),
(1531, 'Hồng Thái', 26),
(1532, 'Hòa Thắng', 26),
(1533, 'Hàm Thuận', 26),
(1534, 'La Dạ', 26),
(1535, 'Đông Giang', 26),
(1536, 'Hồng Sơn', 26),
(1537, 'Hàm Thuận Bắc', 26),
(1538, 'Hàm Liêm', 26),
(1539, 'Hàm Thuận Nam', 26),
(1540, 'Hàm Thạnh', 26),
(1541, 'Hàm Kiệm', 26),
(1542, 'Tân Lập', 26),
(1543, 'Tân Thành', 26),
(1544, 'Tánh Linh', 26),
(1545, 'Bắc Ruộng', 26),
(1546, 'Nghị Đức', 26),
(1547, 'Đồng Kho', 26),
(1548, 'Suối Kiết', 26),
(1549, 'Đức Linh', 26),
(1550, 'Hoài Đức', 26),
(1551, 'Nam Thành', 26),
(1552, 'Trà Tân', 26),
(1553, 'Tân Minh', 26),
(1554, 'Hàm Tân', 26),
(1555, 'Tân Hải', 26),
(1556, 'Sơn Mỹ', 26),
(1557, 'Quảng Sơn', 26),
(1558, 'Quảng Hòa', 26),
(1559, 'Quảng Khê', 26),
(1560, 'Tà Đùng', 26),
(1561, 'Cư Jút', 26),
(1562, 'Đắk Wil', 26),
(1563, 'Nam Dong', 26),
(1564, 'Đức Lập', 26),
(1565, 'Đắk Mil', 26),
(1566, 'Đắk Sắk', 26),
(1567, 'Thuận An', 26),
(1568, 'Krông Nô', 26),
(1569, 'Nam Đà', 26),
(1570, 'Nâm Nung', 26),
(1571, 'Quảng Phú', 26),
(1572, 'Đức An', 26),
(1573, 'Đắk Song', 26),
(1574, 'Thuận Hạnh', 26),
(1575, 'Trường Xuân', 26),
(1576, 'Kiến Đức', 26),
(1577, 'Quảng Trực', 26),
(1578, 'Tuy Đức', 26),
(1579, 'Quảng Tân', 26),
(1580, 'Nhân Cơ', 26),
(1581, 'Quảng Tín', 26),
(1582, 'Lạc Dương', 26),
(1583, 'Đam Rông 4', 26),
(1584, 'Nam Ban Lâm Hà', 26),
(1585, 'Đinh Văn Lâm Hà', 26),
(1586, 'Đam Rông 3', 26),
(1587, 'Đam Rông 2', 26),
(1588, 'Nam Hà Lâm Hà', 26),
(1589, 'Đam Rông 1', 26),
(1590, 'Phú Sơn Lâm Hà', 26),
(1591, 'Phúc Thọ Lâm Hà', 26),
(1592, 'Tân Hà Lâm Hà', 26),
(1593, 'Đơn Dương', 26),
(1594, 'D\'Ran', 26),
(1595, 'Ka Đô', 26),
(1596, 'Quảng Lập', 26),
(1597, 'Đức Trọng', 26),
(1598, 'Hiệp Thạnh', 26),
(1599, 'Tân Hội', 26),
(1600, 'Ninh Gia', 26),
(1601, 'Tà Năng', 26),
(1602, 'Tà Hine', 26),
(1603, 'Di Linh', 26),
(1604, 'Đinh Trang Thượng', 26),
(1605, 'Gia Hiệp', 26),
(1606, 'Bảo Thuận', 26),
(1607, 'Hòa Ninh', 26),
(1608, 'Hòa Bắc', 26),
(1609, 'Sơn Điền', 26),
(1610, 'Bảo Lâm 1', 26),
(1611, 'Bảo Lâm 5', 26),
(1612, 'Bảo Lâm 4', 26),
(1613, 'Bảo Lâm 2', 26),
(1614, 'Bảo Lâm 3', 26),
(1615, 'Đạ Huoai', 26),
(1616, 'Đạ Huoai 2', 26),
(1617, 'Đạ Huoai 3', 26),
(1618, 'Đạ Tẻh', 26),
(1619, 'Đạ Tẻh 3', 26),
(1620, 'Đạ Tẻh 2', 26),
(1621, 'Cát Tiên', 26),
(1622, 'Cát Tiên 3', 26),
(1623, 'Cát Tiên 2', 26),
(1624, 'Phú Quý', 26),
(1625, 'Bình Phước', 27),
(1626, 'Đồng Xoài', 27),
(1627, 'Phước Long', 27),
(1628, 'Phước Bình', 27),
(1629, 'Bình Long', 27),
(1630, 'An Lộc', 27),
(1631, 'Chơn Thành', 27),
(1632, 'Minh Hưng', 27),
(1633, 'Trảng Dài', 27),
(1634, 'Hố Nai', 27),
(1635, 'Tam Hiệp', 27),
(1636, 'Long Bình', 27),
(1637, 'Trấn Biên', 27),
(1638, 'Biên Hòa', 27),
(1639, 'Long Khánh', 27),
(1640, 'Bình Lộc', 27),
(1641, 'Bảo Vinh', 27),
(1642, 'Xuân Lập', 27),
(1643, 'Hàng Gòn', 27),
(1644, 'Tân Triều', 27),
(1645, 'Tam Phước', 27),
(1646, 'Phước Tân', 27),
(1647, 'Long Hưng', 27),
(1648, 'Bù Gia Mập', 27),
(1649, 'Đăk Ơ', 27),
(1650, 'Đa Kia', 27),
(1651, 'Bình Tân', 27),
(1652, 'Phú Riềng', 27),
(1653, 'Long Hà', 27),
(1654, 'Phú Trung', 27),
(1655, 'Phú Nghĩa', 27),
(1656, 'Lộc Ninh', 27),
(1657, 'Lộc Tấn', 27),
(1658, 'Lộc Thạnh', 27),
(1659, 'Lộc Quang', 27),
(1660, 'Lộc Thành', 27),
(1661, 'Lộc Hưng', 27),
(1662, 'Thiện Hưng', 27),
(1663, 'Hưng Phước', 27),
(1664, 'Tân Tiến', 27),
(1665, 'Tân Hưng', 27),
(1666, 'Minh Đức', 27),
(1667, 'Tân Quan', 27),
(1668, 'Tân Khai', 27),
(1669, 'Đồng Phú', 27),
(1670, 'Tân Lợi', 27),
(1671, 'Thuận Lợi', 27),
(1672, 'Đồng Tâm', 27),
(1673, 'Bù Đăng', 27),
(1674, 'Đak Nhau', 27),
(1675, 'Thọ Sơn', 27),
(1676, 'Bom Bo', 27),
(1677, 'Nghĩa Trung', 27),
(1678, 'Phước Sơn', 27),
(1679, 'Nha Bích', 27),
(1680, 'Tân Phú', 27),
(1681, 'Đak Lua', 27),
(1682, 'Nam Cát Tiên', 27),
(1683, 'Tà Lài', 27),
(1684, 'Phú Lâm', 27),
(1685, 'Trị An', 27),
(1686, 'Phú Lý', 27),
(1687, 'Tân An', 27),
(1688, 'Định Quán', 27),
(1689, 'Thanh Sơn', 27),
(1690, 'Phú Vinh', 27),
(1691, 'Phú Hòa', 27),
(1692, 'La Ngà', 27),
(1693, 'Trảng Bom', 27),
(1694, 'Bàu Hàm', 27),
(1695, 'Bình Minh', 27),
(1696, 'Hưng Thịnh', 27),
(1697, 'An Viễn', 27),
(1698, 'Thống Nhất', 27),
(1699, 'Gia Kiệm', 27),
(1700, 'Dầu Giây', 27),
(1701, 'Xuân Quế', 27),
(1702, 'Cẩm Mỹ', 27),
(1703, 'Xuân Đường', 27),
(1704, 'Xuân Đông', 27),
(1705, 'Sông Ray', 27),
(1706, 'Long Thành', 27),
(1707, 'An Phước', 27),
(1708, 'Bình An', 27),
(1709, 'Long Phước', 27),
(1710, 'Phước Thái', 27),
(1711, 'Xuân Lộc', 27),
(1712, 'Xuân Bắc', 27),
(1713, 'Xuân Thành', 27),
(1714, 'Xuân Hòa', 27),
(1715, 'Xuân Phú', 27),
(1716, 'Xuân Định', 27),
(1717, 'Nhơn Trạch', 27),
(1718, 'Đại Phước', 27),
(1719, 'Phước An', 27),
(1720, 'Tân Ninh', 28),
(1721, 'Bình Minh', 28),
(1722, 'Ninh Thạnh', 28),
(1723, 'Long Hoa', 28),
(1724, 'Thanh Điền', 28),
(1725, 'Hòa Thành', 28),
(1726, 'Gò Dầu', 28),
(1727, 'Gia Lộc', 28),
(1728, 'Trảng Bàng', 28),
(1729, 'An Tịnh', 28),
(1730, 'Long An', 28),
(1731, 'Tân An', 28),
(1732, 'Khánh Hậu', 28),
(1733, 'Kiến Tường', 28),
(1734, 'Tân Biên', 28),
(1735, 'Tân Lập', 28),
(1736, 'Thạnh Bình', 28),
(1737, 'Trà Vong', 28),
(1738, 'Tân Châu', 28),
(1739, 'Tân Đông', 28),
(1740, 'Tân Hội', 28),
(1741, 'Tân Hòa', 28),
(1742, 'Tân Thành', 28),
(1743, 'Tân Phú', 28),
(1744, 'Dương Minh Châu', 28),
(1745, 'Cầu Khởi', 28),
(1746, 'Lộc Ninh', 28),
(1747, 'Châu Thành', 28),
(1748, 'Hảo Đước', 28),
(1749, 'Phước Vinh', 28),
(1750, 'Hòa Hội', 28),
(1751, 'Ninh Điền', 28),
(1752, 'Thạnh Đức', 28),
(1753, 'Phước Thạnh', 28),
(1754, 'Truông Mít', 28),
(1755, 'Bến Cầu', 28),
(1756, 'Long Chữ', 28),
(1757, 'Long Thuận', 28),
(1758, 'Hưng Thuận', 28),
(1759, 'Phước Chỉ', 28),
(1760, 'Tân Hưng', 28),
(1761, 'Hưng Điền', 28),
(1762, 'Vĩnh Thạnh', 28),
(1763, 'Vĩnh Châu', 28),
(1764, 'Vĩnh Hưng', 28),
(1765, 'Khánh Hưng', 28),
(1766, 'Tuyên Bình', 28),
(1767, 'Bình Hiệp', 28),
(1768, 'Bình Hòa', 28),
(1769, 'Tuyên Thạnh', 28),
(1770, 'Mộc Hóa', 28),
(1771, 'Tân Thạnh', 28),
(1772, 'Nhơn Hòa Lập', 28),
(1773, 'Hậu Thạnh', 28),
(1774, 'Nhơn Ninh', 28),
(1775, 'Thạnh Hóa', 28),
(1776, 'Bình Thành', 28),
(1777, 'Thạnh Phước', 28),
(1778, 'Tân Tây', 28),
(1779, 'Đông Thành', 28),
(1780, 'Mỹ Quý', 28),
(1781, 'Đức Huệ', 28),
(1782, 'Hậu Nghĩa', 28),
(1783, 'Đức Hòa', 28),
(1784, 'An Ninh', 28),
(1785, 'Hiệp Hòa', 28),
(1786, 'Đức Lập', 28),
(1787, 'Mỹ Hạnh', 28),
(1788, 'Hòa Khánh', 28),
(1789, 'Bến Lức', 28),
(1790, 'Thạnh Lợi', 28),
(1791, 'Lương Hòa', 28),
(1792, 'Bình Đức', 28),
(1793, 'Mỹ Yên', 28),
(1794, 'Thủ Thừa', 28),
(1795, 'Mỹ Thạnh', 28),
(1796, 'Mỹ An', 28),
(1797, 'Tân Long', 28),
(1798, 'Tân Trụ', 28),
(1799, 'Nhựt Tảo', 28),
(1800, 'Vàm Cỏ', 28),
(1801, 'Cần Đước', 28),
(1802, 'Rạch Kiến', 28),
(1803, 'Long Cang', 28),
(1804, 'Mỹ Lệ', 28),
(1805, 'Tân Lân', 28),
(1806, 'Long Hựu', 28),
(1807, 'Cần Giuộc', 28),
(1808, 'Phước Lý', 28),
(1809, 'Mỹ Lộc', 28),
(1810, 'An Phước', 28),
(1811, 'Phước Vĩnh Tây', 28),
(1812, 'Tân Tập', 28),
(1813, 'Tầm Vu', 28),
(1814, 'Vĩnh Công', 28),
(1815, 'Thuận Mỹ', 28),
(1816, 'An Lục Long', 28),
(1817, 'Thủ Dầu Một', 29),
(1818, 'Phú Lợi', 29),
(1819, 'Bình Dương', 29),
(1820, 'Phú An', 29),
(1821, 'Chánh Hiệp', 29),
(1822, 'Bến Cát', 29),
(1823, 'Chánh Phú Hòa', 29),
(1824, 'Long Nguyên', 29),
(1825, 'Tây Nam', 29),
(1826, 'Thới Hòa', 29),
(1827, 'Hòa Lợi', 29),
(1828, 'Tân Uyên', 29),
(1829, 'Tân Khánh', 29),
(1830, 'Vĩnh Tân', 29),
(1831, 'Bình Cơ', 29),
(1832, 'Tân Hiệp', 29),
(1833, 'Dĩ An', 29),
(1834, 'Tân Đông Hiệp', 29),
(1835, 'Đông Hòa', 29),
(1836, 'Lái Thiêu', 29),
(1837, 'Thuận Giao', 29),
(1838, 'An Phú', 29),
(1839, 'Thuận An', 29),
(1840, 'Bình Hòa', 29),
(1841, 'Vũng Tàu', 29),
(1842, 'Tam Thắng', 29),
(1843, 'Rạch Dừa', 29),
(1844, 'Phước Thắng', 29),
(1845, 'Bà Rịa', 29),
(1846, 'Long Hương', 29),
(1847, 'Tam Long', 29),
(1848, 'Phú Mỹ', 29),
(1849, 'Tân Hải', 29),
(1850, 'Tân Phước', 29),
(1851, 'Tân Thành', 29),
(1852, 'Tân Định', 29),
(1853, 'Sài Gòn', 29),
(1854, 'Bến Thành', 29),
(1855, 'Cầu Ông Lãnh', 29),
(1856, 'An Phú Đông', 29),
(1857, 'Thới An', 29),
(1858, 'Tân Thới Hiệp', 29),
(1859, 'Trung Mỹ Tây', 29),
(1860, 'Đông Hưng Thuận', 29),
(1861, 'Linh Xuân', 29),
(1862, 'Tam Bình', 29),
(1863, 'Hiệp Bình', 29),
(1864, 'Thủ Đức', 29),
(1865, 'Long Bình', 29),
(1866, 'Tăng Nhơn Phú', 29),
(1867, 'Phước Long', 29),
(1868, 'Long Phước', 29),
(1869, 'Long Trường', 29),
(1870, 'An Nhơn', 29),
(1871, 'An Hội Đông', 29),
(1872, 'An Hội Tây', 29),
(1873, 'Gò Vấp', 29),
(1874, 'Hạnh Thông', 29),
(1875, 'Thông Tây Hội', 29),
(1876, 'Bình Lợi Trung', 29),
(1877, 'Bình Quới', 29),
(1878, 'Bình Thạnh', 29),
(1879, 'Gia Định', 29),
(1880, 'Thạnh Mỹ Tây', 29),
(1881, 'Tân Sơn Nhất', 29),
(1882, 'Tân Sơn Hòa', 29),
(1883, 'Bảy Hiền', 29),
(1884, 'Tân Hòa', 29),
(1885, 'Tân Bình', 29),
(1886, 'Tân Sơn', 29),
(1887, 'Tây Thạnh', 29),
(1888, 'Tân Sơn Nhì', 29),
(1889, 'Phú Thọ Hòa', 29),
(1890, 'Phú Thạnh', 29),
(1891, 'Tân Phú', 29),
(1892, 'Đức Nhuận', 29),
(1893, 'Cầu Kiệu', 29),
(1894, 'Phú Nhuận', 29),
(1895, 'An Khánh', 29),
(1896, 'Bình Trưng', 29),
(1897, 'Cát Lái', 29),
(1898, 'Xuân Hòa', 29),
(1899, 'Nhiêu Lộc', 29),
(1900, 'Bàn Cờ', 29),
(1901, 'Hòa Hưng', 29),
(1902, 'Diên Hồng', 29),
(1903, 'Vườn Lài', 29),
(1904, 'Hòa Bình', 29),
(1905, 'Phú Thọ', 29),
(1906, 'Bình Thới', 29),
(1907, 'Minh Phụng', 29),
(1908, 'Xóm Chiếu', 29),
(1909, 'Khánh Hội', 29),
(1910, 'Vĩnh Hội', 29),
(1911, 'Chợ Quán', 29),
(1912, 'An Đông', 29),
(1913, 'Chợ Lớn', 29),
(1914, 'Phú Lâm', 29),
(1915, 'Bình Phú', 29),
(1916, 'Bình Tây', 29),
(1917, 'Bình Tiên', 29),
(1918, 'Chánh Hưng', 29),
(1919, 'Bình Đông', 29),
(1920, 'Phú Định', 29),
(1921, 'Bình Hưng Hòa', 29),
(1922, 'Bình Tân', 29),
(1923, 'Bình Trị Đông', 29),
(1924, 'Tân Tạo', 29),
(1925, 'An Lạc', 29),
(1926, 'Tân Hưng', 29),
(1927, 'Tân Thuận', 29),
(1928, 'Phú Thuận', 29),
(1929, 'Tân Mỹ', 29),
(1930, 'Dầu Tiếng', 29),
(1931, 'Minh Thạnh', 29),
(1932, 'Long Hòa', 29),
(1933, 'Thanh An', 29),
(1934, 'Trừ Văn Thố', 29),
(1935, 'Bàu Bàng', 29),
(1936, 'Phú Giáo', 29),
(1937, 'Phước Thành', 29),
(1938, 'An Long', 29),
(1939, 'Phước Hòa', 29),
(1940, 'Bắc Tân Uyên', 29),
(1941, 'Thường Tân', 29),
(1942, 'Long Sơn', 29),
(1943, 'Ngãi Giao', 29),
(1944, 'Xuân Sơn', 29),
(1945, 'Bình Giã', 29),
(1946, 'Châu Đức', 29),
(1947, 'Kim Long', 29),
(1948, 'Nghĩa Thành', 29),
(1949, 'Hồ Tràm', 29),
(1950, 'Xuyên Mộc', 29),
(1951, 'Bàu Lâm', 29),
(1952, 'Hòa Hội', 29),
(1953, 'Hòa Hiệp', 29),
(1954, 'Bình Châu', 29),
(1955, 'Long Điền', 29),
(1956, 'Long Hải', 29),
(1957, 'Đất Đỏ', 29),
(1958, 'Phước Hải', 29),
(1959, 'Châu Pha', 29),
(1960, 'Tân An Hội', 29),
(1961, 'An Nhơn Tây', 29),
(1962, 'Nhuận Đức', 29),
(1963, 'Thái Mỹ', 29),
(1964, 'Phú Hòa Đông', 29),
(1965, 'Bình Mỹ', 29),
(1966, 'Củ Chi', 29),
(1967, 'Hóc Môn', 29),
(1968, 'Đông Thạnh', 29),
(1969, 'Xuân Thới Sơn', 29),
(1970, 'Bà Điểm', 29),
(1971, 'Tân Nhựt', 29),
(1972, 'Vĩnh Lộc', 29),
(1973, 'Tân Vĩnh Lộc', 29),
(1974, 'Bình Lợi', 29),
(1975, 'Bình Hưng', 29),
(1976, 'Hưng Long', 29),
(1977, 'Bình Chánh', 29),
(1978, 'Nhà Bè', 29),
(1979, 'Hiệp Phước', 29),
(1980, 'Cần Giờ', 29),
(1981, 'Bình Khánh', 29),
(1982, 'An Thới Đông', 29),
(1983, 'Thạnh An', 29),
(1984, 'Côn Đảo', 29),
(1985, 'Cái Khế', 33),
(1986, 'Ninh Kiều', 33),
(1987, 'Tân An', 33),
(1988, 'An Bình', 33),
(1989, 'Ô Môn', 33),
(1990, 'Thới Long', 33),
(1991, 'Phước Thới', 33),
(1992, 'Bình Thủy', 33),
(1993, 'Thới An Đông', 33),
(1994, 'Long Tuyền', 33),
(1995, 'Cái Răng', 33),
(1996, 'Hưng Phú', 33),
(1997, 'Thốt Nốt', 33),
(1998, 'Tân Lộc', 33),
(1999, 'Trung Nhứt', 33),
(2000, 'Thuận Hưng', 33),
(2001, 'Vị Thanh', 33),
(2002, 'Vị Tân', 33),
(2003, 'Ngã Bảy', 33),
(2004, 'Đại Thành', 33),
(2005, 'Long Mỹ', 33),
(2006, 'Long Bình', 33),
(2007, 'Long Phú 1', 33),
(2008, 'Sóc Trăng', 33),
(2009, 'Phú Lợi', 33),
(2010, 'Mỹ Xuyên', 33),
(2011, 'Ngã Năm', 33),
(2012, 'Mỹ Quới', 33),
(2013, 'Vĩnh Châu', 33),
(2014, 'Khánh Hòa', 33),
(2015, 'Vĩnh Phước', 33),
(2016, 'Thạnh An', 33),
(2017, 'Vĩnh Thạnh', 33),
(2018, 'Vĩnh Trinh', 33),
(2019, 'Thạnh Quới', 33),
(2020, 'Thạnh Phú', 33),
(2021, 'Trung Hưng', 33),
(2022, 'Thới Lai', 33),
(2023, 'Cờ Đỏ', 33),
(2024, 'Thới Hưng', 33),
(2025, 'Đông Hiệp', 33),
(2026, 'Đông Thuận', 33),
(2027, 'Trường Thành', 33),
(2028, 'Trường Xuân', 33),
(2029, 'Phong Điền', 33),
(2030, 'Trường Long', 33),
(2031, 'Nhơn Ái', 33),
(2032, 'Hỏa Lựu', 33),
(2033, 'Tân Hòa', 33),
(2034, 'Trường Long Tây', 33),
(2035, 'Thạnh Xuân', 33),
(2036, 'Châu Thành', 33),
(2037, 'Đông Phước', 33),
(2038, 'Phú Hữu', 33),
(2039, 'Hòa An', 33),
(2040, 'Hiệp Hưng', 33),
(2041, 'Tân Bình', 33),
(2042, 'Thạnh Hòa', 33),
(2043, 'Phụng Hiệp', 33),
(2044, 'Phương Bình', 33),
(2045, 'Tân Phước Hưng', 33),
(2046, 'Vị Thủy', 33),
(2047, 'Vĩnh Thuận Đông', 33),
(2048, 'Vĩnh Tường', 33),
(2049, 'Vị Thanh 1', 33),
(2050, 'Vĩnh Viễn', 33),
(2051, 'Lương Tâm', 33),
(2052, 'Xà Phiên', 33),
(2053, 'Kế Sách', 33),
(2054, 'An Lạc Thôn', 33),
(2055, 'Phong Nẫm', 33),
(2056, 'Thới An Hội', 33),
(2057, 'Nhơn Mỹ', 33),
(2058, 'Đại Hải', 33),
(2059, 'Mỹ Tú', 33),
(2060, 'Phú Tâm', 33),
(2061, 'Hồ Đắc Kiện', 33),
(2062, 'Long Hưng', 33),
(2063, 'Thuận Hòa', 33),
(2064, 'Mỹ Hương', 33),
(2065, 'An Ninh', 33),
(2066, 'Mỹ Phước', 33),
(2067, 'An Thạnh', 33),
(2068, 'Cù Lao Dung', 33),
(2069, 'Long Phú', 33),
(2070, 'Đại Ngãi', 33),
(2071, 'Trường Khánh', 33),
(2072, 'Tân Thạnh', 33),
(2073, 'Trần Đề', 33),
(2074, 'Liêu Tú', 33),
(2075, 'Lịch Hội Thượng', 33),
(2076, 'Tài Văn', 33),
(2077, 'Thạnh Thới An', 33),
(2078, 'Nhu Gia', 33),
(2079, 'Hòa Tú', 33),
(2080, 'Ngọc Tố', 33),
(2081, 'Gia Hòa', 33),
(2082, 'Tân Long', 33),
(2083, 'Phú Lộc', 33),
(2084, 'Lâm Tân', 33),
(2085, 'Vĩnh Lợi', 33),
(2086, 'Vĩnh Hải', 33),
(2087, 'Lai Hòa', 33),
(2088, 'Bạc Liêu', 34),
(2089, 'Vĩnh Trạch', 34),
(2090, 'Hiệp Thành', 34),
(2091, 'Giá Rai', 34),
(2092, 'Láng Tròn', 34),
(2093, 'An Xuyên', 34),
(2094, 'Lý Văn Lâm', 34),
(2095, 'Tân Thành', 34),
(2096, 'Hòa Thành', 34),
(2097, 'Hồng Dân', 34),
(2098, 'Ninh Quới', 34),
(2099, 'Vĩnh Lộc', 34),
(2100, 'Ninh Thạnh Lợi', 34),
(2101, 'Phước Long', 34),
(2102, 'Vĩnh Phước', 34),
(2103, 'Vĩnh Thanh', 34),
(2104, 'Phong Hiệp', 34),
(2105, 'Hòa Bình', 34),
(2106, 'Châu Thới', 34),
(2107, 'Vĩnh Lợi', 34),
(2108, 'Hưng Hội', 34),
(2109, 'Vĩnh Mỹ', 34),
(2110, 'Vĩnh Hậu', 34),
(2111, 'Phong Thạnh', 34),
(2112, 'Gành Hào', 34),
(2113, 'Đông Hải', 34),
(2114, 'Long Điền', 34),
(2115, 'An Trạch', 34),
(2116, 'Định Thành', 34),
(2117, 'Nguyễn Phích', 34),
(2118, 'U Minh', 34),
(2119, 'Khánh An', 34),
(2120, 'Khánh Lâm', 34),
(2121, 'Thới Bình', 34),
(2122, 'Biển Bạch', 34),
(2123, 'Trí Phải', 34),
(2124, 'Tân Lộc', 34),
(2125, 'Hồ Thị Kỷ', 34),
(2126, 'Trần Văn Thời', 34),
(2127, 'Sông Đốc', 34),
(2128, 'Đá Bạc', 34),
(2129, 'Khánh Bình', 34),
(2130, 'Khánh Hưng', 34),
(2131, 'Cái Nước', 34),
(2132, 'Lương Thế Trân', 34),
(2133, 'Tân Hưng', 34),
(2134, 'Hưng Mỹ', 34),
(2135, 'Đầm Dơi', 34),
(2136, 'Tạ An Khương', 34),
(2137, 'Trần Phán', 34),
(2138, 'Tân Thuận', 34),
(2139, 'Quách Phẩm', 34),
(2140, 'Thanh Tùng', 34),
(2141, 'Tân Tiến', 34),
(2142, 'Năm Căn', 34),
(2143, 'Đất Mới', 34),
(2144, 'Tam Giang', 34),
(2145, 'Cái Đôi Vàm', 34),
(2146, 'Phú Mỹ', 34),
(2147, 'Phú Tân', 34),
(2148, 'Nguyễn Việt Khái', 34),
(2149, 'Tân Ân', 34),
(2150, 'Phan Ngọc Hiển', 34),
(2151, 'Đất Mũi', 34),
(2152, 'Phú Khương', 32),
(2153, 'An Hội', 32),
(2154, 'Sơn Đông', 32),
(2155, 'Bến Tre', 32),
(2156, 'Phú Tân', 32),
(2157, 'Trà Vinh', 32),
(2158, 'Nguyệt Hóa', 32),
(2159, 'Long Đức', 32),
(2160, 'Hòa Thuận', 32),
(2161, 'Duyên Hải', 32),
(2162, 'Trường Long Hòa', 32),
(2163, 'Long Châu', 32),
(2164, 'Phước Hậu', 32),
(2165, 'Tân Ngãi', 32),
(2166, 'Thanh Đức', 32),
(2167, 'Tân Hạnh', 32),
(2168, 'Cái Vồn', 32),
(2169, 'Bình Minh', 32),
(2170, 'Đông Thành', 32),
(2171, 'Giao Long', 32),
(2172, 'Phú Túc', 32),
(2173, 'Tân Phú', 32),
(2174, 'Tiên Thủy', 32),
(2175, 'Chợ Lách', 32),
(2176, 'Phú Phụng', 32),
(2177, 'Vĩnh Thành', 32),
(2178, 'Hưng Khánh Trung', 32),
(2179, 'Mỏ Cày', 32),
(2180, 'Phước Mỹ Trung', 32),
(2181, 'Tân Thành Bình', 32),
(2182, 'Đồng Khởi', 32),
(2183, 'Nhuận Phú Tân', 32),
(2184, 'An Định', 32),
(2185, 'Thành Thới', 32),
(2186, 'Hương Mỹ', 32),
(2187, 'Giồng Trôm', 32),
(2188, 'Lương Hòa', 32),
(2189, 'Lương Phú', 32),
(2190, 'Châu Hòa', 32),
(2191, 'Phước Long', 32),
(2192, 'Tân Hào', 32),
(2193, 'Hưng Nhượng', 32),
(2194, 'Bình Đại', 32),
(2195, 'Phú Thuận', 32),
(2196, 'Lộc Thuận', 32),
(2197, 'Châu Hưng', 32),
(2198, 'Thạnh Trị', 32),
(2199, 'Thạnh Phước', 32),
(2200, 'Thới Thuận', 32),
(2201, 'Ba Tri', 32),
(2202, 'Mỹ Chánh Hòa', 32),
(2203, 'Bảo Thạnh', 32),
(2204, 'Tân Xuân', 32),
(2205, 'An Ngãi Trung', 32),
(2206, 'An Hiệp', 32),
(2207, 'Tân Thủy', 32),
(2208, 'Thạnh Phú', 32),
(2209, 'Quới Điền', 32),
(2210, 'Đại Điền', 32),
(2211, 'Thạnh Hải', 32),
(2212, 'An Qui', 32),
(2213, 'Thạnh Phong', 32),
(2214, 'Càng Long', 32),
(2215, 'An Trường', 32),
(2216, 'Tân An', 32),
(2217, 'Bình Phú', 32),
(2218, 'Nhị Long', 32),
(2219, 'Cầu Kè', 32),
(2220, 'An Phú Tân', 32),
(2221, 'Phong Thạnh', 32),
(2222, 'Tam Ngãi', 32),
(2223, 'Tiểu Cần', 32),
(2224, 'Hùng Hòa', 32),
(2225, 'Tập Ngãi', 32),
(2226, 'Tân Hòa', 32),
(2227, 'Châu Thành', 32),
(2228, 'Song Lộc', 32),
(2229, 'Hưng Mỹ', 32),
(2230, 'Hòa Minh', 32),
(2231, 'Long Hòa', 32),
(2232, 'Cầu Ngang', 32),
(2233, 'Mỹ Long', 32),
(2234, 'Vinh Kim', 32),
(2235, 'Nhị Trường', 32),
(2236, 'Hiệp Mỹ', 32),
(2237, 'Trà Cú', 32),
(2238, 'Tập Sơn', 32),
(2239, 'Lưu Nghiệp Anh', 32),
(2240, 'Hàm Giang', 32),
(2241, 'Đại An', 32),
(2242, 'Đôn Châu', 32),
(2243, 'Long Hiệp', 32),
(2244, 'Long Thành', 32),
(2245, 'Long Hữu', 32),
(2246, 'Ngũ Lạc', 32),
(2247, 'Long Vĩnh', 32),
(2248, 'Đông Hải', 32),
(2249, 'An Bình', 32),
(2250, 'Long Hồ', 32),
(2251, 'Phú Quới', 32),
(2252, 'Nhơn Phú', 32),
(2253, 'Bình Phước', 32),
(2254, 'Cái Nhum', 32),
(2255, 'Tân Long Hội', 32),
(2256, 'Trung Thành', 32),
(2257, 'Quới An', 32),
(2258, 'Quới Thiện', 32),
(2259, 'Trung Hiệp', 32),
(2260, 'Trung Ngãi', 32),
(2261, 'Hiếu Phụng', 32),
(2262, 'Hiếu Thành', 32),
(2263, 'Tam Bình', 32),
(2264, 'Cái Ngang', 32),
(2265, 'Hòa Hiệp', 32),
(2266, 'Song Phú', 32),
(2267, 'Ngãi Tứ', 32),
(2268, 'Tân Lược', 32),
(2269, 'Mỹ Thuận', 32),
(2270, 'Tân Quới', 32),
(2271, 'Trà Ôn', 32),
(2272, 'Hòa Bình', 32),
(2273, 'Trà Côn', 32),
(2274, 'Vĩnh Xuân', 32),
(2275, 'Lục Sĩ Thành', 32);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `company_id` bigint DEFAULT NULL,
  `job_id` bigint DEFAULT NULL,
  `application_id` bigint DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `read_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`notification_id`, `user_id`, `type`, `title`, `message`, `link`, `company_id`, `job_id`, `application_id`, `created_at`, `read_at`) VALUES
(1, 2, 'APPLICATION_STATUS', 'Hồ sơ được xem', 'AI Tech đã xem hồ sơ của bạn cho vị trí Lập trình viên Java', '/applications/1', 1, 1, NULL, '2025-10-29 13:40:52', NULL),
(2, 2, 'NEW_JOB', 'Việc làm mới phù hợp', 'Có việc làm Frontend Developer mới tại AI Tech', '/jobs/4', 1, 4, NULL, '2025-10-28 13:40:52', NULL),
(3, 3, 'INTERVIEW_SCHEDULED', 'Lịch phỏng vấn', 'ERP Việt Nam mời bạn phỏng vấn vào 10:00 ngày mai', '/interviews/1', 2, 2, NULL, '2025-10-29 13:40:52', NULL),
(4, 3, 'APPLICATION_ACCEPTED', 'Hồ sơ được chấp nhận', 'Chúc mừng! Bạn đã được chấp nhận cho vị trí Marketing', '/applications/3', 2, 2, NULL, '2025-10-29 11:40:52', NULL),
(5, 6, 'APPLICATION_REJECTED', 'Hồ sơ không phù hợp', 'Rất tiếc, AI Tech đã chọn ứng viên khác cho vị trí Java', '/applications/5', 1, 1, NULL, '2025-10-24 13:40:52', NULL),
(6, 6, 'NEW_JOB', 'Việc làm mới', 'E-Learning VN đang tuyển giáo viên tiếng Anh', '/jobs/7', 5, 7, NULL, '2025-10-26 13:40:52', NULL),
(7, 4, 'NEW_APPLICATION', 'Đơn ứng tuyển mới', 'Có 3 đơn ứng tuyển mới cho vị trí Java Developer', '/recruiter/applications', 1, 1, NULL, '2025-10-29 13:40:52', NULL),
(8, 5, 'NEW_APPLICATION', 'Đơn ứng tuyển mới', 'Ngô Văn E đã ứng tuyển vào vị trí Giáo viên tiếng Anh', '/recruiter/applications', 5, 7, NULL, '2025-10-29 12:40:52', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `packages`
--

CREATE TABLE `packages` (
  `package_id` bigint NOT NULL,
  `code` varchar(50) NOT NULL,
  `name` varchar(120) NOT NULL,
  `type` varchar(50) DEFAULT 'VIP',
  `duration_days` int NOT NULL DEFAULT '30',
  `price_vnd` bigint NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `packages`
--

INSERT INTO `packages` (`package_id`, `code`, `name`, `type`, `duration_days`, `price_vnd`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'VIP_1M', 'VIP 1 Month', 'VIP', 30, 100000, 1, '2025-10-28 15:01:25', '2025-10-28 15:01:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `payments`
--

CREATE TABLE `payments` (
  `payment_id` bigint NOT NULL,
  `company_id` bigint NOT NULL,
  `package_id` bigint DEFAULT NULL,
  `amount_vnd` bigint NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'VND',
  `status` enum('PENDING','REQUIRES_ACTION','PAID','FAILED','REFUNDED','PARTIALLY_REFUNDED','CHARGEBACK') NOT NULL DEFAULT 'PENDING',
  `provider` varchar(32) NOT NULL,
  `method` varchar(32) DEFAULT NULL,
  `txn_ref` varchar(64) NOT NULL,
  `provider_txn` varchar(128) DEFAULT NULL,
  `provider_order_id` varchar(128) DEFAULT NULL,
  `metadata_json` json DEFAULT NULL,
  `paid_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `payments`
--

INSERT INTO `payments` (`payment_id`, `company_id`, `package_id`, `amount_vnd`, `currency`, `status`, `provider`, `method`, `txn_ref`, `provider_txn`, `provider_order_id`, `metadata_json`, `paid_at`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 4800000, 'VND', 'PAID', 'VNPAY', 'QR', 'TXN202501010001', 'VNPAY20250101123456', NULL, NULL, '2025-01-01 14:30:00', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(2, 2, 2, 1350000, 'VND', 'PAID', 'MOMO', 'WALLET', 'TXN202501050002', 'MOMO20250105234567', NULL, NULL, '2025-01-05 09:15:00', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(3, 3, 1, 500000, 'VND', 'PAID', 'VNPAY', 'CARD', 'TXN202501100003', 'VNPAY20250110345678', NULL, NULL, '2025-01-10 16:45:00', '2025-10-29 13:40:52', '2025-10-29 13:40:52'),
(4, 4, 3, 2550000, 'VND', 'PENDING', 'VNPAY', 'QR', 'TXN202501150004', NULL, NULL, NULL, NULL, '2025-10-29 13:40:52', '2025-10-29 13:40:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reports`
--

CREATE TABLE `reports` (
  `report_id` int NOT NULL,
  `report_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `reported_content_id` int NOT NULL,
  `status` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `reports`
--

INSERT INTO `reports` (`report_id`, `report_type_id`, `user_id`, `description`, `create_at`, `reported_content_id`, `status`) VALUES
(14, 0, 14, 'hhjihuj', '2025-10-30 14:56:14', 10, 'DONE'),
(15, 0, 14, 'fjikaijiwji', '2025-10-22 20:22:21', 8, 'PROCESS');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `report_type`
--

CREATE TABLE `report_type` (
  `report_type_id` int NOT NULL,
  `type_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `report_type`
--

INSERT INTO `report_type` (`report_type_id`, `type_name`) VALUES
(0, 'JOB'),
(1, 'USER'),
(2, 'COMPANY');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `role_id` int NOT NULL,
  `role_name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'ADMIN'),
(2, 'CANDIDATE'),
(3, 'RECRUITER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `saved_job`
--

CREATE TABLE `saved_job` (
  `save_job_id` int NOT NULL,
  `user_id` int NOT NULL,
  `job_id` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `saved_job`
--

INSERT INTO `saved_job` (`save_job_id`, `user_id`, `job_id`, `created_at`) VALUES
(1, 2, 1, '2025-10-29 13:36:36'),
(2, 2, 4, '2025-10-29 13:36:36'),
(3, 3, 2, '2025-10-29 13:36:36'),
(4, 3, 3, '2025-10-29 13:36:36'),
(5, 6, 1, '2025-10-29 13:36:36'),
(6, 6, 7, '2025-10-29 13:36:36'),
(7, 7, 5, '2025-10-29 13:36:36'),
(8, 7, 9, '2025-10-29 13:36:36'),
(9, 10, 6, '2025-10-29 13:36:36'),
(10, 10, 10, '2025-10-29 13:36:36'),
(11, 12, 1, '2025-10-30 06:54:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skills`
--

CREATE TABLE `skills` (
  `skill_id` int NOT NULL,
  `skill_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`) VALUES
(1, 'Java Programming'),
(2, 'Python Programming'),
(3, 'JavaScript Development'),
(4, 'DevOps Engineering'),
(5, 'System Administration'),
(6, 'Network Security'),
(7, 'Cybersecurity Analysis'),
(8, 'Data Analysis'),
(9, 'Machine Learning'),
(10, 'Database Management'),
(11, 'General Accounting'),
(12, 'Tax Accounting'),
(13, 'Internal Auditing'),
(14, 'Financial Reporting'),
(15, 'Cost Accounting'),
(16, 'Recruitment'),
(17, 'Training and Development'),
(18, 'Compensation and Benefits'),
(19, 'HR Policy Management'),
(20, 'Employee Relations'),
(21, 'SEO Optimization'),
(22, 'Social Media Marketing'),
(23, 'Content Creation'),
(24, 'Market Research'),
(25, 'Brand Management'),
(26, 'Direct Sales'),
(27, 'B2B Sales'),
(28, 'Customer Service'),
(29, 'Account Management'),
(30, 'Sales Negotiation'),
(31, 'Teaching'),
(32, 'Educational Consulting'),
(33, 'Training Program Management'),
(34, 'Curriculum Development'),
(35, 'Instructional Design'),
(36, 'Warehouse Management'),
(37, 'International Shipping'),
(38, 'Customs Declaration'),
(39, 'Supply Chain Management'),
(40, 'Inventory Control'),
(41, 'Graphic Design'),
(42, 'UI/UX Design'),
(43, 'Interior Design'),
(44, 'Motion Graphics'),
(45, '3D Modeling'),
(46, 'Nursing'),
(47, 'Medical Diagnosis'),
(48, 'Pharmacy'),
(49, 'Patient Care'),
(50, 'Clinical Research'),
(51, 'Production Management'),
(52, 'Machine Operation'),
(53, 'Equipment Maintenance'),
(54, 'Quality Control'),
(55, 'Process Engineering');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `skill_categories`
--

CREATE TABLE `skill_categories` (
  `skill_id` int NOT NULL,
  `cate_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `skill_categories`
--

INSERT INTO `skill_categories` (`skill_id`, `cate_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 3),
(17, 3),
(18, 3),
(19, 3),
(20, 3),
(21, 4),
(22, 4),
(23, 4),
(24, 4),
(25, 4),
(26, 5),
(27, 5),
(28, 5),
(29, 5),
(30, 5),
(31, 6),
(32, 6),
(33, 6),
(34, 6),
(35, 6),
(36, 7),
(37, 7),
(38, 7),
(39, 7),
(40, 7),
(41, 8),
(42, 8),
(43, 8),
(44, 8),
(45, 8),
(46, 9),
(47, 9),
(48, 9),
(49, 9),
(50, 9),
(51, 10),
(52, 10),
(53, 10),
(54, 10),
(55, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `soft_skills`
--

CREATE TABLE `soft_skills` (
  `soft_skill_id` int NOT NULL,
  `profile_id` int NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `level` enum('Low','Medium','High') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `soft_skills`
--

INSERT INTO `soft_skills` (`soft_skill_id`, `profile_id`, `name`, `description`, `level`) VALUES
(1, 1, 'Teamwork', 'Làm việc nhóm hiệu quả trong môi trường Agile', 'High'),
(2, 1, 'Problem Solving', 'Giải quyết vấn đề kỹ thuật phức tạp', 'High'),
(3, 1, 'Time Management', 'Quản lý thời gian dự án tốt', 'Medium'),
(4, 2, 'Creativity', 'Sáng tạo trong chiến dịch marketing', 'High'),
(5, 2, 'Communication', 'Giao tiếp tốt với khách hàng', 'High'),
(6, 2, 'Analytical Thinking', 'Phân tích số liệu marketing', 'Medium'),
(7, 3, 'Public Speaking', 'Thuyết trình trước đám đông tự tin', 'High'),
(8, 3, 'Patience', 'Kiên nhẫn với học viên', 'High'),
(9, 3, 'Empathy', 'Đồng cảm với học viên', 'High'),
(10, 4, 'Creativity', 'Sáng tạo trong thiết kế', 'High'),
(11, 4, 'Attention to Detail', 'Chú ý đến chi tiết', 'High'),
(12, 4, 'Time Management', 'Quản lý deadline dự án', 'Medium'),
(13, 5, 'Leadership', 'Lãnh đạo team sản xuất', 'High'),
(14, 5, 'Decision Making', 'Ra quyết định nhanh chóng', 'High'),
(15, 5, 'Continuous Improvement', 'Cải tiến liên tục quy trình', 'High');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tickets`
--

CREATE TABLE `tickets` (
  `id` bigint NOT NULL,
  `subject` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(254) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thread_id` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `status` enum('OPEN','PENDING','CLOSED') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'OPEN'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint NOT NULL,
  `ticket_id` bigint NOT NULL,
  `message_id` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_reply_to` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(320) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sent_at` timestamp(6) NULL DEFAULT CURRENT_TIMESTAMP(6),
  `body_text` longtext COLLATE utf8mb4_unicode_ci,
  `body_html` longtext COLLATE utf8mb4_unicode_ci,
  `direction` enum('INBOUND','OUTBOUND') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INBOUND'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ticket_message_attachments`
--

CREATE TABLE `ticket_message_attachments` (
  `id` bigint NOT NULL,
  `ticket_message_id` bigint NOT NULL,
  `filename` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size_bytes` bigint DEFAULT NULL,
  `content_id` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inline` tinyint(1) NOT NULL DEFAULT '0',
  `storage_provider` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CLOUDINARY',
  `storage_public_id` varchar(512) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_url` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `city_id` int DEFAULT NULL,
  `role_id` int NOT NULL,
  `full_name` varchar(200) DEFAULT NULL,
  `email` varchar(200) NOT NULL,
  `password_hash` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE','BANNED') DEFAULT 'INACTIVE',
  `google_id` varchar(100) DEFAULT NULL,
  `auth_provider` varchar(20) DEFAULT NULL,
  `password_set` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '0',
  `sms_notification_active` tinyint(1) DEFAULT '0',
  `email_notification_active` tinyint(1) DEFAULT '0',
  `create_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `last_login_at` datetime(3) DEFAULT NULL,
  `password_changed_at` datetime(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`user_id`, `city_id`, `role_id`, `full_name`, `email`, `password_hash`, `phone_number`, `status`, `google_id`, `auth_provider`, `password_set`, `is_active`, `sms_notification_active`, `email_notification_active`, `create_at`, `updated_at`, `last_login_at`, `password_changed_at`) VALUES
(1, NULL, 1, 'ADMIN', 'admin@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0909123456', 'ACTIVE', NULL, NULL, 0, 0, 0, 1, '2025-08-11 09:13:27', '2025-10-28 15:02:34.731', NULL, NULL),
(2, NULL, 2, 'Nguyễn Văn A', 'candidate1@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0912345678', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-28 15:01:54', '2025-10-28 15:02:34.731', NULL, NULL),
(3, NULL, 2, 'Trần Thị B', 'candidate2@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0923456789', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-28 15:01:54', '2025-10-29 15:02:34.731', NULL, NULL),
(4, NULL, 3, 'Phạm Văn C', 'recruiter1@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0934567890', 'ACTIVE', NULL, NULL, 0, 0, 0, 1, '2025-10-28 15:01:54', '2025-10-28 15:02:34.731', NULL, NULL),
(5, NULL, 3, 'Lê Thị D', 'recruiter2@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0945678901', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-28 15:01:54', '2025-10-28 15:02:34.731', NULL, NULL),
(6, NULL, 2, 'Ngô Văn E', 'candidate3@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0956789012', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-30 15:01:54', '2025-10-31 09:46:12.442', NULL, NULL),
(7, NULL, 2, 'Đặng Thị F', 'candidate4@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0967890123', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-31 15:01:54', '2025-10-31 09:46:28.773', NULL, NULL),
(8, NULL, 3, 'Vũ Văn G', 'recruiter3@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0978901234', 'ACTIVE', NULL, NULL, 0, 0, 0, 1, '2025-10-28 15:01:54', '2025-10-28 15:02:34.731', NULL, NULL),
(9, NULL, 3, 'Bùi Thị H', 'recruiter4@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0989012345', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-28 15:01:54', '2025-10-28 15:02:34.731', NULL, NULL),
(10, NULL, 2, 'Phan Văn I', 'candidate5@gmail.com', '$2a$12$eCoyVZC81XhJNz.pab6Qy.mhOxROxzzi6Y3V9m2d4.ZyPJn9mLsly', '0990123456', 'ACTIVE', NULL, NULL, 0, 0, 1, 1, '2025-10-27 15:01:54', '2025-10-31 09:46:42.395', NULL, NULL),
(12, NULL, 1, 'Admin', 'admin123@gmail.com', '$2a$10$1e8zWGCNqcv.3J9jIv1s3ONq9yarhtZgtGcDuuNwXrRsHI83aB7..', '0123456789', 'ACTIVE', '', NULL, 0, 1, 0, 1, '2025-10-28 15:14:34', '2025-10-31 09:13:21.901', '2025-10-31 09:13:21.889', NULL),
(14, NULL, 2, 'Võ Nhật Hào', 'haovo@gmail.com', '$2a$10$hzowi16xujUGeBAcgVMake.tTR89KsRUrFgfwIEQ4wyJckx7Oep/6', '0334944908', 'ACTIVE', '1', NULL, 0, 1, 0, 1, '2025-10-29 15:59:05', '2025-10-31 09:46:53.284', '2025-10-31 08:30:32.915', NULL),
(15, NULL, 3, 'Phạm Văn Phúc', 'phucpham@gmail.com', '$2a$10$8QAiyEEcz9Or7IymP5Fa/.5sp5i7NXPnJnzFo8PrQlei6kxUYCaG6', '0987612345', 'ACTIVE', '2', NULL, 0, 1, 0, 1, '2025-10-29 17:33:39', '2025-10-31 07:29:26.541', '2025-10-31 07:29:26.534', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_one_time_tokens`
--

CREATE TABLE `user_one_time_tokens` (
  `token_id` int NOT NULL,
  `user_id` int NOT NULL,
  `purpose` enum('ACTIVATION','SET_PASSWORD','RESET_PASSWORD','EMAIL_CHANGE') NOT NULL,
  `token_hash` char(64) NOT NULL,
  `expires_at` datetime(3) NOT NULL,
  `consumed_at` datetime(3) DEFAULT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_sessions`
--

CREATE TABLE `user_sessions` (
  `session_id` int NOT NULL,
  `user_id` int NOT NULL,
  `session_family_id` char(36) NOT NULL,
  `parent_session_id` int DEFAULT NULL,
  `replaced_by_session_id` int DEFAULT NULL,
  `refresh_token_hash` char(64) NOT NULL,
  `refresh_expires_at` datetime(3) NOT NULL,
  `created_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `last_seen_at` datetime(3) DEFAULT NULL,
  `revoked_at` datetime(3) DEFAULT NULL,
  `reuse_detected_at` datetime(3) DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `device_label` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `user_sessions`
--

INSERT INTO `user_sessions` (`session_id`, `user_id`, `session_family_id`, `parent_session_id`, `replaced_by_session_id`, `refresh_token_hash`, `refresh_expires_at`, `created_at`, `last_seen_at`, `revoked_at`, `reuse_detected_at`, `ip_address`, `user_agent`, `device_label`) VALUES
(1, 12, '3ca94f54-6a04-4009-8bf5-b9df947288fd', NULL, NULL, '717448a174c5fe9987e36284e83a3f184cd4dee1f9ff2a401256eb0049a82ddf', '2025-11-04 15:21:18.147', '2025-10-28 15:21:18.158', '2025-10-28 15:21:18.147', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(2, 12, 'b233771a-511f-40bd-973f-60b535850ecb', NULL, NULL, '0fbf1457613a00dae9dbe32632b82fbea10d687de52ecaa367d95411d06ff688', '2025-11-04 15:50:35.655', '2025-10-28 15:50:35.662', '2025-10-28 15:50:35.655', '2025-10-28 15:55:51.532', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(3, 14, '57183725-c843-40c9-9ccc-821d7455034a', NULL, NULL, '6dfc2217bc3a743200d00ff16d61196a0e0241412cf5150ca9813eaaf7db0778', '2025-11-04 16:05:03.080', '2025-10-28 16:05:03.084', '2025-10-28 16:05:03.080', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(4, 14, '7717e779-468a-4313-98b4-8a93eba958a0', NULL, NULL, '6668629d10c7f0c865d2eb10467be78f551d67ff36c60b5715f5937f84e0cde5', '2025-11-04 16:08:32.617', '2025-10-28 16:08:32.618', '2025-10-28 16:08:32.617', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(5, 14, 'f9c131a7-6ce7-4c0a-a712-0f3c452da570', NULL, 6, '3cca011c2858df7bdc534fb8d8d1dae94ad01fdeb43f1906022bd7ffb41f64de', '2025-11-05 08:42:07.507', '2025-10-29 08:42:07.511', '2025-10-29 09:42:22.634', '2025-10-29 09:42:22.634', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(6, 14, 'f9c131a7-6ce7-4c0a-a712-0f3c452da570', 5, NULL, 'c02256a358c54c1818c16804f8dda1092eb8b5a05abebab4b8b79e92480d6bde', '2025-11-05 09:42:22.634', '2025-10-29 09:42:22.642', '2025-10-29 09:42:22.634', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(7, 14, 'ad7b4ea6-8bbe-4bff-9808-d33ac0cc85bd', NULL, NULL, 'a18fd41c831597f029b0a701c2f13d514538c41ea0fbaad06f91e90153dce3d9', '2025-11-05 09:52:24.593', '2025-10-29 09:52:24.594', '2025-10-29 09:52:24.593', '2025-10-29 10:03:55.696', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(8, 12, 'e21db6fc-fc18-4ec0-b11c-ce2dc2f680e8', NULL, NULL, '5927163f8919ba6c84b01120b2a632c95fd8362bcd401efceac5b1f11e2b5db4', '2025-11-05 10:34:03.913', '2025-10-29 10:34:03.914', '2025-10-29 10:34:03.913', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(9, 12, '0dcfa35b-63e1-4316-8c21-a1deecd079c2', NULL, NULL, 'c9a7bd3f428f1deb50e1296f0e468dc326f978d55e0b932db673f91f99f98dcb', '2025-11-05 10:40:08.373', '2025-10-29 10:40:08.374', '2025-10-29 10:40:08.373', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(10, 14, '1742718e-28e8-4f69-943a-b81530b5d542', NULL, NULL, '25c750c39c811e8b599797a8fe289d525f9fb5c84d8d0145b2616eef437de0ac', '2025-11-05 14:38:01.052', '2025-10-29 14:38:01.060', '2025-10-29 14:38:01.052', '2025-10-29 14:56:35.807', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(11, 12, '2b44946f-2d82-44f3-ab72-a1f3b0989272', NULL, NULL, '782dc36b953e52b67960dae659cc9b32904a78d796fe30f9ac72e1f3ba0a7ae3', '2025-11-05 14:56:45.519', '2025-10-29 14:56:45.524', '2025-10-29 14:56:45.519', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(12, 14, 'cdc89912-a4e0-4b28-b638-fc1d00300770', NULL, NULL, 'b3646f557da0054339795e33948243ba41e41e543c37547b24995a7ce07beb52', '2025-11-05 17:17:47.295', '2025-10-29 17:17:47.302', '2025-10-29 17:17:47.295', '2025-10-29 17:17:53.570', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(13, 12, '5bca067a-3357-438c-8a4f-d08956e374a7', NULL, NULL, '4051839aab25f72112ddd5a5a2f53892bd02db1fa91a7a1f46af79678fa3ada1', '2025-11-05 17:18:55.081', '2025-10-29 17:18:55.081', '2025-10-29 17:18:55.081', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(14, 14, 'b2a91818-465b-4884-9312-135735eb8f37', NULL, NULL, '3ea525397a361234fef10b3362c852f3480b2f7cbdc565929986125f4a0f2954', '2025-11-05 17:19:06.348', '2025-10-29 17:19:06.348', '2025-10-29 17:19:06.348', '2025-10-29 17:30:02.518', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(15, 15, '00e97bff-c3c2-4e8f-a004-56e5be9133ea', NULL, NULL, 'a69df305e0b3edb690dae1c1c54c7e61c02b5265cd62e64eb0daba07cc7e53fa', '2025-11-05 17:33:59.938', '2025-10-29 17:33:59.939', '2025-10-29 17:33:59.938', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(16, 15, '79458fc0-a7a6-44d2-a15c-d534861a978d', NULL, NULL, '114fae46a7f32510b642f628726d7b00eb6f09e97101bbce101d46bfc6cf5b16', '2025-11-05 18:05:40.528', '2025-10-29 18:05:40.531', '2025-10-29 18:05:40.528', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', 'Chrome - Windows'),
(17, 14, '490a9982-be79-40e6-9f5f-5ce81f4963bc', NULL, NULL, 'd6157bbd4da333bd5743b95861398d80d58034961bc80b96cd2ea3d782385e0f', '2025-11-06 06:20:59.101', '2025-10-30 06:20:59.108', '2025-10-30 06:20:59.101', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(18, 12, '31c23a63-5ec3-45cd-8b06-9e74d174951d', NULL, NULL, '826d52e5059a474656c8888a23a36385225bcf2761c5a4aaad9eb675baa7b0c7', '2025-11-06 06:26:59.022', '2025-10-30 06:26:59.022', '2025-10-30 06:26:59.022', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(19, 12, '29df1971-8b8a-469e-9ff0-477a232a5f28', NULL, 20, '5182be1836f9acddfe6020590633fd768cc858dfe405e8e6b2748053f7f7fa3e', '2025-11-06 07:33:08.961', '2025-10-30 07:33:08.965', '2025-10-30 08:36:12.538', '2025-10-30 08:36:12.538', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(20, 12, '29df1971-8b8a-469e-9ff0-477a232a5f28', 19, NULL, 'a6be177dd13252d111cdf00e8aa3cccea122d0d12729c8b7cbd445886e7d3083', '2025-11-06 08:36:12.538', '2025-10-30 08:36:12.908', '2025-10-30 08:36:12.538', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(21, 14, '708cd1e9-23f6-4537-b550-9f14b46e4859', NULL, NULL, '3264bc3cb2b91db98b99896de8ebad8dbf032d287870b6ec54ef0a80c366900e', '2025-11-06 09:00:14.346', '2025-10-30 09:00:14.523', '2025-10-30 09:00:14.346', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(22, 12, '50094a7e-04f0-4b81-9f7f-ed05207592fc', NULL, NULL, '14adc663ba3da236430875ab3bec832265001fb27dc0ddf50592909cebd8ff72', '2025-11-06 10:49:23.449', '2025-10-30 10:49:23.458', '2025-10-30 10:49:23.449', '2025-10-30 13:38:35.372', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(23, 12, '9d1e5e6f-f61f-4d10-be9b-6b0bac99ef6d', NULL, NULL, 'fbe002112928d29e0a3f7124e4b1249d68c216e138d3966ee009a4f13385b728', '2025-11-06 13:38:49.235', '2025-10-30 13:38:49.241', '2025-10-30 13:38:49.235', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(24, 12, '745ea367-3ab2-4392-a4f1-cb5afe30a53c', NULL, NULL, '40f3b8b5169a4b7fa91a83c4660e225cf936f6fefc5a00e2162ee44555a20d60', '2025-11-06 15:19:11.522', '2025-10-30 15:19:11.528', '2025-10-30 15:19:11.522', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(25, 12, '580d8c01-2b7e-441f-8628-5786000ce18e', NULL, NULL, '4df90b1055cdfd6964fecc21070e2fbc0d3a8c90ef311c2b8d0cd5d9e6229845', '2025-11-06 15:35:38.400', '2025-10-30 15:35:38.406', '2025-10-30 15:35:38.400', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(26, 12, '29530e43-8b72-4ec6-ad72-932b36e07cf3', NULL, NULL, '3cfa1825a6bd35aed70bdcf36ebf9f4dc93d2b023e1969d9f2ac62bd03039f03', '2025-11-06 16:48:28.212', '2025-10-30 16:48:28.215', '2025-10-30 16:48:28.212', '2025-10-30 16:58:43.729', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(27, 14, '9de2121a-3f51-48f5-9f51-391dea748cfd', NULL, NULL, '2ee24247fcdf53822d161447b86a68b1ea117305609e8ca37abd77020c456e7b', '2025-11-06 16:59:00.536', '2025-10-30 16:59:00.536', '2025-10-30 16:59:00.536', '2025-10-30 18:09:04.747', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(28, 12, '9b44af28-49a1-4285-bf5c-c65437799d00', NULL, NULL, '41961ebf7a1b0dbfc2abc604ac3ec46a4b19fb76c10499a3adddb5b720954c3d', '2025-11-06 18:09:17.548', '2025-10-30 18:09:17.554', '2025-10-30 18:09:17.548', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(29, 14, '66291b4e-92a8-4dc2-84a9-3271a5129a08', NULL, NULL, 'ad61b9edd4ce7f1d8487eaaaeabcbc5d9c73cce66759cf295beb54f91406d8e5', '2025-11-06 18:12:57.927', '2025-10-30 18:12:57.927', '2025-10-30 18:12:57.927', '2025-10-30 18:15:02.776', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(30, 12, 'b0e6cda5-d274-4a5b-af9f-eb5d7a9e06d2', NULL, NULL, '3bb6b8ee46807f52d16427e8d9524afebbb5dc51d1052b8bd59579148779fd2b', '2025-11-06 18:15:08.064', '2025-10-30 18:15:08.065', '2025-10-30 18:15:08.064', '2025-10-30 18:15:24.841', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(31, 12, 'a4dfe771-dc9f-4d4d-acaf-81acbef23d04', NULL, NULL, '4b84b93babd6d89ecfdd94e787ef53907aa0fa8c2fb4074e4238b3b3818eda2c', '2025-11-06 18:15:57.473', '2025-10-30 18:15:57.474', '2025-10-30 18:15:57.473', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(32, 12, 'e93ca364-07f9-4f09-b3e8-50d837b05470', NULL, NULL, '0fa80f4ca78a254178796b8387726067d6f8e6ef8fe37ca846d2c836a67163d0', '2025-11-07 04:46:15.319', '2025-10-31 04:46:15.323', '2025-10-31 04:46:15.319', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(33, 12, '23088c99-cd95-4d07-9214-0f3b849ad3d7', NULL, NULL, '378bda33c63bb133fce3e74b50d1f6bea134d2e57df9221032394f0d7311f271', '2025-11-07 05:04:39.921', '2025-10-31 05:04:39.922', '2025-10-31 05:04:39.921', '2025-10-31 05:14:30.831', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(34, 14, '3fc9fea2-b214-4f9e-be17-553254a962e9', NULL, NULL, 'f85a17a1d726144fd604a16be367a3ffb239eb1d82c6953faafc3e73670babd6', '2025-11-07 05:14:41.353', '2025-10-31 05:14:41.354', '2025-10-31 05:14:41.353', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(35, 15, 'bda4d766-ec73-49d9-ac6b-f317a28e3af0', NULL, NULL, 'cb068d1510eaf2633c97faa2a464c26727b5fa5ae0e4ef4b997a4d0e11f3ad14', '2025-11-07 06:31:17.682', '2025-10-31 06:31:17.685', '2025-10-31 06:31:17.682', '2025-10-31 07:14:20.350', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(36, 12, 'c908e7e9-5a4b-4318-abf5-0acd898d59c9', NULL, NULL, '7a56c0ba62961b037b0bd8ed84dc28f4828a07399931f1b19ef25e256ac228ca', '2025-11-07 07:14:28.516', '2025-10-31 07:14:28.518', '2025-10-31 07:14:28.516', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(37, 12, 'd50cbbb4-c9a5-4e3f-a5b0-057c087ccb9f', NULL, NULL, '32a953c056a82724dd3ac67ef922c7268e7bff1fa7fd250dbd56049715806b9e', '2025-11-07 07:24:33.956', '2025-10-31 07:24:33.956', '2025-10-31 07:24:33.956', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(38, 15, 'a81384b8-d884-41b3-8e33-0806f368e260', NULL, NULL, 'd128eb4e870767f84d68c26f72354e5107c1956cc022757ca323c27104aa1a01', '2025-11-07 07:29:26.566', '2025-10-31 07:29:26.572', '2025-10-31 07:29:26.566', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(39, 14, '90e90243-213e-441b-95d4-e8e7bd7dde7a', NULL, NULL, '55f7ddb1e81c78c277682caf7f2577b78be98672528d261501eb360896974e01', '2025-11-07 08:30:33.030', '2025-10-31 08:30:33.038', '2025-10-31 08:30:33.030', '2025-10-31 09:00:32.073', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(40, 12, '23d954dc-0368-4134-896a-a2ae177c71ef', NULL, NULL, 'f35a1d7d29b9f272f4d4ecc3eb69cf48d11bd44f7b66a7b91289ccd12d65b120', '2025-11-07 09:00:41.576', '2025-10-31 09:00:41.576', '2025-10-31 09:00:41.576', '2025-10-31 09:04:44.822', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows'),
(41, 12, '4c21370e-48cf-4b57-8504-a9b19fc5c7b5', NULL, NULL, 'c0f4d56b6f966b56654de90dd8ea6edf94be18bd4e6981ac8c80dc05963aa5b2', '2025-11-07 09:13:21.943', '2025-10-31 09:13:21.946', '2025-10-31 09:13:21.943', NULL, NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', 'Chrome - Windows');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ward_company`
--

CREATE TABLE `ward_company` (
  `ward_id` int NOT NULL,
  `company_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ward_job`
--

CREATE TABLE `ward_job` (
  `ward_id` int NOT NULL,
  `job_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `ward_job`
--

INSERT INTO `ward_job` (`ward_id`, `job_id`) VALUES
(1, 1),
(4, 1),
(267, 2),
(268, 3),
(139, 4),
(140, 5),
(104, 6),
(269, 7),
(270, 8),
(141, 9),
(105, 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_experience`
--

CREATE TABLE `work_experience` (
  `exper_id` int NOT NULL,
  `description` text,
  `company_name` varchar(200) DEFAULT NULL,
  `position` varchar(200) DEFAULT NULL,
  `duration` varchar(200) DEFAULT NULL,
  `profile_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `work_experience`
--

INSERT INTO `work_experience` (`exper_id`, `description`, `company_name`, `position`, `duration`, `profile_id`) VALUES
(1, 'Phát triển ứng dụng web với Java Spring Boot, làm việc trong team Agile', 'TechViet Solutions', 'Junior Java Developer', '2020-2022', 1),
(2, 'Phụ trách các chiến dịch marketing trên Facebook và Google Ads', 'ABC Marketing', 'Marketing Executive', '2021-2023', 2),
(3, 'Giảng dạy tiếng Anh cho học viên IELTS', 'English Center Plus', 'IELTS Instructor', '2019-2022', 3),
(4, 'Thiết kế logo, branding và ấn phẩm marketing', 'Creative Studio', 'Graphic Designer', '2022-2024', 4),
(5, 'Quản lý dây chuyền sản xuất linh kiện điện tử', 'Samsung Vietnam', 'Production Supervisor', '2017-2020', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `work_type`
--

CREATE TABLE `work_type` (
  `work_type_id` int NOT NULL,
  `work_type_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Đang đổ dữ liệu cho bảng `work_type`
--

INSERT INTO `work_type` (`work_type_id`, `work_type_name`) VALUES
(1, 'On-site'),
(2, 'Remote'),
(3, 'Hybrid'),
(4, 'Full-time'),
(5, 'Part-time');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `applications`
--
ALTER TABLE `applications`
  ADD PRIMARY KEY (`user_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Chỉ mục cho bảng `awards`
--
ALTER TABLE `awards`
  ADD PRIMARY KEY (`award_id`),
  ADD KEY `idx_profile_id` (`profile_id`);

--
-- Chỉ mục cho bảng `candidate_profile`
--
ALTER TABLE `candidate_profile`
  ADD PRIMARY KEY (`profile_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD PRIMARY KEY (`candidate_skill_id`),
  ADD UNIQUE KEY `unique_profile_skill` (`skill_id`,`profile_id`),
  ADD KEY `profile_id` (`profile_id`),
  ADD KEY `level_id` (`level_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cate_id`),
  ADD KEY `fk_categories_parent` (`parent_id`);

--
-- Chỉ mục cho bảng `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`cer_id`),
  ADD KEY `idx_profile_id` (`profile_id`);

--
-- Chỉ mục cho bảng `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`company_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `idx_companies_vip_until` (`vip_until`);

--
-- Chỉ mục cho bảng `company_categories`
--
ALTER TABLE `company_categories`
  ADD PRIMARY KEY (`company_id`,`cate_id`),
  ADD KEY `cate_id` (`cate_id`);

--
-- Chỉ mục cho bảng `company_subscriptions`
--
ALTER TABLE `company_subscriptions`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `idx_company_end` (`company_id`,`end_at`);

--
-- Chỉ mục cho bảng `cv_template`
--
ALTER TABLE `cv_template`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `edu`
--
ALTER TABLE `edu`
  ADD PRIMARY KEY (`edu_id`),
  ADD KEY `idx_profile_id` (`profile_id`);

--
-- Chỉ mục cho bảng `follows`
--
ALTER TABLE `follows`
  ADD PRIMARY KEY (`follow_id`),
  ADD KEY `fk_follows_user` (`user_id`),
  ADD KEY `fk_follows_company` (`company_id`);

--
-- Chỉ mục cho bảng `interviews`
--
ALTER TABLE `interviews`
  ADD PRIMARY KEY (`interview_id`),
  ADD UNIQUE KEY `uq_interviews_gcal_event` (`gcal_event_id`),
  ADD KEY `idx_interviews_scheduled_at` (`scheduled_at`),
  ADD KEY `idx_interviews_company` (`company_id`),
  ADD KEY `idx_interviews_candidate` (`candidate_id`),
  ADD KEY `idx_interviews_job` (`job_id`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`job_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Chỉ mục cho bảng `job_category`
--
ALTER TABLE `job_category`
  ADD PRIMARY KEY (`job_id`,`cate_id`),
  ADD KEY `fk_job_category_category` (`cate_id`);

--
-- Chỉ mục cho bảng `job_level`
--
ALTER TABLE `job_level`
  ADD PRIMARY KEY (`level_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Chỉ mục cho bảng `job_skill`
--
ALTER TABLE `job_skill`
  ADD PRIMARY KEY (`skill_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Chỉ mục cho bảng `job_work_type`
--
ALTER TABLE `job_work_type`
  ADD PRIMARY KEY (`job_id`,`work_type_id`),
  ADD KEY `work_type_id` (`work_type_id`);

--
-- Chỉ mục cho bảng `levels`
--
ALTER TABLE `levels`
  ADD PRIMARY KEY (`level_id`);

--
-- Chỉ mục cho bảng `location_city`
--
ALTER TABLE `location_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Chỉ mục cho bảng `location_ward`
--
ALTER TABLE `location_ward`
  ADD PRIMARY KEY (`ward_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `idx_user_created` (`user_id`,`created_at` DESC),
  ADD KEY `idx_company` (`company_id`),
  ADD KEY `idx_job` (`job_id`);

--
-- Chỉ mục cho bảng `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`package_id`),
  ADD UNIQUE KEY `code` (`code`);

--
-- Chỉ mục cho bảng `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD UNIQUE KEY `uq_txn_ref` (`txn_ref`),
  ADD UNIQUE KEY `uq_provider_txn` (`provider`,`provider_txn`),
  ADD KEY `idx_company_created` (`company_id`,`created_at`);

--
-- Chỉ mục cho bảng `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `report_type_id` (`report_type_id`);

--
-- Chỉ mục cho bảng `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`report_type_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`);

--
-- Chỉ mục cho bảng `saved_job`
--
ALTER TABLE `saved_job`
  ADD PRIMARY KEY (`save_job_id`),
  ADD KEY `fk_saved_job_user` (`user_id`),
  ADD KEY `fk_saved_job_job` (`job_id`);

--
-- Chỉ mục cho bảng `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- Chỉ mục cho bảng `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD PRIMARY KEY (`skill_id`,`cate_id`),
  ADD KEY `fk_skill_categories_category` (`cate_id`);

--
-- Chỉ mục cho bảng `soft_skills`
--
ALTER TABLE `soft_skills`
  ADD PRIMARY KEY (`soft_skill_id`),
  ADD KEY `idx_profile_id` (`profile_id`);

--
-- Chỉ mục cho bảng `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_tickets_thread_id` (`thread_id`),
  ADD KEY `ix_tickets_created_at` (`created_at` DESC),
  ADD KEY `ix_tickets_status` (`status`),
  ADD KEY `ix_tickets_customer_email` (`customer_email`);

--
-- Chỉ mục cho bảng `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_ticket_messages_message_id` (`message_id`),
  ADD KEY `ix_ticket_messages_ticket_id` (`ticket_id`),
  ADD KEY `ix_ticket_messages_sent_at` (`sent_at`),
  ADD KEY `ix_ticket_messages_in_reply_to` (`in_reply_to`),
  ADD KEY `ix_ticket_messages_from_email` (`from_email`);

--
-- Chỉ mục cho bảng `ticket_message_attachments`
--
ALTER TABLE `ticket_message_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ix_tma_msg` (`ticket_message_id`),
  ADD KEY `ix_tma_cid` (`content_id`),
  ADD KEY `ix_tma_inline` (`inline`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone_number` (`phone_number`),
  ADD UNIQUE KEY `google_id` (`google_id`),
  ADD KEY `role_id` (`role_id`),
  ADD KEY `city_id` (`city_id`);

--
-- Chỉ mục cho bảng `user_one_time_tokens`
--
ALTER TABLE `user_one_time_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD UNIQUE KEY `ux_purpose_hash` (`purpose`,`token_hash`),
  ADD KEY `idx_user_purpose` (`user_id`,`purpose`),
  ADD KEY `idx_expires` (`expires_at`);

--
-- Chỉ mục cho bảng `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `ux_refresh_hash` (`refresh_token_hash`),
  ADD KEY `fk_sessions_parent` (`parent_session_id`),
  ADD KEY `fk_sessions_replaced_by` (`replaced_by_session_id`),
  ADD KEY `idx_user` (`user_id`),
  ADD KEY `idx_family` (`session_family_id`),
  ADD KEY `idx_expires` (`refresh_expires_at`),
  ADD KEY `idx_revoked` (`revoked_at`);

--
-- Chỉ mục cho bảng `ward_company`
--
ALTER TABLE `ward_company`
  ADD PRIMARY KEY (`ward_id`,`company_id`),
  ADD KEY `company_id` (`company_id`);

--
-- Chỉ mục cho bảng `ward_job`
--
ALTER TABLE `ward_job`
  ADD PRIMARY KEY (`ward_id`,`job_id`),
  ADD KEY `job_id` (`job_id`);

--
-- Chỉ mục cho bảng `work_experience`
--
ALTER TABLE `work_experience`
  ADD PRIMARY KEY (`exper_id`),
  ADD KEY `idx_profile_id` (`profile_id`);

--
-- Chỉ mục cho bảng `work_type`
--
ALTER TABLE `work_type`
  ADD PRIMARY KEY (`work_type_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `awards`
--
ALTER TABLE `awards`
  MODIFY `award_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `candidate_profile`
--
ALTER TABLE `candidate_profile`
  MODIFY `profile_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `candidate_skill`
--
ALTER TABLE `candidate_skill`
  MODIFY `candidate_skill_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `cate_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `certificates`
--
ALTER TABLE `certificates`
  MODIFY `cer_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `companies`
--
ALTER TABLE `companies`
  MODIFY `company_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `company_subscriptions`
--
ALTER TABLE `company_subscriptions`
  MODIFY `subscription_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `cv_template`
--
ALTER TABLE `cv_template`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `edu`
--
ALTER TABLE `edu`
  MODIFY `edu_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `follows`
--
ALTER TABLE `follows`
  MODIFY `follow_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `interviews`
--
ALTER TABLE `interviews`
  MODIFY `interview_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `job_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `levels`
--
ALTER TABLE `levels`
  MODIFY `level_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `location_city`
--
ALTER TABLE `location_city`
  MODIFY `city_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT cho bảng `location_ward`
--
ALTER TABLE `location_ward`
  MODIFY `ward_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2276;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `packages`
--
ALTER TABLE `packages`
  MODIFY `package_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `report_type`
--
ALTER TABLE `report_type`
  MODIFY `report_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `saved_job`
--
ALTER TABLE `saved_job`
  MODIFY `save_job_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `soft_skills`
--
ALTER TABLE `soft_skills`
  MODIFY `soft_skill_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ticket_message_attachments`
--
ALTER TABLE `ticket_message_attachments`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `user_one_time_tokens`
--
ALTER TABLE `user_one_time_tokens`
  MODIFY `token_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `user_sessions`
--
ALTER TABLE `user_sessions`
  MODIFY `session_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT cho bảng `work_experience`
--
ALTER TABLE `work_experience`
  MODIFY `exper_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `work_type`
--
ALTER TABLE `work_type`
  MODIFY `work_type_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ràng buộc đối với các bảng kết xuất
--

--
-- Ràng buộc cho bảng `applications`
--
ALTER TABLE `applications`
  ADD CONSTRAINT `applications_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `applications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `awards`
--
ALTER TABLE `awards`
  ADD CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `candidate_profile`
--
ALTER TABLE `candidate_profile`
  ADD CONSTRAINT `candidate_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `candidate_skill`
--
ALTER TABLE `candidate_skill`
  ADD CONSTRAINT `candidate_skill_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidate_skill_ibfk_2` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `candidate_skill_ibfk_3` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `fk_categories_parent` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`cate_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `certificates`
--
ALTER TABLE `certificates`
  ADD CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `companies`
--
ALTER TABLE `companies`
  ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `company_categories`
--
ALTER TABLE `company_categories`
  ADD CONSTRAINT `company_categories_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `company_categories_ibfk_2` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `edu`
--
ALTER TABLE `edu`
  ADD CONSTRAINT `edu_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `follows`
--
ALTER TABLE `follows`
  ADD CONSTRAINT `fk_follows_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_follows_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `interviews`
--
ALTER TABLE `interviews`
  ADD CONSTRAINT `fk_interviews_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_interviews_company` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_interviews_job` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `job_category`
--
ALTER TABLE `job_category`
  ADD CONSTRAINT `fk_job_category_category` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_job_category_job` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `job_level`
--
ALTER TABLE `job_level`
  ADD CONSTRAINT `job_level_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `job_level_ibfk_2` FOREIGN KEY (`level_id`) REFERENCES `levels` (`level_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `job_skill`
--
ALTER TABLE `job_skill`
  ADD CONSTRAINT `job_skill_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `job_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `job_work_type`
--
ALTER TABLE `job_work_type`
  ADD CONSTRAINT `job_work_type_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `job_work_type_ibfk_2` FOREIGN KEY (`work_type_id`) REFERENCES `work_type` (`work_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `location_ward`
--
ALTER TABLE `location_ward`
  ADD CONSTRAINT `location_ward_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `location_city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `fk_notifications_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `reports_ibfk_2` FOREIGN KEY (`report_type_id`) REFERENCES `report_type` (`report_type_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `saved_job`
--
ALTER TABLE `saved_job`
  ADD CONSTRAINT `fk_saved_job_job` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_saved_job_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `skill_categories`
--
ALTER TABLE `skill_categories`
  ADD CONSTRAINT `fk_skill_categories_category` FOREIGN KEY (`cate_id`) REFERENCES `categories` (`cate_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_skill_categories_skill` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `soft_skills`
--
ALTER TABLE `soft_skills`
  ADD CONSTRAINT `soft_skills_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD CONSTRAINT `fk_ticket_messages_ticket` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `ticket_message_attachments`
--
ALTER TABLE `ticket_message_attachments`
  ADD CONSTRAINT `fk_tma_msg` FOREIGN KEY (`ticket_message_id`) REFERENCES `ticket_messages` (`id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_2` FOREIGN KEY (`city_id`) REFERENCES `location_city` (`city_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `user_one_time_tokens`
--
ALTER TABLE `user_one_time_tokens`
  ADD CONSTRAINT `fk_ott_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `user_sessions`
--
ALTER TABLE `user_sessions`
  ADD CONSTRAINT `fk_sessions_parent` FOREIGN KEY (`parent_session_id`) REFERENCES `user_sessions` (`session_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sessions_replaced_by` FOREIGN KEY (`replaced_by_session_id`) REFERENCES `user_sessions` (`session_id`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_sessions_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE;

--
-- Ràng buộc cho bảng `ward_company`
--
ALTER TABLE `ward_company`
  ADD CONSTRAINT `ward_company_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`company_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ward_company_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `location_ward` (`ward_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `ward_job`
--
ALTER TABLE `ward_job`
  ADD CONSTRAINT `ward_job_ibfk_1` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`job_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `ward_job_ibfk_2` FOREIGN KEY (`ward_id`) REFERENCES `location_ward` (`ward_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Ràng buộc cho bảng `work_experience`
--
ALTER TABLE `work_experience`
  ADD CONSTRAINT `work_experience_ibfk_1` FOREIGN KEY (`profile_id`) REFERENCES `candidate_profile` (`profile_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
