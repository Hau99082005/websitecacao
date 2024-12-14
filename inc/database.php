<?php 
 include('config/connect.php');
 session_start();

 class cart {
    public $id, $name, $image, $price, $quantity;
    function __construct($id, $name, $image, $price, $quantity) {
      $this->id = $id;
      $this->name = $name;
      $this->image = $image;
      $this->price = $price;
      $this->quantity = $quantity;

    }
}
 function _header($title) {
    $s = '
    <!DOCTYPE html>
       <html lang="zxx">
     <head>
    <meta charset="UTF-8">
    <meta name="description" content="Fashi Template">
    <meta name="keywords" content="Fashi, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>'.$title.'</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Muli:300,400,500,600,700,800,900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="phung_css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="phung_css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="phung_css/themify-icons.css" type="text/css">
    <link rel="stylesheet" href="phung_css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="phung_css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="phung_css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="phung_css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="phung_css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="phung_css/style.css" type="text/css">
     <link rel="stylesheet" href="bootstraps/css/bootstrap.min.css">
    <script src="bootstraps/js/bootstrap.min.js"></script>
    <script src="bootstraps/js/bootstrap.bundle.js"></script>
    <link rel="apple-touch-icon" sizes="180x180" href="icons/android-chrome-192x192.png">
     <link rel="icon" type="image/png" sizes="32x32" href="icons/favicon-32x32.png">
   <link rel="icon" type="image/png" sizes="16x16" href="icons/favicon-16x16.png">
        <link rel="manifest" href="icons/site.webmanifest">
   </head>
   <body>
    ';
    echo $s;
 }

 function _navbar() {
    if(isset($_GET['id_product']))addtoCartProduct($_GET['id_product']);
    if(isset($_GET['clear']))unset($_SESSION['cart']);
    $total = 0.0;
    if (isset($_SESSION['cart'])) {
        $a = $_SESSION['cart'];
        for ($i = 0; $i < count($a); $i++) {
            $item_total = $a[$i]->quantity * $a[$i]->price * 1000;
            $total += $item_total;
        }
    }
    if (isset($_GET['delete']) && is_numeric($_GET['delete'])) {
        $deleteIndex = (int)$_GET['delete'];
        if (isset($_SESSION['cart'][$deleteIndex])) {
            unset($_SESSION['cart'][$deleteIndex]);
            // Reset lại index của mảng giỏ hàng để không còn khoảng trống
            $_SESSION['cart'] = array_values($_SESSION['cart']);
        }
    }
    
    $s = '
     <header class="header-section">
        <div class="header-top">
            <div class="container">
                <div class="ht-left">
                    <div class="mail-service">
                        <i class=" fa fa-envelope"></i>
                        Phungtruong1148@gmail.com
                    </div>
                    <div class="phone-service">
                        <i class=" fa fa-phone"></i>
                        0356482981
                    </div>
                </div>
                <div class="ht-right">';
                 if(!isset($_SESSION['user'])) {
                    $s .= '<a href="dangnhap.php" class="login-panel" style="text-decoration: none;"><i class="fa fa-user"></i>Đăng nhập</a>';
                 }else {
                    $s .= '<div class="hr-container" style"display: inline-block;"><i class="fa fa-user"></i><p"> Chào '.splitName($_SESSION['user']['name']).'</p></div>
                          <a href="dangxuat.php" class="login-panel"><i class="fa fa-sign-out"></i></a>
                    ';
                 }
                    $s .= '
                    <div class="top-social">
                        <a href="#" style="text-decoration: none;"><i class="ti-facebook"></i></a>
                        <a href="#" style="text-decoration: none;"><i class="ti-twitter-alt"></i></a>
                        <a href="#" style="text-decoration: none;"><i class="ti-linkedin"></i></a>
                        <a href="#" style="text-decoration: none;"><i class="ti-pinterest"></i></a>
                    </div>';
                $s .= '</div>
            </div>
        </div>
        <div class="container">
            <div class="inner-header">
                <div class="row">
                    <div class="col-lg-2 col-md-2">
                        <div class="logo">
                            <a href="index.php">
                                <img src="icons/logo.png" alt="" width="50%" height="50%">
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-7 col-md-7">
                        <div class="advanced-search">
                            <div class="input-group">
                               <form action="sanpham.php" method="GET">
                                <input type="text" name="search_query" placeholder="Bạn cần tìm kiếm gì?" value="'.(isset($_GET['search_query']) ? $_GET['search_query'] : '').'">
                                <button type="submit" class="site-btn"><i class="fa fa-search" aria-hidden="true"></i></button>
                            </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 text-right col-md-3">
                        <ul class="nav-right">
                            <li class="cart-icon">
                                <a href="giohang.php">
                                    <i class="icon_bag_alt"></i>
                                    <span>';
                                    if(!isset($_SESSION['cart'])) $s.= '0';
                                    else $s.= count($_SESSION['cart']);
                                    $s.= '</span>
                                </a>
                                <div class="cart-hover">
                                    <div class="select-items">
                                        <table>
                                            <tbody>';
                                            if(isset($_SESSION['cart'])) {
                                                $a = $_SESSION['cart'];
                                                for ($i = 0; $i < count($a); $i++) {
                                                    $item_total = $a[$i]->quantity * $a[$i]->price * 1000;
                                                    $s .= '<tr>
                                                    <td class="si-pic"><img src="assets/images/'.$a[$i]->image.'" alt=""></td>
                                                    <td class="si-text">
                                                        <div class="product-selected">
                                                            <p>'.number_format($a[$i]->price * 1000, 0, '.', '.').' đ</p>
                                                            <h6>'.$a[$i]->name.'</h6>
                                                        </div>
                                                    </td>
                                                    <td class="si-close">
                                                        <a href="giohang.php?delete=' . $i . '" 
                                                           class="ti-close" 
                                                           style="background: #F08080; width: 80px; height: 40px; display: flex; justify-content: center; align-items: center; border-radius: 10px; font-weight: bolder; color: white; font-size: 16px; text-decoration: none;">
                                                        </a>
                                                    </td>
                                                </tr>';
                                                
                                                }
                                            }
                                            $s.= '</tbody>
                                        </table>
                                    </div>
                                    <div class="select-total">
                                        <span>Tổng Tiền:</span>
                                        <h5>'.number_format($total, 0, '.', '.').'</h5>
                                    </div>
                                    <div class="select-button">
                                        <a href="giohang.php" class="primary-btn view-card">Giỏ hàng</a>
                                        <a href="thanhtoan.php" class="primary-btn checkout-btn">Thanh Toán</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="nav-item">
            <div class="container">
                <div class="nav-depart">
                    <div class="depart-btn">
                        <i class="ti-menu"></i>
                        <span>Danh Mục</span>
                        <ul class="depart-hover">';
                        $q = Database::query("SELECT * FROM `categories`");
                           while($r = $q->fetch_array()) {
                            $s .= '<li class="active"><a href="sanpham.php?id_category='.$r['id'].'" style="text-decoration: none;">'.$r['name'].'</a></li>';
                           }
                        $s .= '</ul>
                    </div>
                </div>
                <nav class="nav-menu mobile-menu">
                    <ul>
                        <li class="active"><a href="index.php" style="text-decoration: none;">Trang chủ</a></li>
                     <li>
                            <a href="sanpham.php" style="text-decoration: none;">Cửa Hàng</a>
                             <ul class="dropdown">';
                               $q = Database::query("SELECT * FROM `categories`");
                                  while ($r = $q->fetch_array()) {
                               $s.='<li><a href="sanpham.php?id_category='.$r['id'].'" style="text-decoration: none;">'.$r['name'].'</a></li>';
                               }
                       $s .= '</ul>
                     </li>
                        <li><a href="lienhe.php" style="text-decoration: none;">Liên Hệ</a></li>
                        <li><a href="giohang.php" style="text-decoration: none;">Trang</a>
                            <ul class="dropdown">
                                <li><a href="giohang.php" style="text-decoration: none;">Giỏ hàng</a></li>
                                <li><a href="thanhtoan.php" style="text-decoration: none;">Thanh toán</a></li>
                                <li><a href="dangky.php" style="text-decoration: none;">Đăng ký</a></li>
                                <li><a href="dangnhap.php" style="text-decoration: none;">Đăng nhập</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="mobile-menu-wrap"></div>
            </div>
        </div>
    </header>
    ';
    echo $s;
 }

 function _banner() {
    $s = '
           <section class="hero-section">
        <div class="hero-items owl-carousel">
            <div class="single-hero-items set-bg">
                <div class="container">
                    <div class="row">
                       <div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
                           <div class="carousel-inner">';
                            $q = Database::query("SELECT * FROM `banner`");
                            while($r = $q->fetch_array()) {
                             $s .= '<div class="carousel-item active" data-bs-interval="3000">
                                 <img src="img/'.$r['image'].'" class="d-block w-100" alt="...">
                            </div>';
                            }
                          $s .= '</div>
                          <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
                           <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                          <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
                           <span class="carousel-control-next-icon" aria-hidden="true"></span>
                           <span class="visually-hidden">Next</span>
                           </button>
                        </div>
                    </div>
                </div>
            </div>
            
        </div>
    </section>
    ';
    echo $s;
 }

 function _hero() {
    $s = '
        <div class="banner-section spad">
        <div class="container-fluid">
            <div class="row">';
              $q = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 3");
              while($r = $q->fetch_array()) {
                $s .= '<div class="col-lg-4">
                    <div class="single-banner">
                        <img src="assets/images/'.$r['image'].'" alt="" width="100%" height="100%">
                        <div class="inner-text">
                            <h4>'.$r['name'].'</h4>
                        </div>
                    </div>
                </div>';
              }
            $s .=  '</div>
        </div>
    </div>
    ';
    echo $s;
 }

 function _pad() {
    $s = '
    <section class="women-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3">';
                 $q2 = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 1");
              if ($q2) {
              while ($r2 = $q2->fetch_array()) {
            $s .= '<div class="product-large set-bg" data-setbg="assets/images/'.$r2['image'].'">
                        <h2>'.$r2['name'].'</h2>
                        <a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r2['id'];
                            $s.='"><i class="fa fa-shopping-cart" style="font-size: 30px;"></i></a>
                            <a href="thongtin.php?id_info= '.intval($r2['id']).'"><i class="fa fa-eye"></i></a>
                   </div>';
        }
    }
    $s .= '</div>
            <div class="col-lg-8 offset-lg-1">
                <div class="filter-control">
                    <ul>';
    $q = Database::query("SELECT * FROM `categories`");
    if ($q) {
        while ($r = $q->fetch_array()) {
            $activeClass = isset($_GET['id_category']) && $_GET['id_category'] == $r['id'] ? 'active' : '';
            $s .= '<li class="' . $activeClass . '">
                    <a href="index.php?id_category='.$r['id'].'" style="text-decoration: none; color: #000;">'.$r['name'].'</a>
                  </li>';
        }
    }
    $s .= '</ul>
                </div>
                <div class="product-slider owl-carousel">';
    $id_category = isset($_GET['id_category']) ? intval($_GET['id_category']) : 0;
    $q1 = Database::query("SELECT * FROM `products` WHERE status = true" . ($id_category ? " AND id_category = $id_category" : ""));
    if ($q1) {
        while ($r1 = $q1->fetch_array()) {
            $s .= '<div class="product-item">
                    <div class="pi-pic">
                        <img src="assets/images/'.$r1['image'].'" alt="">
                        <div class="icon">
                            <i class="icon_heart_alt"></i>
                        </div>
                        <ul>
                            <li class="w-icon active"><a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r1['id'];
                            $s.='"><i class="icon_bag_alt"></i></a></li>
                              <li><a href="thongtin.php?id_info= '.intval($r1['id']).'"><i class="fa fa-eye"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <div class="catagory-name">Category</div>
                        <a href="#" style="text-decoration: none">
                            <h5>'.$r1['name'].'</h5>
                        </a>
                        <div class="product-price">
                            '.$r1['price'].'<sup>đ</sup>
                        </div>
                    </div>
                </div>';
        }
    }

    $s .= '</div> <!-- Close product-slider -->
            </div>
        </div>
    </div>
    </section>';
    echo $s;
}

 function _deal() {
    $s = '';
    $q = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 1");
    while($r = $q->fetch_array()) {
    $s .= '
         <section class="deal-of-week set-bg spad" data-setbg="assets/images/'.$r['image'].'" width="100%" height="100%">
        <div class="container"> 
            <div class="col-lg-6 text-center">
                <div class="section-title">
                    <h2>'.$r['name'].'</h2>
                    <div class="product-price">
                        '.$r['price'].'
                       <sup>đ</sup>
                    </div>
                </div>
                <div class="countdown-timer" id="countdown">
                    <div class="cd-item">
                        <span>56</span>
                        <p>Ngày</p>
                    </div>
                    <div class="cd-item">
                        <span>12</span>
                        <p>Giờ</p>
                    </div>
                    <div class="cd-item">
                        <span>40</span>
                        <p>Phút</p>
                    </div>
                    <div class="cd-item">
                        <span>52</span>
                        <p>Giây</p>
                    </div>
                </div>
               <a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r['id'];
                            $s.='"><i class="fa fa-shopping-cart"></i></a>
                            <a href="thongtin.php?id_info= '.intval($r['id']).'"><i class="fa fa-eye"></i></a>
            </div>
        </div>
    </section>
    ';
    }
    echo $s;
 }

 function _product() {
    $s = '
    <!-- Deal Of The Week Section End -->
    <!-- Man Banner Section Begin -->
    <section class="man-banner spad">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-8">
                    <div class="filter-control">
                        <ul>';
                     $q = isset($_GET['id_category']) 
                    ? Database::query("SELECT * FROM `categories` WHERE id = " . intval($_GET['id_category']))
                    : Database::query("SELECT * FROM `categories`");
                    if ($q) {
                    while ($r = $q->fetch_array()) {
                 $s .= '<li class="active"><a href="index.php?id_category=' . intval($r['id']) . '" style="color: #000; text-decoration: none;">'.$r['name'].'</a></li>';
                }
         }
    $s .= '</ul>
                    </div>
                    <div class="product-slider owl-carousel">';
    $id_category = isset($_GET['id_category']) ? intval($_GET['id_category']) : 0;
    $q1 = $id_category 
        ? Database::query("SELECT * FROM `products` WHERE status = true AND id_category = $id_category")
        : Database::query("SELECT * FROM `products` WHERE status = true");
    if ($q1) {
        while ($r1 = $q1->fetch_array()) {
            $s .= '<div class="product-item">
                <div class="pi-pic">
                    <img src="assets/images/'.$r1['image'].'" alt="">
                    <div class="icon">
                        <i class="icon_heart_alt"></i>
                    </div>
                    <ul>
                        <li class="w-icon active"><a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r1['id'];
                            $s.='"><i class="icon_bag_alt"></i></a></li>
                              <li><a href="thongtin.php?id_info= '.intval($r1['id']).'"><i class="fa fa-eye"></i></a></li>
                    </ul>
                </div>
                <div class="pi-text">
                    <div class="catagory-name">Coat</div>
                    <a href="#" style="text-decoration: none;">
                        <h5>'.$r1['name'].'</h5>
                    </a>
                    <div class="product-price">
                        '.$r1['price'].'<sup>đ</sup>
                    </div>
                </div>
            </div>';
        }
    }
    $s .= '</div>
                </div>
                <div class="col-lg-3 offset-lg-1">';
    $q2 = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 1");
    if ($q2) {
        while ($r2 = $q2->fetch_array()) {
            $s .= '<div class="product-large set-bg m-large" data-setbg="assets/images/'.$r2['image'].'">
                <h2 style="color: #000;">'.$r2['name'].'</h2>
                <a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r2['id'];
                            $s.='"><i class="fa fa-shopping-cart"></i></a>
                            <a href="thongtin.php?id_info= '.intval($r2['id']).'"><i class="fa fa-eye"></i></a>
            </div>';
        }
    }

    $s .= '</div>
            </div>
        </div>
    </section>
    <!-- Man Banner Section End -->

    <!-- Instagram Section Begin -->
    <div class="instagram-photo">';
    $q = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 6");
    if ($q) {
        while ($r = $q->fetch_array()) {
            $s .= '<div class="insta-item set-bg" data-setbg="assets/images/'.$r['image'].'">
                <div class="inside-text">
                    <h5><a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r['id'];
                            $s.='"><i class="icon_bag_alt"></i></a></h5>
                </div>
            </div>';
        }
    }
    $s .= '</div>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest-blog spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Bài Viết</h2>
                    </div>
                </div>
            </div>
                     <div class="row">';
                    if (!isset($_GET['id_blog'])) {
                     $q = Database::query("SELECT * FROM `blog`");
                      } else {
                      $id_blog = intval($_GET['id_blog']); 
                     $q = Database::query("SELECT * FROM `blog` WHERE id = $id_blog");
                    }
                    if ($q) {
                     while ($r = $q->fetch_array()) {
                $s .= '<div class="col-lg-4 col-md-6">
                <div class="single-latest-blog">
                    <img src="assets/images/'.$r['image'].'" alt="">
                    <div class="latest-text">
                        <div class="tag-list">
                            <div class="tag-item">
                                <i class="fa fa-calendar-o"></i>
                                '.$r['day'].'
                            </div>
                        </div>
                        <a href="baiviet.php?id_blog=' . intval($r['id']).'" style="text-decoration: none;">
                            <h4>'.$r['title'].'</h4>
                        </a>
                        <p>'.$r['pagaph'].'</p>
                    </div>
                </div>
            </div>';
    }
 }
  $s .= '</div>
        </div>
    </section>';

    echo $s;
}

 function _footer() {
    $s = '
    <footer class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="footer-left">
                        <div class="footer-logo">
                            <a href="index.php"><img src="icons/logo.png" width="50%" height="50%" alt=""></a>
                        </div>
                        <ul>
                            <li>Address: 55 Tôn Thất Dương Kỵ</li>
                            <li>Phone: 0356482981</li>
                            <li>Email: Phungtruong1148@gmail.com</li>
                        </ul>
                        <div class="footer-social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-pinterest"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1">
                    <div class="footer-widget">
                        <h5>Về Chúng Tôi</h5>
                        <ul>
                            <li><a href="index.php" style="text-decoration: none;">Trang chủ</a></li>
                            <li><a href="thanhtoan.php" style="text-decoration: none;">Thanh Toán</a></li>
                            <li><a href="lienhe.php" style="text-decoration: none;">Liên Hệ</a></li>
                            <li><a href="index.php" style="text-decoration: none;">Chính sách và điều khoản</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="newslatter-item">
                        <h5>Liên Hệ ngay cho chúng tôi</h5>
                        <p>Nếu có sự cố về sản phẩm thì hãy liên hệ với chúng tôi.</p>
                        <form action="#" class="subscribe-form">
                            <input type="text" placeholder="Email của bạn">
                            <button type="button">Gửi</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="copyright-reserved">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="copyright-text">
                            <!-- Link back to Colorlib cant be removed. Template is licensed under CC BY 3.0. -->
          &copy;<script>document.write(new Date().getFullYear());</script>  Bản quyền thuộc về<i class="fa fa-heart-o" aria-hidden="true"></i> <a style="text-decoration: none;" href="https://colorlib.com" target="_blank">SunnyFarm</a>
                        </div>
                        
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="phung_js/jquery-3.3.1.min.js"></script>
    <script src="phung_js/bootstrap.min.js"></script>
    <script src="phung_js/jquery-ui.min.js"></script>
    <script src="phung_js/jquery.countdown.min.js"></script>
    <script src="phung_js/jquery.nice-select.min.js"></script>
    <script src="phung_js/jquery.zoom.min.js"></script>
    <script src="phung_js/jquery.dd.min.js"></script>
    <script src="phung_js/jquery.slicknav.js"></script>
    <script src="phung_js/owl.carousel.min.js"></script>
    <script src="phung_js/main.js"></script>
   </body>

</html>
    
    ';
    echo $s;
 }

 function login(){
    if (isset($_POST['emailphone']) && isset($_POST['password'])) {
        if (is_numeric($_POST['emailphone'])) {
            $x = 'phone';
        } else {
            $x = 'email';
        }
        
        $q = Database::query("SELECT * FROM users WHERE $x = '{$_POST['emailphone']}' AND password = '{$_POST['password']}'");
        if ($r = $q->fetch_array()) {
            if ($r['role'] == 'admin') {
                header("Location: admin.php");
            } else {
                $_SESSION['user'] = $r;
                if (isset($_POST['remember_me'])) {
                    setcookie('emailphone', $_POST['emailphone'], time() + (86400 * 30), "/"); 
                    setcookie('password', $_POST['password'], time() + (86400 * 30), "/"); 
                } else {
                    setcookie('emailphone', '', time() - 3600, "/");
                    setcookie('password', '', time() - 3600, "/");
                }
                
                header("Location:  index.php");
            }
        } else {
            $_SESSION['login_fail'] = 'Dữ liệu nhập không chính xác!!!';
            header("Location: dangnhap.php");
        }
    }

    $saved_emailphone = isset($_COOKIE['emailphone']) ? $_COOKIE['emailphone'] : '';
    $saved_password = isset($_COOKIE['password']) ? $_COOKIE['password'] : '';

    $s = '
    <section class="vh-100">
    <div class="container-fluid h-custom">
        <div class="row d-flex justify-content-center align-items-center h-100">';
        $q = Database::query("SELECT * FROM `dangnhap`");
        while($r = $q->fetch_array()) {
        $s .= '<div class="col-md-9 col-lg-6 col-xl-5">
            <img src="assets/images/'.$r['image'].'"
            class="img-fluid" alt="Sample image">
        </div>';
        }
        $s .= '<div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
            <form action="" method="post">
            <h2 style="padding: 40px 0 25px 0">Đăng Nhập</h2>';
           if (isset($_SESSION['login_fail'])) {
               $s .= '<div style="color: red;">'.$_SESSION['login_fail'].'</div>';
               unset($_SESSION['login_fail']); 
           }
           
            $s .= '<!-- Email input -->
            <div data-mdb-input-init class="form-outline mb-4">
                <input type="text" name="emailphone" class="form-control form-control-lg"
                placeholder="Nhập vào số điện thoại của bạn" value="' . htmlspecialchars($saved_emailphone) . '" />
            </div>
            <!-- Password input -->
            <div data-mdb-input-init class="form-outline mb-3">
                <input type="password" name="password" class="form-control form-control-lg"
                placeholder="Nhập vào mật khẩu" id="password" value="' . htmlspecialchars($saved_password) . '" />
                <button type="button" onclick="togglePassword()" class="btn btn-secondary btn-sm mt-2">Hiện/Ẩn mật khẩu</button>
            </div>
            <div class="d-flex justify-content-between align-items-center">
                <!-- Remember Me Checkbox -->
                <div class="form-check mb-0">
                    <input class="form-check-input me-2" type="checkbox" name="remember_me" value="1" id="form2Example3"' . (!empty($saved_emailphone) ? ' checked' : '') . ' />
                    <label class="form-check-label" for="form2Example3">
                        Ghi nhớ mật khẩu    
                    </label>
                </div>
                <a href="#!" class="text-body">Quên mật khẩu?</a>
            </div>

            <div class="text-center text-lg-start mt-4 pt-2">
                <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg"
                style="padding-left: 2.5rem; padding-right: 2.5rem;">Đăng Nhập</button>
                <p class="small fw-bold mt-2 pt-1 mb-0">Bạn chưa có tài khoản? <a href="dangky.php"
                    class="link-danger">Đăng ký</a></p>
            </div>
            </form>
        </div>
        </div>
    </div>
    
    </section>

    <script>
    function togglePassword() {
        var passwordField = document.getElementById("password");
        if (passwordField.type === "password") {
            passwordField.type = "text";
        } else {
            passwordField.type = "password";
        }
    }
    </script>
    ';

    echo $s;
}

 function splitName($str){
        $rs = NULL;
        $word = mb_split(' ', $str);
        $n = count($word)-1;
        if ($n > 0) {$rs = $word[$n];}

        return $rs;
}
function register(){
    $errName = $errPhone = $errPass = $errRepass = '';

    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        if (empty($_POST['name'])) {
            $errName = "Vui lòng nhập vào tên của bạn!";
        }
        if (empty($_POST['phone'])) {
            $errPhone = "Cần có 1 số điện thoại!";
        } else {
            if (!preg_match('/^\d{10}$/', $_POST['phone'])) {
                $errPhone = "Số điện thoại phải có đúng 10 chữ số!";
            } else {
                $phoneCheckQuery = "SELECT COUNT(*) FROM users WHERE phone='" . $_POST['phone'] . "'";
                $phoneCheckResult = Database::query($phoneCheckQuery);
                $phoneExists = $phoneCheckResult->fetch_array()[0];

                if ($phoneExists > 0) {
                    $errPhone = "Số điện thoại đã tồn tại!";
                }
            }
        }
        if (empty($_POST['pass'])) {
            $errPass = "Vui lòng nhập mật khẩu!";
        }
        if (empty($_POST['repass'])) {
            $errRepass = "Vui lòng xác nhận mật khẩu!";
        } else {
            if ($_POST['pass'] != $_POST['repass']) {
                $errRepass = "Mật khẩu không khớp!";
            }
        }
        if ($errName == '' && $errPhone == '' && $errPass == '' && $errRepass == '') {
            $insertQuery = "INSERT INTO users(name, phone, password, role) VALUES('".$_POST['name']."', '".$_POST['phone']."', '".$_POST['pass']."', '')";
            Database::query($insertQuery);
            $userQuery = "SELECT * FROM users WHERE phone='" . $_POST['phone'] . "' AND password='" . $_POST['pass'] . "'";
            $userResult = Database::query($userQuery);
            $_SESSION['user'] = $userResult->fetch_array();
            header("location: index.php");
        }
    }

    $s = '
        <section class="vh-80" style="background-color: #eee; border: none; border-radius: none;">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-lg-12 col-xl-11">
                <div class="card text-black" style="border-radius: 25px;">
                <div class="card-body p-md-3">
                    <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">

                        <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Đăng Ký</p>

                        <form class="mx-1 mx-md-4" action="" method="post">

                        <div class="d-flex flex-row align-items-center mb-3">
                            <i class="fa fa-user"></i>
                            <div data-mdb-input-init class="form-outline flex-fill mb-0">
                            <label class="form-label" for="form3Example1c">Tên của bạn</label>
                            <input type="text" name="name" class="form-control" />
                            <span style="color: red;">'.$errName.'</span>
                            </div>
                        </div>
                        <div class="d-flex flex-row align-items-center mb-3">
                            <i class="fa fa-phone"></i>
                            <div data-mdb-input-init class="form-outline flex-fill mb-0">
                            <label class="form-label" for="form3Example3c">Số điện thoại của bạn</label>
                            <input type="text" name="phone" class="form-control" />
                            <span style="color: red;">'.$errPhone.'</span>
                            </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-3">
                            <i class="fa fa-lock"></i>
                            <div data-mdb-input-init class="form-outline flex-fill mb-0">
                            <label class="form-label" for="form3Example4c">Mật Khẩu</label>
                            <input type="password" id="pass" name="pass" class="form-control" />
                            <span style="color: red;">'.$errPass.'</span>
                            <input type="checkbox" onclick="togglePassword(\'pass\')"> Hiển thị mật khẩu
                            </div>
                        </div>

                        <div class="d-flex flex-row align-items-center mb-3">
                            <i class="fa fa-key"></i>
                            <div data-mdb-input-init class="form-outline flex-fill mb-0">
                            <label class="form-label" for="form3Example4cd">Xác nhận mật khẩu</label>
                            <input type="password" id="repass" name="repass" class="form-control" />
                            <span style="color: red;">'.$errRepass.'</span>
                            <input type="checkbox" onclick="togglePassword(\'repass\')"> Hiển thị mật khẩu
                            </div>
                        </div>

                        <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                            <button type="submit" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-lg">Đăng ký</button>
                        </div>

                        </form>

                    </div>';
                    $q = Database::query("SELECT * FROM `dangky`");
                    while($r = $q->fetch_array()) {
                    $s .= '<div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                        <img src="assets/images/'.$r['image'].'"
                        class="img-fluid" alt="Sample image">
                    </div>';
                    }
                   $s .= '</div>
                    </div>
                </div>
            </div>
            </div>
        </div>
        </section>
        
        <script>
        function togglePassword(fieldId) {
            var field = document.getElementById(fieldId);
            if (field.type === "password") {
                field.type = "text";
            } else {
                field.type = "password";
            }
        }
        </script>
    ';
    echo $s;
}

