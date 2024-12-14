-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 08, 2024 lúc 01:29 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `phung`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `paragraph` text NOT NULL,
  `id_article` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baigioithieu`
--

CREATE TABLE `baigioithieu` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagraph` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagraph` text NOT NULL,
  `id_blog` int(100) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `baiviet`
--

INSERT INTO `baiviet` (`id`, `image`, `title`, `pagraph`, `id_blog`, `status`) VALUES
(56, '', 'Uống Cacao có mất ngủ không? Nên uống vào thời điểm nào?', 'Cacao là thức uống yêu thích của nhiều người, nhưng cũng có không ít lo ngại về tác động của nó đến giấc ngủ. Vậy uống Cacao có mất ngủ không? Nên uống vào thời điểm nào? Bài viết này SunnyFarm sẽ hướng dẫn cách thức uống cacao không gây mất ngủ cũng như tác động tích cực và tiêu cực khác của cacao đến giấc ngủ.', 13, 1),
(57, 'caffeine-trong-cacao.jpg', 'Lượng Cafein trong cacao là bao nhiêu?', 'Hàm lượng Cafein trong cacao dao động từ 12-24mg/100g, thấp hơn đáng kể so với cà phê chứa khoảng 40-175mg/100g. Trà xanh, trà đen chứa khoảng 11-25mg/100g. Lượng Cafein cụ thể phụ thuộc vào cách chế biến, pha chế và nguồn gốc của từng loại.', 13, 1),
(58, 'uong-cacao-co-mat-ngu-khong.jpg', 'Uống Cacao có mất ngủ không? Lý giải khoa học về tác động của cacao đến giấc ngủ', '<trong>Vai trò của Cafein trong cacao đến giấc ngủ<strong>\r\n<br>\r\nCacao chứa Cafein, một chất kích thích thần kinh trung ương, có thể gây mất ngủ và ảnh hưởng tiêu cực đến chất lượng giấc ngủ. Cafein ức chế hoạt động của adenosine, chất điều hòa quá trình ngủ, khiến cơ thể và não bộ tỉnh táo, khó đi vào giấc ngủ.\r\n\r\n', 13, 1),
(59, '', 'Ảnh hưởng của thời điểm uống', 'Thời điểm uống cacao cũng ảnh hưởng đến giấc ngủ. Uống cacao vào buổi tối, đặc biệt là trước khi ngủ có thể khiến Cafein còn tồn dư trong cơ thể gây khó ngủ. Trong khi đó, uống cacao vào buổi sáng hoặc đầu buổi chiều ít ảnh hưởng tiêu cực hơn.', 13, 1),
(60, '', 'Uống cacao như thế nào để không mất ngủ?', '', 13, 1),
(61, '', 'Lượng cacao phù hợp', 'Để không ảnh hưởng đến giấc ngủ, nên uống tối đa 1-2 tách cacao mỗi ngày. Liều lượng nhiều hơn có thể gây mất ngủ, mệt mỏi cho một số người.', 13, 1),
(62, '', 'Thời điểm uống lý tưởng', 'Uống cacao vào buổi sáng hoặc đầu buổi chiều là thời điểm thích hợp, tránh uống vào tối muộn. Nên uống trước bữa ăn hoặc giữa các bữa để thức uống được hấp thu tốt nhất.', 13, 1),
(63, '', 'Ai không nên uống cacao?', 'Một số nhóm người dưới đây không nên uống Cacao hoặc uống cacao thường xuyên để tránh ảnh hưởng đến giấc ngủ của bạn:\r\n<br>\r\nNgười mẫn cảm với Cafein\r\n<br>\r\nNgười mắc chứng mất ngủ, rối loạn giấc ngủ\r\n<br>\r\nPhụ nữ mang thai, cho con bú\r\n<br>\r\nTrẻ em dưới 12 tuổi', 13, 1),
(64, '', 'Biscotti là gì? Cách làm Bánh Biscotti ăn giảm cân thơm ngon', 'Bánh Biscotti với thành phần chính là bột nguyên cám đang rất thịnh hành trong thời gian gần đây, đặc biệt là với phân khúc khách hàng có thói quen ăn uống lành mạnh. Theo nhiều thông tin cho rằng Bánh Biscotti có tác dụng giảm cân, bổ sung chất dinh dưỡng cho người đang theo chế độ ăn kiêng, ăn chay hay người tập thể hình.', 14, 1),
(65, '', 'Các loại Bánh BISCOTTI đang được phân phối bởi SunnyFarm', 'Hiện nay SunnyFarm đang cung cấp 3 loại bánh Biscotti bao gồm Truyền thống, Matcha trà xanh và Chocolate để bạn có thể dễ dàng lựa chọn tuỳ vào khẩu vị của mình.', 14, 1),
(66, 'baiviet5.jpg', 'Bánh Biscotti là gì?', 'Bánh Biscotti là một loại bánh nổi tiếng có nguồn gốc từ nước Ý và được giới sành ăn gọi là món bánh “thách thức thời gian” và ăn hoài mà không chán. Bánh Biscotti là một loại bánh quy giòn và khô, được nướng hai lửa và ăn cùng với các loại hạt, quả sấy.\r\n<br>\r\nTại Việt Nam, có khá nhiều công thức làm Bánh Biscotti phổ biến như biscotti nho khô, biscotti hạnh nhân, biscotti Nutella,…', 14, 1),
(67, 'cacaomi-biscotti-chocolate-5.jpg', 'Thành phần dinh dưỡng trong bánh Biscotti', 'Theo các chuyên gia dinh dưỡng, thì trong 100g bánh Biscotti sẽ chứa khoảng 360 kcal và hàm lượng dinh dưỡng như sau:\r\n\r\nCarb: 48.32g\r\nFat: 13.82g\r\nProtein: 17.5g\r\nTheo đánh giá từ các chuyên gia, Bánh Biscotti không những không gây béo phì mà còn có tác dụng giảm cân nhờ vào hàm lượng calo thấp.\r\nThành phần có trong bánh Biscotti giảm cân đều là những nguyên liệu tự nhiên và giàu chất dinh dưỡng như:\r\n\r\nBột mì nguyên cám là loại thức ăn thô, chứa rất nhiều chất xơ, giúp tăng cường sự tiêu hoá thức ăn trong cơ thể\r\nTrứng gà giúp no lâu, tăng cường quá trình trao đổi chất giúp bạn giảm cân nhanh hơn\r\nMật ong trong bánh Biscotti giúp giảm cân và làm đẹp hiệu quả\r\nCác loại hạt dinh dưỡng như hạnh nhân, hạt điều, nho khô… chứa hàm lượng lớn chất xơ, vitamin và khoáng chất giúp bổ sung các chất dinh dưỡng cho người đang có nhu cầu giảm cân.', 14, 1),
(68, '', ' Công dụng của bánh Biscotti', 'Bánh Biscotti chứa nhiều chất xơ, một số loại viatmin nên được đánh giá là một loại thực phẩm tốt cho sức khoẻ. Bên cạnh đó, thành phần bao gồm những chất béo tốt từ các loại hạt và lượng canxi dồi dào vô cùng tốt cho xương.\r\nMột số công dụng nổi bật của của bánh Biscotti:\r\n\r\nHỗ trợ giảm cholesterol, bảo vệ tim mạch, phòng ngừa đau tim, phòng ngừa đột quỵ\r\nCải thiện chức năng hệ tiêu hóa\r\nHỗ trợ giảm cân hiệu quả.\r\nLà món ăn vặt thú vị trong những buổi xế chiều.', 14, 1),
(69, '', '3+ Cách Uống Bột Cacao Giảm Cân An Toàn Và Hiệu Quả Nhất', 'Một body đẹp, săn chắc luôn là mục tiêu của các tín đồ mê làm đẹp. Để làm được điều này cần phải thường xuyên tập luyện thể dục thể thao. Bên cạnh đó, chế độ ăn uống cũng là một yếu tố quan trọng đáng quan tâm.\r\n\r\nCacao chính là “thần dược” giúp hỗ trợ giảm cân rất hiệu quả. Với bột cacao giảm cân, giảm mỡ bụng bạn sẽ có ngay một cơ thể khỏe mạnh, body thu hút mọi ánh nhìn mà lại không mất quá nhiều tiền.', 15, 1),
(70, 'bot-cacao-giup-giam-can-hieu-qua.jpg', 'Lý do bột Cacao có thể giúp giảm cân hiệu quả', 'Theo tiến sĩ Sh Shilpa Mittal, chuyên gia dinh dưỡng Ấn Độ đã chia sẻ: “Cacao là một thành phần tuyệt vời để thúc đẩy sự trao đổi chất, giúp đẩy nhanh quá trình đốt cháy năng lượng, giảm quá trình tích lũy mỡ thừa.”\r\n\r\nVì vậy, dùng sô cô la đen để làm  món tráng miệng là một ý tưởng thật tuyệt vời. Đặc biệt, trong mùa đông, khi hoạt động trao đổi chất của cơ thể trở nên yếu đi, việc dùng sôcôla rất được khuyến khích.\r\nVới hàm lượng calo có trong cacao (227,5kcal) và chất theobromine sẽ giúp bạn cảm thấy no khi uống, từ đó giảm cảm giác thèm ăn hỗ trợ rất tốt trong quá trình giảm cân.\r\n\r\nSong song với việc giảm cân, cacao còn giúp bạn ổn định đường huyết, chống oxy hóa. Cacao tốt cho người tiểu đường bởi khả năng giúp cơ thể sản sinh thêm insulin, chất này làm ổn định đường trong máu.\r\n\r\nNgoài ra Insulin còn giúp chuyển hóa Carbohydrate (tinh bột) thành năng lượng thay vì thành dạng đường dự trữ trong cơ thể (tức mỡ thừa).\r\n\r\nCuối cùng, với magie có trong thành phần, bột cacao giảm cân giúp thư giãn và đẩy nhanh quá trình phục hồi cơ bắp, tạo sự phấn khởi và hứng thú trong tập luyện, đẩy nhanh quá trình giảm cân, giảm mỡ bụng.', 15, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banner`
--

