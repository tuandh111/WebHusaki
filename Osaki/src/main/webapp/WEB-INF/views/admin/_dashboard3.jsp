<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="topbar">
    <div class="toggle">
        <ion-icon name="menu-outline"></ion-icon>
    </div>
    <div class="search">
        <label>
            <input type="text" placeholder="Tìm kiếm...">
            <ion-icon name="search-outline"></ion-icon>
        </label>
    </div>
    <div class="user">
        <img alt="" src="/images/author-item.jpg">
    </div>
</div>
<div class="cardBox">
    <div class="cardP">
        <div class="cardP-body">
            <div class="numbers">${totalInv}</div>
            <div class="cardName">Lượt mua</div>
        </div> 
        <div class="iconBox">
            <ion-icon name="cart-outline"></ion-icon>
        </div>      
    </div>
    
    <div class="cardP">
        <div class="cardP-body">
            <div class="numbers">1,504</div>
            <div class="cardName">Lượt xem</div>
        </div> 
        <div class="iconBox">
            <ion-icon name="eye-outline"></ion-icon>
        </div>      
    </div>
    <div class="cardP">
        <div class="cardP-body">
            <div class="numbers">854</div>
            <div class="cardName">Bình luận</div>
        </div> 
        <div class="iconBox">
            <ion-icon name="chatbubbles-outline"></ion-icon>
        </div>      
    </div>
    <div class="cardP">
        <div class="cardP-body">
            <div class="numbers">${totalRevenue}</div>
            <div class="cardName">Doanh thu</div>
        </div> 
        <div class="iconBox">
            <ion-icon name="cash-outline"></ion-icon>
        </div>      
    </div>
</div>

<!-- Oder -->
<div class="details">
    <div class="recentOrders">
        <div class="cardHeader d-flex flex-row justify-content-between">
            <h2>Đơn hàng gần đây</h2>
            <a href="#" class="btn btn-custom">Xem tất cả</a>
        </div>
        <table class="table table-hover table-custom">
            <thead>
                <tr>
                    <th>Sản phẩm</th>
                    <th>Giá</th>
                    <th>Hình thức thanh toán</th>
                    <th>Trạng thái</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Sữa rửa mặt Dabo</td>
                    <td>110.000 vnđ</td>
                    <td>Tiền mặt</td>
                    <td>
                        <span class="status delivered">Trạng thái đơn hàng</span>
                    </td>
                </tr>
                
            </tbody>
        </table>
    </div>
    <div class="recentCustomer">
        <div class="cardHeader">
            <h2>Khách hàng vừa truy cập</h2>
        </div>
         <table class="table table-hover table-custom">
                <tr>
                    <td width="60px">
                        <div class="img-thumbnail imgBox">
                            <img src="/images/author-item.jpg">
                        </div>
                    </td>
                    <td>
                        <h4>
                            Trung nguyễn
                            <br>
                            <span>An Giang</span>
                        </h4>
                    </td>
                </tr>
        </table>
    </div>
</div>

<!-- Chart -->
<div class="graphicBox">
    <div class="box">        
        <canvas id="myChartDoughnut"></canvas>
    </div>
    <div class="box">
        <canvas id="myChartLine"></canvas>
    </div>
</div>