function _contact() {
    $s = '
     <div class="map spad">
        <div class="container">
            <div class="map-inner">
              <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3826.5236923257344!2d107.6019987746075!3d16.44899952916035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3141a16f27f66311%3A0x7627f28e10e57274!2zNTUgVMO0biBUaOG6pXQgRMawxqFuZyBL4buLLCBBbiBD4buxdSwgSHXhur8sIFRo4burYSBUaGnDqm4gSHXhur8gNDkwMDAsIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1733555319364!5m2!1svi!2s" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                <div class="icon">
                    <i class="fa fa-map-marker"></i>
                </div>
            </div>
        </div>
    </div>
    <!-- Map Section Begin -->

    <!-- Contact Section Begin -->
    <section class="contact-section spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-5">
                    <div class="contact-title">
                        <h4>Liên Hệ</h4>
                        <p>Nếu có thắc mắc gì thì xin liên hệ với chúng tôi.</p>
                    </div>
                    <div class="contact-widget">
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-location-pin"></i>
                            </div>
                            <div class="ci-text">
                                <span>Địa Chỉ:</span>
                                <p>55 Tôn Thất Dương Kỵ</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-mobile"></i>
                            </div>
                            <div class="ci-text">
                                <span>Số điện thoại:</span>
                                <p>0356482981</p>
                            </div>
                        </div>
                        <div class="cw-item">
                            <div class="ci-icon">
                                <i class="ti-email"></i>
                            </div>
                            <div class="ci-text">
                                <span>Email:</span>
                                <p>Phungtruong1148@gmail.com</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 offset-lg-1">
                    <div class="contact-form">
                        <div class="leave-comment">
                            <h4>Để Lại Một Bình Luận</h4>
                            <p>chúng tôi sẽ gọi lại sau và giải đáp thắc mắc của bạn.</p>
                            <form action="#" class="comment-form">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Tên Của Bạn">
                                    </div>
                                    <div class="col-lg-6">
                                        <input type="text" placeholder="Email của bạn">
                                    </div>
                                    <div class="col-lg-12">
                                        <textarea placeholder="Tin nhắn của bạn"></textarea>
                                        <button type="submit" class="site-btn">Gửi tin nhắn</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>    
    ';
    echo $s;
}