CREATE TABLE `banner` (
  `id` int(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `banner`
--

INSERT INTO `banner` (`id`, `image`) VALUES
(1, 'banner 01.png'),
(8, 'banner 02.png'),
(9, 'banner 03.png');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `blog`
--

CREATE TABLE `blog` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `pagaph` text NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `blog`
--

INSERT INTO `blog` (`id`, `image`, `title`, `pagaph`, `day`) VALUES
(13, 'baiviet4.jpeg', 'Uống Cacao có mất ngủ không?Nên uống vào thời điểm nào?', '', '2024-12-10'),
(14, 'baiviet4.jpeg', 'Biscotti là gì? Cách làm Bánh Biscotti ăn giảm cân thơm ngon', '', '2024-12-20'),
(15, 'baiviet8.png', '3+ Cách Uống Bột Cacao Giảm Cân An Toàn Và Hiệu Quả Nhất', '', '2024-12-11');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Bột Ngũ Cốc'),
(2, 'Bột Chiết Xuất'),
(3, 'Bột Rau Củ '),
(4, 'Thảo Dược Thiên Nhiên');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories_items`
--

CREATE TABLE `categories_items` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dangky`
--

CREATE TABLE `dangky` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dangky`
--

INSERT INTO `dangky` (`id`, `image`) VALUES
(1, 'đăng nhập.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dangnhap`
--

CREATE TABLE `dangnhap` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `dangnhap`
--

INSERT INTO `dangnhap` (`id`, `image`) VALUES
(1, 'đăng nhập.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `haianh`
--

CREATE TABLE `haianh` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `haianh`
--

INSERT INTO `haianh` (`id`, `image`) VALUES
(1, 'banner5.jpg'),
(2, 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `info`
--

CREATE TABLE `info` (
  `id` int(100) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `pagraph` text NOT NULL,
  `id_info` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `info`
--

INSERT INTO `info` (`id`, `image`, `name`, `price`, `pagraph`, `id_info`, `status`) VALUES
(8, 'bot-ca-cao.jpg', 'Bột Ca Cao', 120.000, 'Bột Ca Cao nguyên chất được chế biến từ hạt ca cao tươi ngon, không qua xử lý hóa học, đảm bảo giữ trọn hương vị đắng nhẹ đặc trưng. Sản phẩm giàu chất chống oxy hóa, tốt cho tim mạch và giúp cải thiện tâm trạng. Phù hợp để làm bánh, đồ uống hoặc các món tráng miệng. Đóng gói tiện lợi, dễ dàng bảo quản và sử dụng trong nhiều công thức nấu ăn đa dạng.', 1, 1),
(9, 'Botcarot.jpg', 'Bột Cà Rốt', 90.000, 'Bột Cà Rốt được làm từ cà rốt tươi được sấy khô và xay nhuyễn, giữ lại tối đa vitamin A và các chất dinh dưỡng thiết yếu. Sản phẩm không chứa chất bảo quản hay phẩm màu, thích hợp cho các bữa ăn lành mạnh. Có thể sử dụng trong sinh tố, súp, bánh mì hoặc các món ăn khác để tăng hương vị và bổ sung dinh dưỡng. Đóng gói kín, bảo quản lâu dài mà không mất đi giá trị dinh dưỡng.', 2, 1),
(10, 'Bot-ot.jpg', 'Bột Ớt', 70.000, 'Bột Ớt tự nhiên được chế biến từ ớt tươi, không thêm bất kỳ phẩm màu hay chất bảo quản nào, giữ được hương vị cay nồng đặc trưng. Sản phẩm thích hợp để làm gia vị cho các món ăn như mì, súp, thịt nướng, và các món ăn truyền thống khác. Độ cay vừa phải, phù hợp với nhiều khẩu vị. Đóng gói tiện lợi, dễ dàng sử dụng và bảo quản, giúp bạn thêm phần nóng hổi cho các bữa ăn hàng ngày.', 4, 1),
(11, 'Botgaochin.jpg', 'Bột Gạo Chín', 85.000, 'Bột Gạo Chín được làm từ gạo chín rang vàng, mang lại hương vị thơm ngon và mùi thơm đặc trưng của gạo rang. Sản phẩm giàu carbohydrate, cung cấp năng lượng cho cơ thể, phù hợp để làm bánh, bánh xốp, bánh crepe, hoặc các món ăn truyền thống như xôi, chè. Đóng gói kín để bảo quản độ tươi ngon và giữ được chất lượng lâu dài. Thích hợp cho cả người lớn và trẻ em.', 5, 1),
(12, 'bot-nhan-sam.jpg', 'Bột Ca Cao Nhân Sâm', 150.000, 'Kết hợp giữa hương vị đậm đà của Bột Ca Cao nguyên chất và lợi ích sức khỏe từ nhân sâm, sản phẩm Bột Ca Cao Nhân Sâm giúp tăng cường sức đề kháng, cải thiện sức khỏe tổng thể. Thích hợp để pha chế các loại đồ uống bổ dưỡng, sinh tố, hoặc các món tráng miệng. Đóng gói tiện lợi, dễ dàng bảo quản và sử dụng hàng ngày để duy trì sức khỏe và năng lượng. Không chứa chất bảo quản hay phẩm màu.', 7, 1),
(13, 'bot-ca-chua.jpg', 'Bột Cà Chua', 95.000, 'Bột Cà Chua tự nhiên được làm từ cà chua chín mọng, sấy khô và xay nhuyễn, giữ lại hương vị ngọt thanh và màu đỏ hấp dẫn. Sản phẩm giàu lycopene, một chất chống oxy hóa mạnh mẽ, tốt cho tim mạch và da. Thích hợp để sử dụng trong các món nước sốt, súp, nước ép, hoặc làm gia vị cho các món ăn hàng ngày. Đóng gói kín, bảo quản lâu dài mà không mất đi hương vị và chất dinh dưỡng.', 8, 1),
(14, 'bot-cai-bo-xoi.jpg', 'Bột Cải Bó Xôi', 110.000, 'Bột Cải Bó Xôi được chế biến từ cải bó xôi tươi ngon, giữ lại nhiều chất xơ, vitamin và khoáng chất cần thiết cho cơ thể. Sản phẩm không chứa chất bảo quản, phù hợp cho các bữa ăn lành mạnh, sinh tố, hoặc các món ăn chay. Giúp cải thiện hệ tiêu hóa, tăng cường sức khỏe tim mạch và hỗ trợ giảm cân. Đóng gói tiện lợi, dễ dàng bảo quản và sử dụng trong nhiều công thức nấu ăn đa dạng.', 9, 1),
(15, 'bot-cai-xoan.jpg', 'Bột Cải Xoăn', 120.000, 'Bột Cải Xoăn hữu cơ được làm từ cải xoăn tươi, giàu vitamin K, C và các chất chống oxy hóa. Sản phẩm giúp hỗ trợ sức khỏe xương, cải thiện hệ miễn dịch và giảm viêm nhiễm trong cơ thể. Thích hợp để thêm vào sinh tố, nước ép, súp hoặc các món ăn khác để tăng cường dinh dưỡng. Đóng gói kín, bảo quản dễ dàng và giữ được chất lượng dinh dưỡng lâu dài. Không chứa chất bảo quản hay phẩm màu.', 10, 1),
(16, 'bot-collagen-ca.jpg', 'Bột Collagen Cá', 300.000, 'Bột Collagen Cá được chiết xuất từ da và xương cá biển sâu, giàu collagen tự nhiên giúp cải thiện độ đàn hồi của da, giảm nếp nhăn và hỗ trợ sức khỏe tóc và móng. Sản phẩm dễ dàng hòa tan trong nước, sữa hoặc sinh tố, phù hợp để bổ sung hàng ngày cho cả nam và nữ. Đóng gói tiện lợi, đảm bảo chất lượng cao và không chứa các chất phụ gia độc hại. Giúp duy trì vẻ đẹp và sức khỏe từ bên trong.', 11, 1),
(17, 'bot-dau-nanh-nhan-sam.jpg', 'Bột Đậu Nành Nhân Sâm', 130.000, 'Bột Đậu Nành Nhân Sâm kết hợp giữa đậu nành giàu protein và nhân sâm bổ dưỡng, hỗ trợ sức khỏe toàn diện, tăng cường năng lượng và cải thiện chức năng não bộ. Sản phẩm thích hợp để làm sinh tố, đồ uống bổ dưỡng, hoặc thêm vào các món ăn hàng ngày để tăng cường dinh dưỡng. Đóng gói kín, dễ dàng bảo quản và sử dụng, không chứa chất bảo quản hay phẩm màu, phù hợp cho cả người lớn và trẻ em.', 12, 1),
(18, 'bot-gao-lut.jpg', 'Bột Gạo Lứt', 70.000, 'Bột Gạo Lứt nguyên chất được làm từ gạo lứt rang xay nhuyễn, giàu chất xơ và các vitamin nhóm B. Sản phẩm giúp hỗ trợ hệ tiêu hóa, tốt cho tim mạch và thích hợp cho người ăn kiêng. Có thể sử dụng để làm bánh, cháo hoặc sinh tố. Đóng gói tiện lợi, dễ bảo quản và đảm bảo chất lượng lâu dài. Không chứa phẩm màu hay chất bảo quản.', 13, 1),
(19, 'bot-hoa-dau-biec-txk9mivr.jpg', 'Bột Hoa Dầu Biếc', 95.000, 'Bột Hoa Đậu Biếc tự nhiên được làm từ hoa đậu biếc sấy khô và xay nhuyễn, mang màu xanh tím đẹp mắt và giàu chất chống oxy hóa. Sản phẩm giúp cải thiện sức khỏe tim mạch, tăng cường miễn dịch và làm đẹp da. Dễ dàng pha chế đồ uống, làm bánh, hoặc sử dụng trong nấu ăn. Đóng gói kín, bảo quản lâu dài mà không mất đi hương vị và màu sắc tự nhiên.', 14, 1),
(20, 'bot-hung-que-nguyen-chat.jpg', 'Bột Húng Quế Nguyên Chất', 85.000, 'Bột Húng Quế Nguyên Chất được làm từ lá húng quế tươi, giữ nguyên hương thơm đặc trưng và các dưỡng chất thiết yếu. Sản phẩm thích hợp để làm gia vị cho các món ăn như salad, nước sốt, mì Ý, hoặc các món chay. Bột không chứa phẩm màu, chất bảo quản, giúp tăng hương vị cho các bữa ăn hàng ngày. Đóng gói nhỏ gọn, tiện lợi, dễ bảo quản và sử dụng.', 15, 1),
(21, 'bot-la-mo.jpg', 'Bột Lá Mơ', 80.000, 'Bột Lá Mơ tự nhiên được chế biến từ lá mơ tươi, giàu chất xơ và các chất dinh dưỡng tốt cho hệ tiêu hóa. Sản phẩm hỗ trợ giảm viêm, làm mát cơ thể và tăng cường sức khỏe. Có thể sử dụng trong sinh tố, nước ép, hoặc làm gia vị cho các món ăn. Đóng gói tiện lợi, không chứa chất bảo quản hay phụ gia, phù hợp cho mọi đối tượng sử dụng.', 16, 1),
(22, 'bot-me.jpg', 'Bột Me', 65.000, 'Bột Me được làm từ me chín, giữ nguyên hương vị chua thanh tự nhiên, rất thích hợp để làm gia vị nấu canh, nước chấm, hoặc các món ăn đặc trưng như lẩu, súp. Sản phẩm giàu vitamin C, giúp tăng cường miễn dịch và hỗ trợ tiêu hóa. Đóng gói kín, dễ dàng sử dụng và bảo quản lâu dài mà không cần chất bảo quản. Thích hợp cho cả món ăn gia đình và chuyên nghiệp.', 17, 1),
(23, 'bot-ngai-cuu-nguyen-cha.jpg', 'Bột Ngải Cứu Nguyên Chất', 75.000, 'Bột Ngải Cứu Nguyên Chất được làm từ lá ngải cứu tươi, giàu dưỡng chất giúp tăng cường sức khỏe, giảm căng thẳng và hỗ trợ hệ tiêu hóa. Sản phẩm thích hợp để pha trà, làm bánh, hoặc làm gia vị cho các món ăn truyền thống. Đóng gói kín, bảo quản tiện lợi và sử dụng dễ dàng. Không chứa phẩm màu hay hóa chất độc hại, an toàn cho mọi đối tượng sử dụng.', 18, 1),
(24, 'bot-nghe-vang-sdtvyfzp.jpg', 'Bột Nghệ Vàng', 80.000, 'Bột Nghệ Vàng nguyên chất được chế biến từ củ nghệ tươi, giàu curcumin giúp giảm viêm, hỗ trợ tiêu hóa và làm đẹp da. Thích hợp để pha trà, làm mặt nạ hoặc dùng trong nấu ăn. Đóng gói kín, dễ dàng bảo quản và sử dụng, không chứa chất bảo quản hay phụ gia.', 19, 1),
(25, 'bot-ngu-coc-nhan-sam.jpg', 'Bột Ngũ Cốc Nhân Sâm', 200.000, 'Bột Ngũ Cốc Nhân Sâm là sự kết hợp giữa ngũ cốc nguyên chất và nhân sâm, giúp bổ sung năng lượng và tăng cường sức khỏe tổng thể. Sản phẩm thích hợp để làm bữa sáng, sinh tố hoặc đồ ăn nhẹ. Đóng gói kín, bảo quản dễ dàng và sử dụng tiện lợi.', 20, 1),
(26, 'bot-oc-cho.jpg', 'Bột Óc Chó', 180.000, 'Bột Óc Chó được làm từ hạt óc chó nguyên chất, giàu omega-3 và các dưỡng chất tốt cho tim mạch, não bộ và da. Sản phẩm thích hợp để thêm vào sữa, bánh hoặc các món ăn lành mạnh. Đóng gói kín, bảo quản lâu dài và an toàn cho người dùng.', 21, 1),
(27, 'bot-rau-ma-nguyen-chat-4roaiwhm.jpg', 'Bột Rau Má Nguyên Chất', 90.000, 'Bột Rau Má Nguyên Chất được chế biến từ rau má tươi, giúp làm mát cơ thể, tăng cường sức khỏe và cải thiện làn da. Sản phẩm thích hợp để pha nước uống, làm mặt nạ hoặc dùng trong các món ăn. Đóng gói kín, không chứa chất bảo quản hay phụ gia.', 22, 1),
(28, 'bot-rong-bien-u5qlz1zw.jpg', 'Bột Rong Biển', 120.000, 'Bột Rong Biển làm từ rong biển tự nhiên, giàu i-ốt và các khoáng chất cần thiết, giúp hỗ trợ sức khỏe tuyến giáp và tăng cường miễn dịch. Sản phẩm dễ sử dụng trong súp, cháo hoặc làm gia vị. Đóng gói tiện lợi, bảo quản lâu dài mà không mất đi dinh dưỡng.', 23, 1),
(29, 'bot-rong-nho-wyqnpfpd.jpg', 'Bột Rong Nho', 150.000, 'Bột Rong Nho được làm từ rong nho tươi, giàu collagen và các chất chống oxy hóa, giúp làm đẹp da và tăng cường sức khỏe. Sản phẩm thích hợp để pha chế đồ uống, sinh tố hoặc làm gia vị. Đóng gói kín, dễ dàng bảo quản và sử dụng hàng ngày.', 24, 1),
(30, 'bot-sachi-f3pbtkqz.png', 'Bột Sachi', 250.000, 'Bột Sachi được chế biến từ hạt sachi nguyên chất, giàu omega-3, omega-6 và protein thực vật, giúp cải thiện sức khỏe tim mạch và hỗ trợ giảm cân. Sản phẩm thích hợp để pha chế sinh tố, nước uống hoặc làm bánh. Đóng gói tiện lợi, không chứa chất bảo quản.', 25, 1),
(31, 'bot-sam-ngoc-linh.jpg', 'Bột Sâm Ngọc Linh', 400.000, 'Bột Sâm Ngọc Linh là sản phẩm cao cấp được làm từ củ sâm Ngọc Linh tươi, giàu dưỡng chất giúp tăng cường sức khỏe, giảm căng thẳng và cải thiện miễn dịch. Thích hợp để pha trà, sử dụng trực tiếp hoặc làm quà tặng. Đóng gói kín, bảo quản lâu dài và dễ sử dụng.', 26, 1),
(32, 'bot-sam-to-nu.jpg', 'Bột Sâm Tố Nữ', 350.000, 'Bột Sâm Tố Nữ được chế biến từ củ sâm Tố Nữ, giàu phytoestrogen tự nhiên, giúp cân bằng nội tiết tố, làm đẹp da và hỗ trợ sức khỏe sinh lý nữ. Sản phẩm thích hợp để pha trà, sinh tố hoặc dùng trực tiếp. Đóng gói tiện lợi, bảo quản dễ dàng.', 27, 1),
(33, 'bot-san-day-n5cvdbks.jpg', 'Bột Sắn Dây', 50.000, 'Bột Sắn Dây nguyên chất được làm từ củ sắn dây tự nhiên, giúp thanh nhiệt, giải độc và hỗ trợ tiêu hóa. Sản phẩm dễ dàng pha chế thành đồ uống mát lạnh hoặc sử dụng trong nấu ăn. Đóng gói tiện lợi, dễ bảo quản.', 28, 1),
(34, 'bot-trai-dua-bloobsuf.jpg', 'Bột Trái Dứa', 60.000, 'Bột Trái Dứa tự nhiên, giữ nguyên hương vị và dưỡng chất của trái dứa tươi. Sản phẩm giúp tăng cường miễn dịch, hỗ trợ tiêu hóa và làm đẹp da. Thích hợp để pha chế sinh tố, nước ép hoặc làm gia vị nấu ăn.', 29, 1),
(35, 'bot-trai-nhau-qrcu5ed7.jpg', 'Bột Trái Nhàu', 80.000, 'Bột Trái Nhàu được làm từ trái nhàu chín, giàu chất chống oxy hóa và các dưỡng chất tốt cho sức khỏe. Sản phẩm thích hợp để pha trà, làm sinh tố hoặc sử dụng trực tiếp. Đóng gói tiện lợi, dễ bảo quản.', 30, 1),
(36, 'bot-xuyen-tam-lien.png', 'Bột Xuyên Tâm Li', 90.000, 'Bột Xuyên Tâm Li là sản phẩm tự nhiên giúp hỗ trợ thanh nhiệt, giải độc và tăng cường sức khỏe tổng thể. Thích hợp để pha trà hoặc sử dụng làm gia vị trong nấu ăn. Đóng gói kín, dễ dàng bảo quản và sử dụng.', 31, 1),
(37, 'tinh-bot-dau-ha-lan-f012nsdr.png', 'Tinh Bột Hà Lan', 70.000, 'Tinh Bột Hà Lan được chiết xuất từ các loại hạt tự nhiên, giàu dinh dưỡng và phù hợp để chế biến các món ăn hoặc làm nguyên liệu trong công nghiệp thực phẩm. Đóng gói kín, bảo quản lâu dài.', 32, 1),
(38, 'tinh-bot-khoai-mi-dang-hat.png', 'Tinh Bột Khoai Mì', 55.000, 'Tinh Bột Khoai Mì nguyên chất, giàu năng lượng, thích hợp để làm bánh, chè hoặc các món ăn truyền thống. Sản phẩm không chứa chất bảo quản, dễ bảo quản và sử dụng.', 33, 1),
(39, 're-cam-thao.jpg', 'Rễ Cam Thảo', 75.000, 'Rễ Cam Thảo tự nhiên, giàu dưỡng chất, giúp tăng cường miễn dịch, làm dịu họng và hỗ trợ tiêu hóa. Sản phẩm thích hợp để pha trà hoặc làm nguyên liệu trong các bài thuốc cổ truyền.', 34, 1),
(40, 'hong-hoa-say-kho.jpg', 'Hồng Hoa Sấy Khô', 65.000, 'Hồng Hoa Sấy Khô giữ nguyên màu sắc và hương vị tự nhiên, giàu dưỡng chất tốt cho sức khỏe. Thích hợp để pha trà, làm thuốc hoặc sử dụng trong chế biến thực phẩm. Đóng gói kín, bảo quản dễ dàng.', 35, 1),
(41, 'la-co-ngot-kho.jpg', 'Lá Cỏ Ngọt Khô', 60.000, 'Lá Cỏ Ngọt Khô tự nhiên, có vị ngọt tự nhiên, giúp giảm lượng đường trong chế độ ăn uống. Sản phẩm thích hợp để pha trà hoặc làm nguyên liệu trong các món ăn lành mạnh.', 36, 1),
(42, 'bach-qua-tuoi.jpg', 'Bạch Quả Tươi', 85.000, 'Bạch Quả Tươi giàu dưỡng chất, giúp tăng cường trí nhớ, hỗ trợ tim mạch và cải thiện tuần hoàn máu. Sản phẩm thích hợp để làm thuốc hoặc sử dụng trong chế biến món ăn đặc biệt.', 37, 1),
(43, 'hatchumngaykho.jpg', 'Hạt Chùm Ngây Khô', 70.000, 'Hạt Chùm Ngây Khô tự nhiên, giàu protein và các vitamin thiết yếu, giúp bổ sung dinh dưỡng và tăng cường sức khỏe. Sản phẩm dễ dàng chế biến trong món ăn hoặc pha trà.', 38, 1),
(44, 'botvocam.jpg', 'Bột Vỏ Cam', 50.000, 'Bột Vỏ Cam nguyên chất, giữ nguyên hương thơm và dưỡng chất của vỏ cam. Sản phẩm thích hợp để làm bánh, pha trà hoặc sử dụng trong các món ăn. Đóng gói kín, bảo quản lâu dài.', 39, 1),
(45, 'botvobuoi.jpg', 'Bột Vỏ Bưởi', 55.000, 'Bột Vỏ Bưởi tự nhiên, giàu tinh dầu và chất xơ, giúp hỗ trợ giảm cân và làm đẹp da. Sản phẩm thích hợp để pha trà, làm gia vị hoặc sử dụng trong các công thức làm đẹp.', 40, 1),
(46, 'hoa-dinh-huong-kho.jpg', 'Hoa Đinh Hương Khô', 80.000, 'Hoa Đinh Hương Khô tự nhiên, giữ nguyên hương thơm và dưỡng chất, giúp hỗ trợ tiêu hóa và cải thiện sức khỏe răng miệng. Thích hợp để pha trà hoặc làm gia vị trong các món ăn.', 41, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `customer_address` text NOT NULL,
  `note` text DEFAULT NULL,
  `total_amount` decimal(10,3) NOT NULL,
  `status` enum('Pending','Processing','Completed','Cancelled') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` decimal(10,3) NOT NULL DEFAULT 0.000,
  `quantity` decimal(10,3) NOT NULL DEFAULT 0.000,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `id_category` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `quantity`, `status`, `id_category`) VALUES
(1, 'Bột Ca Cao', 'bot-ca-cao.jpg', 220.000, 100.000, 1, 1),
(2, 'Bột Cà rốt (kg)', 'Botcarot.jpg', 90.000, 100.000, 1, 3),
(4, 'Bột ớt (kg)', 'Bot-ot.jpg', 100.000, 100.000, 1, 3),
(5, 'Bột gạo chín', 'Botgaochin.jpg', 125.000, 100.000, 1, 1),
(7, 'Bột ca cao nhân sâm', 'bot-ca-cao-nhan-sam.jpg', 385.000, 100.000, 1, 1),
(8, 'Bột cà chua', 'bot-ca-chua.jpg', 195.000, 100.000, 1, 3),
(9, 'Bột cải bó xôi', 'bot-cai-bo-xoi.jpg', 235.000, 100.000, 1, 3),
(10, 'Bột cải xoăn', 'bot-cai-xoan.jpg', 270.000, 100.000, 1, 3),
(11, 'Bột collagen cá', 'bot-collagen-ca.jpg', 360.000, 100.000, 1, 2),
(12, 'Bột đậu nành nhân sâm', 'bot-dau-nanh-nhan-sam.jpg', 340.000, 100.000, 1, 1),
(13, 'Bột gạo lứt', 'bot-gao-lut.jpg', 165.000, 100.000, 1, 1),
(14, 'Bột Hoa Dầu Biếc', 'bot-hoa-dau-biec.jpg', 175.500, 100.000, 1, 2),
(15, 'Bột húng quế nguyên chất', 'bot-hung-que-nguyen-chat.jpg', 145.000, 100.000, 1, 2),
(16, 'Bột lá mơ', 'bot-la-mo.jpg', 120.000, 100.000, 1, 2),
(17, 'Bột me', 'bot-me.jpg', 100.000, 100.000, 1, 2),
(18, 'Bột ngải cứu nguyên chất', 'bot-ngai-cuu-nguyen-cha.jpg', 145.000, 100.000, 1, 2),
(19, 'Bột nghệ vàng', 'bot-nghe-vang-sdtvyfzp.jpg', 145.000, 100.000, 1, 2),
(20, 'Bột ngũ cốc nhân sâm', 'bot-ngu-coc-nhan-sam.jpg', 105.000, 100.000, 1, 1),
(21, 'Bột óc chó', 'bot-oc-cho.jpg', 165.000, 100.000, 1, 1),
(22, 'Bột rau má nguyên chất', 'bot-rau-ma-nguyen-chat-4roaiwhm.jpg', 131.000, 100.000, 1, 3),
(23, 'Bột Rong Biển', 'bot-rong-bien-u5qlz1zw.jpg', 60.000, 100.000, 1, 2),
(24, 'Bột Rong Nho', 'bot-rong-nho-wyqnpfpd (1).jpg', 35.000, 100.000, 1, 3),
(25, 'Bột Sachi', 'bot-sachi-f3pbtkqz.png', 148.500, 100.000, 1, 1),
(26, 'Bột sâm Ngọc Linh\r\n', 'bot-sam-ngoc-linh.jpg', 350.000, 100.000, 1, 2),
(27, 'Bột sâm Tố Nữ', 'bot-sam-to-nu.jpg', 60.000, 100.000, 1, 2),
(28, 'Bột Sắn Dây', 'bot-san-day-n5cvdbks.jpg', 42.000, 100.000, 1, 3),
(29, 'Bột Trái Dứa', 'bot-trai-dua-bloobsuf.jpg', 48.500, 100.000, 1, 3),
(30, 'Bột Trái Nhàu', 'bot-trai-nhau-qrcu5ed7.jpg', 48.500, 100.000, 1, 3),
(31, 'Bột Xuyên Tâm Li', 'bot-xuyen-tam-lien.png', 190.000, 100.000, 1, 2),
(32, 'Tinh bột Hà Lan', 'tinh-bot-dau-ha-lan-f012nsdr.png', 65.000, 100.000, 1, 3),
(33, 'Tinh bột khoai mì ', 'tinh-bot-khoai-mi-dang-hat.png', 70.000, 100.000, 1, 3),
(34, 'Rễ Cam Thảo', 're-cam-thao.jpg', 80.000, 100.000, 1, 4),
(35, 'Hồng Hoa Sấy Khô', 'hong-hoa-say-kho.jpg', 90.250, 100.000, 1, 4),
(36, 'Lá cỏ ngọt khô', 'la-co-ngot-kho.jpg', 30.000, 100.000, 1, 4),
(37, 'Bạch quả tươi', 'bach-qua-tuoi.jpg', 40.000, 100.000, 1, 4),
(38, 'Hạt chùm ngây khô', 'hatchumngaykho.jpg', 200.000, 100.000, 1, 4),
(39, 'Bột vỏ cam', 'botvocam.jpg', 50.000, 100.000, 1, 4),
(40, 'Bột vỏ bưởi', 'botvobuoi.jpg', 60.000, 100.000, 1, 4),
(41, 'Hoa đinh hương khô', 'hoa-dinh-huong-kho.jpg', 40.000, 100.000, 1, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `password`, `role`) VALUES
(1, 'Phụng ', '123456789', '', 'admin'),
(15, 'Lê Văn Hậu', '0367722389', '123', '');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_baigioithieu` (`id_article`);

--
-- Chỉ mục cho bảng `baigioithieu`
--
ALTER TABLE `baigioithieu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_baiviet` (`id_blog`);

--
-- Chỉ mục cho bảng `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories_items`
--
ALTER TABLE `categories_items`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dangky`
--
ALTER TABLE `dangky`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `dangnhap`
--
ALTER TABLE `dangnhap`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `haianh`
--
ALTER TABLE `haianh`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_info_products` (`id_info`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `baigioithieu`
--
ALTER TABLE `baigioithieu`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT cho bảng `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `categories_items`
--
ALTER TABLE `categories_items`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT cho bảng `dangky`
--
ALTER TABLE `dangky`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `dangnhap`
--
ALTER TABLE `dangnhap`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `haianh`
--
ALTER TABLE `haianh`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `info`
--
ALTER TABLE `info`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT cho bảng `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=144;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_baigioithieu` FOREIGN KEY (`id_article`) REFERENCES `baigioithieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `fk_blog_baiviet` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `info`
--
ALTER TABLE `info`
  ADD CONSTRAINT `fk_products_info` FOREIGN KEY (`id_info`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_orders_order_items` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_products_order_items` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_products_categories` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
