<%--
    Document   : footer
    Created on : 17 Aug 2022, 11:42:02
    Author     : thien thien
--%>


<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>




<footer>
    <sec:authorize access="hasRole('ROLE_KH')">
    <section  class="container">
        <div class="head">
            <div class="pays">
                <div>
                    <h4 class="foot" >Phuơng thức thanh toán</h4>
                </div>
                <div class="pay">

                    <div><a href="#"><img class="img-pay"src="resources/images/visa.png" alt="visa"></a></div>
                    <div><a href="#"><img class="img-pay"src="resources/images/mastercard.png" alt="mastercard"></a></div>
                    <div><a href="#"><img class="img-pay"src="resources/images/jcb.png" alt="jcb"></a></div>
                    <div><a href="#"><img class="img-pay"src="resources/images/cash.png" alt="cash"></a></div>
                    <div><a href="#"><img class="img-pay"src="resources/images/internet-banking.png" alt="internet-banking"></a></div>



                </div>
            </div>
            <div><img src="resources/images/sp_footer.png" /></div>
            <div class ="apps">
                <div>
                    <h4 class="foot">Tải ứng dụng trên</h4>
                </div>
                <div class="app">
                    <div><a href="#"><img class="img-app" src="resources/images/appstore.png" alt="appstore"></a></div>
                    <div><a href="#"><img class="img-app"src="resources/images/playstore.png" alt="playstore"></a></div>

                </div>
            </div>
            <div><img src="resources/images/sp_footer.png" /></div>
            <div class="connections">
                <div>
                    <h4 class="foot">Kết nối với chúng tôi</h4>
                </div>
                <div class="connection">
                    <div><a href="#"><img class="img-connection" src="resources/images/fb.png" alt="facebook"></a></div>
                    <div><a href="#"><img class="img-connection"src="resources/images/youtube.png" alt="youtube"></a></div>
                    <div><a href="#"><img class="img-connection"src="resources/images/zalo.png" alt="zalo"></a></div>

                </div>
            </div>
        </div>
    </section>
    </sec:authorize>
    <section class="container">
        <div class="infos-footer" style="">
            <div class="info-footer">
                <h6>HỖ TRỢ KHÁCH HÀNG</h6>
                <ul class="support">
                    <li><a href="#">Sản phẩm & Đơn hàng: 0123456789</a></li>
                    <li><a href="#">Kỹ thuật & Bảo hành: 0987654321 </a></li>
                    <li><a href="#">Điện thoại: 0123455432</a></li>
                    <li><a href="#">Email: gachsach@gmail.com</a></li>
                    <li><a href="#">Địa chỉ: 371 Nguyễn Kiệm, Gò vấp, TPHCM</a></li>
                </ul>
            </div>
            <div class="info-footer">
                <h6>ORDER FOOD</h6>
                <ul class="support">
                    <li><a href="#">Giới thiệu OrderFood</a></li>
                    <li><a href="#">Liên hệ OrderFood </a></li>
                    <li><a href="#">Đặt hàng OrderFood</a></li>
                    <li><a href="#">Thỏa thuận OrderFood</a></li>
                </ul>
            </div>
            <div class="info-footer">
                <h6>TÀI KHOẢN CỦA BẠN</h6>
                <ul class="support">
                    <li><a href="#">Cập nhật tài khoản</a></li>
                    <li><a href="#">Giỏ hàng </a></li>
                    <li><a href="#">Lịch sử giao dịch</a></li>
                    <li><a href="#">Kiểm tra đơn hàng</a></li>
                    <li><a href="#">Sản phẩm yêu thích</a></li>
                </ul>
            </div>

            <div class="info-footer">
                <h6>TRỢ GIÚP</h6>
                <ul class="support">
                    <li><a href="#">Đăng ký nhận bản tin</a></li>
                    <li><a href="#">Hướng dẫn mua hàng</a></li>
                    <li><a href="#">Phương thức thanh toán</a></li>
                    <li><a href="#">Phương thức vận chuyển</a></li>
                    <li><a href="#">Chính sách đổi - trả</a></li>
                    <li><a href="#">Chính sách bồi hoàn</a></li>
                    <li><a href="#">Câu hỏi thường gặp</a></li>
                </ul>
            </div>

        </div>
    </section>
</footer>