function _sanpham() {
    $s = '
    <section class="product-shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-8 order-2 order-lg-1 produts-sidebar-filter">
                    <div class="filter-widget">
                        <h4 class="fw-title">Danh Mục</h4>';
                           $q = Database::query("SELECT * FROM `categories`");
                          if ($q) {
                         while ($r = $q->fetch_array()) {
                        $s .= '<ul class="filter-catagories">
                <li><a href="sanpham.php?id_category='.$r['id'].'" style="text-decoration: none;">'.$r['name'].'</a></li>
            </ul>';
        }
     }
    $s .= '</div>
                    <div class="filter-widget">
                        <h4 class="fw-title">Tìm Kiếm</h4>
                        <div class="fw-tags">';
    $q1 = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 5");
    if ($q1) {
        while ($r1 = $q1->fetch_array()) {
            $s .= '<a href="#" style="text-decoration: none;">'.$r1['name'].'</a>';
        }
    }
    $s .= '</div>
                    </div>
                </div>
                <div class="col-lg-9 order-1 order-lg-2">
                    <div class="product-list">
                        <div class="row">';
    $id_category = isset($_GET['id_category']) ? intval($_GET['id_category']) : 0;
    $q3 = Database::query("SELECT * FROM `products` WHERE status = true" . ($id_category ? " AND id_category = $id_category" : ""));
    if ($q3) {
        while ($r3 = $q3->fetch_array()) {
            $s .= '<div class="col-lg-4 col-sm-6">
                <div class="product-item">
                    <div class="pi-pic">
                        <img src="assets/images/'.$r3['image'].'" alt="">
                        <ul>
                            <li class="w-icon active"><a href="';
                            if(!isset($_SESSION['user']))
                            $s .= 'dangnhap.php';
                         else 
                            $s .= 'sanpham.php?id_product='.$r3['id'];
                            $s.='"><i class="icon_bag_alt"></i></a></li>
                            <li><a href="thongtin.php?id_info= '.intval($r3['id']).'"><i class="fa fa-eye"></i></a></li>
                        </ul>
                    </div>
                    <div class="pi-text">
                        <a href="#" style="text-decoration: none;">
                            <h5>'.$r3['name'].'</h5>
                        </a>
                        <div class="product-price">
                            '.$r3['price'].'<sup>đ</sup>
                        </div>
                    </div>
                </div>
            </div>';
        }
    }

    $s .= '</div>
                    </div>
                </div>
            </div>
        </div>
    </section>';

    echo $s;
}

function _baiviet()
{
    $s = '<section class="blog-details spad">
            <div class="container">
                <div class="row">';
    if (!isset($_GET['id_blog'])) {
        $q1 = Database::query("SELECT * FROM `baiviet` WHERE status = true");
    } else {
        $id_blog = intval($_GET['id_blog']);
        $q1 = Database::query("SELECT * FROM `baiviet` WHERE status = true AND id_blog = $id_blog");
    }
    if ($q1) {
        while ($r1 = $q1->fetch_array()) {
            $s .= '<div class="col-lg-12">
                    <div class="blog-details-inner">
                        <div class="blog-detail-title">
                            <h2>'.$r1['title'].'</h2>
                        </div>
                        <div class="blog-large-pic">
                            <img src="assets/images/'.$r1['image'].'" alt="">
                        </div>
                        <div class="blog-detail-desc">
                            <p>'.$r1['pagraph'].'</p>
                        </div>
                    </div>
                </div>';
        }
    }

    $s .= '</div>
            </div>
        </section>';
    
    echo $s;
}

function cart() {
    $total = 0.0;
    // Xử lý xóa từng sản phẩm
    if (isset($_GET['delete']) && is_numeric($_GET['delete'])) {
        $deleteIndex = (int)$_GET['delete'];
        if (isset($_SESSION['cart'][$deleteIndex])) {
            unset($_SESSION['cart'][$deleteIndex]);
            $_SESSION['cart'] = array_values($_SESSION['cart']); // Reset lại index
        }
    }
    // Xử lý cập nhật số lượng
    if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['update_cart'])) {
        foreach ($_POST['quantities'] as $index => $quantity) {
            if (isset($_SESSION['cart'][$index]) && is_numeric($quantity) && $quantity > 0) {
                $_SESSION['cart'][$index]->quantity = (int)$quantity;
            }
        }
    }
    // Tính tổng tiền
    if (isset($_SESSION['cart'])) {
        $a = $_SESSION['cart'];
        foreach ($a as $item) {
            $item_total = $item->quantity * $item->price * 1000;
            $total += $item_total;
        }
    }
    // Hiển thị giỏ hàng
    $s = '
        <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <form method="post" action="giohang.php">
                        <div class="cart-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Ảnh</th>
                                        <th class="p-name">Tên</th>
                                        <th>Giá</th>
                                        <th>Số lượng</th>
                                        <th>Tổng tiền</th>
                                        <th>Xoá</th>
                                    </tr>
                                </thead>
                                <tbody>';
                                if (isset($_SESSION['cart'])) {
                                $a = $_SESSION['cart'];
                                foreach ($a as $index => $item) {
                                $item_total = $item->quantity * $item->price * 1000;
                                $s .= '<tr>
                               <td class="cart-pic first-row"><img src="assets/images/' . $item->image . '" alt=""></td>
                                <td class="cart-title first-row">
                                <h5>' . $item->name . '</h5>
                                </td>
                                <td class="p-price first-row"><sup>$</sup>'.$item->price.'</td>
                                <td class="qua-col first-row">
                               <div class="quantity">
                                <input type="number" name="quantities[' . $index . ']" value="' . $item->quantity . '" min="1" style="width: 50px;">
                            </div>
                        </td>
                        <td class="total-price first-row">' . number_format($item_total, 0, '.', '.') . '<sup>đ</sup></td>
                      <td class="close-td first-row"><a href="giohang.php?delete=' . $index . '" class="ti-close" style="background: #F08080; 
                           width: 80px; 
                           height: 40px; 
                           display: flex; 
                          justify-content: center; 
                          align-items: center; 
                          border-radius: 10px; 
                         font-weight: bolder;
                         color: white; 
                         font-size: 16px; 
                         text-decoration: none;">
                         </a>
                        </td>
                    </tr>';
                    }
                   }
                     $s .= '</tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="cart-buttons">
                                    <a href="index.php" class="primary-btn continue-shop">Tiếp Tục Mua Sắm</a>
                                    <button type="submit" name="update_cart" class="primary-btn up-cart">Cập Nhật</button>
                                    <a href="giohang.php?clear=OK" class="primary-btn up-cart" style="text-decoration: none;"><span class="fa fa-trash-o"></span> Xoá giỏ hàng</a>
                                </div>
                            </div>
                            <div class="col-lg-4 offset-lg-4">
                                <div class="proceed-checkout">
                                    <ul>
                                        <li class="cart-total">Tổng Tiền <span>' . number_format($total, 0, '.', '.') . '<sup>đ</sup></span></li>
                                    </ul>
                                    <a href="thanhtoan.php" class="proceed-btn" style="text-decoration: none;">Tiếp Tục Thanh Toán</a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>';
    echo $s;
}

function addtoCartProduct($id_product) {
    $q = Database::query("SELECT * FROM `products` WHERE id =". $id_product);
    $r = $q->fetch_array();
    if(isset($_SESSION['cart'])) {
        $a = $_SESSION['cart'];
        for($i = 0; $i <count($a); $i++) 
            if($r['id']==$a[$i]->id)break;
        if($i<count($a))$a[$i]->quantity++;
        else  $a[count($a)] = new cart($r['id'], $r['name'], $r['image'], $r['price'], 1);
        
    }else {
        $a = array();
        $a[0] = new cart($r['id'], $r['name'], $r['image'], $r['price'], 1);
    }
    $_SESSION['cart'] = $a;
}

function _checkout($title) {
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
    $total = 0;
    foreach ($cart as $item) {
        $total += $item->quantity * $item->price * 1000;
    }
    $s = '
    <section class="checkout-section spad">
        <div class="container">
            <form action="process_order.php" class="checkout-form" method="POST">
                <div class="row">
                    <div class="col-lg-6">
                        <h4>'.$title.'</h4>
                          <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>Họ Tên <span>*</span></p>
                                        <input type="text" name="name" required>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input">
                                <p>Địa Chỉ <span>*</span></p>
                                <input type="text" name="address" placeholder="Nhập địa chỉ của bạn" required>
                            </div>
                            <div class="checkout__input">
                                <p>Số điện thoại <span>*</span></p>
                                <input type="text" name="phone" required>
                            </div>
                            <div class="checkout__input">
                                <p>Ghi chú</p>
                                <input type="text" name="note" placeholder="Ghi chú về đơn hàng (nếu có)">
                            </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="place-order">
                            <h4>Đơn Hàng Của Bạn</h4>
                            <div class="order-total">
                                <ul class="order-table">
                                <li>Sản Phẩm <span>Tổng Tiền</span></li>
                                ';
                                foreach ($cart as $item) {
                                    $item_total = $item->quantity * $item->price * 1000;
                                    $s .= '
                                    <li class="fw-normal">'.$item->name.'x '.$item->quantity.' <span>'.number_format($item_total, 0, '.','.').'<sup>đ</sup></span></li>
                               ';
                                }
                                $s.= '
                                <li class="total-price">Tổng tiền <span>'.number_format($total, 0, '.','.').'<sup>đ</sup></span></li></ul>
                            
                                <div class="order-btn">
                                    <button type="submit" class="site-btn place-btn">Đặt Đơn</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>  
    </section>
    ';
    echo $s;
}

function _info() {
    global $db;
    $s = '';
    $id_info = isset($_GET['id_info']) && is_numeric($_GET['id_info']) ? intval($_GET['id_info']) : null;
    $query = $id_info 
        ? "SELECT * FROM `products` WHERE id = $id_info" 
        : "SELECT * FROM `products` LIMIT 1";
    $q = Database::query($query);
    while ($r = $q->fetch_array()) {
        $s .= '
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__item">
                                <img class="product__details__pic__item--large"
                                    src="assets/images/'.($r['image'] ?? 'default.jpg').'" alt="">
                            </div>
                            <div class="product__details__pic__slider owl-carousel">';
        $q_rand = Database::query("SELECT * FROM `products` ORDER BY RAND() LIMIT 10");
        while ($r_rand = $q_rand->fetch_array()) {
            $s .= '<a href="thongtin.php?id_info='.intval($r_rand['id']).'">
                    <img src="assets/images/'.($r_rand['image'] ?? 'default.jpg').'" alt="">
                  </a>';
        }
        $s .= '</div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">';
        $q_info = Database::query("SELECT * FROM `info` WHERE id_info = ".$r['id']);
        while ($r1 = $q_info->fetch_array()) {
            $s .= '<div class="product__details__text">
                        <h3>'.$r1['name'].'</h3>
                        <div class="product__details__price">'.$r1['price'].'<sup>đ</sup></div>
                        <p style="font-family: \'Lato\', serif; font-size: 20px; font-weight: 500;">'.$r1['pagraph'].'</p>
                        <a href="'.(isset($_SESSION['user']) ? 'sanpham.php?id_product='.$r['id'] : 'dangnhap.php').'" class="primary-btn"><i class="fa fa-shopping-cart"></i></a>
                    </div>';
        }
        $s .= '</div>
                </div>
            </div>
        </section>';
    }
    echo $s;
}


 
?>
